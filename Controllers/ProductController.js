var express = require('express');
var ProductRePo = require('../repos/ProductRePo');

var app = express();
var router = express.Router();

router.get('/', (req, res) => {
    ProductRePo.searchById(req.query.id).then(rows => {
        var lx=parseInt(rows[0].luotXem)+1;
        var p1= ProductRePo.loadByPD(rows[0].idLoai);
        var p2=ProductRePo.loadNhaSX(rows[0].idNhaSX,rows[0].idSach);
        var p3=ProductRePo.loadTheLoai(rows[0].idLoai,rows[0].idSach);
        var p4=ProductRePo.updateLX(rows[0].idSach,lx);
        Promise.all([p1, p2,p3,p4]).then(([kind, products,Theloai,lx]) => {
        req.session.reUrl = "/sample_product?id="+req.query.id
            var vm={
                products: rows,
                kind:kind,
                loai:Theloai,
                nxb:products,
                tl:Theloai[0],
                url:"/sample_product?id="+req.query.id
            }
            res.render('sample_product', vm);
        }).catch(err => {
            console.error(err);
        });
    }).catch(err => {
        console.log(err);
    });
});



module.exports = router;