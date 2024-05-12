const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;

const pool = require('../database');
const helpers = require('./helpers');
const { Strategy } = require('passport-local');

passport.use('local.signin', new LocalStrategy({
  usernameField: 'adviser_username',
  passwordField: 'adviser_password',
  passReqToCallback: true
}, async (req, adviser_username, adviser_password, done) => {
  const rows = await pool.query('SELECT * FROM advisers WHERE adviser_username = ?', [adviser_username]);
  if (rows.length > 0) {
    const adviser = rows[0];
    const validPassword = await helpers.matchPassword(adviser_password, adviser.adviser_password)
    if (validPassword) {
      const admin = await pool.query('SELECT * FROM advisers WHERE adviser_username = ? and adviser_role="admin"', [adviser_username]);
      if(admin.length>0){
        
        
       
        req.user_role='worker';

      }else{

      }
      done(null, adviser, req.flash('success', 'Welcome admin ' + adviser.adviser_username));

      
    } else {
      done(null, false, req.flash('message', 'Incorrect Password'));
    }
  } else {
    return done(null, false, req.flash('message', 'The Username does not exists.'));
  }
}));

passport.use('local.signup', new LocalStrategy({
  usernameField: 'adviser_username',
  passwordField: 'adviser_password',
  passReqToCallback: true
}, async (req, adviser_username, adviser_password, done) => {

  const { adviser_email,adviser_rut, adviser_phone,adviser_role ,adviser_lastname, adviser_name, adviser_birthday} = req.body;
  let newUser = {
    adviser_email,
    adviser_rut,
    adviser_phone,
    adviser_role,
    adviser_lastname,
    adviser_name,
    adviser_birthday,
    adviser_username,
    adviser_password
  };

  console.log(newUser);
  newUser.adviser_password = await helpers.encryptPassword(adviser_password);
  // Saving in the Database
  const result = await pool.query('INSERT INTO advisers SET ? ', newUser);
  newUser.id = result.insertId;
  return done(null, newUser);
  }
));

passport.serializeUser((advisers, done) => {
  console.log(advisers.id_adviser);
  if (advisers.id_adviser){
  done(null, advisers.id_adviser);}
  else{
    done(null, advisers.id);
  }
});

passport.deserializeUser(async (id_adviser, done) => {
  const rows = await pool.query('SELECT * FROM advisers WHERE id_adviser = ?', [id_adviser]);
  done(null, rows[0]);
});

