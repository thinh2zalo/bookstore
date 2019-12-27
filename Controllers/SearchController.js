/**
 * Created by tutrinh on 6/23/18.
 */

var express = require('express');
var categoryRepo = require('../repos/categoryRepo');
var helpers = require('handlebars-helpers')();

var router = express.Router();

var p1 = categoryRepo.loadAllLoai();
var p2 = categoryRepo.loadAllBook();
var p4 = categoryRepo.loadAllPD();



router.get('/', (req, res) => {
    var p3 = categoryRepo.search_with_keyword(req.query.keyword, req.query.selectDanhMuc);
    Promise.all([p1, p3, p4]).then(([rowloais, rowBooks, rowNhaSXs]) => {
        var vm = {
            loai: rowloais,
            book: rowBooks,
            NhaSX: rowNhaSXs,
            keyword: req.query.keyword,
            url : "/tim-voi-key?selectDanhMuc=" + req.query.selectDanhMuc + "&keyword=" + req.query.keyword
     
        };
        req.session.reUrl = "/tim-voi-key?selectDanhMuc=" + req.query.selectDanhMuc + "&keyword=" + req.query.keyword;
        res.render('search/tim-theo-loai', vm);
    });

});

module.exports = router;