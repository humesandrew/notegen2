const express = require('express');
const connection = require('./config');
const PORT = process.env.PORT || 3001;
const app = express();
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.listen(PORT, () => console.log('Server listening on port: ${PORT}'));


// the above is the boilerplate code for creating the server in express///////////////////////

// async and await///////
//declaring a function as 'async' allows us to use 'await' syntax inside that function//  
// ONLY WORKS FOR PROMISES //  

app.post('/api/todos', async (req, res) => {

    const { task } = req.body;
    if(!task) {
        return res.status(400).json({ error: 'You must provide a task.'});
        
    }


//if there is a task, save it to the database//  /////
// js will try to run every single line of code inside the 'try' block ("try    catch") /////
// then if any line throws an error JS will put the error in the catch block, then run the code in the catch block//////
// so if we had many lines of code happening in the try block, the error that happens will become what the "e" is//////
// any then any code in the catch block will be executed// 


   try {
       const insertQuery = 'INSERT INTO todos(task) VALUES(?);';
       const result = await connection.query(insertQuery, [task]);
       
   } catch (e) {

   }


})