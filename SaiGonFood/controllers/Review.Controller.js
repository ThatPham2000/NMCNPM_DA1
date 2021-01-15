const low = require("lowdb");
const FileSync = require("lowdb/adapters/FileSync");
const adapter = new FileSync("model/db.json");
const multer = require('multer');

db = low(adapter);

// Set some defaults
db.defaults({ review: [] }).write();



module.exports.getreview = (req, res, next) => {
  res.render("review/formReview");
};

module.exports.postreview = (req, res, next) => {
    const storage = multer.diskStorage({
        destination: function (req, file, cb){
          cb(null,'./public/images/')
        },
        filename: function (req, file, cb){
          cb(null,file.originalname)
        }
      })
    const upload = multer({storage});
    
    upload.single('fuMain')(req,res,function (err){
        if(err){
          redirect('blog');
        }else {
          const infor = {
            typefood: req.body.typefood,
            address: req.body.address,
            image: res.req.file.filename,
            content: req.body.content,
          };
            db.get("review").push(infor).write();
            res.redirect('/blog');
        }
      })
};