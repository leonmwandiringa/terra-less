const serverless = require("serverless-http");
const express = require("express");
const app = express();
const userRouter = require("./routes/user");
const bodyParser = require('body-parser');

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.use(userRouter)
app.use((req, res, next) => {
  return res.status(404).json({
    error: "Not Found bro we couldnt",
    data: req.path
  });
});

module.exports.handler = serverless(app);
