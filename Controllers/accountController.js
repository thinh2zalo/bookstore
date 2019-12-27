var express = require('express');
var SHA256 = require('crypto-js/sha256');
var moment = require('moment');
var format = require('date-format');
var accountRepo = require('../repos/accountRepo');
var payRepo = require('../repos/payRepo');
var restrict = require('../middle-wares/restrict');
var Recaptcha = require('express-recaptcha').Recaptcha;
var recaptcha = new Recaptcha('6LdoIGEUAAAAADW83_JdZknEjFYPl7bLmJD_YVzo', '6LdoIGEUAAAAANFjdBJxqiedi0D8wd3FtVWxCJUN');
var nodemailer =  require('nodemailer'); // khai báo sử dụng module nodemailer
var transporter =  nodemailer.createTransport({ // config mail server
    service: 'Gmail',
    auth: {
        user: 'suncena97@gmail.com',
        pass: 'tutrinhtt'
    }
});
var router = express.Router();

router.get('/register', (req, res) => {
    res.render('account/dang-ki');
});

router.post('/register', (req, res) => {
    var user = {
        username: req.body.username,
        password: SHA256(req.body.pass).toString(),
        name: req.body.fullname,
        address: req.body.address,
        phonenumber: req.body.phone,
        email: req.body.email,
        permission: 0,
    };

    accountRepo.check(user).then(rows => {
        if (rows.length > 0) {
            var vm = {
                showError: true,
                errorMsg: 'Đã tồn tại tài khoản này'
            };
            res.render('account/dang-ki', vm);
        } else {
            var idCustomer;
            accountRepo.addCustomer(user).then(value => {
                var mainOptions = { // thiết lập đối tượng, nội dung gửi mail
                    from: 'admin of website auction',
                     to: user.email,
                    // to: 'ttttrinh132@gmail.com',
                    subject: 'Đăng ký tài khoản BookStore Online thành công!',
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
                idCustomer = value.insertId;
                accountRepo.addUser(user, idCustomer).then(value => {
                    var vm = {
                        Success: true,
                        Msg: 'Đăng kí thành công'
                    };
                    res.redirect('/account/login');
                });
            });
        }
    });

});

router.get('/login', (req, res) => {
    res.render('account/dang-nhap');
});

router.post('/login', (req, res) => {
    var user = {
        username: req.body.username,
        password: SHA256(req.body.pass).toString()
    };
    accountRepo.login(user).then(rows => {
        if (rows.length > 0) {
            req.session.isLogged = true;
            req.session.user = rows[0];
            req.session.Authorized = rows[0].loaiNguoiDung;
            if (rows[0].loaiNguoiDung === 0) {
                var url = '/';
                if (req.query.retUrl) {
                    url = req.query.retUrl;
                }
                res.redirect(url);
            } else {
                res.redirect('../manager/dashboard');
            }


        } else {

            var vm = {
                showError: true,
                errorMsg: 'Tên hoặc mật khẩu không đúng.',
            };
            res.render('account/dang-nhap', vm);
        }
    });
});

router.get('/profile', restrict, (req, res) => {
    var idCus = req.session.user.idNguoiSuDung;

    var p1 = payRepo.getPayment(idCus);
    var p2 = accountRepo.getCus(idCus);

    Promise.all([p1, p2]).then(([pay, account]) => {
        var vm = {
            donHang: pay,
            name: account[0].hoTen,
            diachi: account[0].diaChi,
            sdt: account[0].soDT,
        }
        res.render('account/profile', vm);

    });
});

router.get('/order', restrict, (req, res) => {
    var idDonHang = req.query.id;
    payRepo.getDH(idDonHang).then(rows => {
        var p1 = payRepo.getDatSP(rows[0].idGioHang);
        var p2 = accountRepo.getCus(req.session.user.idNguoiSuDung);

        Promise.all([p1, p2]).then(([rows2, account]) => {
            var vm = {
                name: account[0].hoTen,
                donhang: rows[0],
                sanpham: rows2
            }
            res.render('account/chi-tiet-dh', vm);

        });

    });
});

router.get('/edit-info', restrict, (req, res) => {
    var idCus = req.session.user.idNguoiSuDung;
    accountRepo.getCus(idCus).then(rows => {
        var vm = {
            name: rows[0].hoTen,
            diachi: rows[0].diaChi,
            sdt: rows[0].soDT
        }
        res.render('account/sua-tt', vm);
    });
});
router.post('/edit-info', (req, res) => {
    var user = {
        hoten: req.body.name,
        sdt: req.body.phonenumber,
        diachi: req.body.address,
        idCus: req.session.user.idNguoiSuDung
    };
    var p1 = accountRepo.updateNameCus(user);
    var p2 = accountRepo.updatePhoneCus(user);
    var p3 = accountRepo.updateAddressCus(user);

    Promise.all([p1, p2, p3]).then(([value1, value2, value3]) => {
        res.redirect('edit-info');
    });
});

router.post('/logout', (req, res) => {
    req.session.isLogged = false;
    req.session.user = null;
    req.session.Authorized = 0;
    req.session.cart = [];
    res.redirect(req.headers.referer);
});

router.get('/doiMK',(req,res)=>{
    res.render('account/doi-mk');
});
router.post('/doiMK',(req,res)=>{
    var user = {
        username: req.session.user.userName,
        password: SHA256(req.body.mkcu).toString()
    };
    accountRepo.login(user).then(rows => {
        if (rows.length > 0) {
            accountRepo.updatePass(req.session.user.userName,SHA256(req.body.mkmoi1));
            var vm = {
                showMsg: true,
                Msg: 'Cập nhật mật khẩu thành công',
            };
            res.render('account/doi-mk', vm);
        } else {
            var vm = {
                showError: true,
                errorMsg: 'Mật khẩu cũ không đúng.',
            };
            res.render('account/doi-mk', vm);
        }
    });
    
});

module.exports = router;