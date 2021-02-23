
class DateUtils{
    monthName = [];

    static constructor(){
        
    }
    
    /**
     * 
     * @param {number} monthNumber 
     * @param {string} isoLang 
     * @returns {string}
     */
    static getMonthName(monthNumber, isoLang = "fr"){
        const monthName = [];
        monthName["fr"] = [];
        monthName["fr"][1] = "Janvier";
        monthName["fr"][2] = "Fevrier";
        monthName["fr"][3] = "Mars";
        monthName["fr"][4] = "Avril";
        monthName["fr"][5] = "Mai";
        monthName["fr"][6] = "Juin";
        monthName["fr"][7] = "Juillet";
        monthName["fr"][8] = "Aout";
        monthName["fr"][9] = "Septembre";
        monthName["fr"][10] = "Octobre";
        monthName["fr"][11] = "Novembre";
        monthName["fr"][12] = "Decembre";

        monthName["en"] = [];
        monthName["en"][1] = "January";
        monthName["en"][2] = "Febroary";
        monthName["en"][3] = "March";
        monthName["en"][4] = "April";
        monthName["en"][5] = "May";
        monthName["en"][6] = "June";
        monthName["en"][7] = "Julle";
        monthName["en"][8] = "Aougust";
        monthName["en"][9] = "September";
        monthName["en"][10] = "October";
        monthName["en"][11] = "November";
        monthName["en"][12] = "December";

        // console.log('DateUtils::getMonthName', [isoLang, monthNumber], monthName[isoLang][monthNumber]);
        return monthName[isoLang][monthNumber];
    }
}

module.exports = DateUtils;