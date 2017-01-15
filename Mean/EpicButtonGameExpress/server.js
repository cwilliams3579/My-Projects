var express = require("express");
var path = require("path");
var app = express();
app.set("views", path.join(__dirname, "./views"));
app.set("view engine", "ejs");

var bodyParser = require("body-parser");
app.use(bodyParser.urlencoded({extended: true}));

app.get("/", function(req, res){
	res.render("index");
});

var server = app.listen(8000, function(){
	console.log("magic on port 8000");
});

var io = require("socket.io").listen(server);
var count = 0
io.sockets.on("connection", function(socket){
	console.log("socket on" + socket.id);
	socket.emit("push", {push: "The button has been pushed " + count + "time(s)"});
	socket.on("epic_clicked", function(){
		count ++
		console.log("Pushed " + count);
		io.emit("epic_response", {response: "The button has been pushed " + count + " time(s)"});
	});
	socket.on("reset_clicked", function(){
		count = 0;
		console.log("Pushed " + count);
		io.emit("reset_response", {reset: "The button has been pushed " + count + " times"});
	});
})