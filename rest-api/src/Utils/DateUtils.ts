
export default class DateUtils{
    public static monthName = [];
    
    /**
     * Convert : "3" ----> "Mars"
     * @param monthNumber 
     * @param isoLang 
     * @param longMonthName 
     * @returns 
     */
    public static getMonthName(monthNumber: number, isoLang: string = "fr", longMonthName: boolean = true): string{
        isoLang = isoLang.toLowerCase();

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

    public static getDateWord(isoLang: string, type: DateWordType): string {
        const name: {[key: string]: any} = {
            "en": {
                "year": "Year",
                "years": "Years",
                "month": "Month",
                "months": "Months",
                "day": "Day",
                "days": "Days"
            },
            "fr": {
                "year": "Année",
                "years": "Années",
                "month": "Mois",
                "months": "Mois",
                "day": "Jour",
                "days": "Jours"
            }
        };

        isoLang = isoLang.toLowerCase().trim();

        switch(isoLang){
            case "fr":
            case "en":
                return name[isoLang][type];
            default:
                return name["en"][type];
        }
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
    
    /**
     * Convert "2021-03" ----> "March 2021"
     * @param date 
     * @param isoLang 
     * @param longMonthName 
     * @returns 
     */
    public static formatDateToFriendly(dateStr: string, isoLang: string, longMonthName: boolean): string{
        isoLang = isoLang.toLowerCase();
        const date_array = dateStr.split("-");
        const year = parseInt(date_array[0]);
        const month = parseInt(date_array[1]);
        const monthName = DateUtils.getMonthName(month, isoLang, longMonthName);
        
        let enFriendlyDate = `${year} ${monthName}`; // Default : EN 
        let result: string = ``;
        switch(isoLang){
            case "fr":
                result = `${monthName} ${year}`;
                break;
            default:
                result = enFriendlyDate;
                break;
        }
        return result;
    }

    /**
     * "2021-02-01" and "2021-02-03" ----> "2" days of differences
     * @param dateAstr 
     * @param dateBstr 
     * @param format YYYY-MM-DD or YYYY-MM or YYYY
     * @returns The day number between the two date
     */
    public static calculateTwoDateDurationInDay(dateAstr: string, dateBstr: string, format: string = "YYYY-MM-DD", separator: string = "-"): number {
        const dateA: Date = DateUtils.parseDate(dateAstr, format, separator);
        const dateB: Date = DateUtils.parseDate(dateBstr, format, separator);
        const numDayDiff: number = DateUtils.dateDiff(dateA, dateB);
        return Math.abs(numDayDiff);
    }

    /**
     * Convert "2021-02-01" ----> new Date() object
     * @param dateStr 
     * @param format 
     * @param separator 
     * @returns 
     */
    public static parseDate(dateStr: string, format: string, separator: string = "-"): Date {
        let splitedStr: string[];
        let splitedInt: number[];
        switch(format){
            case "YYYY-MM-DD":
                splitedStr = dateStr.split(separator);
                splitedInt = splitedStr.map(i => parseInt(i));
                return new Date(splitedInt[0], splitedInt[1]-1, splitedInt[2]);
            case "YYYY-MM":
                splitedStr = dateStr.split(separator);
                splitedInt = splitedStr.map(i => parseInt(i));
                return new Date(splitedInt[0], splitedInt[1]-1, 1);
            case "YYYY":
                const year: number = parseInt(dateStr);
                return new Date(year, 0, 1);
            default:
                throw new Error(`DateUtils::parseDate, Format '${format}' unknow`);
        }
    }

    /**
     * Two Date object -----> Number of day (difference)
     * @param dateFirst 
     * @param dateSecond 
     * @returns Number of day (difference)
     */
    public static dateDiff(dateFirst: Date, dateSecond: Date): number {
        // Take the difference between the dates and divide by milliseconds per day.
        // Round to nearest whole number to deal with DST.
        return Math.round((dateFirst.getTime() - dateSecond.getTime())/(1000*60*60*24));
    }

    /**
     * Convert : "35" days -----> "1 month and 5 days"
     */
    public static convertDayNumberToFriendlyDuration(daysNumber: number, isoLang: string, showDay: boolean = true): string{
        isoLang = isoLang.toLowerCase();
        const numberDaysOnYear = 365;
        const numberDaysOnMonth = 30;
        let comma = ``;
        // ------------------------------------------
        let dayNumerLeft = daysNumber;
        const year = Math.floor(dayNumerLeft / numberDaysOnYear);
        const yearLang = DateUtils.getDateWord(isoLang, year>1 ? DateWordType.Years : DateWordType.Year);
        const yearPart = year > 0 ? `${year} ${yearLang}` : ``;
        // ------------------------------------------
        dayNumerLeft = dayNumerLeft - (year*numberDaysOnYear)
        const month = Math.floor(dayNumerLeft / numberDaysOnMonth);
        const monthLang = DateUtils.getDateWord(isoLang, month>1 ? DateWordType.Months : DateWordType.Month);
        comma = yearPart.length > 0 ? `, ` : ``;
        const monthPart = month > 0 ? (
            `${comma}${month} ${monthLang}`
        ) : ``;
        // ------------------------------------------
        let dayPart = ``;
        if(showDay){
            const day = dayNumerLeft - (month*numberDaysOnMonth);
            const dayLang = DateUtils.getDateWord(isoLang, day>1 ? DateWordType.Days : DateWordType.Day);
            comma = monthPart.length > 0 ? `, ` : ``;
            dayPart = day > 0 ? `${comma}${day} ${dayLang}` : ``;
        }
        // ------------------------------------------
        return `${yearPart} ${monthPart} ${dayPart}`;
    }
}

enum DateWordType {
    Day     = "day", 
    Days    = "days", 
    Month   = 'month', 
    Months  = 'months', 
    Year    = "year",
    Years   = "years"
}