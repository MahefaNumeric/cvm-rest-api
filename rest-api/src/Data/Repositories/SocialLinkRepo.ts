import BaseRepo from './BaseRepo';
import SocialLink from '../Models/SocialLink';

export default class SocialLinkRepo extends BaseRepo<SocialLink> {

    
    /**
     * 
     * @param {number} idUser 
     * @returns {SocialLink}
     */
    static createFromDbById(idUser: number): Promise<SocialLink>{
        return new Promise((resolve, reject) => {
            const connMysql = require("../../Configs/Databases/db.config");
            const sql = /* sql */`
                SELECT 
                    socials_link.*
                FROM socials_link
                WHERE user_id = ${idUser} 
                LIMIT 1
            `;
            connMysql.query(sql, (error: any, socialLinkResult: any, fields: any) => {
                if(error) throw error;
                if(Array.isArray(socialLinkResult) && socialLinkResult.length > 0) {
                    const socialLink = SocialLink.createFromObj(socialLinkResult[0]);
                    resolve(socialLink);
                }else{
                    console.log("SocialLink::createFromDbById::socialLinkResult", socialLinkResult, error);
                }
            });
        });
    }

}