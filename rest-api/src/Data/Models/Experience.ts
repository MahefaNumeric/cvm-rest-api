import Company from './Company';
import ErrorTools from '../../Utils/ErrorTools';
import BaseModel from './BaseModel';

export default class Experience extends BaseModel {
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
        super();
        // List of companies
        this.companies = [];
    }

    public static createFromObj(obj: Experience): Experience{
        ErrorTools.throwNotYetImplementedError("Experience::createFromObj");
        return new Experience();
    }

}