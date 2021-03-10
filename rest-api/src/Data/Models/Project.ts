import DateUtils from '../../Utils/DateUtils';
import BaseModel from './BaseModel';

export default class Project // extends BaseModel 
{
    public dateBegin_Friendly: string = "";
    public dateEnd_Friendly: string = "";

    public durationInDayValue: number = 0;
    public durationInDayFriendly: string = ``;

    constructor(
        public id: number,
        public company_id: number,
        public id_user: number,
        public slug: string,
        public title: string,
        public description: string,
        public show_in_portfolio: boolean,
        public url_access: string,
        public url_preview: string,
        public dateBeginValue: string,
        public dateEndValue: string,
        public isoLang: string = "fr"   // Special, optionnal, at the end
    ){
        // super();
        this.dateBegin = dateBeginValue;
        this.dateEnd = dateEndValue;
    }
    
    get dateBegin(){
        return this.dateBeginValue;
    }
    set dateBegin(value: string){
        this.dateBeginValue = value;
        this.dateBegin_Friendly = DateUtils.formatDateToFriendly(value, this.isoLang, false);
        this.setup_durationInDay();
    }

    get dateEnd(){
        return this.dateEndValue;
    }
    set dateEnd(value: string){
        this.dateEndValue = value;
        this.dateEnd_Friendly = DateUtils.formatDateToFriendly(value, this.isoLang, false);
        this.setup_durationInDay();
    }

    get durationInDay(): number {
        return this.durationInDayValue;
    }
    set durationInDay(value: number) {
        this.durationInDayValue = value;
        this.durationInDayFriendly = DateUtils.convertDayNumberToFriendlyDuration(this.durationInDayValue, this.isoLang, false);
    }

    public static createFromObj(obj: Project, isoLang: string): Project{
        return new Project(
            obj.id, 
            obj.company_id, 
            obj.id_user, 
            obj.slug, 
            obj.title,
            obj.description,
            obj.show_in_portfolio,
            obj.url_access,
            obj.url_preview,
            obj.dateBegin,
            obj.dateEnd,
            isoLang
        );
    }

    private setup_durationInDay(){
        this.durationInDay = DateUtils.calculateTwoDateDurationInDay(
            this.dateBeginValue, 
            this.dateEndValue,
            "YYYY-MM"
        );
    }

}
