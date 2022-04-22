import db from "../database/db.js";

import { DataTypes } from "sequelize";

const CompanyModel = db.define("companies", {
  nombre: { type: DataTypes.STRING },
  rif: { type: DataTypes.STRING },
  numalianza: { type: DataTypes.STRING },
  direccionfiscal: { type: DataTypes.STRING },
  estado: { type: DataTypes.STRING },
  municipio: { type: DataTypes.STRING },
  parroquia: { type: DataTypes.STRING },
  representante: { type: DataTypes.STRING },
  telefonorepresentante: { type: DataTypes.STRING },
  correorepresentante: { type: DataTypes.STRING },
  cedularepresentante: { type: DataTypes.STRING },
  rumrepresentante: { type: DataTypes.STRING },
  tipoactividad: { type: DataTypes.STRING },
  actividadminera: { type: DataTypes.STRING },
  descripcionactminera: { type: DataTypes.STRING },
});

export default CompanyModel;
