import express from "express";
import {
  authHome,
  getAllCompanies,
  getCompany,
  loginUser,
  registerCompany,
  registerUser,
} from "../controllers/ComController.js";

const router = express.Router();

router.get("/companies", getAllCompanies);
router.get("/companies/:id", getCompany);
router.get("/home", authHome);
router.post("/companyregister", registerCompany);
router.post("/register", registerUser);
router.post("/login", loginUser);
router.post("/auth", authHome);

export default router;
