const express = require("express");

import SkillGroup from "../Data/Models/SkillGroup";
import SkillGroupService from '../Services/SkillGroupService';

export const router = express.Router({ mergeParams: true });

const skillGroupService = new SkillGroupService();

// Recupere liste
router.get("/all", (request: any, response: any) => {
    const isoLang = request.params.isoLang;
    skillGroupService.getListAllSkillGroup(isoLang)
        .then(list => {
            response.type("application/json").status(200);
            response.json(list);
            response.end();
        })
        .catch(error => {
            response.type("application/json").status(500);
            response.json(error);
            response.end();
        });
});

// Creation nouvel 
router.post("/", (request: any, response: any)=>{
    const pData = request.body;
    const skillGroup = new SkillGroup(
        null, pData.slug, pData.title, pData.description
    );

    // response.type("application/json");
    // response.json(skillGroup);
    // return;

    skillGroupService.createSkillGroup(skillGroup)
        .then(results => {
            // console.log("Results: ", results);
            response.type("application/json");
            response.json(results).status(200);
        })
        .catch(error => {
            // console.log("Results: ", error);
            response.type("application/json");
            response.json(error).status(500);
        });
});

// // Creation nouvel 
// router.get("/:id", (request, response)=>{
//     response.type("application/json");
//     const connMysql = require("../Configs/db.config");
//     const id = request.params.id;
//     console.log(id);
//     const sql = `SELECT * FROM users WHERE id = ${id}`;
//     connMysql.query(sql, (error, result, fields) => {
//         if(error) throw error;
//         console.log("Result: ", result.length);
//         if(result.length > 0){
//             response.json(result);
//         }else{
//             response.json({
//                 "message": `Pas d'utilisateur avec l'id ${id}`
//             });
//         }
//     });
// });

// // Mise a jours 
// router.put("/:id", (request, response) => {
//     response.type("application/json");
//     const connMysql = require("../Configs/db.config");
//     const checkIdIfExist = require("../Validation/UserValidation").checkIdIfExist;
//     const pData = request.body;
//     const id = request.params.id;
//     // const resultCheckIdUser = checkIdIfExist(id, connMysql);
//     console.log(pData, id, resultCheckIdUser);
//     // const sql = `UPDATE users 
//     // SET firstname='${pData.firstname}', 
//     // lastname='${pData.lastname}', 
//     // date_birth='${pData.date_birth}', 
//     // auto_desc='${pData.auto_desc}'
//     // WHERE id=${id}`;
//     // connMysql.query(sql, (error, results, fields)=> {
//     //     if(error) throw error;
//     //     console.log("Results: ", results);
//     //     response.json(results);
//     // });
// });


module.exports = router;