const LanguageService = require("./LanguageService");
const SkillGroupRepo = require("../Data/Repositories/SkillGroupRepo");

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
        return SkillGroupRepo.getListAllSkillGroup(lang.id);
    }

    createSkillGroup(skillGroup){
        return SkillGroupRepo.insert(skillGroup);
    }

}

module.exports = SkillGroupService;