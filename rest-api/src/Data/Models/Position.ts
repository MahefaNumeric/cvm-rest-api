import BaseModel from './BaseModel';

export default class Position extends BaseModel {

    constructor(
        public id: number,
        public slug: string,
        public title: string,
        public description: string,
        public descriptionExperiencePosition: string,
        public experienceDateBegin: string,
        public experienceDateEnd: string
    ){
        super();
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