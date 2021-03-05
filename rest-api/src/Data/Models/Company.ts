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

    public constructor(
        public id: number,
        public slug: string,
        public name: string,
        public description: string
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
        this.dateStartFriendly = DateUtils.formatDateToFriendly(this.dateStartValue, "fr", false);
    }

    get dateEnd(): string {
        return this.dateEndValue;
    }
    set dateEnd(value: string) {
        this.dateEndValue = value;
        this.dateEndFriendly = DateUtils.formatDateToFriendly(this.dateEndValue, "fr", false);
    }

    get durationInDayOnTheCompany(): number {
        return this.durationInDayOnTheCompanyValue;
    }
    set durationInDayOnTheCompany(value: number) {
        this.durationInDayOnTheCompanyValue = value;
        this.durationInDayOnTheCompanyFriendly = DateUtils.convertDayNumberToFriendlyDuration(this.durationInDayOnTheCompanyValue);
    }

    private setupPositionsBeganEnd(): boolean{
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

    public static createFromObj(obj: Company): Company{
        return new Company(
            obj.id, 
            obj.slug, 
            obj.name,
            obj.description
        );
    }

}