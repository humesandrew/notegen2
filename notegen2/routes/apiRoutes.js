
const router = require('express').Router();
const store = require('../db/db.json');

app.use('/api', apiRoutes);
    app.use('/', htmlRoutes);

app.get('/api/notes', (req, res) => {
   console.log(req.method, " request received");
   res.json(notes);
})

app.post('/api/notes', (req, res) => {
    console.log(req.method);
    res.json(notes);
})