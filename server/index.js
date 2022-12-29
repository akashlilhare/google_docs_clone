const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
const http = require("http");
const authRouter = require("./routes/auth");
const documentRouter = require("./routes/document");
const Document = require("./models/document");

const PORT = process.env.PORT | 3000;

const app = express();
var server = http.createServer(app);
var io = require("socket.io")(server);

app.use(cors());
app.use(express.json());
app.use(authRouter);
app.use(documentRouter);

const DB = "mongodb+srv://docsclone:Docs12345@cluster0.18mwd9n.mongodb.net/?retryWrites=true&w=majority";
mongoose.connect(DB).then(()=>{
    console.log("Conneted to database");
}).catch((err)=>{
    console.log("Database connection error");
    console.log(err);
});

io.on("connection",(socket)=>{

    socket.on("join", (documentId) =>{
        console.log("id");
        console.log(documentId);
        socket.join(documentId);
    });

    socket.on("typing", (data)=>{
        console.log(data);
        socket.broadcast.to(data.room).emit("changes", data);
    });

    socket.on("save", (data)=>{
        saveData(data);
    });
});

const saveData = async (data) => {
    let document = await Document.findById(data.room);
    document.content = data.delta;
    document = await document.save();
  };
  

server.listen(PORT, "0.0.0.0", ()=>{
    console.log(`Connected at port ${PORT}`);
});