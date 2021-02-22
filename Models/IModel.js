
/**
 * Experimental, not yet used
 */
class AbstractModel{

    constructor(path) {
        if (this.constructor === AbstractModel) {
          throw new TypeError('Abstract class "AbstractModel" cannot be instantiated directly');
        }
    }
}