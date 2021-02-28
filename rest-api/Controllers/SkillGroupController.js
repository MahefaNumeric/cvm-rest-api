const express = require("express");
const SkillGroupService = require("../Services/SkillGroupService");

const router = express.Router({ mergeParams: true });

module.exports = router;

// Recupere liste
router.get("/all", (request, response) => {
    const skillGroupService = new SkillGroupService();
    const isoLang = request.params.isoLang;
    skillGroupService.getListAllSkillGroup(isoLang).then(list => {
        response.type("application/json");
        response.json(list);
        response.end();
    });
});

// // Creation nouvel 
// router.post("/", (request, response)=>{
//     response.type("application/json");
//     const userService = new UsersService();
    
//     const pData = request.body;
//     console.log(pData);
//     userService.createNewUser(pData, (results) => {
//         console.log("Results: ", results);
//         response.type("application/json");
//         response.json(results);
//     });
// });

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