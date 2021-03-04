import BaseModel from './BaseModel';

export default class SocialLink extends BaseModel {
    static _table = "socials_link";

    constructor(
        public user_id: number,
        public github_url: string,
        public linkedin_url: string,
        public skype_id: string,
        public website_url: string,
        public zoom_id: number,
    ){
        super();
    }

    public static createFromObj(obj: SocialLink): SocialLink{
        return new SocialLink(
            obj.user_id,
            obj.github_url, 
            obj.linkedin_url, 
            obj.skype_id, 
            obj.website_url,
            obj.zoom_id
        );
    }

}