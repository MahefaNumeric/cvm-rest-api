import LooseObject from "../Types/LooseObject";

export default abstract class BaseModel {
    public _table: string;
    public _definitions: any;
    [key: string]: any; // Special : For TypeScript accept property unknow

    public constructor() {
        this._table = "";
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
