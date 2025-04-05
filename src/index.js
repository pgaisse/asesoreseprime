const express = require('express');
const morgan = require('morgan');
const path = require('path');
const exphbs = require('express-handlebars');
const session = require('express-session');
const passport = require('passport');
const flash = require('connect-flash');
const MySQLStore = require('express-mysql-session')(session);
const bodyParser = require('body-parser');



const uuid = require('uuid');
const unicid = uuid.v4();

// MULTER //
const multer = require('multer');
const storage = multer.memoryStorage();
const { database } = require('./backup/keys');

// Intializations
const app = express();
require('./lib/passport');

// Settings
app.set('port', process.env.PORT || 3389);
app.set('views', path.join(__dirname, 'views'));

console.log(path.join(__dirname, 'js'));

app.engine('hbs', exphbs.engine({
  defaultLayout: 'main',
  layoutsDir: path.join(app.get('views'), 'layouts'),
  partialsDir: path.join(app.get('views'), 'partials'),
  extname: '.hbs',
  helpers: require('./lib/handlebars'),

}))
app.set('view engine', '.hbs');



// Middlewares
//app.use(morgan('dev'));
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(multer({
  storage,
  limits: { fileSize: 10000000 },
  fileFilter: (req, file, cb) => {
    const filetypes = /jpeg|png|jpg/
    const minetype = filetypes.test(file.mimetype);
    const extname = filetypes.test(path.extname(file.originalname))
    if (minetype && extname) {
      return cb(null, true);
    }
    cb("error: el archivo debe ser una extensión válida");
  }


}).fields([{ name: 'image', maxCount: 1 }, { name: 'image1', maxCount: 1 }, { name: 'image2', maxCount: 1 }]));

app.use(session({
  secret: 'faztmysqlnodemysql',
  resave: false,
  saveUninitialized: false,
  store: new MySQLStore(database)
}));
app.use(flash());
app.use(passport.initialize());
app.use(passport.session());
// Global variables
app.use((req, res, next) => {
  app.locals.message = req.flash('message');
  app.locals.success = req.flash('success');
  app.locals.user = req.user;
  next();
});

// Routes
app.use(require('./routes/index'));
app.use(require('./routes/authentication'));

// Public
app.use(express.static(path.join(__dirname, 'public/style-1')));
app.use(express.static(path.join(__dirname, 'js')));
app.use(express.static(path.join(__dirname, '/public/uploads/images')));
// Starting
try {
  app.listen(app.get('port'), () => {
    console.log('Server is in port', app.get('port'));
  });

}
catch (error) {
  app.listen(app.get('port'), () => {
    console.log('Server is in port', app.get('port'));
  });

}
