import SkillGroupRepo from "../Data/Repositories/SkillGroupRepo";
import LanguageService from "./LanguageService";

export default class SkillGroupService{

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