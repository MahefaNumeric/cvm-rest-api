import SkillGroupRepo from "../Data/Repositories/SkillGroupRepo";
import LanguageService from './LanguageService';
import SkillGroup from '../Data/Models/SkillGroup';
import BaseRepo from '../Data/Repositories/BaseRepo';

/**
 * @todo Injection dependance LanguageService
 */
export default class SkillGroupService{

    constructor(
        public languageService: LanguageService = new LanguageService()
    ){
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
        return BaseRepo.insert(skillGroup);
    }

}