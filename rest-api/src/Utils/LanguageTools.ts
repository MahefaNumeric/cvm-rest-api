
export default class LanguageTools {
    
    /**
     * 
     * @param {Array<Language>} allLanguages 
     * @param {string} iso 
     * @returns {number} id (if 0, then not found)
     */
    public static convertIsoToId(allLanguages: any[], iso: string): number{
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
    public static convertIdToIso(allLanguages: any[], id: number): string{
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