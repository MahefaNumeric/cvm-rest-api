// const mysql = require("mysql");
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
      return;
    }
  
   console.log('DB Connected as id ', connection.threadId);
});

module.exports = connection;