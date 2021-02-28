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
            response.type("application/json")
                .json(results);
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
            }).catch(error => userGetById_ErrorHandling(error, response));
        }).catch(error => languageGetByIso_ErrorHandling(error, isoLang, response));
        return;
    }

    static createNewCv = (request, response)=>{
        const userService = new CvService();
        
        const pData = request.body;
        userService.createNewUser(pData, (results) => {
            console.log("Results: ", results);
            response.type("application/json")
                .json(results);
        });
    }

    static GetCvByid = (request, response)=>{
        const connMysql = require("../Configs/db.config");
        const id = request.params.id;
        console.log(id);
        const sql = `SELECT * FROM users WHERE id = ${id}`;
        connMysql.query(sql, (error, result, fields) => {
            if(error) throw error;
            console.log("Result: ", result.length);
            if(result.length > 0){
                response.type("application/json")
                    .json(result);
            }else{
                response.type("application/json")
                    .json({
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
        const isoLangLowercase = String(request.params.isoLang).toLowerCase(); // From parent params
        const idCv = request.params.idCv;
        const idUser = 1; // Mahefa

        const cvService = new CvService();

        Language.createFromDbByIso(isoLangLowercase).then(language => {
            User.createFromDbById(idUser, language.id).then(user => {
                Cv.createFromDbById(idCv, language.id).then(cv => {
                    const data = {
                        user: user,
                        cv: cv,
                        language: language
                    };
                    console.log("/:idCv/generate/html/view", util.inspect(data, {showHidden: false, depth: null, colors: true}));
                    const htmlPageTitle = `${isoLangLowercase=="en" ? 'Resume':'CV'} ${data.user.lastname}`;
                    request.vueOptions = vueOptions(htmlPageTitle);
                    
                    const templateVueFilePath = cvService.getTemplateVueFilePath(idCv, false);
                    response.type("text/html")
                        .status(200)
                        .renderVue(templateVueFilePath, data, request.vueOptions);
                }).catch(error => cvGetById_ErrorHandling(error, idCv, response));
            }).catch(error => userGetById_ErrorHandling(error, response, isoLangLowercase));
        }).catch(error => languageGetByIso_ErrorHandling(error, isoLangLowercase, response));
    }
}

function userGetById_ErrorHandling(error, response, isoLang){
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

function languageGetByIso_ErrorHandling(error, isoLang, response){
    switch(error.code){
        case Language.MSG_NO_LANGUAGE:
            response.type("text/json")
                .status(404)
                .write(JSON.stringify({message: `Error: Language '${isoLang}' does not exist`}));
            response.end();
            break;
        case Language.MSG_RESULT_NOT_KNOW:
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

    response.type("text/json")
        .status(404)
        .write(JSON.stringify(dataRender));
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