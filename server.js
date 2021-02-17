const express = require("express");
const bodyParse = require("body-parser");
const basicAuth = require("./Utils/BasicAuth");
const userController = require("./Controllers/UsersController");

const app = express();
app.use(bodyParse.json());

app.use(basicAuth);
app.use("/users", userController);

app.listen(3000);