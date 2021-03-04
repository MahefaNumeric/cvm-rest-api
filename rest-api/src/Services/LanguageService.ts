import Language from "../Data/Models/Language";
import LanguageRepo from '../Data/Repositories/LanguageRepo';

export default class LanguageService{
    
    async getLanguageByIso(isoLang: string) {
        return await LanguageRepo.createFromDbByIso(isoLang);
    }

    /**
     * @returns {Promise<Array<Language>>}
     */
    public getAllLanguage(): Promise<Array<Language>>{
        return LanguageRepo.getAllLanguage();
    }

}