import BaseModel from '../Models/BaseModel';
import SqlUtil from '../../Utils/Strings/SqlUtil';
import LanguageRepo from './LanguageRepo';
import LanguageTools from '../../Utils/LanguageTools';
const connMysql = require("../../Configs/Databases/db.config");

/**
 * All Repositories class MUST NOT import any *Service level
 */
export default class BaseRepo<T> {

    public static insert(model: BaseModel): Promise<any>{
        return new Promise((resolve, reject) => {
            const sql = /* sql */`
                INSERT INTO skills_group (
                    slug
                ) VALUES (
                    ?
                )
            `;

            const sqlData = [ model.slug ];
            connMysql.query(sql, sqlData, (error: any, result: any, fields: any) => {
                if(error){
                    reject({
                        message: "Error insert",
                        data: [error, result]
                    });
                    return false;
                }

                model.id = result.insertId;

                this.insertLang(model)
                    .then(resultInsertSkillGroupLang => {
                        resolve([model, result, error, resultInsertSkillGroupLang]);
                    })
                    .catch(errorInsertSkillGroupLang => {
                        reject(["insertSkillGroupLang::catch", errorInsertSkillGroupLang, model, result, error]);
                    });
            });
        });
    }

    /**
     * 
     * @param {BaseModel} model 
     */
    public static insertLang(model: BaseModel): Promise<any>{
        return new Promise((resolve, reject) => {
            if(model.id == null){
                reject({
                    origin: "BaseRepo::insertLang",
                    message: "model.id == null"
                });
                return false;
            }

            const definitionsLang = model.getDefinitionsLang();

            // resolve([model._table, definitionsLang]); return;

            LanguageRepo.getAllLanguage().then((allLanguages) => {
                const columnsLang = SqlUtil.buildSqlColumn(definitionsLang);
                const interogationsSqlPart = SqlUtil.buildSqlInterogation(allLanguages.length);
                const valuesIntergationOnInsert = SqlUtil.buildValuesInterogationsOnInsert(model, interogationsSqlPart);

                const sql = /* sql */`
                    INSERT INTO ${model._table}_lang (
                        id_${model._table},
                        id_lang,
                        ${columnsLang}
                    ) VALUES 
                    ${valuesIntergationOnInsert}
                `;

                // resolve([columnsLang, interogationsSqlPart, valuesIntergationOnInsert, sql]);

                const sqlData = new Array<any>();
                if(Array.isArray(model.title)){
                    for (let index = 0; index < model.title.length; index++) {
                        const idLang = LanguageTools.convertIsoToId(allLanguages, model.title[index].iso);
                        const arrayValueData = SqlUtil.buildArrayValueData(model, definitionsLang, index);
                        sqlData.push(...[
                            model.id,
                            idLang,
                            ...arrayValueData
                        ]); 
                    }
                }
                
                connMysql.query(sql, sqlData, (error: any, result: any, fields: any) => {
                    resolve([model, sqlData, result, error]);
                });
            });
        });
    }

    // public static update(model: BaseModel): Promise<any>{}
    // public static listAll(model: BaseModel): Promise<any>{}
    // public static delete(model: BaseModel): Promise<any>{}
}