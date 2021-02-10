const express = require("express");
const bodyParse = require("body-parser");

const app = express();
app.use(bodyParse.json());

// Recupere liste produits
app.get("/products/", (request, response) => {
    const products = [];
    products.push(
        {
            "id": 1,
            "nom": "Haricots"
        },
        {
            "id": 2,
            "nom": "Saucisse"
        }
    );
    response.type("application/json");
    response.json(products);
});

app.listen(3000);