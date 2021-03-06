import Position from './Position';
import DateUtils from '../../Utils/DateUtils';
import BaseModel from './BaseModel';

export default class Company extends BaseModel{
    public _table = 'companies';

    // Position on a company
    private positionsValue: Array<Position> = [];

    public dateStartValue: string = ``;
    public dateStartFriendly: string = ``;

    public dateEndValue: string = ``;
    public dateEndFriendly: string = ``;

    public durationInDayOnTheCompanyValue: number = 0;
    public durationInDayOnTheCompanyFriendly: string = ``;

    public hasManyPosition: boolean;
    public hasActualPosition: boolean = false;

    public constructor(
        public id: number,
        public slug: string,
        public name: string,
        public description: string,
        public isoLang: string = "fr"   // Special, optionnal, at the end
    ){
        super();

        /** Need for the template, to differentiate visual rendering for one or many position on signle company */
        this.hasManyPosition = false;
    }

    get positions(): Array<Position> {
        return this.positionsValue;
    }
    set positions(value: Array<Position>) {
        this.positionsValue = value;
        this.setupPositionsBeganEnd();
        this.setupProperty_hasManyPosition();
    }

    get dateStart(): string {
        return this.dateStartValue;
    }
    set dateStart(value: string) {
        this.dateStartValue = value;
        console.log("Company::set dateStart, isoLang: ", this.isoLang);
        this.dateStartFriendly = DateUtils.formatDateToFriendly(this.dateStartValue, this.isoLang, false);
    }

    get dateEnd(): string {
        return this.dateEndValue;
    }
    set dateEnd(value: string) {
        this.dateEndValue = value;
        this.dateEndFriendly = this.hasActualPosition ?
            "À présent"
            :
            DateUtils.formatDateToFriendly(this.dateEndValue, this.isoLang, false);
    }

    get durationInDayOnTheCompany(): number {
        return this.durationInDayOnTheCompanyValue;
    }
    set durationInDayOnTheCompany(value: number) {
        this.durationInDayOnTheCompanyValue = value;
        this.durationInDayOnTheCompanyFriendly = DateUtils.convertDayNumberToFriendlyDuration(this.durationInDayOnTheCompanyValue, this.isoLang, false);
    }

    private setupPositionsBeganEnd(): boolean {
        this.setupProperty_hasActualPosition();
        if(Array.isArray(this.positions) == false) return false;
        if(this.positions.length == 0) return false;

        let dateMin: string = this.positions[0].experienceDateBegin,
            dateMax: string = this.positions[0].experienceDateEnd;
        this.positions.forEach(element => {
            if(DateUtils.compareDateAB(element.experienceDateBegin, dateMin) == -1)
                dateMin = element.experienceDateBegin;
            if(DateUtils.compareDateAB(element.experienceDateEnd, dateMax) == 1)
                dateMax = element.experienceDateEnd;
        });
        this.dateStart = dateMin;
        this.dateEnd = dateMax;
        this.durationInDayOnTheCompany = DateUtils.calculateTwoDateDurationInDay(
            this.dateStart, 
            this.dateEnd,
            "YYYY-MM"
        );

        return true;
    }

    private setupProperty_hasManyPosition(): boolean{
        if(Array.isArray(this.positions) == false) return false;
        if(this.positions.length == 0) return false;

        this.hasManyPosition = this.positions.length > 1;
        return true;
    }
    
    private setupProperty_hasActualPosition(): boolean{
        if(Array.isArray(this.positions) == false) return false;
        if(this.positions.length == 0) return false;

        for (const element of this.positions) {
            if(element.actual == true){
                this.hasActualPosition = true;
                return true;
            }
        }
        this.hasActualPosition = false;
        return true;
    }

    public static createFromObj(obj: Company, isoLang: string = "fr"): Company{
        return new Company(
            obj.id, 
            obj.slug, 
            obj.name,
            obj.description,
            isoLang
        );
    }

}