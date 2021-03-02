
class BaseModel {
    static _table;
    static _definitions;

    constructor(path) {
        if (this.constructor === BaseModel) {
          throw new TypeError('Abstract class "BaseModel" cannot be instantiated directly');
        }
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
    getDefinitionsLang(){
      const defLang = {};
      const defKeys = Object.keys(this._definitions);
      for (const item of defKeys) {
        if(this._definitions[item].lang == true)
          defLang[item] = this._definitions[item];
      }
      return defLang;
    }
}

module.exports = BaseModel;