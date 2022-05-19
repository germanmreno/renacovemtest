import express from "express";
import {
  getAllCompanies,
  getCompany,
  loginUser,
  registerCompany,
  registerUser,
} from "../controllers/ComController.js";

const router = express.Router();

router.get("/companies", getAllCompanies);
router.get("/companies/:id", getCompany);
router.post("/companyregister", registerCompany);
router.post("/register", registerUser);
router.post("/login", loginUser);

export default router;
