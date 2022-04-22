import CompanyModel from "../models/ComModel.js";

//Métodos

//Mostrar todos los registros
export const getAllCompanies = async (req, res) => {
  try {
    const companies = await CompanyModel.findAll();
    res.json(companies);
  } catch (error) {
    res.json({ message: error.message });
  }
};

//Mostrar una compañía
export const getCompany = async (req, res) => {
  try {
    const company = await CompanyModel.findAll({
      where: {
        id: req.params.id,
      },
    });
    res.json(company[0]);
  } catch {
    res.json({ message: error.message });
  }
};

//Registrar compañía
export const registerCompany = async (req, res) => {
  try {
    await CompanyModel.create(req.body);
    res.json({
      message: "La compañía se ha registrado correctamente",
    });
  } catch (error) {
    res.json({ message: error.message });
  }
};
