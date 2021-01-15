const low = require("lowdb");
const FileSync = require("lowdb/adapters/FileSync");
const adapter = new FileSync("model/db.json");

db = low(adapter);
// Set some defaults
db.defaults({ user: [] }).write();
module.exports.dish = (req, res, next) => {
      res.render("single-food",{
        rate:req.session.rating,
        num_rate:req.session.num_rating,
      });
  };
  module.exports.rating = (req, res, next) => {
    if(req.session.isAuth===false)
    {
      res.render("auth/login",{
        error: 'Cần login để đánh giá'
      });
      return;
    }
    var star1 = (+req.body.star)*1.0;
    req.session.num_rating+=1;
  const avgRate = (req.session.rating*(req.session.num_rating-1) + star1)/(req.session.num_rating);
  req.session.rating=Math.round(avgRate * 100) / 100  ;
    res.redirect('/single-food');
  };