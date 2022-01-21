const express = require('express');
const PORT = process.env.PORT || 3001;
const app = express();
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static('./public'));

const notes = require('./notes/db.json');





    app.listen(PORT, () => console.log('Server started on port: 3001'));

app.get('/api/notes', (req, res) => {
   console.log(req.method, " request received");
   res.json(notes);
})

app.post('/api/notes', (req, res) => {
    console.log(req.method);
    res.json(notes);
})








//Body - parser : takes info a client is sending from a form or post request///
// and attach the data into req.body // this is built into node// 




// app.get('/api/notes', (req, res) => {
//     console.log(req.method);
//     res.json(notes);
// });





// app.post('/api/notes', (req, res) => {
//     console.log(req.method);
//     res.send('Success')
// });

