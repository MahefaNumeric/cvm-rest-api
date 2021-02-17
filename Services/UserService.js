

class UsersService{
    
    getListUser(){
        const connMysql = require("../Configs/db.config");
        connMysql.query("SELECT * FROM users", (error, results, fields)=> {
            if(error) throw error;
            console.log("Results: ", results);
            response.type("application/json");
            response.json(results);
        });
    }
}