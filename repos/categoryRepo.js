/**
 * Created by tutrinh on 6/2/18.
 */
var db = require('../fn/db');

exports.loadAll = () => {
    var sql = `select * from Categories`;
    return db.load(sql);

};
exports.loadAllLoai = () => {
    var sql = `select * from Loai`;
    return db.load(sql);

};

// load Book cung loai & nsx (detail Book)
exports.loadAllBook = () => {
    var sql = `select * from Book`;
    return db.load(sql);

};
exports.loadAllBook_arr = () => {
    var sql = `select * from Book`;
    return db.load(sql);

};
exports.loadAllKind = () => {
    var sql = 'select * from Loai';
    return db.load(sql);
};
exports.loadAllPD = () => {
    var sql = 'select * from NhaSX';
    return db.load(sql);
};

//show data vs loai & nsx
exports.load_by_idLoai = (id) => {
    var sql = `Select* from Book where idLoai = ${id}`;
    return db.load(sql);
}
exports.load_by_idNhaSX = (id) => {
    var sql = `Select* from Book where idNhaSX = ${id}`;
    return db.load(sql);
}

//tim kiem vs key word
exports.search_with_keyword = (keyword,idMuc) => {
if(idMuc==2)
{
    var sql = `Select * from Book where ten_sach like '%${keyword}%'`;

}
else if(idMuc==3)
{
    var sql = `Select * from Book where tac_gia like '%${keyword}%'`;

}
else if(idMuc==4){
    var sql = `Select * from Book,NhaSX where Book.idNhaSX=NhaSX.idNhaSX and tenNhaSX like '%${keyword}%'`;

}
else {
    var sql = `Select distinct idSach,ten_sach, giaBan,hinhAnh,tac_gia from Book,NhaSX where Book.idNhaSX=NhaSX.idNhaSX and tenNhaSX like '%${keyword}%' or
    ten_sach like '%${keyword}%' or tac_gia like '%${keyword}%'`;

}
    return db.load(sql);
}
exports.search_with_price = (giadau,giacuoi) => {

    var sql = `Select * from Book where giaBan>='${giadau}' and giaBan<='${giacuoi}'`;
    return db.load(sql);
}
exports.updateLoai = (idLoai,tenLoai)=>{
    var sql=`UPDATE loai SET tenLoai='${tenLoai}' WHERE idLoai = '${idLoai}'`;
    return db.save(sql);
};
exports.deleteLoai=(idLoai)=>{
	var sql = `delete from loai where idLoai = ${idLoai}`;
    return db.save(sql);
};
exports.addLoai=(tenLoai)=>{
    var sql = `insert into Loai(tenLoai) values('${tenLoai}')`;
    return db.save(sql);

};
exports.updateNXB = (idNXB,tenNXB)=>{
    var sql=`UPDATE NhaSX SET tenNhaSX='${tenNXB}' WHERE idNhaSX = '${idNXB}'`;
    return db.save(sql);
};
exports.addNXB=(tenNXB)=>{
    var sql = `insert into NhaSX(tenNhaSX) values('${tenNXB}')`;
    return db.save(sql);

};

exports.addNewBook=(Book)=>{
    var sql=`insert into Book(ngayNhapHang, luotMua, luotXem,idNhaSX,hinhAnh,moTa,idLoai,giaBan,ten_sach,tac_gia,soLuong) values('${Book.ngayNhap}', '0', '0','${Book.idNXB}','img/Book/${Book.hinhAnh}','${Book.moTa}','${Book.idLoai}','${Book.giaBan}','${Book.tenSach}','${Book.tacGia}','${Book.soLuong}')`;
    return db.save(sql);
};
exports.loadNXB=(idNXB)=>{
    var sql=`Select * from NhaSX where idNhaSX='${idNXB}'`;
    return db.load(sql);
};
exports.loadL=(idLoai)=>{
    var sql=`Select * from Loai  where idLoai='${idLoai}'`;
    return db.load(sql);
};