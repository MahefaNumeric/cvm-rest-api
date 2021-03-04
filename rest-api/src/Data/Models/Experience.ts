import Company from './Company';
import ErrorTools from '../../Utils/ErrorTools';

export default class Experience {
    static _table = 'part_experiences';

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

    public static createFromObj(obj: Experience): Experience{
        ErrorTools.throwNotYetImplementedError("Experience::createFromObj");
        return new Experience();
    }

}