const express = require('express');
const morgan = require('morgan');
const path = require('path');
const exphbs = require('express-handlebars');
const session = require('express-session');
const passport = require('passport');
const flash = require('connect-flash');
const MySQLStore = require('express-mysql-session')(session);
const https = require('https');
const cors = require('cors');
const fs = require('fs');
const mongoConnect = require('./config/db');
require('dotenv').config();
const usersRouter = require('./routes/users');
const { ManagementClient } = require('auth0');
const qs = require('qs');
const uuid = require('uuid');
const unicid = uuid.v4();

// MULTER //
const multer = require('multer');
const storage = multer.memoryStorage();
const { database } = require('./backup/keys');

// Initializations
const app = express();

// Body parsing middleware — debe ir antes de las rutas
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

// Middleware para parsear query strings complejas con qs
app.use((req, res, next) => {
  req.query = qs.parse(req._parsedUrl.query);
  next();
});



// Otros middlewares
app.use(cors());
app.use(morgan('dev'));

app.use(multer({
  storage,
  limits: { fileSize: 10000000 },
  fileFilter: (req, file, cb) => {
    const filetypes = /jpeg|png|jpg/;
    const minetype = filetypes.test(file.mimetype);
    const extname = filetypes.test(path.extname(file.originalname));
    if (minetype && extname) {
      return cb(null, true);
    }
    cb("error: el archivo debe ser una extensión válida");
  }
}).fields([{ name: 'image', maxCount: 1 }, { name: 'image1', maxCount: 1 }, { name: 'image2', maxCount: 1 }]));

// Passport y base de datos
require('./lib/passport');
mongoConnect();

// Settings
app.set('port', process.env.PORT || 4000);
app.set('views', path.join(__dirname, 'views'));

// Rutas
app.use(require('./routes/index'));
app.use(require('./routes/authentication'));
app.use('/users', usersRouter);

// Archivos estáticos
app.use(express.static(path.join(__dirname, 'public/style-1')));
app.use(express.static(path.join(__dirname, 'js')));
app.use(express.static(path.join(__dirname, '/public/uploads/images')));

// HTTPS server
const sslOptions = {
  key: fs.readFileSync('/etc/letsencrypt/live/letsmarter.com/privkey.pem'),
  cert: fs.readFileSync('/etc/letsencrypt/live/letsmarter.com/fullchain.pem')
};

const httpsServer = https.createServer(sslOptions, app);
const port = 4000;

try {
  httpsServer.listen(port, () => {
    console.log(`Servidor HTTPS corriendo en https://localhost:${port}`);
  });
} catch (error) {
  console.log(error);
}
