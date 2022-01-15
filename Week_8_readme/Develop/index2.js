// // TODO: Include packages needed for this application
const inquirer = require('inquirer');
const fs = require('fs');
const generateMarkdown = require('./utils/generateMarkdown');

// TODO: Create an array of questions for user input



var questions = [
    {type: 'input',
    name: 'title',
    message: 'What is the title of your project?'},

    {type: 'input',
    name: 'license',
    message: 'What is your GitHub license?'},

    {type: 'input', 
    name: 'description',
    message: "Describe your project."},

    {type: 'input',
    name: 'installation',
    message: "Any installation instructions?"},

    {type: 'input',
    name: 'usage',
    message: "Any usage instructions?"},

    {type: 'input',
    name: 'contributing',
    message: "Any contribution guidelines?"}, 

    {type: 'input',
    name: "credits",
    message: "Any credits?"}
]



    // {type: 'input',
    // name: 'testing',
    // message: "Any testing instructions?"}];



    inquirer.prompt(questions).then(function(data) {
       console.log(data.title);
       
        // fs.writeFileSync("readme.txt", JSON.stringify(data, null, '\t'), generateMarkdown(data));
        fs.writeFileSync("readme.md", generateMarkdown(data));
    }
    )