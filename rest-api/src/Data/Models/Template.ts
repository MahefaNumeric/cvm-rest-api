
export default class Template {

    constructor(
        public id: number,
        public slug: number,
        public title: number
    ){
        throw Error("Template Not yet implemented");
    }

    static createFromDbById(idTemplate: number){
        throw Error("Template Not yet implemented");
    }
}