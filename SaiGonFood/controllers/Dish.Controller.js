const low = require("lowdb");
const FileSync = require("lowdb/adapters/FileSync");
const adapter = new FileSync("model/db.json");
const moment = require('moment');

db = low(adapter);
// Set some defaults
db.defaults({ comment: [] }).write();

module.exports.dish = (req, res, next) => {
    const comment = db.get('comment').value();
    res.render("single-food", {
        rate: req.session.rating,
        num_rate: req.session.num_rating,
        comment
    });
};

module.exports.search = (req, res, next) => {
    // const name = escapeRegex(req.query.name);
    const name = req.query.name;
    const listDish = db.get('dish').value();
    let list = [];
    for (let i = 0; i < listDish.length; i++) {
        if (listDish[i].name === name) {
            list.push(listDish[i]);
        }
    }
    console.log(`list: ${list}`);
    if (list !== undefined) {
        res.render('restaurant', { list })
    } else {
        res.render('restaurant', {
            msg: 'Không tìm thấy sản phẩm nào'
        });
    }
}

module.exports.getAlldish = (req, res, next) => {
    const listDish = db.get('dish').value();
    res.render('restaurant', {
        listDish
    })
}
module.exports.rating = (req, res, next) => {
    if (req.session.isAuth === false) {
        res.render("auth/login", {
            error: 'Cần login để đánh giá'
        });
        return;
    }
    var star1 = (+req.body.star) * 1.0;
    req.session.num_rating += 1;
    const avgRate = (req.session.rating * (req.session.num_rating - 1) + star1) / (req.session.num_rating);
    req.session.rating = Math.round(avgRate * 100) / 100;
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
    const item = {
        account: name,
        day: moment().format('DD-MM-YYYY HH:mm:ss'),
        comment: req.body.comment,
    }
    db.get("comment").push(item).write();
    res.redirect('/single-food');
};

function escapeRegex(text) {
    return text.replace(/[-[\]{}()*+?.,\\^$|#\s]/g, "\\$&");
};