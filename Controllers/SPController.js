/**
 * Created by tutrinh on 5/11/18.
 */
var express = require('express');
var SPRePo = require('../repos/SPRePo');

var router = express.Router();

router.get('/', (req, res) => {
    SPRePo.loadAll().then(rows => {
        var vm = {
            Book: rows,
            NhaSX: rows,
            Loai: rows
        };
        res.render('SP/index', vm);
    });
});


router.get('/add', (req, res) => {
    var vm = {
        showAlert: false
    };
    res.render('SP/add', vm);
});

router.post('/add', (req, res) => {
    SPRePo.add(req.body).then(value => {
        var vm = {
            showAlert: true
        };
        res.render('SP/add', vm);
    }).catch(err => {
        res.end('fail');
    });
});

router.get('/delete', (req, res) => {
var vm = {
    idSach: req.query.id
};
    res.render('SP/delete', vm);
});

router.post('/delete', (req, res) => {

    SPRePo.delete(req.body.idSach).then(value => {
        res.redirect('/SP');
    });
});

router.get('/edit', (req, res) => {
    SPRePo.single(req.query.id).then(c => {

        var vm = {
            Book: c,
            NhaSX: c,
            Loai: c

    };

        res.render('SP/edit', vm);
    });
});

router.post('/edit', (req, res) => {
    SPRePo.update(req.body).then(value => {
        res.redirect('/SP');
    });
});


module.exports = router;