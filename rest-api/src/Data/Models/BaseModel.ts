import LooseObject from "../Types/LooseObject";

export default abstract class BaseModel // extends Object 
{
    public _table: string;
    public _definitions: any;
    [key: string]: any; // Special : For TypeScript accept unknow property

    public constructor() {
        // super();
        this._table = "";
    }

    /**
     * 
     * @param objectType 
     * @todo have a problem
     */
    public static initalize(objectType: any): any{
        const arrayProperties: string[] = Object.getOwnPropertyNames(objectType);
        const newObject: any = {};
        arrayProperties.forEach(property => {
            newObject[property] = null;
        });
        return newObject;
    }

    /**
     * @returns {Object}
     * Example :
     *  {
            "title": {
                "lang": true
            },
            "description": {
                "lang": true
            }
        }
     */
    public getDefinitionsLang(): Object{
        const defLang: LooseObject = {};
        const defKeys = Object.keys(this._definitions);
        for (const item of defKeys) {
            if(this._definitions[item].lang == true)
            defLang[item] = this._definitions[item];
        }
        return defLang;
    }
}

const Models: { [key: string]: any } = {
};