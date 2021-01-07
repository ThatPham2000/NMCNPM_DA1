module.exports.login = (req, res, next) => {
    res.render('login');
}

module.exports.logout = (req, res, next) => {
    res.redirect('/');
}