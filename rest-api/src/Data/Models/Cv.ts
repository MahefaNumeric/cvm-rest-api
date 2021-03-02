import BaseModel from './BaseModel';

export default class Cv extends BaseModel {
    static MSG_NO_CV_GIVEN_ID = "NO_CV_GIVEN_ID";

    public template: any;
    public address: any;
    public educations: any;
    public experiences: any;
    public projects: any;    // Works  
    public skills: any;
    public skillsGroup: any;

    /**
     * 
     * @param {number} id 
     * @param {Template} template 
     * @param {string} slug 
     * @param {Address} address 
     * @param {string} title 
     * @param {string} auto_biography 
     * @param {Date} date_add 
     * @param {Date} date_update 
     */
    constructor(
        public id: number,
        public id_template: number,
        public slug: string,
        public id_address: number,
        public title_backend: string,
        public title_frontend: string,
        public auto_biography: string
    ){
        super();
        // this.template = null;
        // this.address = null;
        // this.educations = null;
        // this.experiences = null;
        // this.projects = [];   // Works  
        // this.skills = null;
        // this.skillsGroup = null;
    }
}