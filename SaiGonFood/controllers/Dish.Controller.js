const low = require("lowdb");
const FileSync = require("lowdb/adapters/FileSync");
const adapter = new FileSync("model/db.json");
const moment = require('moment');

db = low(adapter);
// Set some defaults
db.defaults({ comment: [] }).write();

module.exports.dish = (req, res, next) => {
  const comment = db.get('comment').value();
  const rating = db.get('rate').value();
  res.render("single-food", {
    rate: rating[0].rate,
    num_rate:rating[0].num_rate,
    comment
  });
};
module.exports.rating = (req, res, next) => {
  // if (req.session.isAuth === false) {
  //   res.render("auth/login", {
  //     error: 'Cần login để đánh giá'
  //   });
  //   return;
  // }
  const rating = db.get('rate').value();
  var star1 = (+req.body.star) * 1.0;
  rating[0].num_rate += 1;
  const avgRate = (rating[0].rate * (rating[0].num_rate - 1) + star1) / (rating[0].num_rate);
  rating[0].rate = Math.round(avgRate * 100) / 100;
  db.get('rate').find({ id: "rate" }).assign({rate: rating[0].rate }).value();
  db.get('rate').find({ id: "rate" }).assign({num_rate: rating[0].num_rate }).value();
  res.redirect('/single-food');
};

module.exports.comment = (req, res, next) => {
  if (req.session.isAuth === false) {
    res.render("auth/login", {
      error: 'Cần login để bình luận'
    });
    return;
  }
  const name = req.session.authUser.account;
  const item={
    account:name,
    day: moment().format('DD-MM-YYYY HH:mm:ss'),
    comment:req.body.comment,
  }
  db.get("comment").push(item).write();
  res.redirect('/single-food');
};