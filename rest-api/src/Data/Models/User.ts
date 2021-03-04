import Address from './Address';
import SocialLink from './SocialLink';
import BaseModel from './BaseModel';

export default class User extends BaseModel {

    public address: Address;
    public socialLink: SocialLink;

    constructor(
        public id: number,
        public email: string,
        public firstname: string,
        public lastname: string,
        public date_birth: string,
        public phone: string,
        public url_profile: string,
        public auto_description: string,
        public auto_biography: string
    ){
        super();
        // this.address = new Address();
        // this.socialLink = undefined;
    }

    // static initalize(): void{

    // }

    /**
     * 
     * @param {number} idUser 
     * @param {number} idLang 
     * @returns {Promise<User>} Promise of User requested
     */
    static createFromDbById(idUser: number, idLang: number): Promise<User>{
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
            connMysql.query(sql, (error: any, usersResult: any, fields: any) => {
                if(error) throw error;
                if(Array.isArray(usersResult) && usersResult.length > 0) {
                    const userResultFirst = usersResult[0];
                    const user = new User(...Object.values(userResultFirst));
                    SocialLink.createFromDbById(userResultFirst.id).then((socialLink: SocialLink) => {
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
    static createFromForm(form: any){
    }


}