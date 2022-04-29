const express = require("express");
const app = express();

const cors = require("cors");

//middelware
app.use(cors());
app.use(express.json()) // => allows acess to req.body

const PORT = 4000
app.listen(PORT, () => {
    console.log(`Server is starting on ${PORT}`)
});