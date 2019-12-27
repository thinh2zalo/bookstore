var db = require('../fn/db');

exports.searchById = (id) => {
    var sql = `Select* from Book
     INNER JOIN NhaSX ON Book.idNhaSX=NhaSX.idNhaSX
     INNER JOIN Loai ON Book.idLoai=Loai.idLoai
    where idSach = ${id}`;
    return db.load(sql);
}
exports.loadByViews = () => {
    var sql = `select * from Book order by luotXem desc limit ${10} offset ${0}`;
    return db.load(sql);
}
exports.single = idSach => {
    var sql = `select * from Book where idSach = ${idSach}`;
    return db.load(sql);
}
exports.loadDetail = (idSach)=> {

    var sql = `Select* from Book where idSach = ${idSach}`;

    return db.load(sql);

}

exports.loadByKind = (idTheLoai) => {
    var sql = `select * from Book where idLoai="${idTheLoai}" order by luotXem desc limit ${10} offset ${0}`;
    return db.load(sql);
}
exports.loadByPD = (idNXB) => {
    var sql = `select * from Book where idNhaSX="${idNXB}" order by luotXem desc limit ${10} offset ${0}`;
    return db.load(sql);
}


exports.loadTheLoai = (idTheLoai,idSach) => {
    var sql= `select * from Book where idLoai='${idTheLoai}' and idSach!='${idSach}'`;
    return db.load(sql);
}
exports.loadNhaSX = (idNXB,idSach) => {
    var sql= `select * from Book where idNhaSX='${idNXB}' and idSach!='${idSach}'`;
    return db.load(sql);
}
exports.updateLX=(idSach,lx)=>{
    var sql=`update Book set luotXem = '${lx}'
     where idSach = ${idSach}`
     return db.save(sql);
};
