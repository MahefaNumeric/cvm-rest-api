
export default class ErrorTools {

    /**
     * 
     * @param addressFunction Address of the function
     * Example : UserService::getListUser
     */
    public static throwNotYetImplementedError(addressFunction: string): never {
        throw new Error(`${addressFunction} is not yet implemented`);
    }

}