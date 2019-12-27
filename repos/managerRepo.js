var db = require('../fn/db');

exports.loadAcount = () => {
    var sql = `SELECT * 
    FROM NguoiDung INNER JOIN KhachHang ON NguoiDung.idNguoiSuDung=KhachHang.idKhachHang `;
    return db.load(sql);
}
exports.UpdatepassAcount = (username, Pass) => {
    var sql = `UPDATE NguoiDung SET pass='${Pass}' WHERE userName = '${username}'`;
    return db.save(sql);
}
