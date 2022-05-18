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
        .setExpirationTime("2h")
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

export const authHome = async (req, res) => {
  const { authorization } = req.headers;

  if (!authorization) return res.status(401);

  try {
    const encoder = new TextEncoder();
    const { payload } = await jwtVerify(
      authorization,
      encoder.encode(process.env.JWT_PRIVATE_KEY)
    );

    console.log(payload);
  } catch (err) {
    res.redirect("/");
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
    await CompanyModel.create(req.body);
    res.json({
      message: "La compañía se ha registrado correctamente",
    });
  } catch (error) {
    res.json({ message: error.message });
  }
};
