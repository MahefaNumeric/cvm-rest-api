import BaseRepo from './BaseRepo';
import Template from '../Models/Template';

export default class TemplateRepo extends BaseRepo<Template> {


    static createFromDbById(idTemplate: number){
        throw Error("Template Not yet implemented");
    }
    
}