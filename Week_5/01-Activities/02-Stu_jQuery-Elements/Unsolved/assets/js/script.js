$(document).ready(function() { //

// TODO: Select the existing DOM element, <div id="root">, and assign to a new variable
let rootEl = $('#root');

// Hint: Visit the documentation https://api.jquery.com/



// TODO: Create a `<p>` element that will store an author's name and assign that created element to a new variable
let author = $('<p>');

// TODO: Add the following text to the newly created `<p>` element: "~ Carol Dweck"// 

author.text('Carol Dweck');


// TODO: Add the class `plain` to the author element//
author.addClass('plain');
// or author.addClass('plain') - more explicit // 


// TODO: Create a new `<h1>` element that will store an author's quote and assign it to new variable//
let quote = $('<h1>');


// TODO: Add the following quote text to the quote element, "Love Challenges, Be Intrigued by Mistakes, Enjoy Effort, and Keep Learning."
quote.text('Love challenges');


// TODO: Apply the class `fancy` to the quote element
quote.attr('class', 'fancy');


// TODO: Append the author element to the quote element
quote.append('plain');

// TODO: Append the quote element to the HTML element with an ID of `root` in `index.html`
root.append('quote');

});