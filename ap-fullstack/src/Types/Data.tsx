export type Case = {
  _id: string;
  idStatus: string;
  caseDate: string;
  caseSectors: {
    sectorName: string;
    sectorDescription: string;
    sectorImages: {
      img1: string;
      img2: string;
      img3: string;
      _id: string;
    }[];
    sectorImage2: string;
    sectorImage3: string;
    SectorDimentions: {
      widht: number;
      height: number;
      depth: number;
      _id: string;
    }[];
    damages: {
      damageName: string;
      damageDescription: string;
      damageUnit: string;
      DamageUnit: string; // se repite
      DamageImages: {
        img1: string;
        img2: string;
        img3: string;
        _id: string;
      }[];
      DamageSizes: {
        widht: number;
        height: number;
        depth: number;
        _id: string;
      }[];
      _id: string;
    }[];
    _id: string;
  }[];
  numCase: string;
  adviser: Adviser;
  createdAt: string;
  __v: number;
  Incident: string;
  client: Client;
  incident: Incident;
};


type Sector = {
  sectorName: string;
  sectorDescription: string;
  sectorImages: ImageSet[];
  sectorImage2: string;
  sectorImage3: string;
  SectorDimentions: Dimension[];
  damages: Damage[];
  _id: string;
};

type ImageSet = {
  img1: string;
  img2: string;
  img3: string;
  _id: string;
};



type Dimension = {
  widht: number;
  height: number;
  depth: number;
  _id: string;
};

type Damage = {
  damageName: string;
  damageDescription: string;
  damageUnit: string;
  DamageUnit: string;
  DamageImages: ImageSet[];
  DamageSizes: Dimension[];
  _id: string;
};

export type Adviser = {
  _id: string;
  adviserUsername: string,
  adviserPassword: string,
  adviserRole: string,
  adviserName: string,
  adviserLastname: string,
  adviserRut: string,
  adviserEmail: string,
  adviserPicture:string,
  adviserPhone: string,
  adviserBirthday: Date,
  registeredAt: Date,
};

export type Incident = {
  _id: string;
  incidentCode: string;
  incidentType: string;
  incident_description?: string; // opcional, ya que no es required en el schema
}

export type Client = {
  _id: string; // Mongoose.ObjectId como string
  nombre: string;
  apellidos: string;
  rut: string;
  email: string;
  telefono: string;
  estado: string;
  created_at: Date;
  nacionalidad?: string;
  estado_civil?: string;
  profesion_ocupacion?: string;
  fecha_nacimiento?: Date;
  tipo_inmueble?: string;
  region?: string;
  direccion?: string;
  ciudad?: string;
  comuna?: string;
  banco?: string;
  aseguradora?: string;
  archivo?: string;
  nombre_archivos?: string;
  exc_prorroga?: boolean;
  exc_pendiente?: boolean;
  observaciones?: string;
  tipo_entidad: string;
  tipo_siniestros: string;
  num_bancoestado?: string;
  monto_indemnizado?: number;
  porcentaje?: number;
  honorarios?: number;
  pago_honorarios?: Date;
  correo_enviado?: boolean;
  token?: string;
  notas_internas?: string;
  vencimiento_estado?: Date;
  numero_caso?: number;
  fecha_siniestro?: Date;
};

;

export type StatusField = {
  id_status: number
  status_name: string
}

export type ResultClient = {
  id_client: number
  numero_caso: number
  client_name: string
  client_lastname: string
  client_rut: string
  client_address: string
  indicent_type: string
}

export type CaseResponse = {
  cases: Case[]
  statusFields: StatusField[]
  resultsClients: ResultClient[]
}


export type Auth0UserResponse = {
  data: Auth0User[];
  headers: Record<string, any>;
  status: number;
  statusText: string;
};

export type Auth0User = {
  email: string;
  email_verified: boolean;
  name: string;
  given_name: string;
  family_name: string;
  nickname: string;
  picture: string;
  sub: string;
  updated_at: string;
  org_id?: string;
  role?: string;
};