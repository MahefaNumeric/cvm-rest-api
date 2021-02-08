const express = require('express');
const bodyParser = require('body-parser');

const app = express();

app.use(bodyParser.json());

app.get('/', (req, res) => {
  const articles = [];
  articles.push("Post 1");
  articles.push("Post 2");
  res.json(articles);
});

app.post('/', (req, res) => {
  res.json(req);
});

app.listen(3000, () => console.log('Server started at http://localhost:3000'));