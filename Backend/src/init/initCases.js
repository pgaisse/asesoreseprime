const mongoose = require('mongoose');
const { Case, Client, Adviser, Damage, Incident, Repair } = require("../models/Models");
const mongoConnect = require('../config/db');

// FUNCIONES AUXILIARES
function randomDate(start, end) {
  return new Date(start.getTime() + Math.random() * (end.getTime() - start.getTime()));
}

function randomNumber(min, max) {
  return +(Math.random() * (max - min) + min).toFixed(2);
}

// SCRIPT PRINCIPAL
async function insertAdvisersAndCases() {
  await mongoConnect();

  const advisersData = [
    {
      adviserUsername: 'hmonsalves',
      adviserPassword: '123456',
      adviserRole: 'inspector',
      adviserName: 'Héctor',
      adviserLastname: 'Monsalves',
      adviserRut: '12.345.678-9',
      adviserEmail: 'hector@example.com',
      adviserPhone: '+56912345678',
      adviserBirthday: new Date(1985, 4, 15),
    },
    {
      adviserUsername: 'carias',
      adviserPassword: 'abcdef',
      adviserRole: 'inspector',
      adviserName: 'Carlos',
      adviserLastname: 'Arias',
      adviserRut: '13.456.789-0',
      adviserEmail: 'carlos@example.com',
      adviserPhone: '+56987654321',
      adviserBirthday: new Date(1990, 6, 20),
    }
  ];

  const defaultClients = [
    {
      nombre: 'Juan',
      apellidos: 'Pérez',
      rut: '11.111.111-1',
      email: 'juan.perez@example.com',
      telefono: '+56911111111',
      estado: 'activo',
      tipo_entidad: 'natural',
      tipo_siniestros: 'incendio',
      region: 'Metropolitana',
      ciudad: 'Santiago',
      comuna: 'Ñuñoa',
    },
    {
      nombre: 'María',
      apellidos: 'González',
      rut: '22.222.222-2',
      email: 'maria.gonzalez@example.com',
      telefono: '+56922222222',
      estado: 'activo',
      tipo_entidad: 'natural',
      tipo_siniestros: 'inundación',
      region: 'Valparaíso',
      ciudad: 'Viña del Mar',
      comuna: 'Reñaca',
    }
  ];

  try {
    // Insertar advisers y clients
    const advisers = await Adviser.insertMany(advisersData);
    const clients = await Client.insertMany(defaultClients);

    console.log(`Advisers insertados: ${advisers.length}`);
    console.log(`Clients insertados: ${clients.length}`);

    // Crear casos relacionados (uno por cada adviser-client)
    const cases = advisers.map((adviser, index) => ({
      idStatus: 'open',
      idIncident: 'INC100',
      caseDate: randomDate(new Date(2023, 0, 1), new Date()),
      caseSectors: [
        {
          sectorName: 'Sector A',
          sectorDescription: 'Descripción del sector',
          sectorImages: [{
            img1: 'https://placehold.it/200x200?img=1',
            img2: 'https://placehold.it/200x200?img=2',
            img3: 'https://placehold.it/200x200?img=3',
          }],
          sectorImage2: 'https://placehold.it/200x200?img=4',
          sectorImage3: 'https://placehold.it/200x200?img=5',
          SectorDimentions: [{
            widht: randomNumber(1, 5),
            height: randomNumber(1, 5),
            depth: randomNumber(1, 5),
          }],
          damages: [
            {
              damageName: 'Crack',
              damageDescription: 'Fisura en el muro',
              damageUnit: 'cm',
              DamageUnit: 'cm',
              DamageImages: [{
                img1: 'https://placehold.it/100x100?img=6',
                img2: 'https://placehold.it/100x100?img=7',
                img3: 'https://placehold.it/100x100?img=8',
              }],
              DamageSizes: [{
                widht: randomNumber(0.5, 2),
                height: randomNumber(0.5, 2),
                depth: randomNumber(0.5, 2),
              }]
            }
          ]
        }
      ],
      numCase: `CASE${1000 + index}`,
      adviser: adviser._id,
      client: clients[index % clients.length]._id, // asocia un cliente existente
    }));

    await Case.insertMany(cases);
    console.log(`Cases insertados: ${cases.length}`);
  } catch (err) {
    console.error('Error en inserción:', err);
  } finally {
     mongoose.connection.close();
  }
}

insertAdvisersAndCases();
