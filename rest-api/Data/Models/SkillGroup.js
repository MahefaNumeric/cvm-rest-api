
/**
 * @todo Redo structuration SkillGroup and Skill (actually not good)
 */
class SkillGroup{

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