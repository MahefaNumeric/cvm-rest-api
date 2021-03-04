import BaseModel from './BaseModel';

export default class Project extends BaseModel {

    constructor(
        public id: number,
        public company_id: number,
        public id_user: number,
        public slug: string,
        public title: string,
        public description: string,
        public show_in_portfolio: boolean,
        public url_access: string,
        public url_preview: string
    ){
        super();
    }

    public static createFromObj(obj: Project): Project{
        return new Project(
            obj.id, 
            obj.company_id, 
            obj.id_user, 
            obj.slug, 
            obj.title,
            obj.description,
            obj.show_in_portfolio,
            obj.url_access,
            obj.url_preview
        );
    }

}
