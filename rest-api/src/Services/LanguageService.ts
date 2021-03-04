import Language from "../Data/Models/Language";

export default class LanguageService{
    
    async getLanguageByIso(isoLang: string) {
        const lang = await Language.createFromDbByIso(isoLang);
        return lang;
    }

    /**
     * @returns {Promise<Array<Language>>}
     */
    public getAllLanguage(): Promise<Array<Language>>{
        return Language.getAllLanguage();
    }

    /**
     * 
     * @param {Array<Language>} allLanguages 
     * @param {string} iso 
     * @returns {number} id (if 0, then not found)
     */
    convertIsoToId(allLanguages: any[], iso: string): number{
        if(Array.isArray(allLanguages)){
            for (const element of allLanguages) {
                if( String(element.code_iso).toLocaleLowerCase() == String(iso).toLocaleLowerCase() )
                    return element.id;
            }
            throw Error(`LangugageService::convertIsoToId | Lang iso: '${iso}' doesn't exist on allLanguages array`);
        }else
            throw Error("LangugageService::convertIsoToId | allLanguages Not Array");
    }

    /**
     * 
     * @param {Array<Language>} allLanguages 
     * @param {number} id
     * @returns {string} iso
     */
    convertIdToIso(allLanguages: any[], id: number): string{
        if(Array.isArray(allLanguages)){
            for (const element of allLanguages) {
                if( element.id == id )
                    return element.code_iso;
            }
            throw Error(`LangugageService::convertIsoToId | Lang id: '${id}' doesn't exist on allLanguages array`);
        }else{
            throw Error("LangugageService::convertIdToIso | allLanguages Not Array");
        }
    }

}