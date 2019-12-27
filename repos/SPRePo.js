/**
 * Created by tutrinh on 5/11/18.
 */
var db = require('../fn/db');

exports.loadAll = () => {
    var sql = 'select * from Book,NhaSX,Loai where Book.idNhaSX=NhaSX.idNhaSX and Book.idLoai=Loai.idLoai';
    return db.load(sql);
}
exports.single = (id) => {
    var sql = `SELECT* 
    FROM Book
    INNER JOIN NhaSX ON Book.idNhaSX=NhaSX.idNhaSX
    INNER JOIN Loai ON Book.idLoai=Loai.idLoai
    WHERE Book.idSach='${id}'`
    return db.load(sql);
};


exports.add = (c) => {
    var sql = `insert into Book(ten_sach,tac_gia,giaBan,idNhaSX,idLoai,sl) values('${c.ten_sach}','${c.tac_gia}','${c.giaBan}','${c.idNhaSX}','${c.idLoai}','${c.sl}')`;
    return db.save(sql);
};

exports.delete = (id) => {
    var sql = `delete from Book where idSach = ${id}`;
    return db.save(sql);
};

exports.update = (c) => {
    var sql = `update Book set tac_gia = '${c.tacGia}',
                                    ten_sach = '${c.tenSach}',
    								giaBan ='${c.giaBan}' ,
    								idNhaSX = '${c.idNXB}',
    								idLoai = '${c.idLoai}',
                                    moTa='${c.moTa}',
                                    soLuong='${c.soLuong}'
    								 where idSach = ${c.idSach}`;
    // console.log(sql);
    return db.save(sql);
};
exports.updateHinhAnh = (id, hinh) => {
    var sql = `update Book set hinhAnh = 'img/book/${hinh}'
                                     where idSach = ${id}`;
    return db.save(sql);
};


