import Company from './Company';
import CompanyRepo from '../Repositories/CompanyRepo';

export default class Experiences{
    static _table = 'part_experiences';

    static MSG_NO_EXPERIENCE = "NO_EXPERIENCE";

    public companies: Array<Company>;

    constructor(
        // id,
        // id_user,
        // id_company,
        // id_company_position ,
        // slug,
        // date_begin,
        // date_end
    ){

        // List of companies
        this.companies = [];
    }

    static buildExperienceByIdCv(idCv: number, idLang: number): Promise<Experiences>{
        return new Promise((resolve, reject) => {
            const experience = new Experiences();
            CompanyRepo.getListCompaniesFromDbByCv(idCv, idLang).then((listCompanies: Array<Company>) => {
                experience.companies = listCompanies;
                resolve(experience);
            }).catch(error => reject(error));
        });
    }

}