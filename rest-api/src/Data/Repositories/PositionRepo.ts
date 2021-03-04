import BaseRepo from './BaseRepo';
import Address from '../Models/Address';

export default class AddressRepo extends BaseRepo {
    static MSG_NO_ADRESS = "NO_ADRESS";
    static MSG_UNKOW_ERROR = "UNKOW_ERROR";
    static MSG_UNKOW_DATA = "UNKOW_DATA";
    
    /**
     * 
     * @param {number} idUser 
     * @returns {User}
     */
    static createFromDbById(idAddress: number, idLang: number): Promise<Address>{
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
            connMysql.query(sql, (error: any, result: any, fields: any) => {
                if(error) reject({
                    message: "Address::createFromDbById::error",
                    code: this.MSG_UNKOW_ERROR,
                    data: {result, error}
                });
                if(Array.isArray(result)){
                    if(result.length > 0){
                        const address = Address.createFromObj(result[0]);
                        resolve(address);
                    }else{
                        reject({
                            message: `Address::createFromDbById:: Address ID: ${idAddress} does not exist`,
                            code: this.MSG_NO_ADRESS,
                            data: {result, error}
                        });
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
     * @todo implementation
     */
    static createFromForm(form: any){
    }

}