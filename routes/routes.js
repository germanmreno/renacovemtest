import express from "express";
import {
  getAllCompanies,
  getCompany,
  registerCompany,
} from "../controllers/ComController.js";
const router = express.Router();

router.get("/companies", getAllCompanies);
router.get("/companies/:id", getCompany);
router.post("/companyregister", registerCompany);

export default router;
