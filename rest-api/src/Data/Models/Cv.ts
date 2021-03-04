import BaseModel from './BaseModel';

export default class Cv extends BaseModel {
    public template: any;
    public address: any;
    public educations: any;
    public experiences: any;
    public projects: any;    // Works  
    public skills: any;
    public skillsGroup: any;

    constructor(
        public id: number,
        public id_template: number,
        public slug: string,
        public id_address: number,
        public title_backend: string,
        public title_frontend: string,
        public auto_biography: string
    ){
        super();
    }

    public static createFromObj(obj: Cv): Cv{
        return new Cv(
            obj.id, 
            obj.id_template, 
            obj.slug, 
            obj.id_address, 
            obj.title_backend,
            obj.title_frontend,
            obj.auto_biography
        );
    }
}