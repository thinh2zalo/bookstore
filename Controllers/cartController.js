/**
 * Created by tutrinh on 6/3/18.
 */
var express = require('express');
var cartRepo = require('../repos/cartRepo'),
    productRepo = require('../repos/ProductRepo'),
    payRepo = require('../repos/payRepo'),
    accountRepo = require('../repos/accountRepo');
    dateFormat = require('handlebars-dateformat');

var router = express.Router();
router.get('/', (req, res) => {
    if (req.session.user) {
        accountRepo.getCus(req.session.user.idNguoiSuDung).then(rows => {
            var vm = {
                items: req.session.cart,
                total: cartRepo.getTotal(req.session.cart),
                isEmpty: req.session.cart.length === 0,
                diaChi: rows[0].diaChi,
                SDT: rows[0].soDT,
                url:"/cart"
            };
            res.render('cart/index', vm);
        });
    } else {
        var vm = {
            items: req.session.cart,
            total: cartRepo.getTotal(req.session.cart),
            isEmpty: req.session.cart.length === 0,
            url:"/cart"
            
        };
        res.render('cart/index', vm);
    }

});

router.post('/', (req, res) => {
    cartRepo.remove(req.session.cart, req.body.idSach);
    res.redirect('/cart');

});
router.post('/sl', (req, res) => {
    cartRepo.updateSL(req.session.cart, req.body.idSach, req.body.sl);
    res.redirect('/cart');
});

router.post('/add', (req, res) => {
    productRepo.loadDetail(req.body.idSach).then(rows => {
        var item = {
            idSach: req.body.idSach,
            ten_sach: rows[0].ten_sach,
            giaBan: rows[0].giaBan,
            hinh: rows[0].hinhAnh,
            sl: +req.body.sl,
            amount: rows[0].giaBan * +req.body.sl
        };
        cartRepo.add(req.session.cart, item);

        // res.redirect('/sample_product/?id=' + req.body.idSach);
        res.redirect(req.session.reUrl);
    });
});
router.post('/tt', (req, res) => {
    if (req.session.isLogged) {
        // var date = new Date().toLocaleString().slice(0, 19).replace('T', ' ');
        var d = new Date();
        // var date = new Date().getTime();

        var  dd=d.getDate();
        var  yyyy=d.getFullYear();
        var  h=d.getHours();
        var  m=d.getMinutes();
        var  mm=d.getMonth();
        var  s=d.getSeconds();
        var cart = req.session.cart;
        if (cart.length === 0) {
            vm = {
                ErrMsg: true,
                Msg: "Không có sản phẩm trong giỏ hàng"
            }
            res.render('cart/index', vm);
            return;
        }

        for (i = cart.length - 1; i >= 0; i--) {
            var soluong = parseInt(cart[i].sl);
            payRepo.getBook(cart[i].idSach).then(rows => {
                if (parseInt(rows[0].soLuong) < soluong) {
                    res.redirect('/cart')
                    return;
                }
            });
        }
        var idGioHang;
        payRepo.addCart(cartRepo.getTotal(req.session.cart)).then(value => {
            idGioHang = value.insertId;
            for (i = cart.length - 1; i >= 0; i--) {

                payRepo.addPToCart(cart[i].idSach, cart[i].sl, idGioHang);
                var sl = parseInt(cart[i].sl);
                payRepo.getBook(cart[i].idSach).then(row => {
                    var slUpdate = parseInt(row[0].soLuong) - sl;
                    var lmUpdate = parseInt(row[0].luotMua) + 1;
                    payRepo.updateSLBook(row[0].idSach, lmUpdate, slUpdate);
                });
                if (i == 0) {
                    accountRepo.getCus(req.session.user.idNguoiSuDung).then(use => {
                        payRepo.addPayment(idGioHang, use[0].idKhachHang, use[0].diaChi, yyyy+ '-' + mm +'-'+dd+' '+h+':'+m+':'+s, use[0].soDT).then(value => {
                            req.session.cart = [];
                            res.redirect('/account/profile');
                        });
                    });

                }
            }
        });
    }else{
        res.redirect('/account/login?retUrl=/cart');
    }
});




router.post('/remove', (req, res) => {
    cartRepo.remove(req.session.cart, req.body.ProId);
    res.redirect(req.headers.referer);
});

module.exports = router;