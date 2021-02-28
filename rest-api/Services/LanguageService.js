const Language = require("../Data/Models/Language");

class LanguageService{
    
    async getLanguageByIso(isoLang) {
        const lang = await Language.createFromDbByIso(isoLang);
        return lang;
    }

}

module.exports = LanguageService;