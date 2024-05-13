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

// MULTER
const multer = require('multer');
const storage = multer.memoryStorage();
const { database } = require('./keys');

// Intializations
const app = express();
require('./lib/passport');

// Settings
app.set('port', process.env.PORT || 8080);
app.set('views', path.join(__dirname, 'views'));

console.log(path.join(__dirname, 'js'));

app.engine('hbs', exphbs.engine({
  defaultLayout: 'main',
  layoutsDir: path.join(app.get('views'), 'layouts'),
  partialsDir: path.join(app.get('views'), 'partials'),
  extname: '.hbs',
  helpers: {
    ifCond: function (v1, v2, options) {
      console.log('1:' + v1);
      console.log('2:' + v2);
      if (v1 === v2) {
        return options.fn(this);
      }
      return options.inverse(this);

    },

    nodupl: function (name_sector, name_sector_ant) {

      if (name_sector != name_sector_ant) {

        return "";
      }
      else {
        return name_sector;
      }

      id_sector_ant = id_sector


    },

    or: function (v1, v2, options) {
      if (v1 || v2) {
        return options.fn(this);
      }
      else {
        return options.inverse(this);

      }
    },
    rest: function (v1) {
      const result = v1 - 1;
      if (result >= 1) {
        return result;
      }
      else {
        return 1;
      }


    },
    setVar: function (varName, varValue, options) {
      options.data.root[varName] = varValue;
    },
    sum: function (v1, max) {
      const result = v1 + 1;
      return result;

    },

    findTable: function (obj) {
      const id = 0;
      for (var prop in obj) {
        //if(prop.includes('id_'))
        {
          return prop;
        }
      }
    },
    objectToArray: function (object) {
      return Object.entries(object);
    },
    findId: function (obj) {
      for (var prop in obj) {
        //if(prop.includes('id_'))
        {
          return obj[prop];
        }
      }
    },
    icons: function (nameTable) {



      var icons = [['incidents', 'fas fa-exclamation-triangle'], ['repairs', 'fas fa-hammer'], ['advisers', 'fas fa-user'], ['cases', 'fas fa-folder-open'], ['clients', 'fas fa-user-friends'], ['budgets', 'far fa-clipboard'], ['damages', 'fas fa-house-damage'], ['dimentions', 'fa-solid fa-maximize'], ['sectors', 'fas fa-map-marker-alt'], ['status', 'fas fa-check-circle']];
      //const objetoJSON = JSON.parse(icons);


      for (let i = 0; i < icons.length; i++) {
        if (icons[i][0] == nameTable) {
          return icons[i][1]
        }

      }

    },
    genField: function (type_f) {
      let html_v = '';

      console.log("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" + type_f);
      if (type_f == 'varchar') {
        html_v = `<input type="text" name="adviser_name" placeholder="Name" class="form-control" >`;


      }
      else if ('int') {
        html_v = `<input type="Number" name="adviser_name" placeholder="Name" class="form-control" >`;
      }
      return html_v;
    }
  },

}))
app.set('view engine', '.hbs');



// Middlewares
app.use(morgan('dev'));
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
