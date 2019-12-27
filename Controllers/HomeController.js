var express = require('express');
var HomeRePo = require('../repos/HomeRePo');
var categoryRepo = require('../repos/categoryRepo');

var app = express();
var router = express.Router();

var p1 = HomeRePo.loadNewBook();
var p2 = HomeRePo.loadBestSale();
var p3 = HomeRePo.loadByViews();
var nodemailer =  require('nodemailer'); // khai báo sử dụng module nodemailer

var transporter =  nodemailer.createTransport({ // config mail server
    service: 'Gmail',
    auth: {
        user: 'suncena97@gmail.com',
        pass: 'tutrinhtt'
    }
});



router.get('/', (req, res) => {
    console.log("here")
    Promise.all([p1, p2, p3]).then(([newB, bestS, Views]) => {
        req.session.reUrl = "/"
        var vm = {
            newBook: newB,
            bestSaleBook: bestS,
            byViews: Views,
            url:"/"
        };
        res.render('index', vm);
    }).catch(err => {
        console.log(err);
    })
});
router.post('/email',(req,res)=>{

    var mainOptions = { // thiết lập đối tượng, nội dung gửi mail
        from: 'admin of website auction',
        to: req.body.email,
        // to: 'ttttrinh132@gmail.com',
        subject: 'Bạn đã đăng kí nhận bản tin BookStore Online thành công!',
        text: 'You recieved message from ',
        html: '<p>Chúc mừng bạn đăng ký thành công</p>'
    }

    transporter.sendMail(mainOptions, function(err, info){
        if (err) {
            console.log("err: "+err);
        } else {
            console.log('Message sent: ' +  info.response);
        }
    });
    res.redirect('/');
});


module.exports = router;