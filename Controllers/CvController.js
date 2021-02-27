const util = require('util');
const Language = require("../Data/Models/Language");
const CvService = require("../Services/CvService");
const User = require("../Data/Models/User");
const Cv = require("../Data/Models/Cv");

module.exports = (router) => {
    
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
    router.get("/:idCv/generate/:format", CvController.generateGivenCv);

    /**
     * Previsualize the html output (Type: text/html)
     * @since v1
     * @tutorial If you change the url structure, don't forget to update too the url in "Services/CvService.js/generateCvPdf()"" function
     * @todo cvService.getTemplateVueFilePath : make the logic to manage by Template object
     * @todo Add template to url
     */
    router.get("/:idCv/generate/html/view", CvController.previsualizeHtmlOutput);
    
    return router;
}

class CvController {

    static getCvList = (request, response) => {
        const userService = new CvService();
        userService.getListUser((results) => {
            console.log("Results: ", results);
            response.type("application/json");
            response.json(results);
        });
    }

    static generateGivenCv = (request, response) => {
        const isoLang = request.params.isoLang; // From parent params
        const idCv = request.params.idCv;
        const format = request.params.format;
        const idUser = 1; // Mahefa

        const cvService = new CvService();
        let resultHTML = null;
        Language.createFromDbByIso(isoLang).then((language) => {
            User.createFromDbById(idUser, language.id).then((user) => {
                cvService.generateCv(isoLang, idCv, format, user, (result) => {
                    if(format == "html"){
                        resultHTML = result;
                        response.type("application/json");
                        response.status(200);
                        response.json({"html": resultHTML});
                        response.end();
                    }else if(format == "pdf"){
                        response.type("application/json");
                        response.status(200);
                        response.json({
                            "message": "PDF generation finnished",
                            "data": result
                        });
                        response.end();
                    }else{
                        response.type("application/json");
                        response.status(400);
                        response.json(`Error : Format error : ${format}`);
                        response.end();
                    }
                });
            }).catch(error => userGetById_ErrorHandling(error, response));
        }).catch(error => languageGetByIso_ErrorHandling(error, isoLang, response));
        return;
    }

    static createNewCv = (request, response)=>{
        response.type("application/json");
        const userService = new CvService();
        
        const pData = request.body;
        userService.createNewUser(pData, (results) => {
            console.log("Results: ", results);
            response.type("application/json");
            response.json(results);
        });
    }

    static GetCvByid = (request, response)=>{
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
    }

    static updateCv = (request, response) => {
        response.type("application/json");
        const connMysql = require("../Configs/db.config");
        const checkIdIfExist = require("../Validation/UserValidation").checkIdIfExist;
        const pData = request.body;
        const id = request.params.id;
        console.log(pData, id, resultCheckIdUser);
    }

    static previsualizeHtmlOutput = (request, response, next) => {
        const isoLang = request.params.isoLang; // From parent params
        const idCv = request.params.idCv;
        const idUser = 1; // Mahefa

        const cvService = new CvService();

        Language.createFromDbByIso(isoLang).then((language) => {
            User.createFromDbById(idUser, language.id).then((user) => {
                Cv.createFromDbById(idCv, language.id).then((cv) => {
                    const data = {
                        user: user,
                        cv: cv,
                        language: language
                    };
                    console.log("/:idCv/generate/html/view", util.inspect(data, {showHidden: false, depth: null, colors: true}));
                    const htmlPageTitle = `Resume ${data.lastname}`;
                    request.vueOptions = vueOptions(htmlPageTitle);
                    
                    const templateVueFilePath = cvService.getTemplateVueFilePath(idCv, false);
                    response.type("text/html");
                    response.status(200);
                    response.renderVue(templateVueFilePath, data, request.vueOptions);
                }).catch(error => cvGetById_ErrorHandling(error, idCv, response));
            }).catch(error => userGetById_ErrorHandling(error, response));
        }).catch(error => languageGetByIso_ErrorHandling(error, isoLang, response));
    }
}

function userGetById_ErrorHandling(error, response){
    console.error("CvController:: /:idCv/generate/html/view User.createFromDbById::", error);
}

function languageGetByIso_ErrorHandling(error, isoLang, response){
    switch(error.code){
        case Language.MSG_NO_LANGUAGE:
            response.type("text/json");
            response.status(404);
            response.write(JSON.stringify({message: `Error: Language '${isoLang}' does not exist`}));
            response.end();
            break;
        case Language.MSG_RESULT_NOT_KNOW:
            response.type("text/json");
            response.status(500);
            response.write(JSON.stringify({message: `MSG_RESULT_NOT_KNOW`}));
            response.end();
            break;
        case "ECONNREFUSED":
            response.type("text/json");
            response.status(500);
            response.write(JSON.stringify({message: `Database not reachable`}));
            response.end();
            break;
        default:
    }
}

function cvGetById_ErrorHandling(error, idCv, response){
    let dataRender = {};
    if(error.code == Cv.MSG_NO_CV_GIVEN_ID){
        dataRender = {
            message: `Error: CV id #${idCv} does not exist`,
            code: error.code
        }
    }else{
        dataRender = {
            message: `Error: Unknow`,
            code: "UNKNOW_ERROR"
        }
    }

    response.type("text/json");
    response.status(404);
    response.write(JSON.stringify(dataRender));
    response.end();
}

/**
 * 
 * @param {*} htmlPageTitle 
 * @todo Twitter ????
 */
const vueOptions = (htmlPageTitle) => ({
    head: {
        title: htmlPageTitle,
        metas: [
            { property:'og:title', content: htmlPageTitle},
            { name:'twitter:title', content: htmlPageTitle},
        ]
    },
})