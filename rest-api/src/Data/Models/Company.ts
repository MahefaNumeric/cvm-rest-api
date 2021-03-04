import Position from './Position';
import DateUtils from '../../Utils/DateUtils';
import BaseModel from './BaseModel';

export default class Company extends BaseModel{
    public _table = 'companies';

    private positionsValue: Array<Position>;

    public dateStart: string;
    public dateEnd: string;
    public hasManyPosition: boolean;

    public constructor(
        public id: number,
        public slug: string,
        public name: string,
        public description: string
    ){
        super();

        // // Position on a company
        this.positionsValue = [];

        this.dateStart = ``;  // Calculate from this.positions
        this.dateEnd = ``;  // Calculate from this.positions

        /** Need for the template, to differentiate visual rendering for one or many position on signle company */
        this.hasManyPosition = false;
    }
    
    set positions(value: Array<Position>) {
        this.positionsValue = value;
        this.setupPositionsBeganEnd();
        this.setupProperty_hasManyPosition();
    }

    get positions(): Array<Position> {
        return this.positionsValue;
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

        return true;
    }

    private setupProperty_hasManyPosition(): boolean{
        if(Array.isArray(this.positions) == false) return false;
        if(this.positions.length == 0) return false;

        this.hasManyPosition = this.positions.length > 1;
        return true;
    }

    public static createFromObj(jsObj: Company): Company{
        return new Company(
            jsObj.id, 
            jsObj.slug, 
            jsObj.name,
            jsObj.description
        );
    }

}