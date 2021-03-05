import Language from '../Data/Models/Language';
import User from '../Data/Models/User';
import CvService from '../Services/CvService';
import CvRepo from '../Data/Repositories/CvRepo';
import express, { NextFunction, Request, Response } from 'express';
import util from "util";
import LanguageRepo from '../Data/Repositories/LanguageRepo';
import UserRepo from '../Data/Repositories/UserRepo';
import ControllerTools from '../Utils/ControllerTools';

function getRoute(){
    const router = express.Router({ mergeParams: true });
     
    // Retrive CV list
    router.get("/", CvController.getCvList);

    // Create new CV
    router.post("/", CvController.createNewCv);

    // Get a CV by idCv
    router.get("/:id", CvController.GetCvByid);

    // Update CV
    router.put("/:id", CvController.updateCv);

    /**
     * Generate a given CV
     * @param {Int} idCv
     * @param {String} format
     * @returns 
     */
    router.get("/:idCv/template/:slugTemplate/generate/:format", CvController.generateGivenCv);

    /**
     * Previsualize the html output (Type: text/html)
     * @since v1
     * @tutorial If you change the url structure, don't forget to update too the url in "Services/CvService.js/generateCvPdf()"" function
     * @todo cvService.getTemplateVueFilePath : make the logic to manage by Template object
     * @todo Add template to url
     */
    router.get("/:idCv/template/:slugTemplate/generate/html/view", CvController.previsualizeHtmlOutput);

    return router;
}

class CvController {

    static getCvList = (request: any, response: any) => {
        console.log("CvController::getCvList");
        response.type("application/json")
            .status(200)
            .json({"msg": "CvController::getCvList"})
            .end();

        // const userService = new CvService();
        // userService.getListUser((results) => {
        //     console.log("Results: ", results);
        //     response.type("application/json")
        //         .json(results);
        // });
    }

    static generateGivenCv = (request: any, response: any) => {
        const isoLang = request.params.isoLang; // From parent params
        const idCv = request.params.idCv;
        const format = request.params.format;
        const slugTemplate = request.params.slugTemplate;
        const idUser = 1; // Mahefa

        const cvService = new CvService();
        let resultHTML = null;
        LanguageRepo.createFromDbByIso(isoLang).then((language: Language) => {
            UserRepo.createFromDbById(idUser, language.id).then((user: User) => {
                cvService.generateCv(isoLang, idCv, slugTemplate, format, user).then((result: any) => {
                    if(format == "html"){
                        resultHTML = result;
                        response.type("application/json")
                            .status(200)
                            .json({"html": resultHTML})
                            .end();
                    }else if(format == "pdf"){
                        response.type("application/json")
                            .status(200)
                            .json({
                                "message": "PDF generation finnished",
                                "data": result
                            })
                            .end();
                    }else{
                        response.type("application/json")
                            .status(400)
                            .json(`Error : Format error : ${format}`)
                            .end();
                    }
                });
            }).catch(error => userGetById_ErrorHandling(error, response, isoLang));
        }).catch(error => languageGetByIso_ErrorHandling(error, isoLang, response));
        return;
    }

    static createNewCv = (request: any, response: any)=>{
        const cvService = new CvService();
        
        const pData = request.body;
        cvService.createNewCv(pData).then((results: any) => {
            console.log("Results: ", results);
            response.type("application/json")
                .json(results);
        });
    }

    static GetCvByid = (request: any, response: any)=>{
        // const connMysql = require("../Configs/db.config");
        // const id = request.params.id;
        // console.log(id);
        // const sql = `SELECT * FROM users WHERE id = ${id}`;
        // connMysql.query(sql, (error, result, fields) => {
        //     if(error) throw error;
        //     console.log("Result: ", result.length);
        //     if(result.length > 0){
        //         response.type("application/json")
        //             .json(result);
        //     }else{
        //         response.type("application/json")
        //             .json({
        //                 "message": `Pas d'utilisateur avec l'id ${id}`
        //             });
        //     }
        // });
    }

    static updateCv = (request: any, response: any) => {
        // response.type("application/json");
        // const connMysql = require("../Configs/db.config");
        // const checkIdIfExist = require("../Validation/UserValidation").checkIdIfExist;
        // const pData = request.body;
        // const id = request.params.id;
        // console.log(pData, id, resultCheckIdUser);
    }

    static previsualizeHtmlOutput = (request: any, response: any, next: NextFunction) => {
        const isoLangLowercase = String(request.params.isoLang).toLowerCase(); // From parent params
        const idCv = parseInt(request.params.idCv);
        const slugTemplate = request.params.slugTemplate;   // Sensible a la casse
        const idUser = 1; // Mahefa

        const cvService = new CvService();
        
        LanguageRepo.createFromDbByIso(isoLangLowercase).then(language => {
            UserRepo.createFromDbById(idUser, language.id).then(user => {
                CvRepo.createFromDbById(idCv, language.id).then(cv => {
                    const data = {
                        user: user,
                        cv: cv,
                        language: language
                    };
                    console.log("/:idCv/generate/html/view", util.inspect(data, {showHidden: false, depth: null, colors: true}));
                    const htmlPageTitle = `${isoLangLowercase=="en" ? 'Resume':'CV'} ${data.user.lastname}`;
                    request.vueOptions = vueOptions(htmlPageTitle);
                    
                    const templateVueFilePath = cvService.getTemplateVueFilePath(slugTemplate, idCv, false);
                    response.type("text/html")
                        .status(200)
                        .renderVue(templateVueFilePath, data, request.vueOptions);
                }).catch((error: any) => cvGetById_ErrorHandling(error, idCv, response));
            }).catch(error => userGetById_ErrorHandling(error, response, isoLangLowercase));
        }).catch(error => languageGetByIso_ErrorHandling(error, isoLangLowercase, response));
    }
}

function userGetById_ErrorHandling(error: any, response: any, isoLang: string){
    console.error("CvController:: /:idCv/generate/html/view User.createFromDbById::", error);
    response.type("text/json")
        .status(404)
        .write(JSON.stringify({
            message: `Error: This User doesn't have '${isoLang}' language`,
            data: [
                "CvController:: /:idCv/generate/html/view User.createFromDbById::",
                error
            ]
        }));
    response.end();
}

function languageGetByIso_ErrorHandling(error: any, isoLang: string, response: any){
    switch(error.code){
        case LanguageRepo.MSG_NO_LANGUAGE:
            response.type("text/json")
                .status(404)
                .write(JSON.stringify({message: `Error: Language '${isoLang}' does not exist`}));
            response.end();
            break;
        case LanguageRepo.MSG_RESULT_NOT_KNOW:
            response.type("text/json")
                .status(500)
                .write(JSON.stringify({message: `MSG_RESULT_NOT_KNOW`}));
            response.end();
            break;
        case "ECONNREFUSED":
            response.type("text/json")
                .status(500)
                .write(JSON.stringify({message: `Database not reachable`}));
            response.end();
            break;
        default:
    }
}

function cvGetById_ErrorHandling(error: any, idCv: number, response: any){
    let dataRender = {};
    if(error.code == CvRepo.MSG_NO_CV_GIVEN_ID){
        dataRender = {
            message: `Error: CV id #${idCv} does not exist`,
            code: error.code
        }
    }else{
        dataRender = {
            message: `Error: Unknow`,
            code: "UNKNOW_ERROR",
            data: [error]
        }
    }

    response.type("text/json")
        .status(404)
        .write(JSON.stringify(dataRender));
    response.end();
}

/**
 * 
 * @param {string} htmlPageTitle 
 * @todo Twitter ????
 */
const vueOptions = (htmlPageTitle: string) => ({
    head: {
        title: htmlPageTitle,
        metas: [
            { property:'og:title', content: htmlPageTitle},
            { name:'twitter:title', content: htmlPageTitle},
        ]
    },
})


// export default getRoute();   //TypeError: Router.use() requires a middleware function but got a Object
module.exports = getRoute();