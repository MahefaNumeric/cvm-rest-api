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
        const path = require("path");
        const fs = require('fs');
        
        const filename = "./Templates/cv/template-1/index.html";
        const htmlFilename = path.resolve(filename);
        await fs.readFile(htmlFilename, 'utf8', (err, htmlContent) => {
            mcbFinnished(htmlContent);
        });
        return;
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
        const puppeteer = require("puppeteer");
        const path = require("path");

        const filename = "./Templates/cv/template-1/index.html";
        const htmlFilename = path.resolve(filename);

        const dateObj = new Date();
        const month = dateObj.getUTCMonth() + 1; //months from 1-12
        const day = dateObj.getUTCDate();
        const year = dateObj.getUTCFullYear();
        const hour = dateObj.getHours();
        const minute = dateObj.getMinutes();
        const seconde = dateObj.getSeconds();

        const browser = await puppeteer.launch();
        const page = await browser.newPage();
        await page.goto("file://" + htmlFilename);
        await page.pdf({ path: `./Public/CvOutput/cv-${idCv}-${year}-${month}-${day}-${hour}-${minute}-${seconde}.pdf`, format: "Letter" });
        await browser.close();

        mcbFinnished(null);
        return;
    }

}

module.exports = CvService;