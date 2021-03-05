
export default class DateUtils{
    public monthName = [];
    
    public static getMonthName(monthNumber: number, isoLang: string = "fr", longMonthName: boolean = true): string{
        const monthName: {[key: string]: any} = [];
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

    /**
     * Compare two formated string date
     * @param {String} dateA Ex : 2016-06
     * @param {String} dateB Ex : 2016-08
     * @param {String} format Ex : YYYY-MM
     * 
     * @returns {-1} When dateA < dateB
     * @returns { 0} When dateA = dateB
     * @returns {+1} When dateA > dateB
     * @returns {null} When format is unkown
     */
    public static compareDateAB(dateA: string, dateB: string, format: string = "YYYY-MM"): number|false{
        switch(format){
            case "YYYY-MM":
                return this.compareDateAB_YYYYMM(dateA, dateB);
            default:
                return false;
        }
    }

    /**
     * Compare two formated string date (For format : YYYY-MM only)
     * @param {String} dateA Ex : 2016-06
     * @param {String} dateB Ex : 2016-08
     * 
     * @returns {-1} When dateA < dateB
     * @returns { 0} When dateA = dateB
     * @returns {+1} When dateA > dateB
     */
    public static compareDateAB_YYYYMM(dateA: string, dateB: string): number|false{
        let result: any = false;
        
        // Collect data
        const [dateA_year, dateA_month] = String(dateA).split("-");
        const [dateB_year, dateB_month] = String(dateB).split("-");

        // Sanitize data
        const iDateA_year: number = parseInt(dateA_year);
        const iDateB_year: number = parseInt(dateB_year);
        const iDateA_month: number = parseInt(dateA_month);
        const iDateB_month: number = parseInt(dateB_month);

        // Compare data
        if(iDateA_year < iDateB_year) result = -1;
        else if(iDateA_year > iDateB_year) result = 1;
        else if(iDateA_year == iDateB_year){
            if(iDateA_month < iDateB_month) result = -1;
            else if(iDateA_month == iDateB_month) result = 0;
            else if(iDateA_month > iDateB_month) result = 1;
        }

        return result;
    }
    
    public static formatDateToFriendly(date: string, isoLang: string, longMonthName: boolean): string{
        const date_array = date.split("-");
        const year = parseInt(date_array[0]);
        const month = parseInt(date_array[1]);
        const monthName = DateUtils.getMonthName(month, isoLang, longMonthName);
        
        let enFriendlyDate = `${year} ${monthName}`; // Default : EN 
        let result: string = ``;
        switch(String(isoLang).toLowerCase()){
            case "fr":
                result = `${monthName} ${year}`;
                break;
            default:
                result = enFriendlyDate;
                break;
        }
        return result;
    }
}