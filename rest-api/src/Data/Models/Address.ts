
export default class Address{

    /**
     * 
     * @param {number} id 
     * @param {0|1} enable 
     * @param {number} id_user 
     * @param {string} slug 
     * @param {string} value 
     */
    constructor(
        public id: number,
        public enable: 0|1,
        public id_user: number,
        public slug: string,
        public value: string 
    ){
    }

    public static createFromObj(jsObj: Address): Address{
        return new Address(
            jsObj.id, 
            jsObj.enable, 
            jsObj.id_user, 
            jsObj.slug, 
            jsObj.value
        );
    }
}