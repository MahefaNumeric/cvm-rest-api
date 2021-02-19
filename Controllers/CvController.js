const mysql = require("mysql");
const express = require("express");

const CvService = require("../Services/CvService");

const router = express.Router();

module.exports = router;

// Recupere liste CV
router.get("/", (request, response) => {
    const userService = new CvService();
    userService.getListUser((results) => {
        console.log("Results: ", results);
        response.type("application/json");
        response.json(results);
    });
});

// Creation nouvel utilisateur
router.post("/", (request, response)=>{
    response.type("application/json");
    const userService = new CvService();
    
    const pData = request.body;
    console.log(pData);
    userService.createNewUser(pData, (results) => {
        console.log("Results: ", results);
        response.type("application/json");
        response.json(results);
    });
});

// Creation nouvel utilisateur
router.get("/:id", (request, response)=>{
    response.type("application/json");
    const connMysql = require("../Configs/db.config");
    const id = request.params.id;
    console.log(id);
    const sql = `SELECT * FROM users WHERE id = ${id}`;
    connMysql.query(sql, (error, result, fields) => {
        if(error) throw error;
        console.log("Result: ", result.length);
        if(result.length > 0){
            response.json(result);
        }else{
            response.json({
                "message": `Pas d'utilisateur avec l'id ${id}`
            });
        }
    });
});

// Mise a jours utilisateur
router.put("/:id", (request, response) => {
    response.type("application/json");
    const connMysql = require("../Configs/db.config");
    const checkIdIfExist = require("../Validation/UserValidation").checkIdIfExist;
    const pData = request.body;
    const id = request.params.id;
    // const resultCheckIdUser = checkIdIfExist(id, connMysql);
    console.log(pData, id, resultCheckIdUser);
    // const sql = `UPDATE users 
    // SET firstname='${pData.firstname}', 
    // lastname='${pData.lastname}', 
    // date_birth='${pData.date_birth}', 
    // auto_desc='${pData.auto_desc}'
    // WHERE id=${id}`;
    // connMysql.query(sql, (error, results, fields)=> {
    //     if(error) throw error;
    //     console.log("Results: ", results);
    //     response.json(results);
    // });
});

/**
 * Generate a given CV
 * @param {Int} idCv
 * @param {String} format
 * @returns 
 */
router.get("/generate/:idCv/:format", (request, response) => {
    response.type("application/json");

    const idCv = request.params.idCv;
    const format = request.params.format;

    const cvService = new CvService();
    const result = cvService.generateCvHtml(idCv, );

    response.json(["CvController::/generate/:idCv/:format", idCv, format]);
    return;

    const connMysql = require("../Configs/db.config");
    const sql = `SELECT * FROM users WHERE id = ${idCv}`;
    connMysql.query(sql, (error, result, fields) => {
        if(error) throw error;
        console.log("Result: ", result.length);
        if(result.length > 0){
            response.json(result);
        }else{
            response.json({
                "message": `Pas d'utilisateur avec l'id ${idCv}`
            });
        }
    });
});