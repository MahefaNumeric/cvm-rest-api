import BaseModel from './BaseModel';

export default class Language extends BaseModel {
    static _table = "languages";

    constructor(
        public id: number,
        public code_iso: string,
        public name: string
    ){
        super();
    }

    public static createFromObj(obj: Language): Language{
        return new Language(
            obj.id, 
            obj.code_iso, 
            obj.name
        );
    }
}