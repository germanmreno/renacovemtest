import { Sequelize } from "sequelize";

const db = new Sequelize("comapp", "root", "", {
  host: "localhost",
  dialect: "mysql",
});

export default db;
