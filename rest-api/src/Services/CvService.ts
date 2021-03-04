const connMysql = require("../Configs/Databases/db.config");
const path = require("path");
const fs = require('fs');
import Cv from "../Data/Models/Cv";
import User from '../Data/Models/User';

export default class CvService{
    
    // @todo
    // async getListCv(cbFinnished){
    //     const connMysql = require("../Configs/db.config");
    //     connMysql.query("SELECT * FROM cv", (error, results, fields) => {
    //         if(error) throw error;
    //         cbFinnished && cbFinnished(results);
    //     });
    // }
    
    // @todo
    // async getCv(idCv, cbFinnished){
    //     const connMysql = require("../Configs/db.config");
    //     connMysql.query("SELECT * FROM cv", (error, results, fields) => {
    //         if(error) throw error;
    //         cbFinnished && cbFinnished(results);
    //     });
    // }

    /**
     * 
     * @param pData 
     * @todo reject
     */
    public createNewCv(pData: any): Promise<Cv>{
        return new Promise((resolve, reject) => {
            const sql = /* sql */`
                INSERT INTO 
                users (firstname, lastname, date_birth, auto_desc) 
                VALUE (?, ?, ?, ?)
            `;
            const sqlData = [pData.firstname, pData.lastname, pData.date_birth, pData.auto_desc];
            connMysql.query(sql, sqlData, (error: any, results: any, fields: any)=> {
                if(error) throw error;
                resolve(results);
            });
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
     * @todo add catch for then
     */
    public generateCv(isoLang: string, idCv: number, format: string, user: User): Promise<Cv>{
        return new Promise((resolve, reject) => {
            const formatLC = String(format).toLowerCase();
            if(formatLC == "html"){
                this.generateCvHtml(isoLang, idCv, user)
                    .then((result: any) => {
                        resolve(result);
                    });
            }else if(formatLC == "pdf"){
                this.generateCvPdf(isoLang, idCv, user)
                    .then((result: any) => {
                        resolve(result);
                    });
            }else{
                reject({
                    source : "CvService::generateCv"
                });
            }
        });
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
     * @todo remove user argument if not used
     * @async
     */
    public generateCvHtml(isoLang: string, idCv: number, user: User): Promise<string>{
        return new Promise(async (resolve, reject) => {
            const filename = this.getTemplateVueFilePath(idCv, true);
            const htmlFilename = path.resolve(filename);
            await fs.readFile(htmlFilename, 'utf8', (err: any, htmlContent: any) => {
                resolve(htmlContent);
            });
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
    public generateCvPdf(isoLang: string, idCv: number, user: User): Promise<Object>{
        return new Promise(async (resolve, reject) => {
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
    
            resolve({
                "filenameOutput": filenameOutput
            });
        });
    }

    /**
     * The path begin on root project folder > Templates/*
     * @param {number} idCv 
     * @param {boolean} withTemplatesRoot 
     * @todo cvService.getTemplateVueFilePath : make the logic to manage by Template object
     */
    public getTemplateVueFilePath(idCv: number, withTemplatesRoot: boolean = false): string{
        let rootView = '';
        if(withTemplatesRoot) rootView = "Templates/";

        const filename = "cv/template-1/index.vue";

        return "./" + rootView + filename;
    }

    /**
     * @todo Move to a dedicated utils class
     * @todo Should contain too the name of the User
     */
    public makePdfFilename(idCv: number, isoLang: string, user: User): string{
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
    public getHostUrl(): string{
        return `http://localhost:3000`;
    }

}