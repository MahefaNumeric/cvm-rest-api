const LanguageService = require("./LanguageService");
const SkillGroup = require("../Data/Models/SkillGroup");

class SkillGroupService{

    constructor(){
        this.languageService = new LanguageService();
    }
    
    /**
     * 
     * @param {string} isoLang 
     * @returns {Promise<SkillGroup>}
     */
    async getListAllSkillGroup(isoLang) {
        const lang = await this.languageService.getLanguageByIso(isoLang);
        return SkillGroup.getListAllSkillGroup(lang.id);
    }

}

module.exports = SkillGroupService;