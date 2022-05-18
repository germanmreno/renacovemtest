import db from "../database/db.js";

import { DataTypes } from "sequelize";

const UserModel = db.define("users", {
  guid: { type: DataTypes.UUID, primaryKey: true },
  nombreusuario: { type: DataTypes.STRING },
  contraseña: { type: DataTypes.STRING },
  correo: { type: DataTypes.STRING },
  telefono: { type: DataTypes.STRING },
});

export default UserModel;
