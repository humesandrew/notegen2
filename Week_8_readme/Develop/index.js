// // TODO: Include packages needed for this application
const inquirer = require('inquirer');
const fs = require('fs');

// TODO: Create an array of questions for user input


inquirer
  .prompt([
    {type: 'input',
    name: 'name',
    message: 'What is your name?'},

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
    name: 'contribution',
    message: "Any contribution guidelines?"}, 

    {type: 'input',
    name: 'testing',
    message: "Any testing instructions?"}])
  
  .then((data) => {
      const filename = `${data.name.toLowerCase().split(' ').join('')}.json`;
  
      fs.writeFile(filename, JSON.stringify(data, null, '\t'), (err) =>
        err ? console.log(err) : console.log('Success!')
      );
    });
  