
class Address{
    static MSG_NO_ADRESS = "NO_ADRESS";
    static MSG_UNKOW_ERROR = "UNKOW_ERROR";
    static MSG_UNKOW_DATA = "UNKOW_DATA";

    /**
     * 
     * @param {number} id 
     * @param {number[0|1]} enable 
     * @param {number} id_user 
     * @param {string} slug 
     * @param {Date} date_add 
     * @param {Date} date_update 
     * @param {string} value 
     */
    constructor(
        id,
        enable,
        id_user,
        slug,
        date_add,
        date_update,
        value
    ){
        this.id = id;
        this.enable = enable;
        this.id_user = id_user;
        this.slug = slug;
        this.date_add = date_add;
        this.date_update = date_update;
        this.value = value;
    }

    /**
     * 
     * @param {number} idUser 
     * @returns {User}
     */
    static createFromDbById(idAddress, idLang){
        return new Promise((resolve, reject) => {
            const connMysql = require("../../Configs/Databases/db.config");
            const sql = /* sql */`
                SELECT 
                    address.*, 
                    address_lang.value
                FROM address 
                JOIN address_lang 
                    ON address.id=address_lang.id_address 
                WHERE id = ${idAddress} 
                    AND address_lang.id_lang = ${idLang}
                LIMIT 1
            `;
            connMysql.query(sql, (error, result, fields) => {
                if(error) reject({
                    message: "Address::createFromDbById::error",
                    code: this.MSG_UNKOW_ERROR,
                    data: {result, error}
                });
                if(Array.isArray(result)){
                    if(result.length > 0){
                        const address = new Address(...Object.values(result[0]));
                        resolve(address);
                    }else{
                        resolve([]);
                    }
                }else{
                    reject({
                        message: "Address::createFromDbById::result",
                        code: this.MSG_UNKOW_DATA,
                        data: {result, error}
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

module.exports = Address;