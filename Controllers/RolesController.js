const express = require('express');
const bodyParser = require('body-parser');
// const xml = require('xml');

const app = express();

app.use(bodyParser.json());

app.get('/role/all', (req, res) => {
  const body = [];
  body.push({
    "id": 1,
    "nom": "Haricot",
  });
  body.push({
    "id": 2,
    "nom": "Lenbtille",
  });
  // res.set("Content-Type", "text/xml");
  res.json(body);
  // res.send(xml(body));
});

app.post('/role/', (req, res) => {
  const body = "Creation finie";
  res.json(body);
});

app.put('/role/', (req, res) => {
  const body = "Modification finie";
  res.json(body);
});

app.delete('/role/', (req, res) => {
  const body = "Suppression finie";
  res.json(body);
});

app.listen(3000, () => console.log('Server started at http://localhost:3000'));