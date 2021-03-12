import Words from "../Models/Words";
const connMysql = require("../../Configs/Databases/db.config");

export default class WordsRepo {

    public static getById(id: number, idLang: number): Promise<Words>{
        const sql = /* sql */`
            SELECT 
                words.id, 
                words.slug, 
                words.value, 
            FROM words 
            JOIN words_lang 
                ON words_lang.id_words = words.id 
                AND words_lang.id_lang = ${idLang}
            WHERE words.id = ${id}
            LIMIT 1
        `;
        return WordsRepo.findOne(sql);
    }

    public static getBySlug(slug: string, idLang: number): Promise<Words>{
        const sql = /* sql */`
            SELECT 
                words.id, 
                words.slug, 
                words.value, 
            FROM words 
            JOIN words_lang 
                ON words_lang.id_words = words.id 
                AND words_lang.id_lang = ${idLang}
            WHERE words.slug = ${slug}
            LIMIT 1
        `;
        return WordsRepo.findOne(sql);
    }

    private static findOne(sql: string): Promise<Words>{
        return new Promise((resolve, reject) => {
            connMysql.query(sql, (error: any, result: any, fields: any) => {
                if(error) throw error;
                if(Array.isArray(result) && result.length > 0) {
                    const wordFirst = result[0];
                    const word = Words.createFromObj(wordFirst);
                    resolve(word);
                }else{
                    console.log("Words::findOne::result", result, error);
                    reject({
                        message: "Words::findOne::result null"
                    });
                }
            });
        });
    }
    
    private static findMany(sql: string): Promise<Array<Words>>{
        return new Promise((resolve, reject) => {
            connMysql.query(sql, (error: any, resultList: any, fields: any) => {
                if(error) throw error;
                if(Array.isArray(resultList) && resultList.length > 0) {
                    const listWords: Array<Words> = [];
                    resultList.forEach(element => {
                        const word = Words.createFromObj(element);
                        listWords.push(word);
                    });
                    resolve(listWords);
                }else{
                    console.log("Words::findMany::result", resultList, error);
                    reject({
                        message: "Words::findMany::result null"
                    });
                }
            });
        });
    }

    public static getWordsNeedInCV(idLang: number): Promise<Array<Words>>{
        const listWordsStr: Array<string> = [
            "professsional_summary", 
            "education",
            "experience",
            "skills",
            "works",
            // "",
            // "",
            // "",
            // ""
        ];
        const listWordsStrQuoted = listWordsStr.map(item => `"`+ item +`"`);
        const listWordSqlFriendly = listWordsStrQuoted.join(", ");
        const sql = /* sql */`
            SELECT 
                words.id,
                words.slug,
                words_lang.value
            FROM words
            JOIN words_lang
                ON words_lang.id_words = words.id
                AND words_lang.id_lang = ${idLang}
            WHERE slug IN ( ${listWordSqlFriendly} )
        `;
        return WordsRepo.findMany(sql);
    }

    public static getWordsNeedInCV_asObject(idLang: number): Promise<Object>{
        return new Promise((resolve, reject) => {
            const result: {[key: string]: any} = {};
            WordsRepo.getWordsNeedInCV(idLang).then(list => {
                list.forEach(element => {
                    result[element.slug] = element.value;
                });
                resolve(result);
            });
        });
    }

}