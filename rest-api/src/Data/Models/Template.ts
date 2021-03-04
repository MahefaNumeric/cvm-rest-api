
export default class Template {

    constructor(
        public id: number,
        public slug: number,
        public title: number
    ){
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