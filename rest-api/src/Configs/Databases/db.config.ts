// import mysql from "mysql";

// const connection = mysql.createConnection({
//     host: "localhost",
//     user: "root",
//     password: "",
//     database: "cvm_typeorm"
//     // multipleStatements: true
// });

// connection.connect((error: any) => {
//     if (error) {
//       console.error('DB Error connecting: ', error);
//       if(error.code == "ECONNREFUSED"){
//         console.error('Your database (MYSQL) is not running or you are refuse to access to it. Please, verify it! Message from Mahefa.');
//       }
//       return;
//     }
  
//    console.log('DB Connected as id ', connection.threadId);
// });

// module.exports = connection;



// -----------------

import "reflect-metadata";
import {createConnection} from "typeorm";
import Skill from "../../Data/Models/Skill";

export const promiseConnection = createConnection({
    type: "mysql",
    host: "localhost",
    port: 3306,
    username: "root",
    password: "",
    database: "cvm_typeorm",
    entities: [
        Skill
    ],
    synchronize: false, // @todo: Need to activate when all thing is done
    logging: false
}).then(connection => {
    // here you can start to work with your entities
    console.log('DB Connected(TypeORM): ', connection.isConnected);
}).catch(error => console.log(error));

// module.exports = promiseConnection;
