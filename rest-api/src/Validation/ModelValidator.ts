
module.exports =

class ModelValidator {
    static checkIfBaseModel(model){
        return model instanceof BaseModel;
    }
}