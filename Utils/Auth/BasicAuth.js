module.exports = basicAuth;
const UsersService = require("../../Services/UserService");

async function basicAuth(request, response, next){
    const notAuthUrls = [
        "/login",
        "/users/auth"
    ];
    if(notAuthUrls.includes(request.path)){
        return next();
    }

    if(!request.headers.authorization || request.headers.authorization.indexOf("Basic") == -1){
        return response.status(401).json({
            status: 401, 
            message: "Authorization manquante"
        });
    }

    console.log("Authorization : ", request.headers.authorization);
    const base64Credentials = request.headers.authorization.split(" ")[1];
    console.log("base64Credential : ", base64Credentials);
    const credentials = Buffer.from(base64Credentials, "base64").toString("ascii");
    console.log("credentials : ", credentials);
    const [username, password] = credentials.split(":");
    console.log("username, password : ", username, password);
    const userService = new UsersService();
    const user = await userService.checkCredentials(username, password)
    console.log("user : ", user);
    if(user == null){
        return response.status(401).json({
            status: 401, 
            message: "Authorization fausse"
        }); 
    }
    request.user = user;
    return next();
}