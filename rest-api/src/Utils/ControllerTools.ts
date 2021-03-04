import util from 'util';

export default class ControllerTools {
    
    public static render(response: any, data: any): never {
        // Render to console
        console.log("ControllerTools::render", util.inspect(data, {showHidden: false, depth: null, colors: true}));

        // Render to http
        if(response != null || response != undefined){
            response.type("application/json")
            .json(data)
            .end();
        }

        // Stop execution
        process.exit();
    }
}