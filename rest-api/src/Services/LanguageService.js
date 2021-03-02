import Language from "../Data/Models/Language";

export default class LanguageService{
    
    async getLanguageByIso(isoLang) {
        const lang = await Language.createFromDbByIso(isoLang);
        return lang;
    }

    /**
     * @returns {Promise<Array<Language>>}
     */
    getAllLanguage(){
        return Language.getAllLanguage();
    }

    /**
     * 
     * @param {Array<Language>} allLanguages 
     * @param {string} iso 
     * @returns {number} id
     */
    convertIsoToId(allLanguages, iso){
        if(Array.isArray(allLanguages)){
            for (const element of allLanguages) {
                if( String(element.code_iso).toLocaleLowerCase() == String(iso).toLocaleLowerCase() )
                    return element.id;
            }
            return false;
        }else
            throw Error("LangugageService::convertIsoToId | allLanguages Not Array");
    }

    /**
     * 
     * @param {Array<Language>} allLanguages 
     * @param {number} id
     * @returns {string} iso
     */
    convertIdToIso(allLanguages, id){
        if(Array.isArray(allLanguages)){
            for (const element of allLanguages) {
                if( element.id == id )
                    return element.code_iso;
            }
            return false;
        }else{
            throw Error("LangugageService::convertIdToIso | allLanguages Not Array");
        }
    }

}