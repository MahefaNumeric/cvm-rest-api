import SocialLink from './SocialLink';
import BaseModel from './BaseModel';
import Address from './Address';

export default class User extends BaseModel {

    public address: User;
    public socialLink: SocialLink;

    constructor(
        public id: number,
        public email: string,
        public firstname: string,
        public lastname: string,
        public date_birth: string,
        public phone: string,
        public url_profile: string,
        public auto_description: string,
        public auto_biography: string
    ){
        super();
        this.address = BaseModel.initalize(Address);
        this.socialLink = BaseModel.initalize(SocialLink);
    }

    public static createFromObj(obj: User): User{
        return new User(
            obj.id, 
            obj.email, 
            obj.firstname, 
            obj.lastname, 
            obj.date_birth,
            obj.phone,
            obj.url_profile,
            obj.auto_description,
            obj.auto_biography
        );
    }
}