const mongoose = require('mongoose');
const Client = require('../models/Client');
const Adviser = require('../models/Adviser');
const Case = require('../models/Models');
const Incident = require('../models/Incident');
const Damage = require('../models/Damage');
const Repair = require('../models/Repair');
const mongoConnect = require('../config/db');
const dotenv = require('dotenv');
dotenv.config();

async function initData() {
    let connection;

    try {
        mongoConnect();

        console.log('Conexión a MongoDB establecida');

        // Limpieza previa con await explícito
        console.log('Iniciando limpieza de colecciones...');

        await Adviser.deleteMany({}).exec();
        await Case.deleteMany({}).exec();
        await Incident.deleteMany({}).exec();
        await Damage.deleteMany({}).exec();
        await Repair.deleteMany({}).exec();
        await Client.deleteMany({}).exec();
        console.log('Limpieza completada');

        // Inserta incidentes con manejo explícito de promesas
        console.log('Insertando incidentes...');
        const incidentes = await Incident.insertMany([
            {
                incident_code: "Sismo",
                incident_date: new Date("2022-01-15"),
                incident_description: "Terremoto en la región",
                createdAt: new Date("2024-05-08T04:46:21Z"),
                incident_type: "Sismo",
                incident_scale: "R"
            },
            {
                incident_code: "Incendio",
                incident_date: new Date("2022-01-20"),
                incident_description: "Alerta de tsunami a lo largo de las costas",
                createdAt: new Date("2024-05-08T04:46:21Z"),
                incident_type: "Incendio",
                incident_scale: "R"
            }
        ]);
        console.log(`${incidentes.length} incidentes insertados`);

        // Inserta adviser
        console.log('Insertando asesor...');
        const adviser = await Adviser.create({
            adviser_username: "admin",
            adviser_password: "1234",
            adviser_role: "admin",
            adviser_name: "Andrea",
            adviser_lastname: "Ruiz",
            adviser_rut: "10.000.000-0",
            adviser_email: "andrea@correo.com",
            adviser_phone: "987654321",
            adviser_birthday: new Date("1980-05-15")
        });
        console.log(`Asesor creado: ${adviser._id}`);

        // Inserta cliente (corregí el nombre del modelo de "Clients" a "Cliente")
        console.log('Insertando client...');
        const client = await Client.create({
            nombre: "Jacqueline",
            apellidos: "Bustos Gaete",
            rut: "10.179.225-0",
            email: "jakebustos@hotmail.com",
            telefono: "962374936",
            estado: "SINIESTRO CERRADO",
            created_at: new Date("2024-04-04T20:35:36Z"),
            nacionalidad: "Chilena",
            estado_civil: "Casado",
            profesion_ocupacion: "Profesora",
            fecha_nacimiento: new Date("1964-07-15"),
            tipo_inmueble: "Casa",
            region: "9",
            direccion: "Flores de Pucará, Calle Chacarillas #528",
            ciudad: "32",
            comuna: "181",
            banco: "Banco Estado",
            archivo: "/wp-content/uploads/10.179.225-0",
            exc_prorroga: false,
            exc_pendiente: false,
            observaciones: "Siniestro cerrado.",
            tipo_entidad: "banco",
            tipo_siniestros: "Rotura de cañerías",
            monto_indemnizado: 1367612,
            porcentaje: 20,
            honorarios: 2735224,
            pago_honorarios: new Date("2024-06-21"),
            correo_enviado: true,
            token: "3480b6d05f4b9bb4eff1be51b7adc409",
            vencimiento_estado: new Date("2024-06-21"),
            numero_caso: 1888970,
            fecha_siniestro: new Date("2024-02-23")
        });
        console.log(`Cliente creado: ${client._id}`);

        // Inserta case relacionado
        console.log('Insertando caso...');
        const caso = await Case.create({
            id_status: 1,
            id_incident: incidentes[0]._id,
            case_date: new Date("2024-02-23"),
            createdAt: new Date(),
            id_adviser: adviser._id,
            id_client: client._id  // Añadí referencia al cliente
        });
        console.log(`Caso creado: ${caso._id}`);

        // Inserta daño relacionado
        console.log('Insertando daño...');
        await Damage.create({
            damage_code: "R001",
            damage_type: "Daño estructural",
            id_case: caso._id,
            id_client: client._id
        });
        console.log('Daño creado');

        // Inserta reparación relacionada
        console.log('Insertando reparación...');
        await Repair.create({
            repair_type: "Reparación urgente",
            repair_description: "Se reparó la losa agrietada",
            id_case: caso._id,
            id_client: client._id
        });
        console.log('Reparación creada');

        console.log("✅ Datos insertados correctamente.");
    } catch (err) {
        console.error("❌ Error al insertar datos:", err);
    } finally {
        if (connection) {
            await mongoose.disconnect();
            console.log('Conexión cerrada');
        }
        process.exit(0);
    }
}

// Ejecutar el script
initData();