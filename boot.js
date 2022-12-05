const express = require('express');
let env = require("./config/env");
console.log('服务配置', env);

const app = express();
const port = env.SERVER_PORT ?? 7001;
const filepath = env.FILE_PATH ?? __dirname;

app.use(async (req, res, next) => {
    if (req.path.match(/([0-9]+|umi)\.js/)) {
        await new Promise(resolve => setTimeout(resolve, 1000));
    }
    next();
})

// Logger middleware
app.use((req, res, next) => {
    console.info(`${req.method} ${req.url}`);
    next();
});

// Umi SSR middleware
app.use(require(filepath + '/umi.server.js').default);

// Umi static files (including SSG pages)
app.use(express.static(filepath));

// Start server
app.listen(port, () => {
    console.log(`Server is now running at http://127.0.0.1:${port}/`);
});