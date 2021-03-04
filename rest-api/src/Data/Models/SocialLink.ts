
export default class SocialLink{
    static _table = "socials_link";

    constructor(
        public user_id: number,
        public github_url: string,
        public linkedin_url: string,
        public skype_id: string,
        public website_url: string,
        public zoom_id: number,
    ){
    }

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
                    ${this._table}.*
                FROM ${this._table}
                WHERE user_id = ${idUser} 
                LIMIT 1
            `;
            connMysql.query(sql, (error: any, socialLinkResult: any, fields: any) => {
                if(error) throw error;
                if(Array.isArray(socialLinkResult) && socialLinkResult.length > 0) {
                    const socialLink = new SocialLink(...Object.values(socialLinkResult[0]));
                    resolve(socialLink);
                }else{
                    console.log("SocialLink::createFromDbById::socialLinkResult", socialLinkResult, error);
                }
            });
        });
    }

}