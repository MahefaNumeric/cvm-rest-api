import User from "../Data/Models/User";
import BaseService from './BaseService';
import ErrorTools from '../Utils/ErrorTools';

export default class UsersService extends BaseService {
    
    public getListUser(){
        ErrorTools.throwNotYetImplementedError("UserService::getListUser");
        return new Promise((resolve, reject) => {

        });
    }

    public createNewUser(pData: any): Promise<Array<User>>{
        ErrorTools.throwNotYetImplementedError("UserService::createNewUser");
        return new Promise((resolve, reject) => {

        });
    }

    public checkCredentials(username: string, password: string): Object|null{
        if(username == "test" && password == "pwd"){
            return {
                name: "Test",
                lastname: "2"
            };
        }else{
            return null;
        }
    }
}