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
        url_profile,
        auto_description,
        auto_biography
    ){
        this.id = id;
        this.email = email;
        this.firstname = firstname;
        this.lastname = lastname;
        this.date_birth = date_birth;
        this.phone = phone;
        this.url_profile = url_profile;

        this.auto_description = auto_description ?? new Array();
        this.auto_biography = auto_biography ?? new Array();

        this.address = null;
        this.socialLink = null;
    }

    /**
     * 
     * @param {number} idUser 
     * @param {number} idLang 
     * @returns {Promise<User>} Promise of User requested
     */
    static createFromDbById(idUser, idLang){
        return new Promise((resolve, reject) => {
            const connMysql = require("../../Configs/Databases/db.config");
            const sql = /* sql */`
                SELECT 
                    users.id, 
                    users.email, 
                    users.firstname, 
                    users.lastname, 
                    users.date_birth, 
                    users.phone, 
                    users.url_profile, 
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