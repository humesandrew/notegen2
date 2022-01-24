const express = require('express');
const sequelize = require('./config');
const app = express();
const PORT = process.env.PORT || 3001; 
const Book = require('./models/Book');
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

//connect tto the database prior to starting our server// 

sequelize.sync( { force: true } ).then(()    => {
        app.listen(PORT, () => console.log('server listening on port: ${PORT}'))});

