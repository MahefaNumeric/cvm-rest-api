
class SocialLink{
    static _table = "socials_link";

    constructor(
        user_id,
        github_url,
        linkedin_url,
        skype_id,
        website_url,
        zoom_id,
    ){
        this.user_id = user_id;
        this.github_url = github_url;
        this.linkedin_url = linkedin_url;
        this.skype_id = skype_id;
        this.website_url = website_url;
        this.zoom_id = zoom_id;
    }

    /**
     * 
     * @param {number} idUser 
     * @returns {SocialLink}
     */
    static createFromDbById(idUser, cbFinnished){
        const connMysql = require("../../Configs/Databases/db.config");
        const sql = `
        SELECT 
            ${this._table}.*
        FROM ${this._table}
        WHERE user_id = ${idUser} 
        LIMIT 1`;
        connMysql.query(sql, (error, socialLinkResult, fields) => {
            if(error) throw error;
            if(Array.isArray(socialLinkResult) && socialLinkResult.length > 0) {
                const socialLink = new this(...Object.values(socialLinkResult[0]));
                cbFinnished && cbFinnished(socialLink);
            }else{
                console.log("SocialLink::createFromDbById::socialLinkResult", socialLinkResult, error);
            }
        });
    }

    /**
     * 
     * @param {FormData} form 
     * @returns {SocialLink}
     */
    static createFromForm(form){
        const user = new SocialLink(
            null
        );
    }


}

module.exports = SocialLink;