
export default class NumberTools {

    /**
     * Add zero leading to a number
     * @param {number} number 
     * @param {number} size 
     * @returns {string}
     */
    public static zeroLead(nb: number, size: number): string {
        let result: string = nb.toString();
        while (result.length < size) result = "0" + result;
        return result;
    }

}