const express = require("express");
const bodyParse = require("body-parser");
const basicAuth = require("./Utils/BasicAuth");
const cors = require("cors");

const userController = require("./Controllers/UsersController");

const app = express();

app.use(bodyParse.json());
// app.use(cors);

const corsOption = {
    origin:  "http://localhost"
}

app.use(basicAuth);
app.use("/users", cors(corsOption), userController);

app.listen(3000);