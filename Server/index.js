const jsonServer = require("json-server");
const server = jsonServer.create();
const router = jsonServer.router("db.json");

const middlewares = jsonServer.defaults();
const loginResponse = require("./response/login_response_200_OK.json");
const dbjson = require("./db.json");

server.use(middlewares);
server.use(jsonServer.bodyParser);

// LOGIN ENDPOINTS

server.get("/login", (req, res) => {
    const delay = 2000; // In milliseconds
    setTimeout(() => {
        let filteredUsers = dbjson.users.filter(
            (user) => user.documentNumber == req.body.documentNumber
        );

        console.log("username" + filteredUsers.length);

        if (filteredUsers.length === 0) {
            res.status(404).jsonp({
                status: "error",
                data: null,
                message: "Credentials are incorrect",
            });
        } else {
            res.status(200).jsonp(loginResponse);
        }
    }, delay);
});

// USER MIDDLEWARE

server.use((req, res, next) => {
    console.log("token " + req.query.apiKey);

    if (req.query.apiKey.length === 0) {
        res.status(401).jsonp({
            status: "error",
            data: null,
            message: "Token is incorrect",
        });
    } else {
        //Not a post request. Let db.json handle it
        next();
    }
});

// USER ENDPOINTS

server.get("/users/:userId", (req, res) => {
    const delay = 3000; // In milliseconds
    setTimeout(() => {
        let filteredUsers = dbjson.users.filter(
            (user) => user.id == req.params.userId
        );

        let token = req.query.apiKey.toString;

        if (filteredUsers.length === 0) {
            res.status(404).jsonp({
                status: "error",
                data: null,
                message: "Users no encontrados",
            });
        } else {
            let userFound = filteredUsers[0];
            const jsonResponse = {
                status: "success",
                data: {
                    current_user: userFound,
                },
                message: null,
            };
            res.status(200).jsonp(jsonResponse);
        }
    }, delay);
});


server.get("/services", (req, res) => {
    const delay = 3000; //cargando en 3 segundos
    setTimeout(() => {
       
        res.status(200).jsonp(dbjson.services);

    }, delay);
});

server.use(router);
server.listen(8000, () => {
    console.log("JSON Server is running");
});
