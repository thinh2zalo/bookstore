var express = require('express');
var bodyParser = require('body-parser');
var exphbs = require('express-handlebars');
var express_handlebars_sections = require('express-handlebars-sections');
var wnumb = require('wnumb');
var helpers = require('handlebars-helpers');
var array = helpers.array();
var formidable = require('express-formidable');
var path = require('path');
var ss=require('handlebars-dateformat');
var Handlebars = require('handlebars');
var HandlebarsIntl = require('handlebars-intl');


Handlebars.registerHelper('dateFormat', require('handlebars-dateformat'));


var handleLayoutMDW = require('./middle-wares/handleLayout'),
    handle404MDW = require('./middle-wares/handle404'),
    restrict = require('./middle-wares/restrict');

var SPController = require('./Controllers/SPController');
var HomeController = require('./Controllers/HomeController');
var ProductController = require('./Controllers/ProductController');
var accountController = require('./Controllers/accountController');
var categoryController = require('./Controllers/categoryController');
var cartController = require('./Controllers/cartController');
var managerController=require('./Controllers/managerController');
var SearchController = require('./Controllers/SearchController');


var app = express();
var session = require('express-session');
var MySQLStore = require('express-mysql-session')(session);

//session
var sessionStore = new MySQLStore({
    host: '35.240.217.54',
    port: 4242,
    user: 'root',
    password: '123123',
    database: 'thi-ga',
    timeout: 30, 
    createDatabaseTable: true,
    schema: {
        tableName: 'sessions',
        columnNames: {
            session_id: 'session_id',
            expires: 'expires',
            data: 'data'
        }
    }
});
app.use(session({
    key: 'session_cookie_name',
    secret: 'session_cookie_secret',
    store: sessionStore,
    resave: false,
    saveUninitialized: false
}));





app.engine('hbs', exphbs({
    defaultLayout: 'main',
    extname: 'hbs',
    layoutsDir: 'views/_layouts',
    helpers: {
        section: express_handlebars_sections(),
        number_format: n => {
            var nf = wnumb({
                thousand: '.'
            });
            return nf.to(n);
        }
    }
}));



app.set('view engine', 'hbs');
app.set('views', path.join(__dirname, "views"));
app.use(express.static(path.resolve(__dirname, 'public')));

// app.use(formidable());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: false
}));

app.use(handleLayoutMDW);

app.use('/sample_product', ProductController);
app.use('/SP', SPController);
app.use('/manager',managerController);
app.use('/account', accountController);
app.use('/cart', cartController);
app.use('/tim-kiem', categoryController);
app.use('/tim-voi-key', SearchController);
app.use('/', HomeController);

app.use(handle404MDW);

const port = process.env.PORT || 3000

app.listen(port, () => {
    console.log("Server is running on port: " + port);
});