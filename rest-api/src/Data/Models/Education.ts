import DateUtils from '../../Utils/DateUtils';
import BaseModel from './BaseModel';

export default class Education extends BaseModel{
    static _table = "part_educations";

    public date_begin_friendly: string;
    public date_end_friendly: string;
    private date_begin_value: string;
    private date_end_value: string;

    constructor(
        public isoLang: string,
        public id: number,
        public id_user: number,
        public slug: string,
        date_begin: string,
        date_end: string,
        public title: string,
        public description: string
    ){
        super();
        this.date_begin_friendly = date_begin;
        this.date_begin = date_begin;
        this.date_begin_value = date_begin; // Private (Don't use from class external)
        this.date_end_friendly = date_end;
        this.date_end = date_end;
        this.date_end_value = date_end; // Private (Don't use from class external)
    }

    set date_begin(dateBegin) {
        this.date_begin_value = dateBegin;
        this.date_begin_friendly = DateUtils.formatDateToFriendly(dateBegin, "fr", false);
    }
    get date_begin() {
        return this.date_begin_value;
    }    

    set date_end(dateEnd) {
        this.date_end_value = dateEnd;
        this.date_end_friendly = DateUtils.formatDateToFriendly(dateEnd, "fr", false);
    }
    get date_end() {
        return this.date_end_value;
    }

    public static createFromObj(isoLang: string, obj: Education): Education{
        return new Education(
            isoLang,
            obj.id, 
            obj.id_user, 
            obj.slug, 
            obj.date_begin, 
            obj.date_end,
            obj.title,
            obj.description
        );
    }

}