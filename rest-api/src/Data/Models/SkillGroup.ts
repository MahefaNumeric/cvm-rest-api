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
        id: number,
        slug: string,
        title: string,
        description: string
    ){
        super();

        this.id = id;
        this.slug = slug;
        this.title = title;
        this.description = description;

        this.skills = null;

        this.setupDefinirition();
    }

    public setupDefinirition(): void {
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