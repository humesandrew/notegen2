// // TODO: Include packages needed for this application
const inquirer = require('inquirer');
const fs = require('fs');
const generateMarkdown = require('./utils/generateMarkdown');

// TODO: Create an array of questions for user input



var questions = [
    {type: 'input',
    name: 'name',
    message: 'What is the name of your project?'},

    {type: 'input',
    name: 'user',
    message: 'What is your GitHub username?'},

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
    message: "Any testing instructions?"}];

    inquirer.prompt(questions).then((data) => {
      console.log(JSON.stringify(data, null, '  '));
    });

    // const data = JSON.stringify(questions);
    // const filename = `${data.user}.json`
   
   
  
// //  .then((data) => {
//       const filename = `${questions.name}.json`;
  
// fs.writeFile(readme.md, JSON.stringify(data), generatemarkdown)


      // fs.writeFile(filename.md, JSON.stringify(data, null, '\t'), (err) =>
      //   err ? console.log(err) : console.log('Written to new package!')
      // );

      const userName = data.user;
      const projectName = data.name;
      const userBadge = "Badge is at: " + "https://img.shields.io/github/license/" + userName + "/" + projectName + "/";
      const githubLink = "GitHub link: " + "https://github.com/" + userName + "/" + projectName + "/";



      // fs.appendFile(filename, '\n\n' + githubLink, (err) => {
      //   err ? console.log(err) : console.log('GitHub link added.');
      // })

      // fs.appendFile(filename, '\n' + userBadge, (err) => {
      //   err ? console.log(err) : console.log('Badge added.')
      // })

      // fs.appendFile(filename, '\n' + generateMarkdown, (err) => {
      //   err ? console.log(err) : console.log('Markdown added.')
      // })

      // fs.writeFile

  

    