// const mysql = require("mysql");
// const express = require("express");
const util = require('util');
const Language = require("../Models/Language");

const CvService = require("../Services/CvService");

module.exports = (router) => {
    
    // Recupere liste CV
    router.get("/", (request, response) => {
        const userService = new CvService();
        userService.getListUser((results) => {
            console.log("Results: ", results);
            response.type("application/json");
            response.json(results);
        });
    });

    // Creation nouvel CV
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

    // Creation nouvel CV
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

    // Mise a jours de CV
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
    router.get("/:idCv/generate/:format", (request, response) => {
        response.type("application/json");

        const idCv = request.params.idCv;
        const format = request.params.format;

        const cvService = new CvService();
        let resultHTML = null;
        cvService.generateCv(idCv, format, (result) => {
            if(format == "html"){
                resultHTML = result;
                response.json({"html": resultHTML});
                response.end();
            }else if(format == "pdf"){
                response.json({
                    "message": "PDF generation finnished",
                    "data": result
                });
            }else{
                response.json("Error : Empty format");
            }
        });
        return;
    });

    /**
     * Previsualise the html output (Type: text/html)
     */
    router.get("/:idCv/generate/html/view", (request, response, next) => {
        const idCv = request.params.idCv;
        const isoLang = request.params.isoLang; // From parent params

        const cvService = new CvService();

        const User = require("../Models/User");
        const Cv = require("../Models/Cv");

        Language.createFromDbByIso(isoLang).then((language) => {
            console.log("CvController::Language.createFromDbByIso", language);
            User.createFromDbById(1, language.id).then((user) => {
                Cv.createFromDbById(1, language.id).then((cv) => {
                    const data = {
                        user: user,
                        cv: cv,
                        language: language
                    };
                    // console.log("/:idCv/generate/html/view", util.inspect(data, {showHidden: false, depth: null, colors: true}), "isoLang: ", isoLang);
                    const htmlPageTitle = `Resume ${data.lastname}`;
                    request.vueOptions = vueOptions(htmlPageTitle);
                    
                    const templateVueFilePath = cvService.getTemplateVueFilePath(idCv, false);
                    response.type("text/html");
                    response.renderVue(templateVueFilePath, data, request.vueOptions);
                    // response.end();
                }).catch((error) => {
                    console.error("CvController:: /:idCv/generate/html/view Cv.createFromDbById::", error);
                });
            }).catch((error) => {
                console.error("CvController:: /:idCv/generate/html/view User.createFromDbById::", error);
            });
        }).catch((error) => {
            response.type("text/json");
            response.write({message: `Error: Langugage '${isoLang}' not exist`});
            response.end();
        });
    });
    
    return router;
}

const vueOptions = (htmlPageTitle) => ({
    head: {
        title: htmlPageTitle,
        metas: [
            { property:'og:title', content: htmlPageTitle},
            { name:'twitter:title', content: htmlPageTitle},
        ]
    },
})