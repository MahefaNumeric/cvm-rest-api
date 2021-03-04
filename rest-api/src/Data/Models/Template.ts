import BaseModel from './BaseModel';

export default class Template extends BaseModel {

    constructor(
        public id: number,
        public slug: number,
        public title: number
    ){
        super();
        throw Error("Template Not yet implemented");
    }

    public static createFromObj(obj: Template): Template{
        return new Template(
            obj.id, 
            obj.slug, 
            obj.title, 
        );
    }
}