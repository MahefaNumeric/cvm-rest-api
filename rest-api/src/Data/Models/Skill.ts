import User from './User';
import SocialLink from './SocialLink';
// import { BaseEntity, Column, Entity, PrimaryGeneratedColumn } from 'typeorm';
import BaseModel from './BaseModel';
import SkillGroup from './SkillGroup';

/**
 * @todo Redo structuration SkillGroup and Skill (actually not good)
 */
// @Entity()
export default class Skill // extends BaseEntity 
{
    // @PrimaryGeneratedColumn() 
    public id: string;
    // @Column()
    public slug: string;
    // @Column()
    public title: string;
    // @Column()
    public description: string;

    public user: User;
    public group: SkillGroup;

    constructor(
        id: string,
        public id_user: string,
        public id_skills_group: string,
        slug: string,
        title: string,
        description: string
    ){
        // super();

        this.id = id;
        this.slug = slug;
        this.title = title;
        this.description = description;

        this.user = BaseModel.initalize(User);
        this.group = BaseModel.initalize(SkillGroup);
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