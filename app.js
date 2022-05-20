import express from "express";
import dotenv from "dotenv";
import cors from "cors";
import fileUpload from "express-fileupload";

import db from "./database/db.js";

import comRouter from "./routes/routes.js";

const app = express();

app.use(fileUpload());

dotenv.config();

const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());
app.use("/comapp", comRouter);

try {
  await db.authenticate();
  console.log("Conexión exitosa a la DB");
} catch (error) {
  console.log(`El error de conexiòn es: ${error}`);
}

app.listen(PORT, () => {
  console.log(`Servidor levantado en el puerto ${PORT}`);
});
