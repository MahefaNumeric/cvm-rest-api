
/**
 * @todo Redo structuration SkillGroup and Skill (actually not good)
 */
class SkillGroup{

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
        this.id = id;
        this.slug = slug;
        this.title = title;
        this.description = description;

        this.skills = null;
    }

}

module.exports = SkillGroup;