const User = require("../Data/Models/User");
const NumberTools = require("../Utils/NumbersTools");

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
     * @param {string} isoLang 
     * @param {number} idCv : ID du CV
     * @param {string} format : PDF, HTML
     * @param {User} user 
     * @param {CallableFunction} mcbFinnished : Callback
     * @returns {String}
     * @async
     */
    generateCv(isoLang, idCv, format, user, mcbFinnished){
        const formatLC = String(format).toLowerCase();
        if(formatLC == "html"){
            return this.generateCvHtml(isoLang, idCv, user, mcbFinnished);
        }else if(formatLC == "pdf"){
            return this.generateCvPdf(isoLang, idCv, user, mcbFinnished);
        }else{
            return null;
        }
    }

    /**
     * Service for generating CV into HTML
     * @param {string} isoLang 
     * @param {number} idCv 
     * @param {User} user 
     * @param {Function} mcbFinnished 
     * @returns {String}
     * @todo Create a new function : filename->htmlContent
     * @todo Create another bloc to handle generation html from database
     * @todo Add function to handle variable remplacement to the cv content (name, etc...)
     * @async
     */
    async generateCvHtml(isoLang, idCv, user, mcbFinnished){
        const path = require("path");
        const fs = require('fs');
        
        const filename = this.getTemplateVueFilePath(idCv, true);
        const htmlFilename = path.resolve(filename);
        await fs.readFile(htmlFilename, 'utf8', (err, htmlContent) => {
            mcbFinnished(htmlContent);
        });
    }

    /**
     * Service for generating CV into PDF
     * @param {string} isoLang 
     * @param {number} idCv 
     * @param {User} user 
     * @param {CallableFunction} mcbFinnished 
     * @returns {String}
     * @async
     * @todo Check if urlCv exist
     */
    async generateCvPdf(isoLang, idCv, user, mcbFinnished){
        const pdfFilename = this.makePdfFilename(idCv, isoLang, user);
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
     * @param {boolean} withTemplatesRoot 
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
    makePdfFilename(idCv, isoLang, user){
        const dateObj   = new Date();
        const month     = NumberTools.zeroLead(dateObj.getUTCMonth() + 1, 2); //months from 1-12
        const day       = NumberTools.zeroLead(dateObj.getDate(), 2);
        const year      = NumberTools.zeroLead(dateObj.getUTCFullYear(), 4);
        const hour      = NumberTools.zeroLead(dateObj.getHours(), 2);
        const minute    = NumberTools.zeroLead(dateObj.getMinutes(), 2);
        const seconde   = NumberTools.zeroLead(dateObj.getSeconds(), 2);

        let lastname = user.lastname;
        const isoLangMaj = String(isoLang).toUpperCase();

        return `CV-${idCv}-${lastname}-${isoLangMaj} ${year}-${month}-${day} ${hour}h${minute}m${seconde}s`;
    }

    /**
     * @todo Move to a dedicated utils class
     */
    getHostUrl(){
        return `http://localhost:3000`;
    }

}

module.exports = CvService;