const jsonServer = require("json-server");
const server = jsonServer.create()
const router = jsonServer.router("db.json");

const middlewares = jsonServer.defaults();
const loginResponse = require("./response/login_response_200_OK.json");
const getUserResponse = require("./response/get_user_response_200_OK.json");

server.use(middlewares);
server.use(jsonServer.bodyParser);

server.get("/login", (req, res) => {
    const delay = 2000 // In milliseconds
    setTimeout(() => {
        res.jsonp(loginResponse);
    }, delay)
});

server.get("/user", (req, res) => {
    const delay = 2000 // In milliseconds
    setTimeout(() => {
        res.jsonp(getUserResponse);
    }, delay)
});

server.use(router);
server.listen(8000, () => {
    console.log("JSON Server is running");
});
