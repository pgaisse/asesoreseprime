const mongoose = require('mongoose');

const caseSchema = new mongoose.Schema({
  status: { type: mongoose.Schema.Types.ObjectId, ref: 'Adviser' },
  createdAt: { type: Date, default: Date.now },
  caseDate: { type: Date, required: true },
  caseSectors: [
    {
      sectorName: { type: String },
      sectorDescription: { type: String },
      sectorImages: [{
        img1: { type: String },
        img2: { type: String },
        img3: { type: String },
      }],
      sectorImage2: { type: String },
      sectorImage3: { type: String },
      SectorDimentions: [{
        widht: { type: Number },
        height: { type: Number },
        depth: { type: Number },
      }],
      damages: [
        {
          damageName: { type: String },
          damageDescription: { type: String },
          damageUnit: { type: String },
          DamageUnit: { type: String },
          DamageImages: [{
            img1: { type: String },
            img2: { type: String },
            img3: { type: String },
          }],
          DamageSizes: [{
            widht: { type: Number },
            height: { type: Number },
            depth: { type: Number },
          }],
        }
      ]
    }
  ],
  numCase: { type: String },
  adviser: { type: mongoose.Schema.Types.ObjectId, ref: 'Adviser' },
  client: { type: mongoose.Schema.Types.ObjectId, ref: 'Client' },
  incident: { type: mongoose.Schema.Types.ObjectId, ref: 'Incident' },
}, { collection: 'cases' });

// Modelo de Provincia
const provinciaSchema = new mongoose.Schema({
  _id: mongoose.Schema.Types.ObjectId,
  nombre: {type: String, required: true, trim: true},
  region_id: {type: Number, required: true},
  createdAt: {type: Date, default: Date.now},
  updatedAt: {type: Date, default: Date.now}}, 
  { collection: 'provincias' });



const clientsSchema = new mongoose.Schema({
  _id: mongoose.Schema.Types.ObjectId, // explícito (opcional, Mongoose lo crea igual)
  nombre: { type: String, required: true },
  apellidos: { type: String, required: true },
  rut: { type: String, required: true },
  email: { type: String, required: true },
  telefono: { type: String, required: true },
  estado: { type: String, required: true },
  created_at: { type: Date, default: Date.now },
  nacionalidad: String,
  estado_civil: String,
  profesion_ocupacion: String,
  fecha_nacimiento: Date,
  tipo_inmueble: String,
  region: String,
  direccion: String,
  ciudad: String,
  comuna: String,
  banco: String,
  aseguradora: String,
  archivo: String,
  nombre_archivos: String,
  exc_prorroga: Boolean,
  exc_pendiente: Boolean,
  observaciones: String,
  tipo_entidad: { type: String, required: true },
  tipo_siniestros: { type: String, required: true },
  num_bancoestado: String,
  monto_indemnizado: Number,
  porcentaje: Number,
  honorarios: Number,
  pago_honorarios: Date,
  correo_enviado: Boolean,
  token: String,
  notas_internas: String,
  vencimiento_estado: Date,
  numero_caso: Number,
  fecha_siniestro: Date,
}, { collection: 'clients' });

module.exports = mongoose.model('Client', clientsSchema);


const adviserSchema = new mongoose.Schema({
  adviserUsername: { type: String },
  adviserRole: { type: String },
  adviserName: { type: String },
  adviserLastname: { type: String },
  adviserRut: { type: String },
  adviserEmail: { type: String },
  adviserPhone: { type: String },
  adviserPicture:{type:String},
  adviserSub:{type:String},
  registeredAt: { type: Date, default: Date.now },
  adviserBirthday: { type: Date }
}, { collection: 'advisers' });


const statusSchema = new mongoose.Schema({
  statusName: { type: String, required: true },
  statusDescription: { type: String, required: true },
}, { collection: 'status' });


const damageSchema = new mongoose.Schema({
  damageCode: { type: String, required: true },
  damageType: { type: String, required: true },
}, { collection: 'damages' });

const incidentSchema = new mongoose.Schema({
  incidentCode: { type: String, required: true },
  incidentType: { type: String, required: true },
  incident_description:{type: String}
}, { collection: 'incidents' });

const repairSchema = new mongoose.Schema({
  repair_type: { type: String, required: true },
  repair_description: { type: String, required: true },
}, { collection: 'repairs' });

module.exports = {
  Status: mongoose.model('Status',statusSchema),
  Case: mongoose.model('Case', caseSchema),
  Client: mongoose.model('Client', clientsSchema),
  Adviser: mongoose.model('Adviser', adviserSchema),
  Damage: mongoose.model('Damage', damageSchema),
  Incident: mongoose.model('Incident', incidentSchema),
  Repair: mongoose.model('Repair', repairSchema),
  Provincia: mongoose.model('Provincia', provinciaSchema)

  


};