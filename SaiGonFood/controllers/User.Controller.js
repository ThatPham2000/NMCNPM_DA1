const low = require("lowdb");
const FileSync = require("lowdb/adapters/FileSync");
const adapter = new FileSync("model/db.json");

db = low(adapter);

module.exports.login = async (req, res, next) => {
  const account = req.body.account;
  const password = req.body.pass;

  req.session.isAuth=false;
  
  const user = db.get('user').find({account: account}).value();
  console.log(user);
  req.session.authUser = user;

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
  req.session.isAuth=true;
  res.redirect('/index');
};

module.exports.register = async (req, res, next) => {
  if(req.body.account !== undefined && req.body.account !== null){
    await db.get("user").push(req.body).write();
    res.redirect("/users/login");
  }
    res.render("auth/register");
};

