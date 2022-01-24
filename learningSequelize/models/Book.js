const { Model, DataTypes } = require('sequelize');
const sequelize = require('../config');

// build microservices : when your database gets huge // 

class Book extends Model {}; 


Book.init({
title: {
    type: DataTypes.STRING, 
},
author: { type: DataTypes.STRING,},

isbn: { type: DataTypes.STRING},
pages: { type: DataTypes.INTEGER},
edition: { type: DataTypes.INTEGER},
isPaperback: {type: DataTypes.BOOLEAN},},
{sequelize,
timestamps: false,
modelName: 'book',
}
)
    