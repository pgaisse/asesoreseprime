const express = require('express');
const router = express.Router();
const pool = require('../database');
const { log } = require('handlebars');
const sharp = require('sharp');
const pdfService = require('../lib/pdf');
const helpers = require('../lib/helpers');
const fs = require('fs')
const path = require('path');
const puppeteer = require('puppeteer');
const { format } = require('timeago.js')
const { attachUserInfo, jwtCheck, checkJwt, decodeToken, getUsersFromOrganization } = require('../middleware/auth');
const mongoose = require('mongoose');
const { body, validationResult } = require('express-validator');
const { Case, Client, Adviser, Damage, Incident, Repair } = require("../models/Models");

router.use(jwtCheck);
router.use(attachUserInfo); // 



router.get('/', async (req, res) => {
    try {
        const updatedAdviser = await Adviser.findOneAndUpdate(
            { _id: user.user_id }, // Filtro por ID
            {
                adviserName: user.name,
                adviserEmail: user.email,
            },
            {
                upsert: true,            // Inserta si no existe
                new: true,               // Devuelve el nuevo documento
                setDefaultsOnInsert: true,
            }
        );

        console.log('Adviser insertado/actualizado:', updatedAdviser);
    } catch (error) {
        console.error('Error en upsert adviser:', error);
    }

});


//******************************************************************************************************* */

const models = require('../models/Models'); // ajusta la ruta según corresponda


// En tu router Express (ejemplo para 'Case')


const ObjectId = mongoose.Types.ObjectId;

const { Types } = mongoose;

router.delete('/:collection/:id', async (req, res) => {
    const { collection, id } = req.params;

    try {
        const Model = models[collection];

        if (!Model) {
            return res.status(400).json({ error: `❌ Invalid collection name: ${collection}` });
        }

        if (!mongoose.Types.ObjectId.isValid(id)) {
            return res.status(400).json({ error: `❌ Invalid document ID: ${id}` });
        }

        const deleted = await Model.findByIdAndDelete(id);

        if (!deleted) {
            return res.status(404).json({ error: `❌ No document found with ID: ${id}` });
        }

        res.status(200).json({ message: `✅ Document with ID ${id} deleted successfully`, deleted });

    } catch (error) {
        console.error(`❌ Error deleting from ${collection}:`, error.message);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

// Utilidad para convertir strings a ObjectId en filtros


function convertIdsInFilter(filter) {
  if (typeof filter !== 'object' || filter === null) return filter;

  const isObjectId = (id) => typeof id === 'string' && /^[0-9a-fA-F]{24}$/.test(id);

  const idFields = ['_id', 'adviser', 'client', 'incident', 'status'];

  for (const key in filter) {
    const value = filter[key];

    if (typeof value === 'object' && value !== null) {
      if ('$in' in value || '$nin' in value) {
        for (const op of ['$in', '$nin']) {
          if (Array.isArray(value[op])) {
            value[op] = value[op].map(v => isObjectId(v) ? new Types.ObjectId(v) : v);
          }
        }
      } else {
        filter[key] = convertIdsInFilter(value); // recursivo y asigna resultado
      }
    } else if (idFields.includes(key) && isObjectId(value)) {
      filter[key] = new Types.ObjectId(value);
    }
  }
  return filter;
}


// Ruta principal
router.get('/:collection', async (req, res) => {
    try {
        const { collection } = req.params;
        const Model = models[collection];

        if (!Model) {
            return res.status(400).json({ error: 'Invalid collection name' });
        }

        let filters = {};
        let populate = [];
        let limit = 50;

        // Parsear query (filtros MongoDB)
        if (req.query.query) {
            filters = typeof req.query.query === 'string'
                ? JSON.parse(req.query.query)
                : req.query.query;

            // Si se indica, convierte string IDs a ObjectId
            if (req.query.convertObjectId === 'true') {
                filters = convertIdsInFilter(filters);
            }
        }

        // Parsear populate (campos relacionados)
        if (req.query.populate) {
            populate = typeof req.query.populate === 'string'
                ? JSON.parse(req.query.populate)
                : req.query.populate;
        }

        // Parsear limit
        if (req.query.limit) {
            const parsedLimit = parseInt(req.query.limit);
            if (!isNaN(parsedLimit)) {
                limit = parsedLimit;
            }
        }
        // Construir consulta
        console.log("filters",filters)
        let query = Model.find(filters).limit(limit);


        // Agregar populate si corresponde
        if (populate && Array.isArray(populate)) {
            populate.forEach(p => {
                if (p?.path) {
                    query = query.populate(p.path, p.select);
                }
            });
        }

        const result = await query.lean();
        res.status(200).json(result);

    } catch (error) {
        console.error('❌ Error fetching collection:', error.message);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});


router.post("/advisers", async (req, res) => {
    const { user } = req.body;
    console.log(req.body);

    const adviserData = {
        adviserUsername: user.nickname,
        adviserSub: user.sub,
        adviserOrg: user.org_id,
        adviserRole: user.role,
        adviserName: user.given_name,
        adviserLastname: user.family_name,
        adviserPicture: user.picture,
        adviserEmail: user.email,
        registeredAt: user.updated_at

    };

    console.log("user", req.adviserData)
    // Busca y actualiza si existe, o crea si no existe
    await Adviser.findOneAndUpdate(
        { adviserEmail: user.email },     // filtro por email
        { $set: adviserData },       // datos a actualizar
        { upsert: true, new: true }  // upsert: crea si no existe
    );

    res.sendStatus(200);
});


router.patch('/update-items', async (req, res) => {
    try {
        const { table, id_field, id_value, data } = req.body;

        if (!table || !id_field || id_value === undefined || typeof data !== 'object') {
            return res.status(400).json({ error: 'Faltan datos obligatorios o el cuerpo es inválido' });
        }

        if (Object.keys(data).length === 0) {
            return res.status(400).json({ error: 'No se proporcionaron datos para actualizar' });
        }

        const Model = models[table]; // Usa los modelos predefinidos
        if (!Model) {
            return res.status(400).json({ error: `Modelo '${table}' no encontrado.` });
        }

        const filter = { [id_field]: id_value };

        const updated = await Model.findOneAndUpdate(filter, data, {
            new: true,
            runValidators: false,
        });

        if (!updated) {
            return res.status(404).json({ error: 'Documento no encontrado' });
        }

        res.status(200).json({ message: 'Documento actualizado correctamente', document: updated });
    } catch (error) {
        console.error('Error al actualizar documento:', error);
        res.status(500).json({ error: 'Error interno del servidor' });
    }
});




// Validaciones middleware para inputs mínimos
router.post('/add', async (req, res) => {
    try {
        const { modelName, data } = req.body;

        if (!modelName || !data || typeof data !== 'object') {
            return res.status(400).json({ error: 'modelName y data (objeto) son requeridos' });
        }

        // Obtenemos o creamos modelo dinámico con esquema libre para esa colección
        const Model = mongoose.models[modelName] || mongoose.model(
            modelName,
            new mongoose.Schema({}, { strict: false, collection: modelName })
        );

        const newDoc = new Model(data);
        const savedDoc = await newDoc.save();
        console.log("savedDoc", savedDoc)

        res.status(201).json({ message: 'Documento creado', document: savedDoc });
    } catch (error) {
        console.error('Error al crear documento:', error);
        res.status(500).json({ error: 'Error interno del servidor' });
    }
});

router.get('/dasdasd', async (req, res) => {
    try {
        console.log(req.query);
        const { collection } = req.params;
        console.log('URL:', req.url);
        console.log('req.query:', req.query);
        console.log(req.params)
        let filters = {}; console.log("req.query:", req.query); // Esto muestra lo que recibe Mongoose}
        if (req.query.query) {
            try {

                filters = JSON.parse(req.query.query);
            } catch (error) {
                return res.status(400).json({ message: "Error al parsear 'query'" });
            }
        }

        const model = mongoose.models[collection] || mongoose.model(
            collection,
            new mongoose.Schema({}, { strict: false, collection })
        );
        console.log("Consulta Mongo:", filters); // Esto muestra lo que recibe Mongoose
        const data = await model.find(filters).lean();
        res.json(data);
    } catch (err) {
        console.error('Error al obtener datos:', err);
        res.status(500).json({ message: 'Error al consultar la base de datos' });
    }
});


//**************************************************************************************** */



module.exports = router;

/*shift alt f  ordenar código
ctrl l seleccionar linea
ctrl d seleccionar coincidencia
shift alt selección por columna
ctrl f2 buscar coincidencias
*/
