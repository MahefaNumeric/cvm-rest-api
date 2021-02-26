
class Template{
    constructor(
        id,
        template,
        slug,
        address,
        title,
        auto_biography,
        date_add,
        date_update
    ){
        this.id = id;
        this.email = email;
        this.firstname = firstname;
        this.lastname = lastname;
        this.date_birth = date_birth;
        this.auto_desc = auto_desc;
        this.phone = phone;
        this.date_add = date_add;
        this.date_update = date_update;
    }

    /**
     * 
     * @param {number} idUser 
     * @returns {User}
     */
    static createFromDbById(idUser, cbFinnished){
        const connMysql = require("../../Configs/Databases/db.config");
        const sql = `SELECT * FROM users WHERE id = ${idUser}`;
        connMysql.query(sql, (error, usersResult, fields) => {
            if(error) throw error;
            if(Array.isArray(usersResult) && usersResult.length > 0){
                const user = new User(...Object.values(usersResult[0]));
                cbFinnished && cbFinnished(user);
            }else{
                console.log("User::createFromDbById::usersResult", usersResult, error);
            }
        });
    }
}

module.exports = Template;