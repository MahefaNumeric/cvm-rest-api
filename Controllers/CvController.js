const util = require('util');
const Language = require("../Data/Models/Language");
const CvService = require("../Services/CvService");
const User = require("../Data/Models/User");
const Cv = require("../Data/Models/Cv");

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
        console.log(pData, id, resultCheckIdUser);
    });

    /**
     * Generate a given CV
     * @param {Int} idCv
     * @param {String} format
     * @returns 
     */
    router.get("/:idCv/generate/:format", (request, response) => {
        const isoLang = request.params.isoLang; // From parent params
        const idCv = request.params.idCv;
        const format = request.params.format;

        const cvService = new CvService();
        let resultHTML = null;
        cvService.generateCv(isoLang, idCv, format, (result) => {
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
        return;
    });

    /**
     * Previsualize the html output (Type: text/html)
     * @todo cvService.getTemplateVueFilePath : make the logic to manage by Template object
     */
    router.get("/:idCv/generate/html/view", (request, response, next) => {
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
                }).catch(error => cvErrorHandling(error, idCv, response));
            }).catch((error) => {
                console.error("CvController:: /:idCv/generate/html/view User.createFromDbById::", error);
            });
        }).catch((error) => {
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
        });
    });
    
    return router;
}

function cvErrorHandling(error, idCv, response){
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