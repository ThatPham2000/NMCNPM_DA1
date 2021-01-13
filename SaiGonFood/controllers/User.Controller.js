const low = require("lowdb");
const FileSync = require("lowdb/adapters/FileSync");
const adapter = new FileSync("model/db.json");

db = low(adapter);

// Set some defaults
db.defaults({ user: [] }).write();

module.exports.login = (req, res, next) => {
  const account = req.body.account;
  const password = req.body.pass;

  const user = db.get('user').find({account: account}).value();

  if(!user){
    res.render("auth/login",{
      error: 'User does not exit'
    });
    return;
  }

  if(password !== user.pass){
    res.render("auth/login",{
      error: 'Wrong password'
    });
    return;
  }
  
  res.redirect('/index');
};

module.exports.register = (req, res, next) => {
  db.get("user").push(req.body).write();
  res.render("auth/register");
};