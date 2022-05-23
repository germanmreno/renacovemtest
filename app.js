import express from "express";
import dotenv from "dotenv";
import cors from "cors";
import fileUpload from "express-fileupload";
import path from "path";
import { fileURLToPath } from "url";

import db from "./database/db.js";

import comRouter from "./routes/routes.js";

const app = express();

app.use(fileUpload());

dotenv.config();

const PORT = process.env.PORT || 3000;

const __filename = fileURLToPath(import.meta.url);

const __dirname = path.dirname(__filename);

app.use(express.static(__dirname + "/build"));
//Luego le decimos a express que sirva todo eso desde el home
app.get("/", (req, res) => {
  res.sendFile(path.join(__dirname, "/build", "index.html"));
});

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
