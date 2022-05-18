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
  tipoactividad: { type: DataTypes.JSON },
  actividadminera: { type: DataTypes.JSON },
  descripcionactminera: { type: DataTypes.STRING },
  nombreencargado: { type: DataTypes.STRING },
  cedulaencargado: { type: DataTypes.STRING },
  numempleados: { type: DataTypes.STRING },
  nombreempleados: { type: DataTypes.STRING },
  cedulaempleados: { type: DataTypes.STRING },
  cargoempleados: { type: DataTypes.STRING },
  medidacomercio: { type: DataTypes.STRING },
  inventario: { type: DataTypes.JSON },
  promediooro: { type: DataTypes.STRING },
  promedioganancia: { type: DataTypes.STRING },
  porcentajecompra: { type: DataTypes.STRING },
});

export default CompanyModel;
