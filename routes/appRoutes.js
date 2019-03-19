var Router= require('koa-router');
var bodyParser = require('koa-body')();

module.exports = function(app){

    var router = new Router();

    //Welcome Routes
    var welcomeCtrl = require('./../controllers/WelcomeCtrl');
    router.get('/home', welcomeCtrl.showHomePage);
    router.get('/aboutus',welcomeCtrl.showAboutusPage);
    router.get('/ourteam',welcomeCtrl.showOurteamPage);

    router.get('/showcolleges', welcomeCtrl.showCollegesPage);
    router.get('/compare/:id1/:id2', welcomeCtrl.showComparePage);
    router.get('/cdetail/:id', welcomeCtrl.showCDetailPage);
    router.post('/collegeinfo', welcomeCtrl.putCollegeInfoPage);

    // var userCtrl = require('./../controllers/userCtrl');
    // router.get('/userprofile/:id', userCtrl.showUserProfilPage);
    // router.post('/login',userCtrl.login);
    // router.post('/changepassword',userCtrl.changepassword);
    // router.post('/editprofile',userCtrl.editprofile);

    // var verify= require('./../controllers/varifyCtrl');
    // router.get('/forgotpass',welcomeCtrl.forgotpassword);
    // router.post('/send',verify.sendotp);
    // router.post('/newpass',welcomeCtrl.checkotp);
    // router.post('/reset',welcomeCtrl.pass);
    return router.middleware();
}
