const express = require("express");
const bodyParse = require("body-parser");
const basicAuth = require("./Utils/Auth/BasicAuth");
const cors = require("cors");
const expressVue = require("express-vue");
const path = require("path");

const userController = require("./Controllers/UsersController");
const cvController = require("./Controllers/CvController");

const app = express();

app.use(bodyParse.json());
// app.use(cors);

const corsOption = {
    origin:  "http://localhost"
}

// Setup BasicAuth
// app.use(basicAuth);

// Setup static assets
app.use('/templates/1/', express.static(__dirname + '/Templates/cv/template-1/'));
app.use('/public/', express.static(__dirname + '/Public/'));

const router = express.Router({ mergeParams: true });

// Use ExpressVue Package
const vueOptions = {
    rootPath: path.join(__dirname, "/Templates"),
    head: {},
};
const expressVueMiddleware = expressVue.init(vueOptions);
app.use(expressVueMiddleware);

// Setup controllers
app.use("/:isoLang/users", cors(corsOption), userController);
app.use("/:isoLang/cv", cors(corsOption), cvController(router));

// Start server
app.listen(3000);