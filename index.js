const express = require('express')
const app = express()
const port = 3333
var cors = require('cors')
var bodyParser = require('body-parser')
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }))
app.use(cors());


/**************************************Routes*/
var catalogs = require('./routes/catalogs');
app.use('/', catalogs);

/**************************************Routes*/


app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`)
  })