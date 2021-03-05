import BaseModel from './BaseModel';
import DateUtils from '../../Utils/DateUtils';

export default class Position extends BaseModel {
    public experienceDateBegin_Friendly: string = "";
    public experienceDateEnd_Friendly: string = "";

    public durationInDayOnThePositionValue: number = 0;
    public durationInDayOnThePositionFriendly: string = ``;

    constructor(
        public id: number,
        public slug: string,
        public title: string,
        public description: string,
        public descriptionExperiencePosition: string,
        public experienceDateBeginValue: string,
        public experienceDateEndValue: string,
        public isoLang: string = "fr"   // Special, optionnal, at the end
    ){
        super();
        this.experienceDateBegin = experienceDateBeginValue;
        this.experienceDateEnd = experienceDateEndValue;
    }

    get experienceDateBegin(){
        return this.experienceDateBeginValue;
    }
    set experienceDateBegin(value: string){
        this.experienceDateBeginValue = value;
        this.experienceDateBegin_Friendly = DateUtils.formatDateToFriendly(this.experienceDateBeginValue, this.isoLang, false);
        this.setup_durationInDayOnThePosition();
    }

    get experienceDateEnd(){
        return this.experienceDateEndValue;
    }
    set experienceDateEnd(value: string){
        this.experienceDateEndValue = value;
        this.experienceDateEnd_Friendly = DateUtils.formatDateToFriendly(this.experienceDateEndValue, this.isoLang, false);
        this.setup_durationInDayOnThePosition();
    }

    get durationInDayOnThePosition(): number {
        return this.durationInDayOnThePositionValue;
    }
    set durationInDayOnThePosition(value: number) {
        this.durationInDayOnThePositionValue = value;
        this.durationInDayOnThePositionFriendly = DateUtils.convertDayNumberToFriendlyDuration(this.durationInDayOnThePositionValue, this.isoLang, false);
    }

    public static createFromObj(obj: Position, isoLang: string = "fr"): Position {
        return new Position(
            obj.id, 
            obj.slug, 
            obj.title, 
            obj.description, 
            obj.descriptionExperiencePosition,
            obj.experienceDateBegin,
            obj.experienceDateEnd,
            isoLang
        );
    }

    private setup_durationInDayOnThePosition(){
        this.durationInDayOnThePosition = DateUtils.calculateTwoDateDurationInDay(
            this.experienceDateBeginValue, 
            this.experienceDateEndValue,
            "YYYY-MM"
        );
    }

}