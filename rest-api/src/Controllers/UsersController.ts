import UsersService from '../Services/UserService';
// const mysql = require("mysql");
// const express = require("express");

const router = express.Router();

module.exports = router;

// Recupere liste Users
router.get("/", (request: any, response: any) => {
    // const userService = new UsersService();
    // userService.getListUser((results) => {
    //     console.log("Results: ", results);
    //     response.type("application/json");
    //     response.json(results);
    // });
});

// Creation nouvel utilisateur
router.post("/", (request: any, response: any)=>{
    response.type("application/json");
    const userService = new UsersService();
    
    const pData = request.body;
    console.log(pData);
    userService.createNewUser(pData).then((results) => {
        console.log("Results: ", results);
        response.type("application/json");
        response.json(results);
    });
});

// Creation nouvel utilisateur
router.get("/:id", (request: any, response: any)=>{
    // response.type("application/json");
    // const connMysql = require("../Configs/db.config");
    // const id = request.params.id;
    // console.log(id);
    // const sql = `SELECT * FROM users WHERE id = ${id}`;
    // connMysql.query(sql, (error, result, fields) => {
    //     if(error) throw error;
    //     console.log("Result: ", result.length);
    //     if(result.length > 0){
    //         response.json(result);
    //     }else{
    //         response.json({
    //             "message": `Pas d'utilisateur avec l'id ${id}`
    //         });
    //     }
    // });
});

// Mise a jours utilisateur
router.put("/:id", (request: any, response: any) => {
    // response.type("application/json");
    // const connMysql = require("../Configs/db.config");
    // const checkIdIfExist = require("../Validation/UserValidation").checkIdIfExist;
    // const pData = request.body;
    // const id = request.params.id;
    // // const resultCheckIdUser = checkIdIfExist(id, connMysql);
    // console.log(pData, id, resultCheckIdUser);
    // // const sql = `UPDATE users 
    // // SET firstname='${pData.firstname}', 
    // // lastname='${pData.lastname}', 
    // // date_birth='${pData.date_birth}', 
    // // auto_desc='${pData.auto_desc}'
    // // WHERE id=${id}`;
    // // connMysql.query(sql, (error, results, fields)=> {
    // //     if(error) throw error;
    // //     console.log("Results: ", results);
    // //     response.json(results);
    // // });
});