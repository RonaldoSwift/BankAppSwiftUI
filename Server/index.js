const jsonServer = require("json-server");
const server = jsonServer.create()
const router = jsonServer.router("db.json");

const middlewares = jsonServer.defaults();
const data = require("./response/login_response_200_OK.json");

server.use(middlewares);
server.use(jsonServer.bodyParser);

server.get("/login", (req, res) => {
    res.jsonp(data);
});

server.use(router);
server.listen(8000, () => {
    console.log("JSON Server is running");
});