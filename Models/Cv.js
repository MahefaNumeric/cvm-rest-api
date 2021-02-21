
class Cv{
    /**
     * 
     * @param {number} id 
     * @param {Template} template 
     * @param {string} slug 
     * @param {Address} address 
     * @param {string} title 
     * @param {string} auto_biography 
     * @param {Date} date_add 
     * @param {Date} date_update 
     */
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
        this.template = template;
        this.slug = slug;
        this.address = address;
        this.title = title;
        this.auto_biography = auto_biography;
        this.date_add = date_add;
        this.date_update = date_update;
    }

    /**
     * 
     * @param {number} idUser 
     * @returns {User}
     */
    static createFromDbById(idCv, cbFinnished){
        const connMysql = require("../Configs/Databases/db.config");
        const sql = `
        SELECT 
            users.*, 
            users_lang.auto_description, 
            users_lang.auto_biography
        FROM users 
        JOIN users_lang 
            ON users.id=users_lang.id_user 
        WHERE id = ${idUser} 
            AND users_lang.id_lang = ${idLang}
        LIMIT 1`;
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

    /**
     * 
     * @param {FormData} form 
     * @returns {User}
     */
    static createFromForm(form){
        const user = new User(
            null
        );
    }
}

module.exports = Cv;