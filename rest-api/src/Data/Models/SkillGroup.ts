import BaseModel from './BaseModel';

/**
 * @todo Redo structuration SkillGroup and Skill (actually not good)
 */
export default class SkillGroup extends BaseModel {

    /**
     * 
     * @param {number} id 
     * @param {string} slug 
     * @param {string} title 
     * @param {string} description 
     */
    public constructor(
        public id: number,
        public slug: string,
        public title: string,
        public description: string
    ){
        super();
        this.skills = null;

        this.setupDefinition();
    }

    public setupDefinition(): void {
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