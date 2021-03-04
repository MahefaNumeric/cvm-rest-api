import BaseModel from '../Data/Models/BaseModel';

export default class ModelValidator {

    public static checkIfBaseModel(model: any){
        return model instanceof BaseModel;
    }

}