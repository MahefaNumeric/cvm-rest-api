import User from './User';
import SocialLink from './SocialLink';
import BaseModel from './BaseModel';

/**
 * @todo Redo structuration SkillGroup and Skill (actually not good)
 */
export default class Skill extends BaseModel {
    public user: User;
    public socialLink: SocialLink;

    constructor(
        public id: string,
        public id_user: string,
        public id_skills_group: string,
        public slug: string,
        public title: string,
        public description: string
    ){
        super();
        this.user = BaseModel.initalize(User);
        this.socialLink = BaseModel.initalize(SocialLink);
    }

    public static createFromObj(obj: Skill): Skill{
        return new Skill(
            obj.id, 
            obj.id_user, 
            obj.id_skills_group, 
            obj.slug, 
            obj.title,
            obj.description
        );
    }

}