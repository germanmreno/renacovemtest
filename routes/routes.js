import express from "express";
import {
  authCompany,
  companyData,
  getAllCompanies,
  getCompany,
  loginUser,
  registerCompany,
  registerUser,
} from "../controllers/ComController.js";
import path from "path";
import { fileURLToPath } from "url";

const router = express.Router();

router.get("/companies", getAllCompanies);
router.get("/companies/:id", getCompany);
router.post("/home", authCompany);
router.post("/companyregister", registerCompany);
router.post("/register", registerUser);
router.post("/confirmregister", companyData);
router.post("/login", loginUser);
router.post("/activregister", (req, res) => {
  const __filename = fileURLToPath(import.meta.url);

  const __dirname = path.dirname(__filename);

  if (req.files === null) {
    return res.status(400).json({ msg: "No file uploaded" });
  }

  const file = req.files.file;
  file.mv(`${__dirname}/uploads/${file.name}`, (err) => {
    if (err) {
      console.error(err);
      return res.status(500).send(err);
    }

    res.json({ fileName: file.name, filePath: `/uploads/{file.name}` });
  });
});
router.post("/actarecepcion", (req, res) => {
  const __filename = fileURLToPath(import.meta.url);

  const __dirname = path.dirname(__filename);

  if (req.files === null) {
    return res.status(400).json({ msg: "No file uploaded" });
  }

  const file = req.files.file;
  file.mv(`${__dirname}/uploads/${file.name}`, (err) => {
    if (err) {
      console.error(err);
      return res.status(500).send(err);
    }

    res.json({ fileName: file.name, filePath: `/uploads/{file.name}` });
  });
});
export default router;
