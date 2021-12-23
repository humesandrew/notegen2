// WRITE YOUR CODE HERE

var classNames = ["Jim", "Bob", "Jill", "Chandy", "Elvis"];

console.log(classNames.length);

for (var i = 0; i < classNames.length; i++) {console.log("welcome to the class " +classNames)};

classNames.splice(0, 1, 'RANDY');

console.log(classNames)

if (classNames[0]) {console.log("Welcome to the class " + classNames[0])};