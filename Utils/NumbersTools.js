
class NumberTools {

    /**
     * Add zero leading to a number
     * @param {number} number 
     * @param {number} size 
     * @returns {string}
     */
    static zeroLead(number, size) {
        number = number.toString();
        while (number.length < size) number = "0" + number;
        return number;
    }

}

module.exports = NumberTools;