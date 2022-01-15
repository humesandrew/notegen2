const express = require('express');

// this line does environmental variables (which are privacy sensitive), in like .env // 
// then gitignore the .env file/// Always hide sensitive keys, api keys, ssh, etc// 


const PORT = process.env.PORT || 3001;
const app = express();


const todos = [
    {id: 1, 
    text: 'walk the dog'},

    {id: 2, 
    text: 'get snow tires'}

];

// takes a question and a response//
app.get('/api/todos', (req, res) => {
    console.log(req);
    
    
    res.json(todos);

})