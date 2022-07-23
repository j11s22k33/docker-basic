const express = require('express');
const cors = require('cors');
const cookieParser = require('cookie-parser');

const app = express();
const port = process.env.PORT || 3000;

app.use(express.static('public'));
app.use(cors());
app.use(cookieParser());
app.use(express.urlencoded({extended: true}));
app.use(express.json({limit: '50mb'}));

app.get('/test', (req, res, next) => {
    res.json('TEST')
})

app.listen(port, () => {
    console.info(`Server running at port:${port}`)
})