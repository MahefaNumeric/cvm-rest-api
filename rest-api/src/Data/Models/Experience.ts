import Company from './Company';

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
        // this.id = id;
        // this.id_user = id_user;
        // this.id_company = id_company;
        // this.id_company_position = id_company_position;
        // this.slug = slug;
        // this.date_begin = date_begin;
        // this.date_end = date_end;

        // List of companies
        this.companies = [];
    }

    static buildExperienceByIdCv(idCv: number, idLang: number){
        return new Promise((resolve, reject) => {
            const experience = new Experiences();
            Company.getListCompaniesFromDbByCv(idCv, idLang).then((listCompanies: Array<Company>) => {
                experience.companies = listCompanies;
                resolve(experience);
            }).catch(error => reject(error));
        });
    }

}