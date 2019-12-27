/**
 * Created by tutrinh on 5/11/18.
 */

var mysql = require('mysql');

exports.load = sql => {
    return new Promise((resolve, reject) => {
            var cn = mysql.createConnection({
                host: '35.240.217.54',
                port: 4242,
                user: 'root',
                password: '123123',
                database: 'thi-ga',
                timeout: 30
            });

    cn.connect();

    cn.query(sql, function(error, rows, fields) {
        if (error) {
            reject(error);
        } else {
            resolve(rows);
        }

        cn.end();
    });
});
}

exports.save = sql => {
    return new Promise((resolve, reject) => {
            var cn = mysql.createConnection({
                host: '35.240.217.54',
                port: 4242,
                user: 'root',
                password: '123123',
                database: 'thi-ga',
                timeout: 30
            });

    cn.connect();

    cn.query(sql, function(error, value) {
        if (error) {
            reject(error);
        } else {
            resolve(value);
        }

        cn.end();
    });
});
}