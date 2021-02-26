const Address = require("./Address");
const SocialLink = require("./SocialLink");

class User{

    constructor(
        id,
        email,
        firstname,
        lastname,
        date_birth,
        phone,
        date_add,
        date_update,
        auto_description,
        auto_biography
    ){
        this.id = id;
        this.email = email;
        this.firstname = firstname;
        this.lastname = lastname;
        this.date_birth = date_birth;
        this.phone = phone;
        this.date_add = date_add;
        this.date_update = date_update;

        this.auto_description = auto_description ?? new Array();
        this.auto_biography = auto_biography ?? new Array();

        this.address = null;
        this.socialLink = null;
    }

    /**
     * 
     * @param {number} idUser 
     * @returns {User}
     */
    static createFromDbById(idUser, idLang){
        return new Promise((resolve, reject) => {
            const connMysql = require("../../Configs/Databases/db.config");
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
                LIMIT 1
            `;
            connMysql.query(sql, (error, usersResult, fields) => {
                if(error) throw error;
                if(Array.isArray(usersResult) && usersResult.length > 0) {
                    const userResultFirst = usersResult[0];
                    const user = new User(...Object.values(userResultFirst));
                    SocialLink.createFromDbById(userResultFirst.id, (socialLink) => {
                        user.socialLink = socialLink;
                        resolve(user);
                    });
                }else{
                    console.log("User::createFromDbById::usersResult", usersResult, error);
                    reject({
                        message: "User::createFromDbById::usersResult null"
                    });
                }
            });
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

module.exports = User;