import SkillGroupRepo from "../Data/Repositories/SkillGroupRepo";
import LanguageService from './LanguageService';
import SkillGroup from '../Data/Models/SkillGroup';

export default class SkillGroupService{

    constructor(
        public languageService: LanguageService
    ){
        this.languageService = new LanguageService();
    }
    
    /**
     * 
     * @param {string} isoLang 
     * @returns {Promise<SkillGroup>}
     */
    async getListAllSkillGroup(isoLang: string): Promise<Array<SkillGroup>>{
        const lang = await this.languageService.getLanguageByIso(isoLang);
        return SkillGroupRepo.getListAllSkillGroup(lang.id);
    }

    createSkillGroup(skillGroup: SkillGroup){
        return SkillGroupRepo.insert(skillGroup);
    }

}