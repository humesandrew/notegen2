
const express = require('express');
const inquirer = require('inquirer');
const uuid = require('uuidv4');
const fs = require('fs');


const PORT = 3001;

const app = express();

app.use(express.static('notes'))

app.get('notes.html', (req, res) => {
    res.send("hello");
    console.log("hello");
})


// const prompts = [{
//     type: 'input',
//     name: 'name',
//     message: "What is the note name?",
// },
// {
//     type: 'input', 
//     name: 'text',
//     message: 'What is the note text?'
// }]


// inquirer.prompt(prompts).then((answers) => {
//     fs.writeFileSync('db.json', JSON.stringify(answers, null, '\t'));
    
//     console.log(JSON.stringify(answers, null, '  '))})

   