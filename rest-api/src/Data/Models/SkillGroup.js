const BaseModel = require("./BaseModel");

/**
 * @todo Redo structuration SkillGroup and Skill (actually not good)
 */
class SkillGroup extends BaseModel {

    /**
     * 
     * @param {number} id 
     * @param {string} slug 
     * @param {string} title 
     * @param {string} description 
     */
    constructor(
        id,
        slug,
        title,
        description
    ){
        super();

        this.id = id;
        this.slug = slug;
        this.title = title;
        this.description = description;

        this.skills = null;

        this.setupDefinirition();
    }

    setupDefinirition(){
        this._table = "skills_group";
        this._definitions = {
            id: {
                lang: false,
            },
            slug: {
                lang: false,
            },
            title: {
                lang: true,
            },
            description: {
                lang: true,
            }
        };
    }

}

module.exports = SkillGroup;