const express = require("express");
const bodyParse = require("body-parser");
const basicAuth = require("./Utils/Auth/BasicAuth");
const cors = require("cors");

const userController = require("./Controllers/UsersController");
const cvController = require("./Controllers/CvController");

const app = express();

app.use(bodyParse.json());
// app.use(cors);

const corsOption = {
    origin:  "http://localhost"
}

// app.use(basicAuth);

app.use("/users", cors(corsOption), userController);
app.use("/cv", cors(corsOption), cvController);

app.listen(3000);