/**
 * Created by tutrinh on 6/2/18.
 */
var express = require('express');
var categoryRepo = require('../repos/categoryRepo');
var helpers = require('handlebars-helpers')();
var products= require('../repos/ProductRePo');

var router = express.Router();

var p1 = categoryRepo.loadAllLoai();
var p2 = categoryRepo.loadAllBook();
var p4 = categoryRepo.loadAllPD();


router.get('/', (req, res) => {
    Promise.all([p1, p2,p4]).then(([rowloais, rowBooks,rowNhaSXs]) => {
        req.session.reUrl = "/tim-kiem";                
        var vm = {
            url:"/tim-kiem",
            loai: rowloais,
            book:rowBooks,
            NhaSX:rowNhaSXs
        };
        res.render('search/tim-kiem', vm);
    });
});

router.get('/theo-loai/', (req, res) => {
    var p3 =categoryRepo.load_by_idLoai(req.query.id);
    var p5= categoryRepo.loadL(req.query.id);
    Promise.all([p1, p3,p4,p5]).then(([rowloais, rowBooks,rowNhaSXs,loaifull]) => {
        req.session.reUrl = "/tim-kiem/theo-loai/?id="+req.query.id;
        var vm = {
            loai: rowloais,
            book:rowBooks,
            NhaSX:rowNhaSXs,
            loaifull:loaifull[0],
            url : "/tim-kiem/theo-loai/?id="+req.query.id

        };
        res.render('search/tim-theo-loai', vm);
    });

});
router.get('/theo-NhaSX/', (req, res) => {
    var p3 =categoryRepo.load_by_idNhaSX(req.query.id);

    var p5=categoryRepo.loadNXB(req.query.id);
    Promise.all([p1, p3,p4,p5]).then(([rowloais, rowBooks,rowNhaSXs,tenNXB]) => {
        req.session.reUrl = "/tim-kiem/theo-NhaSX/?id="+req.query.id;
        var vm = {
            loai: rowloais,
            book:rowBooks,
            NhaSX:rowNhaSXs,
            tenNXB:tenNXB[0],
            url : "/tim-kiem/theo-NhaSX/?id="+req.query.id
        };
        res.render('search/theo-nhasx', vm);
    });

});

router.get('/theo-gia/', (req, res) => {
    var p3 = categoryRepo.search_with_price(req.query.giadau,req.query.giacuoi);
    Promise.all([p1, p3,p4]).then(([rowloais, rowBooks,rowNhaSXs]) => {
        req.session.reUrl = "/tim-kiem/theo-gia/?giadau=" + req.query.giadau + "&giacuoi=" + req.query.giacuoi;
        var vm = {
            loai: rowloais,
            book:rowBooks,
            NhaSX:rowNhaSXs,
            keyword: req.query.giadau,
            keyword2: req.query.giacuoi,
            url : "/tim-kiem/theo-gia/?giadau=" + req.query.giadau + "&giacuoi=" + req.query.giacuoi
        };
        // console(rowloais)

        res.render('search/tim-theo-loai', vm);
    });

});
module.exports = router;