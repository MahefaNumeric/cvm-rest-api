import {MODEL} from "../Data/Models/{MODEL}";

export default class {MODEL}Service{
    
    /**
     * @returns {Promise<Array<{MODEL}>>}
     */
    public getAll{MODEL}(): Promise<Array<{MODEL}>>{
        return {MODEL}Repo.getAll{MODEL}();
    }

}