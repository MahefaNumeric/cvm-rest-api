class CvService{
    
    // @todo
    async getListCv(cbFinnished){
        const connMysql = require("../Configs/db.config");
        connMysql.query("SELECT * FROM cv", (error, results, fields) => {
            if(error) throw error;
            cbFinnished && cbFinnished(results);
        });
    }
    
    // @todo
    async getCv(idCv, cbFinnished){
        const connMysql = require("../Configs/db.config");
        connMysql.query("SELECT * FROM cv", (error, results, fields) => {
            if(error) throw error;
            cbFinnished && cbFinnished(results);
        });
    }

    // @todo
    async createNewCv(pData, mcbFinnished){
        const connMysql = require("../Configs/db.config");
        const sql = `INSERT INTO 
        users (firstname, lastname, date_birth, auto_desc) 
        VALUE ('${pData.firstname}', '${pData.lastname}', '${pData.date_birth}', '${pData.auto_desc}')`;
        connMysql.query(sql, (error, results, fields)=> {
            if(error) throw error;
            cbFinnished && cbFinnished(results);
        });
    }

    /**
     * Service for generating CV into a given format
     * @param {Int32} idCv : ID du CV
     * @param {String} format : PDF, HTML
     * @param {Function} mcbFinnished : Callback
     * @returns {String}
     * @async
     */
    async generateCv(idCv, format, mcbFinnished){
        const formatLC = String(format).toLowerCase();
        if(formatLC == "html"){
            return this.generateCvHtml(idCv, mcbFinnished);
        }else if(formatLC == "pdf"){
            return this.generateCvPdf(idCv, mcbFinnished);
        }else{
            return null;
        }
    }

    /**
     * Service for generating CV into HTML
     * @param {number} idCv 
     * @param {Function} mcbFinnished 
     * @returns {String}
     * @todo Implement this function.
     * @async
     */
    async generateCvHtml(idCv, mcbFinnished){
        return "CvService::generateCvHtml";
        const connMysql = require("../Configs/db.config");
        const sql = `INSERT INTO 
        users (firstname, lastname, date_birth, auto_desc) 
        VALUE ('${pData.firstname}', '${pData.lastname}', '${pData.date_birth}', '${pData.auto_desc}')`;
        connMysql.query(sql, (error, results, fields)=> {
            if(error) throw error;
            cbFinnished && cbFinnished(results);
        });
    }

    /**
     * Service for generating CV into PDF
     * @param {*} idCv 
     * @param {*} mcbFinnished 
     * @returns {String}
     * @todo Implement this function.
     * @async
     */
    async generateCvPdf(idCv, mcbFinnished){
    }

}

module.exports = CvService;