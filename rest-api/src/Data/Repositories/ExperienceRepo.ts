import BaseRepo from './BaseRepo';
import Experience from '../Models/Experience';
import Company from '../Models/Company';
import CompanyRepo from './CompanyRepo';

export default class ExperienceRepo extends BaseRepo {
    static MSG_NO_EXPERIENCE = "NO_EXPERIENCE";

    public static buildExperienceByIdCv(idCv: number, idLang: number): Promise<Experience>{
        return new Promise((resolve, reject) => {
            const experience = new Experience();
            CompanyRepo.getListCompaniesFromDbByCv(idCv, idLang).then((listCompanies: Array<Company>) => {
                experience.companies = listCompanies;
                resolve(experience);
            }).catch((error: any) => reject(error));
        });
    }
}