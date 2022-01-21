
Loading history...

Matt Brignola  12:19 PM
?

Stephen Moore  12:20 PM
I think 12:50
:+1::skin-tone-2:
1


Becca Guertin  1:32 PM
activity 8 solution (index.js)
const petEl = document.getElementById('pets');
const termButton = document.getElementById('term-btn');

const getPets = () =>
  fetch('/api/pets', {
    method: 'GET',
  })
    .then((res) => res.json())
    .then((data) => data);

const renderPet = (pet) => {
  const cardEl = document.createElement('div');
  const cardImageEl = document.createElement('img');
  const cardBodyEl = document.createElement('div');
  const cardBodyTitle = document.createElement('div');

  cardImageEl.classList.add('image', 'p-5');
  cardEl.classList.add('card', 'p-5');
  cardBodyEl.classList.add('card-body', 'p-5');
  cardBodyTitle.classList.add('card-header', 'card-title', 'link');

  cardImageEl.setAttribute('src', pet.image_url);
  cardBodyTitle.innerHTML = pet.name;
  cardBodyEl.innerText = pet.description;
  cardEl.appendChild(cardBodyTitle);
  cardEl.appendChild(cardBodyEl);
  cardEl.appendChild(cardImageEl);
  petEl.appendChild(cardEl);
};

const buttonHandler = () =>
  getPets().then((response) => response.forEach((item) => renderPet(item)));

termButton.addEventListener('click', buttonHandler);

Becca Guertin  6:47 PM
@here solutions from today's activities have been pushed to GitLab

Rhys Wright  6:52 PM
@here Thursday's video has been posted

Emmanuel  2:44 PM
@here Video from Saturday has been posted
:raised_hands:
1


Emmanuel  6:08 PM
https://www.postman.com/
PostmanPostman
Postman API Platform | Sign Up for Free
Postman is an API platform for building and using APIs. Postman simplifies each step of the API lifecycle and streamlines collaboration so you can create better APIs—faster. (39 kB)
https://www.postman.com/

6:08
Please odwnload this for class

Emmanuel  7:01 PM
class Character {
  // TODO: Add a constructor
  constructor(name, str, hp) {
    this.name = name;
    this.str = str;
    this.hp = hp;
  }
  // TODO: Create a printStats() method that console logs `this.name`, `this.strength`, and `this.hitPoints`
  printStats() {
    console.log(`Name: ${this.name}`);
    console.log(`Strength: ${this.str}`);
    console.log(`Hit Points: ${this.hp}`);
  }
  isAlive(){
    return this.hp > 0;
  }
  // TODO: Create a isAlive() method that returns a boolean based on whether or not a character's "hitpoints" are <= 0
  attack(character) {
    character.hp -= this.str;
  }
  // TODO: Create a attack() method that accepts an opponent object and decreases the opponent's "hitPoints" by this character's strength
}
// Creates two unique characters using the "character" constructor
const grace = new Character('Grace', 30, 75);
const dijkstra = new Character('Dijkstra', 20, 105);
// This keeps track of whose turn it is
let graceTurn = true;
grace.printStats();
dijkstra.printStats();
const turnInterval = setInterval(() => {
  // If either character is not alive, end the game
  if (!grace.isAlive() || !dijkstra.isAlive()) {
    clearInterval(turnInterval);
    console.log('Game over!');
  } else if (graceTurn) {
    grace.attack(dijkstra);
    dijkstra.printStats();
  } else {
    dijkstra.attack(grace);
    grace.printStats();
  }
  // Switch turns
  graceTurn = !graceTurn;
}, 2000);

Emmanuel  7:57 PM
// TODO: Import the parent class
const Vehicle = require('./vehicle');
// TODO: Create a `Boat` class that extends the `Vehicle` class
class Boat extends Vehicle {
  constructor(id, type, crew) {
    super(id, 0, 'bwom');
    this.type = type;
    this.crew = crew;
  }
  useHorn() {
    console.log(this.sound);
  }
  crewSoundOff() {
    this.crew.forEach(crewMember => {
      console.log(`${crewMember} reporting for duty!`);
    });
  }
}
const boatPassengers = [
  'Blackbeard',
  'Mary Read',
  'Henry Morgan',
  'Madame Cheng',
];
const boat = new Boat(16, 'sailboat', boatPassengers);
console.log('---BOAT---');
boat.printInfo();
boat.useHorn();
boat.crewSoundOff();
7:58
// TODO: Import the parent class
const Vehicle = require('./vehicle');
// TODO: Create a `Car` class that extends the `Vehicle` class
class Car extends Vehicle {
  constructor(id, color, passengers) {
    super(id, 4, 'beep');
    this.color = color;
    this.passengers = passengers;
  }
  useHorn() {
    console.log(this.sound);
  }
  checkPassengers() {
    if (this.passengers.length >= 4) {
      console.log("This car only seats 4 people. You have too many passengers!");
    }
  }
}
const carPassengers = [
  'Aristotle',
  'Confucius',
  'Socrates',
  'Lao-Tzu',
  'Plato',
];
const car = new Car(15, 'blue', carPassengers);
console.log('---CAR---');
car.printInfo();
car.useHorn();
car.checkPassengers();

Emmanuel  8:57 PM
class Store {
  constructor(name, stock) {
    this.name = name;
    this.stock = stock;
    this.revenue = 0;
  }
  processProductSale(name) {
    this.stock.forEach((item) => {
      if (item.name === name) {
        if (item.count > 0) {
          // TODO: Decrement the store's stock of item
          item.count--;
          // TODO: Increase the store's revenue
          this.revenue += item.price;
          console.log(`Purchased ${item.name} for ${item.price}`);
        } else {
          console.log(`Sorry, ${item.name} is out of stock!`);
        }
      }
    });
  }
  replenishStock(name, count) {
    this.stock.forEach((item) => {
      if (item.name === name) {
        item.count += count;
        // TODO: Increase the store's stock of item
        console.log(`Replenished ${item.name} by ${item.count}`);
      }
    });
  }
  printRevenue() {
    console.log(`The revenue so far is ${this.revenue}`);
  }
  welcome() {
    console.log(`Welcome to ${this.name}!`);
  }
}
module.exports = Store;

Emmanuel  9:30 PM
const express = require("express");
const PORT = 3001;
const app = express();
const todos = [
  {
    text: 'Take out the trash',
    id: 1,
  },
  {
    text: 'Sleep',
    id: 2,
  },
  {
    text: 'Run a mile',
    id: 3,
  }
];
app.get('/', (req, res) => {
  res.json(todos);
});
app.get('/:todoId', (req, res) => {
  const todoId = Number(req.params.todoId);
  const todo = todos.find(todo => todo.id === todoId);
  if (!todo) {
     res.status(404).json({ error: 'Todo not found'});
  }
  /*
   cannot set headers twice in a route
  * */
  res.json(todo);
})
app.listen(PORT, () => console.log('yeeee'));

Austin Morrow  9:32 PM
Could I meet with a TA?
:white_check_mark:
1


1 reply
9 days agoView thread

Vito Vittore  6:54 PM
In the instructions for some of the exercises you might see a call for Insomnia.  Insomnia is the same type of program that Postman is.  For the purposes of testing the 2 programs are interchangable

Emmanuel  6:58 PM
Set-ExecutionPolicy RemoteSigned
7:03
const express = require('express');
// Environmental variables
const PORT = process.env.PORT || 3001;
const app = express();
const todos = [
  {
    id: 1,
    text: 'Call the DMV'
  },
  {
    id: 2,
    text: 'Walk the dog',
  },
  {
    id: 3,
    text: 'Get snow tires',
  }
];
app.get('/api/todos', (req, res) => {
  // req is an object
  // that contains information about the incoming request
  console.log(req.method, 'manny is cool');
  res.json(todos);
});
// When someone makes a "POST" request to /api/todos, call the cb function
app.post('/api/todos', (req, res) => {
  console.log(req.method);
  res.send('Success');
});
app.listen(PORT, () => console.log(`Server started on port: ${PORT}`));


// npm i -g nodemon
7:07
const express = require('express');
// Environmental variables
const PORT = process.env.PORT || 3001;
const app = express();
// Body parser
// It takes information that the client is sending from a "form" or "post" request
// and attach the data into req.body
const todos = [
  {
    id: 1,
    text: 'Call the DMV'
  },
  {
    id: 2,
    text: 'Walk the dog',
  },
  {
    id: 3,
    text: 'Get snow tires',
  }
];
app.get('/api/todos', (req, res) => {
  // req is an object
  // that contains information about the incoming request
  console.log(req.method, 'manny is cool');
  res.json(todos);
});
// When someone makes a "POST" request to /api/todos, call the cb function
app.post('/api/todos', (req, res) => {
  console.log(req);
  res.send('Success');
});
app.listen(PORT, () => console.log(`Server started on port: ${PORT}`));


// npm i -g nodemon
7:08
app.use(express.json());
app.use(express.urlencoded({ extended: true}));

Emmanuel  7:17 PM
const express = require('express');
// Environmental variables
const PORT = process.env.PORT || 3001;
const app = express();
// Body parser
// It takes information that the client is sending from a "form" or "post" request
// and attach the data into req.body
app.use(express.json());
app.use(express.urlencoded({ extended: true}));
const todos = [
  {
    id: 1,
    text: 'Call the DMV'
  },
  {
    id: 2,
    text: 'Walk the dog',
  },
  {
    id: 3,
    text: 'Get snow tires',
  }
];
app.get('/api/todos', (req, res) => {
  // req is an object
  // that contains information about the incoming request
  console.log(req.method, 'manny is cool');
  res.json(todos);
});
// When someone makes a "POST" request to /api/todos, call the cb function
app.post('/api/todos', (req, res) => {
  console.log(req.body);
  const newTodo = {
    text: req.body.text,
    id: todos.length + 1,
  };
  todos.push(newTodo);
  res.send('Success');
});
app.listen(PORT, () => console.log(`Server started on port: ${PORT}`));


// npm i -g nodemon

Emmanuel  7:22 PM
const express = require('express');
// Environmental variables
const PORT = process.env.PORT || 3001;
const app = express();
// Body parser
// It takes information that the client is sending from a "form" or "post" request
// and attach the data into req.body
app.use(express.json());
app.use(express.urlencoded({ extended: true}));
// create a middleware to make "req.manny" exist in every route
// 1st parameter to app.use is what routes do i want this middleware to be active for
app.use(function(req, res, next) {
});
const todos = [
  {
    id: 1,
    text: 'Call the DMV'
  },
  {
    id: 2,
    text: 'Walk the dog',
  },
  {
    id: 3,
    text: 'Get snow tires',
  }
];
app.get('/api/todos', (req, res) => {
  // req is an object
  // that contains information about the incoming request
  console.log(req.method, 'manny is cool');
  res.json(todos);
});
// When someone makes a "POST" request to /api/todos, call the cb function
app.post('/api/todos', (req, res) => {
  console.log(req.manny);
  const newTodo = {
    text: req.body.text,
    id: todos.length + 1,
  };
  todos.push(newTodo);
  res.send('Success');
});
app.listen(PORT, () => console.log(`Server started on port: ${PORT}`));
// npm i -g nodemon

Emmanuel  7:37 PM
const express = require('express');
// Environmental variables
const PORT = process.env.PORT || 3001;
const app = express();
// Body parser
// It takes information that the client is sending from a "form" or "post" request
// and attach the data into req.body
app.use(express.json());
app.use(express.urlencoded({ extended: true}));
// create a middleware to make "req.manny" exist in every route
// 1st parameter to app.use is what routes do i want this middleware to be active for
// a middleware is a function that intercepts the incoming request,
// from there, we can validate data, check if a user is logged in, validate data being sent
// modify the request, respond early in case users does something stupid
app.use(function(req, res, next) {
  req.manny = 'Emmanuel';
  next();
});
const checkBodyForText = (req, res, next) => {
  if (req.body.text.length === 0) {
    return res.status(401).json({ error: 'You must pass text to create a todo'});
  } else {
    next();
  }
};
const todos = [
  {
    id: 1,
    text: 'Call the DMV'
  },
  {
    id: 2,
    text: 'Walk the dog',
  },
  {
    id: 3,
    text: 'Get snow tires',
  }
];
app.get('/api/todos', (req, res) => {
  // req is an object
  // that contains information about the incoming request
  console.log(req.method, 'manny is cool');
  res.json(todos);
});
// When someone makes a "POST" request to /api/todos, call the cb function
app.post('/api/todos', checkBodyForText, (req, res) => {
  console.log(req.manny);
  const newTodo = {
    text: req.body.text,
    id: todos.length + 1,
  };
  todos.push(newTodo);
  res.send('Success');
});
app.listen(PORT, () => console.log(`Server started on port: ${PORT}`));
// npm i -g nodemon

Emmanuel  7:51 PM
https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Optional_chaining

Emmanuel  8:10 PM
const express = require('express');
const PORT = 3001;
const app = express();
// TODO: Create a GET method for `/api/reviews` that logs when a user's request has been received
app.get('/api/reviews', (req, res) => {
  console.log('im hit');
  res.json({ success: true });
});
// TODO: Create a POST request for `/api/reviews` that logs when a user's request has been received
// Your code here
app.post('/api/reviews', (req, res) => {
  console.log('im hit');
  res.json({ success: true });
});
// TODO: Create a GET request for `api/upvotes` that logs when a user's request has been received
app.get('/api/upvotes', (req, res) => {
  // Your code here
  console.log('im hit');
  res.json({ success: true });
});
// TODO: Create a POST request for `api/upvotes` that logs when a user's request has been received
// Your code here
app.post('/api/upvotes', (req, res) => {
  // Your code here
  console.log('im hit');
  res.json({ success: true });
});
app.listen(PORT, () =>
  console.log(`Express server listening on port ${PORT}!`)
);

Emmanuel  8:19 PM
const uuid = () =>
  Math.floor((1 + Math.random()) * 0x10000)
    .toString(16)
    .substring(1);

Emmanuel  8:35 PM
app.use(express.static('public'));

Emmanuel  9:19 PM
const $container = document.querySelector('.container');
const $todoInput = document.querySelector('.todoText');
const $submitBtn = document.querySelector('.submitTodo');
$submitBtn.addEventListener('click', function() {
  const todoText = $todoInput.value;
  fetch('/api/todos', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      text: todoText,
      more: 'more stuff',
    })
  }).then(res => res.json())
    .then(todo => {
      console.log(todo);
      const $h1 = document.createElement('h1');
      const $p = document.createElement('p');
      const $hr = document.createElement('hr');
      $h1.textContent = todo.text;
      $p.textContent = todo.id;
      $container.appendChild($h1);
      $container.appendChild($p);
      $container.appendChild($hr);
    })
});
// http://something.com
fetch('/api/todos')
.then(res => res.json())
.then(todos => {
  todos.forEach(todo => {
    const $h1 = document.createElement('h1');
    const $p = document.createElement('p');
    const $hr = document.createElement('hr');
    $h1.textContent = todo.text;
    $p.textContent = todo.id;
    $container.appendChild($h1);
    $container.appendChild($p);
    $container.appendChild($hr);
  });
});
9:19
const express = require('express');
const { todos, uuid } = require('./db/todos');
// Environmental variables
const PORT = process.env.PORT || 3001;
const app = express();
app.use(express.static('public'));
// Body parser
// It takes information that the client is sending from a "form" or "post" request
// and attach the data into req.body
app.use(express.json());
app.use(express.urlencoded({ extended: true}));
// create a middleware to make "req.manny" exist in every route
// 1st parameter to app.use is what routes do i want this middleware to be active for
// a middleware is a function that intercepts the incoming request,
// from there, we can validate data, check if a user is logged in, validate data being sent
// modify the request, respond early in case users does something stupid
app.use(function(req, res, next) {
  req.manny = 'Emmanuel';
  next();
});
const checkBodyForText = (req, res, next) => {
  console.log('im here');
  console.log(req.method);
  if (req.body?.text.length === 0) {
    return res.status(401).json({ error: 'You must pass text to create a todo'});
  } else {
    next();
  }
};
app.get('/api/todos', (req, res) => {
  // req is an object
  // that contains information about the incoming request
  res.json(todos);
});
// When someone makes a "POST" request to /api/todos, call the cb function
app.post('/api/todos', checkBodyForText, (req, res) => {
  console.log(req.body);
  const newTodo = {
    text: req.body.text,
    id: uuid(),
  };
  todos.push(newTodo);
  res.json(newTodo);
});
app.listen(PORT, () => console.log(`Server started on port: ${PORT}`));
// npm i -g nodemon

CJ Sanders:ninja::skin-tone-3:  9:32 PM
can I snag a TA when available in 4
:white_check_mark:
1


Austin Morrow  9:32 PM
^^ Same but in 5
:white_check_mark:
1


Erna L  9:43 PM
manny  can you link your github when you get a chance

Emmanuel  9:55 PM
const uuid = () =>
  Math.floor((1 + Math.random()) * 0x10000)
    .toString(16)
    .substring(1);
9:55
@Erna L https://github.com/JukeFinite/todos
GitHubGitHub
GitHub - JukeFinite/todos
Contribute to JukeFinite/todos development by creating an account on GitHub. (29 kB)
https://github.com/JukeFinite/todos


Emmanuel  3:10 PM
@here vid is up
:raised_hands:
2


Rhys Wright  9:20 AM
@here Week 12 content and week 11 activity and algo solutions have been pushed. Please remember to pull today's content!
:+1:
2


Emmanuel  10:00 AM
https://docs.google.com/presentation/d/1In4Iv-dAv3A3BiU88duttuXpEPcvbr4Qf4RniD8EZsE/edit#slide=id.g406a798aef_2_23

Emmanuel  11:16 AM
winpty mysql -u root -p

Emmanuel  11:22 AM
https://www.mysql.com/products/workbench/
11:26
https://dev.mysql.com/downloads/workbench/

Emmanuel  11:34 AM
@here To those of you who haven't, please install workbench as well on your machine. it's not important but it helps
https://dev.mysql.com/downloads/workbench/

Emmanuel  12:32 PM
SET SQL_SAFE_UPDATES=0;

Emmanuel  12:43 PM
-- by convention, when we write SQL commands
-- ALL SQL COMMANDS are normally written in all capital letters
-- Delete the database from the server
-- delete all rows and tables from that database
DROP DATABASE IF EXISTS todos_db;
CREATE DATABASE todos_db;
-- To specify which database to use for SQL
--  we use the USE command
USE todos_db;
-- when creating a table, we need to specify our columns
-- and what type of data they should be and any limiters that we might want to put
CREATE TABLE users (
	-- specify a number column for this table
    -- tells SQL to create this "id"  column in our table
    -- and that it must be an integer, and they cannot pass a null value
    id INT NOT NULL,
    -- tells SQL to create this "firstName" column in our table
    -- and that it must be a string and cannot be more than 100 characters
    firstName VARCHAR(100) NOT NULL
);
INSERT INTO users (id, firstName)
VALUES
	(1, "Manny"),
    (2, "Zachary"),
    (3, "CJ"),
    (4, "Andrew"),
	(5, "Manny");
-- in order to query our database for data
--  we use the command below
-- we use the SELECT keyword followed by which columns do we want to fetch from the table
-- and then the table that we want to fetch those columns from
-- SELECT firstName FROM users
-- WHERE firstName = "Andrew";
-- DELETION
DELETE FROM users
WHERE id = 1;
--  UPDATE
UPDATE users
SET firstName = "Emmanuel"
WHERE id = 5;
SELECT firstName FROM users;

Emmanuel  12:56 PM
echo 'export PATH="/usr/local/mysql/bin:$PATH"' >> ~/.zshrc
12:59
echo 'export PATH="/usr/local/mysql/bin:$PATH"' >> ~/.bashrc

Emmanuel  1:13 PM
-- by convention, when we write SQL commands
-- ALL SQL COMMANDS are normally written in all capital letters 
-- Delete the database from the server
-- delete all rows and tables from that database
DROP DATABASE IF EXISTS todos_db;
CREATE DATABASE todos_db;
-- To specify which database to use for SQL
--  we use the USE command
USE todos_db;
-- when creating a table, we need to specify our columns
-- and what type of data they should be and any limiters that we might want to put
CREATE TABLE users (
	-- specify a number column for this table
    -- tells SQL to create this "id"  column in our table
    -- and that it must be an integer, and they cannot pass a null value
    id INT NOT NULL,
    -- tells SQL to create this "firstName" column in our table
    -- and that it must be a string and cannot be more than 100 characters
    firstName VARCHAR(100) NOT NULL
);
INSERT INTO users (id, firstName)
VALUES 
	(1, "Manny"),
    (2, "Zachary"),
    (3, "CJ"),
    (4, "Andrew"),
	(5, "Manny");
-- in order to query our database for data
--  we use the command below
-- we use the SELECT keyword followed by which columns do we want to fetch from the table
-- and then the table that we want to fetch those columns from
-- SELECT firstName FROM users
-- WHERE firstName = "Andrew";
-- DELETION
DELETE FROM users
WHERE id = 1;
--  UPDATE
UPDATE users
SET firstName = "Emmanuel"
WHERE id = 5;
SELECT firstName FROM users;

Emmanuel  1:18 PM
-- by convention, when we write SQL commands
-- ALL SQL COMMANDS are normally written in all capital letters 
-- Delete the database from the server
-- delete all rows and tables from that database
DROP DATABASE IF EXISTS todos_db;
CREATE DATABASE todos_db;
-- To specify which database to use for SQL
--  we use the USE command
USE todos_db;
-- when creating a table, we need to specify our columns
-- and what type of data they should be and any limiters that we might want to put

CREATE TABLE users (
	-- specify a number column for this table
    -- tells SQL to create this "id"  column in our table
    -- and that it must be an integer, and they cannot pass a null value
    id INT NOT NULL,
    -- tells SQL to create this "firstName" column in our table
    -- and that it must be a string and cannot be more than 100 characters
    firstName VARCHAR(100) NOT NULL,
    isCool BOOLEAN DEFAULT false
);



INSERT INTO users (id, firstName)
VALUES 
	(1, "Manny"),
    (2, "Zachary"),
    (3, "CJ"),
    (4, "Andrew"),
	(5, "Manny");
-- in order to query our database for data
--  we use the command below
-- we use the SELECT keyword followed by which columns do we want to fetch from the table
-- and then the table that we want to fetch those columns from
-- SELECT firstName FROM users
-- WHERE firstName = "Andrew";
-- DELETION
DELETE FROM users
WHERE id = 1;
--  UPDATE
UPDATE users
SET firstName = "Emmanuel"
WHERE id = 5;
SELECT firstName AS name, isCool FROM users;
1:22
DROP DATABASE IF EXISTS books_db;
CREATE DATABASE books_db;

USE books_db;

CREATE TABLE biographies(
	id INT NOT NULL,
    name VARCHAR(100)
);

CREATE TABLE fiction (
  id INT NOT NULL,
  name VARCHAR(100) NOT NULL
);

INSERT INTO fiction (id, name)
VALUES
    ( 001, "To Kill a Mockingbird"),
    ( 002, "100 Years of Solitude"),
    ( 003, "War and Peace");
    
UPDATE fiction
SET name = "Candide"
WHERE id = 002;

SELECT * FROM fiction;

Jaki:black_heart:  1:47 PM
Whats they syntax to get express

Zachary Swatfigure  1:47 PM
npm i express
:black_heart:
1


Emmanuel  1:57 PM
INSERT INTO students(firstName, lastName, enrolled)
VALUES ("Emmanuel", "Jucaban", true),
        ("Manny", "Jucaban", false),
        ("Stephen", "Moore", true),
        ("CJ", "Sanders", true);
1:58
const express = require('express');
/*
* By default when we require a folder in node
* and we do not specify a file name from within that folder
* the default behavior of node, is grab the file named "index.js"
* */
const connection = require('./connection');
const PORT = process.env.PORT || 3001;
const app = express();
app.get('/api/students', (req, res) => {
  connection.query('SELECT * FROM students;', (err, results) => {
    if (err) {
      return res.status(401).json(err);
    }
    res.json(results);
  });
});
app.listen(PORT, () => console.log(`Server started on PORT: ${PORT}`));
1:59
DROP DATABASE IF EXISTS classlist_db;
CREATE DATABASE classlist_db;

USE classlist_db;

CREATE TABLE students (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    enrolled BOOLEAN NOT NULL
);

INSERT INTO students(firstName, lastName, enrolled)
VALUES ("Emmanuel", "Jucaban", true),
        ("Manny", "Jucaban", false),
        ("Stephen", "Moore", true),
        ("CJ", "Sanders", true);
        
        
SELECT * FROM students;
2:01
Set-ExecutionPolicy RemoteSigned

Emmanuel  2:29 PM
const express = require('express');
/*
* By default when we require a folder in node
* and we do not specify a file name from within that folder
* the default behavior of node, is grab the file named "index.js"
* */
const connection = require('./connection');
const PORT = process.env.PORT || 3001;
const app = express();
// app.get('/api/students', (req, res) => {
//   // ASYNC AND AWAIT only works on promises
//   connection.query('SELECT * FROM students;', (err, results) => {
//     if (err) {
//       return res.status(401).json(err);
//     }
//   });
// });
app.get('/api/students', async (req, res) => {
  // ASYNC AND AWAIT only works on promises
//  in order to use "await"
//  we need to declare the function that await is being called
//  as an "async" function
//  The way try catch block works is
//  JS will try to run every code in the "try" block
//  if anything throws an error, it will exit out of the try block at that error
//  and then immediately go into the catch block
  try {
    const [students] = await connection.query('SELECT * FROM students;');
    console.log(students, 30);
    res.json(students);
  } catch (e) {
    console.log(e);
    res.json(e);
  }
});
app.listen(PORT, () => console.log(`Server started on PORT: ${PORT}`));

Rhys Wright  10:25 PM
@here Today's lecture has been posted to BCS

Kai Walsh  6:53 PM
ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/tmp/mysql.sock' (2)
kaiwalsh@Kais-MacBook-Pro mysqlTodos % mysql.start


2 replies
Last reply 1 day agoView thread

Emmanuel  6:56 PM
DROP DATABASE IF EXISTS todos_db;
CREATE DATABASE todos_db;

USE todos_db;

CREATE TABLE todos (
    id INT NOT NULL AUTO_INCREMENT,
    task VARCHAR(30) NOT NULL,
    completed BOOLEAN DEFAULT false,
    date_created DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

Emmanuel  8:05 PM
    const insertQuery = 'INSERT INTO todos(task) VALUES(?);';
8:06
const mysql = require('mysql2');
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'password',
  database: 'todos_db',
}).promise();
module.exports = connection;

Emmanuel  8:14 PM
const express = require('express');
const connection = require('./config');
// 3306
const PORT = process.env.PORT || 3001;
const app = express();
// turn on body-parser
// makes req.body exist
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
// POST - create todo
// async await
// Declaring a function as "async" allows us to use "await" syntax inside of that function
app.post('/api/todos', async (req, res) => {
  // { task: 'Sleep' }
  const { task } = req.body;
  // If the user does not provide a task, respond with an error
  if(!task) {
    return res.status(400).json({ error: 'You must provide a task'});
  }
//  if there is a task save it to the database
//  JS will "try" to run every single line of code inside of the "try" block
//  if any lines of the code throws an error, JS will take that error and
//  put that error in the "catch" block, and then run the code in the "catch" block
  try {
  // many lines of code....
    const insertQuery = 'INSERT INTO todos(task) VALUES(?);';
    const result = await connection.query(insertQuery, [task]);
    // Whenever we do an INSERT, UPDATE, OR DELETE query in mysql2 or mysql npm package
    // it doesn't give us the data that was interacted with. it instead tells us information
    // about how many rows were affected and maybe the insertId or updateId of the regarding data
    //
    res.json(result);
  } catch (e) {
    res.status(400).json(e);
  }
});
app.listen(PORT, () => console.log(`Server listening on port: ${PORT}`));
// [
//   {
//     "fieldCount": 0,
//     "affectedRows": 1,
//     "insertId": 1,
//     "info": "",
//     "serverStatus": 2,
//     "warningStatus": 0
//   },
//   null
// ]
8:15
const express = require('express');
const connection = require('./config');
// 3306
const PORT = process.env.PORT || 3001;
const app = express();
// turn on body-parser
// makes req.body exist
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
// POST - create todo
// async await
// Declaring a function as "async" allows us to use "await" syntax inside of that function
app.post('/api/todos', async (req, res) => {
  // { task: 'Sleep' }
  const { task } = req.body;
  // If the user does not provide a task, respond with an error
  if(!task) {
    return res.status(400).json({ error: 'You must provide a task'});
  }
//  if there is a task save it to the database
//  JS will "try" to run every single line of code inside of the "try" block
//  if any lines of the code throws an error, JS will take that error and
//  put that error in the "catch" block, and then run the code in the "catch" block
  try {
  // many lines of code....
    const insertQuery = 'INSERT INTO todos(task) VALUES(?);';
    const result = await connection.query(insertQuery, [task]);
    // Whenever we do an INSERT, UPDATE, OR DELETE query in mysql2 or mysql npm package
    // it doesn't give us the data that was interacted with. it instead tells us information
    // about how many rows were affected and maybe the insertId or updateId of the regarding data
    //
    res.json(result);
  } catch (e) {
    res.status(400).json(e);
  }
});
app.listen(PORT, () => console.log(`Server listening on port: ${PORT}`));
// [
//   {
//     "fieldCount": 0,
//     "affectedRows": 1,
//     "insertId": 1,
//     "info": "",
//     "serverStatus": 2,
//     "warningStatus": 0
//   },
//   null
// ]
8:18
const mysql = require('mysql2');
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'password',
  database: 'todos_db',
}).promise();
module.exports = connection;
8:19
const express = require('express');
const connection = require('./config');
// 3306
const PORT = process.env.PORT || 3001;
const app = express();
// turn on body-parser
// makes req.body exist
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
// POST - create todo
// async await
// Declaring a function as "async" allows us to use "await" syntax inside of that function
app.post('/api/todos', async (req, res) => {
  // { task: 'Sleep' }
  const { task } = req.body;
  // If the user does not provide a task, respond with an error
  if(!task) {
    return res.status(400).json({ error: 'You must provide a task'});
  }
//  if there is a task save it to the database
//  JS will "try" to run every single line of code inside of the "try" block
//  if any lines of the code throws an error, JS will take that error and
//  put that error in the "catch" block, and then run the code in the "catch" block
  try {
  // many lines of code....
    const insertQuery = 'INSERT INTO todos(task) VALUES(?);';
    const [result] = await connection.query(insertQuery, [task]);
    // Whenever we do an INSERT, UPDATE, OR DELETE query in mysql2 or mysql npm package
    // it doesn't give us the data that was interacted with. it instead tells us information
    // about how many rows were affected and maybe the insertId or updateId of the regarding data.
    // It also gives us an array with 2 elements. The 1st one is an object where we have the information we need
    // 2nd one is null or information about the fields of that row
    res.json(result);
  } catch (e) {
    res.status(400).json(e);
  }
});
app.listen(PORT, () => console.log(`Server listening on port: ${PORT}`));
// [
//   {
//     "fieldCount": 0,
//     "affectedRows": 1,
//     "insertId": 1,
//     "info": "",
//     "serverStatus": 2,
//     "warningStatus": 0
//   },
//   null
// ]

Emmanuel  8:37 PM
const express = require('express');
const connection = require('./config');
// 3306
const PORT = process.env.PORT || 3001;
const app = express();
// turn on body-parser
// makes req.body exist
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
// POST - create todo
// async await
// Declaring a function as "async" allows us to use "await" syntax inside of that function
app.post('/api/todos', async (req, res) => {
  // { task: 'Sleep' }
  const { task } = req.body;
  // If the user does not provide a task, respond with an error
  if(!task) {
    return res.status(400).json({ error: 'You must provide a task'});
  }
//  if there is a task save it to the database
//  JS will "try" to run every single line of code inside of the "try" block
//  if any lines of the code throws an error, JS will take that error and
//  put that error in the "catch" block, and then run the code in the "catch" block
  try {
  // many lines of code....
    const insertQuery = 'INSERT INTO todos(task) VALUES(?);';
    const getTodoById = 'SELECT * FROM todos WHERE id = ?;';
    const [result,] = await connection.query(insertQuery, [task]);
    // Whenever we do an INSERT, UPDATE, OR DELETE query in mysql2 or mysql npm package
    // it doesn't give us the data that was interacted with. it instead tells us information
    // about how many rows were affected and maybe the insertId or updateId of the regarding data.
    // It also gives us an array with 2 elements. The 1st one is an object where we have the information we need
    // 2nd one is null or information about the fields of that row
    const todosResult = await connection.query(getTodoById, [result.insertId]);
    res.json(todosResult);
  } catch (e) {
    res.status(400).json(e);
  }
});
app.listen(PORT, () => console.log(`Server listening on port: ${PORT}`));
8:40
DROP DATABASE IF EXISTS todos_db;
CREATE DATABASE todos_db;

USE todos_db;

CREATE TABLE todos (
    id INT NOT NULL AUTO_INCREMENT,
    task VARCHAR(30) NOT NULL,
    completed BOOLEAN DEFAULT false,
    date_created DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

Emmanuel  9:17 PM
DROP DATABASE IF EXISTS todos_db;
CREATE DATABASE todos_db;

USE todos_db;

CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(30) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE todos (
    id INT NOT NULL AUTO_INCREMENT,
    task VARCHAR(30) NOT NULL,
    completed BOOLEAN DEFAULT false,
    date_created DATETIME DEFAULT CURRENT_TIMESTAMP,
    userId INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (userId)
    REFERENCES users(id)
    ON DELETE SET NULL
);

Emmanuel  9:26 PM
sqlDevs.jpg 
sqlDevs.jpg


:rolling_on_the_floor_laughing:
3

9:30
const express = require('express');
const connection = require('./config');
// 3306
const PORT = process.env.PORT || 3001;
const app = express();
// turn on body-parser
// makes req.body exist
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
// USER API's
app.post('/api/users', async (req, res) => {
  const { username } = req.body;
  if (!username) {
    return res.status(400).json({ error: 'You must provide a username'});
  }
  try {
    const createUserQuery = 'INSERT INTO users(username) VALUES(?);';
    const getUserByIdQuery = 'SELECT * FROM users WHERE id = ?;';
    const [result] = await connection.query(createUserQuery, [username]);
    const [userResult] = await connection.query(getUserByIdQuery, [result.insertId]);
    res.json(userResult[0]);
  } catch (e) {
    res.status(400).json(e);
  }
});
app.get('/api/todos', async (req, res) => {
  try {
    const getAllTodosQuery = 'SELECT * FROM todos;';
    const [ todos ] = await connection.query(getAllTodosQuery);
    res.json(todos);
  } catch (e) {
    res.status(400).json(e);
  }
});
// POST - create todo
// async await
// Declaring a function as "async" allows us to use "await" syntax inside of that function
app.post('/api/todos', async (req, res) => {
  // { task: 'Sleep' }
  const { task } = req.body;
  // If the user does not provide a task, respond with an error
  if(!task) {
    return res.status(400).json({ error: 'You must provide a task'});
  }
//  if there is a task save it to the database
//  JS will "try" to run every single line of code inside of the "try" block
//  if any lines of the code throws an error, JS will take that error and
//  put that error in the "catch" block, and then run the code in the "catch" block
  try {
  // many lines of code....
    const insertQuery = 'INSERT INTO todos(task) VALUES(?);';
    const getTodoById = 'SELECT * FROM todos WHERE id = ?;';
    const [result,] = await connection.query(insertQuery, [task]);
    // Whenever we do an INSERT, UPDATE, OR DELETE query in mysql2 or mysql npm package
    // it doesn't give us the data that was interacted with. it instead tells us information
    // about how many rows were affected and maybe the insertId or updateId of the regarding data.
    // It also gives us an array with 2 elements. The 1st one is an object where we have the information we need
    // 2nd one is null or information about the fields of that row
    const [todosResult] = await connection.query(getTodoById, [result.insertId]);
    res.json(todosResult[0]);
  } catch (e) {
    res.status(400).json(e);
  }
});
app.listen(PORT, () => console.log(`Server listening on port: ${PORT}`));
9:33
source pathToSqlFile
9:34
DROP DATABASE IF EXISTS todos_db;
CREATE DATABASE todos_db;

USE todos_db;

CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(30) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE todos (
    id INT NOT NULL AUTO_INCREMENT,
    task VARCHAR(30) NOT NULL,
    completed BOOLEAN DEFAULT false,
    date_created DATETIME DEFAULT CURRENT_TIMESTAMP,
    userId INT,
    PRIMARY KEY (id),
    FOREIGN KEY (userId)
    REFERENCES users(id)
    ON DELETE SET NULL