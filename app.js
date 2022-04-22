import express from "express";
import cors from "cors";

import db from "./database/db.js";

import comRouter from "./routes/routes.js";

const app = express();

app.use(cors());
app.use(express.json());
app.use("/comapp", comRouter);

try {
  await db.authenticate();
  console.log("Conexión exitosa a la DB");
} catch (error) {
  console.log(`El error de conexiòn es: ${error}`);
}

app.get("/", (req, res) => {
  res.send("Hola mundo!");
});

app.listen(8000, () => {
  console.log("Server up running in http://localhost:8000/");
});
