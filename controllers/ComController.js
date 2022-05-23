import { compare, encrypt } from "../helpers/handleBcrypt.js";
import { v4 as uuidv4 } from "uuid";
import CompanyModel from "../models/ComModel.js";
import UserModel from "../models/UserModel.js";
import { SignJWT, jwtVerify } from "jose";

//Métodos

//Registrar usuario
export const registerUser = async (req, res) => {
  try {
    const { nombreusuario, contraseña, correo, telefono } = req.body;
    const guid = uuidv4();
    const passwordHash = await encrypt(contraseña);
    await UserModel.create({
      guid,
      nombreusuario,
      contraseña: passwordHash,
      correo,
      telefono,
    });

    res.json({
      message: "Se ha registrado exitosamente.",
    });
  } catch (error) {
    res.json({ message: error.message });
  }
};

export const loginUser = async (req, res) => {
  const { nombreusuario, contraseña } = req.body;

  if (!nombreusuario || !contraseña) return res.sendStatus(400);

  try {
    const { nombreusuario, contraseña } = req.body;
    const user = await UserModel.findOne({
      where: { nombreusuario: nombreusuario },
    });

    if (!user) return res.sendStatus(401);

    const checkPassword = await compare(contraseña, user.contraseña);

    if (!checkPassword) return res.send(401);

    if (checkPassword) {
      //Obtengo el guid
      const guid = user.dataValues.guid;

      //Generar token
      const jwtConstructor = new SignJWT({ guid });
      const encoder = new TextEncoder();
      const jwt = await jwtConstructor
        .setProtectedHeader({
          alg: "HS256",
          typ: "JWT",
        })
        .setIssuedAt()
        .setExpirationTime("24h")
        .sign(encoder.encode(process.env.JWT_PRIVATE_KEY));

      return res.json({
        guid: user.guid,
        name: user.nombreusuario,
        jwt,
      });
    } else {
      return res.sendStatus(401);
    }
  } catch (error) {
    res.json({ message: error.message });
  }
};

//Verificar registro de empresa

export const authCompany = async (req, res) => {
  const { jwt } = req.body;
  const encoder = new TextEncoder();
  const {
    payload: { guid },
  } = await jwtVerify(jwt, encoder.encode(process.env.JWT_PRIVATE_KEY));

  try {
    const company = await CompanyModel.findByPk(guid);
    if (company === null) {
      res.json(false);
    } else {
      res.json(true);
    }
  } catch (err) {
    res.json({ message: error.message });
  }
};

//Obtenemos la data de las compañías
export const companyData = async (req, res) => {
  const { jwt } = req.body; //req.body = {}
  const encoder = new TextEncoder();
  const {
    payload: { guid },
  } = await jwtVerify(jwt, encoder.encode(process.env.JWT_PRIVATE_KEY));

  try {
    const company = await CompanyModel.findByPk(guid);
    if (company === null) {
      res.json({ message: "Ocurrió un error" });
    } else {
      res.json(company);
    }
  } catch (err) {
    res.json({ message: error.message });
  }
};

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
    const numRegistro = Math.random().toString(10).substring(9);
    const { guid: jwt } = req.body;

    const encoder = new TextEncoder();

    const {
      payload: { guid },
    } = await jwtVerify(jwt, encoder.encode(process.env.JWT_PRIVATE_KEY));
    //Cambiamos el jwt por el guid confirmado
    req.body.guid = guid;
    req.body.numregistro = numRegistro;

    await CompanyModel.create(req.body);
    res.json({
      message: "La compañía se ha registrado correctamente",
    });
  } catch (error) {
    res.json({ message: error.message });
  }
};
