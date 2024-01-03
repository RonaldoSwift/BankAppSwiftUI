const jsonServer = require("json-server");
const server = jsonServer.create()
const router = jsonServer.router("db.json");

const middlewares = jsonServer.defaults();
const data = require("./response/login_response_200_OK.json");

server.use(middlewares);
server.use(jsonServer.bodyParser);

server.get("/login", (req, res) => {
    const delay = 2000 // In milliseconds
    setTimeout(() => {
        res.jsonp(data);
    }, delay)
});

server.use(router);
server.listen(8000, () => {
    console.log("JSON Server is running");
});
