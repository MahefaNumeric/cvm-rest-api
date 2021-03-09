import mysql from "mysql";

const connection = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "cvm",
});

connection.connect((error: any) => {
    if (error) {
      console.error('DB Error connecting: ', error);
      if(error.code == "ECONNREFUSED"){
        console.error('Your database (MYSQL) is not running or you are refuse to access to it. Please, verify it! Message from Mahefa.');
      }
      return;
    }
  
   console.log('DB Connected as id ', connection.threadId);
});

module.exports = connection;



// -----------------

// import "reflect-metadata";
// import {createConnection} from "typeorm";
// import Skill from "../../Data/Models/Skill";

// createConnection({
//     type: "mysql",
//     host: "localhost",
//     port: 3306,
//     username: "root",
//     password: "admin",
//     database: "test",
//     entities: [
//         Skill
//     ],
//     synchronize: true,
//     logging: false
// }).then(connection => {
//     // here you can start to work with your entities
// }).catch(error => console.log(error));