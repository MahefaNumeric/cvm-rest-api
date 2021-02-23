
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
    static getMonthName(monthNumber, isoLang = "fr", longMonthName = true){
        const monthName = [];
        monthName["fr"] = [];
        monthName["fr"][1] = longMonthName ? "Janvier" : "Jan";
        monthName["fr"][2] = longMonthName ? "Fevrier" : "Fev";
        monthName["fr"][3] = longMonthName ? "Mars" : "Mar";
        monthName["fr"][4] = longMonthName ? "Avril" : "Avr";
        monthName["fr"][5] = longMonthName ? "Mai" : "Mai";
        monthName["fr"][6] = longMonthName ? "Juin" : "Juin";
        monthName["fr"][7] = longMonthName ? "Juillet" : "Juil";
        monthName["fr"][8] = longMonthName ? "Aout" : "Aou";
        monthName["fr"][9] = longMonthName ? "Septembre" : "Sept";
        monthName["fr"][10] = longMonthName ? "Octobre" : "Oct";
        monthName["fr"][11] = longMonthName ? "Novembre" : "Nov";
        monthName["fr"][12] = longMonthName ? "Decembre" : "Dec";

        monthName["en"] = [];
        monthName["en"][1] = longMonthName ? "January" : "Jan";
        monthName["en"][2] = longMonthName ? "Febroary" : "Feb";
        monthName["en"][3] = longMonthName ? "March" : "Mar";
        monthName["en"][4] = longMonthName ? "April" : "Apr";
        monthName["en"][5] = longMonthName ? "May" : "May";
        monthName["en"][6] = longMonthName ? "June" : "Jun";
        monthName["en"][7] = longMonthName ? "Julle" : "Jul";
        monthName["en"][8] = longMonthName ? "Augost" : "Aug";
        monthName["en"][9] = longMonthName ? "September" : "Sept";
        monthName["en"][10] = longMonthName ? "October" : "Oct";
        monthName["en"][11] = longMonthName ? "November" : "Nov";
        monthName["en"][12] = longMonthName ? "December" : "Dec";

        // console.log('DateUtils::getMonthName', [isoLang, monthNumber], monthName[isoLang][monthNumber]);
        return monthName[isoLang][monthNumber];
    }
}

module.exports = DateUtils;