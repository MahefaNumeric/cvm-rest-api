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
        const connMysql = require("../Configs/Databases/db.config");
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
    async generateCv(isoLang, idCv, format, mcbFinnished){
        const formatLC = String(format).toLowerCase();
        if(formatLC == "html"){
            return this.generateCvHtml(isoLang, idCv, mcbFinnished);
        }else if(formatLC == "pdf"){
            return this.generateCvPdf(isoLang, idCv, mcbFinnished);
        }else{
            return null;
        }
    }

    /**
     * Service for generating CV into HTML
     * @param {number} idCv 
     * @param {Function} mcbFinnished 
     * @returns {String}
     * @todo Create a new function : filename->htmlContent
     * @todo Create another bloc to handle generation html from database
     * @todo Add function to handle variable remplacement to the cv content (name, etc...)
     * @async
     */
    async generateCvHtml(isoLang, idCv, mcbFinnished){
        const path = require("path");
        const fs = require('fs');
        
        const filename = this.getTemplateVueFilePath(idCv, true);
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
     * @async
     * @todo Check if urlCv exist
     */
    async generateCvPdf(isoLang, idCv, mcbFinnished){
        const pdfFilename = this.makePdfFilename(idCv, isoLang);
        const filenameOutput = `./Public/CvOutput/${pdfFilename}.pdf`;

        const host = this.getHostUrl();
        const urlCv = `${host}/${isoLang}/cv/${idCv}/generate/html/view`;

        const puppeteer = require("puppeteer");
        const browser = await puppeteer.launch();
        const page = await browser.newPage();
        await page.goto(urlCv);
        await page.pdf({ path: filenameOutput, format: "Letter" });
        await browser.close();

        mcbFinnished({
            "filenameOutput": filenameOutput
        });
        return;
    }

    /**
     * The path begin on root project folder > Templates/*
     * @param {number} idCv 
     * @todo cvService.getTemplateVueFilePath : make the logic to manage by Template object
     */
    getTemplateVueFilePath(idCv, withTemplatesRoot = false){
        let rootView = '';
        if(withTemplatesRoot) rootView = "Templates/";

        const filename = "cv/template-1/index.vue";

        return "./" + rootView + filename;
    }

    /**
     * @todo Move to a dedicated utils class
     * @todo Should contain too the name of the User
     */
    makePdfFilename(idCv, isoLang){
        const dateObj = new Date();
        const month = dateObj.getUTCMonth() + 1; //months from 1-12
        const day = dateObj.getUTCDate();
        const year = dateObj.getUTCFullYear();
        const hour = dateObj.getHours();
        const minute = dateObj.getMinutes();
        const seconde = dateObj.getSeconds();

        return `cv-${idCv}-${isoLang}-${year}-${month}-${day}-${hour}h${minute}m${seconde}s`;
    }

    /**
     * @todo Move to a dedicated utils class
     */
    getHostUrl(){
        return `http://localhost:3000`;
    }

}

module.exports = CvService;