import BaseModel from './BaseModel';
import DateUtils from '../../Utils/DateUtils';

export default class Position extends BaseModel {
    public experienceDateBegin_Friendly: string = "";
    public experienceDateEnd_Friendly: string = "";

    constructor(
        public id: number,
        public slug: string,
        public title: string,
        public description: string,
        public descriptionExperiencePosition: string,
        public experienceDateBeginValue: string,
        public experienceDateEndValue: string
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
        this.experienceDateBegin_Friendly = DateUtils.formatDateToFriendly(this.experienceDateBeginValue, "fr", false);
    }

    get experienceDateEnd(){
        return this.experienceDateEndValue;
    }
    set experienceDateEnd(value: string){
        this.experienceDateEndValue = value;
        this.experienceDateEnd_Friendly = DateUtils.formatDateToFriendly(this.experienceDateEndValue, "fr", false);
    }

    public static createFromObj(obj: Position): Position {
        return new Position(
            obj.id, 
            obj.slug, 
            obj.title, 
            obj.description, 
            obj.descriptionExperiencePosition,
            obj.experienceDateBegin,
            obj.experienceDateEnd
        );
    }

}