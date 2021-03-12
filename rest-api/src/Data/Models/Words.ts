
export default class Words {
    private _table = 'words';

    public constructor(
        public id: number,
        public slug: string,
        public value: string,
    ){
    }

    public static createFromObj(obj: Words): Words{
        return new Words(
            obj.id, 
            obj.slug, 
            obj.value,
        );
    }

}