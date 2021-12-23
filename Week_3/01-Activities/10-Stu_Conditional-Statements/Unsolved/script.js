// Change the values and operators below to test your algorithm meets all conditions
var x = 50;
var expression1 = (x < 25);
var expression2 = (x >= 50);

// Write Your JavaScript Code Here

if (!expression1 && expression2) 
{console.log("True ✅ True ✅") };

if (!expression1) {console.log("True ✅ False ❌")};
if (expression2) {console.log("False ❌ True ✅");}
if (!expression1 || !expression2) {console.log("False ❌ False ❌");}