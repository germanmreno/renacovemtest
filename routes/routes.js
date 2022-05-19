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

const router = express.Router();

router.get("/companies", getAllCompanies);
router.get("/companies/:id", getCompany);
router.post("/home", authCompany);
router.post("/companyregister", registerCompany);
router.post("/register", registerUser);
router.post("/confirmregister", companyData);
router.post("/login", loginUser);

export default router;
