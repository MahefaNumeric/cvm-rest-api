
export default class UsersService{
    
    // async getListUser(cbFinnished){
    //     const connMysql = require("../Configs/db.config");
    //     connMysql.query("SELECT * FROM users", (error, results, fields) => {
    //         if(error) throw error;
    //         cbFinnished && cbFinnished(results);
    //     });
    // }

    // async createNewUser(pData, mcbFinnished){
    //     const connMysql = require("../Configs/db.config");
    //     const sql = `INSERT INTO 
    //     users (firstname, lastname, date_birth, auto_desc) 
    //     VALUE ('${pData.firstname}', '${pData.lastname}', '${pData.date_birth}', '${pData.auto_desc}')`;
    //     connMysql.query(sql, (error, results, fields)=> {
    //         if(error) throw error;
    //         cbFinnished && cbFinnished(results);
    //     });
    // }

    checkCredentials(username: string, password: string){
        if(username == "test" && password == "pwd"){
            return {
                name: "Test",
                lastname: "2"
            };
        }else{
            return null;
        }
    }
}