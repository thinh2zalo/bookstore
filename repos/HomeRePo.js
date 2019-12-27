var db = require('../fn/db');

exports.loadNewBook = () => {
    var sql = `select * from Book order by ngayNhapHang desc limit ${10} offset ${0}`;
    return db.load(sql);
}

exports.loadBestSale = () => {
    var sql = `select * from Book order by luotMua desc limit ${10} offset ${0}`;
    return db.load(sql);
}
exports.loadByViews = () => {
    var sql = `select * from Book order by luotXem desc limit ${10} offset ${0}`;
    return db.load(sql);
}
