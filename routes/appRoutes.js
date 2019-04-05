var Router= require('koa-router');
var bodyParser = require('koa-body')();

module.exports = function(app){

    var router = new Router();

    //Welcome Routes
    var welcomeCtrl = require('./../controllers/WelcomeCtrl');
    router.get('/home', welcomeCtrl.showHomePage);
    router.get('/aboutus',welcomeCtrl.showAboutusPage);
    router.get('/ourteam',welcomeCtrl.showOurteamPage);
    router.get('/contact',welcomeCtrl.showContactPage);
    router.get('/test',welcomeCtrl.showTestPage);

    router.get('/showcolleges', welcomeCtrl.showCollegesPage);
    router.get('/showorderedcolleges', welcomeCtrl.showOrderedCollegesPage);
    router.get('/compare/:id1/:id2', welcomeCtrl.showComparePage);
    router.get('/cdetail/:id', welcomeCtrl.showCDetailPage);
    router.get('/collegeform',welcomeCtrl.showCollegeFormPage);
    router.get('/collegeinfo', welcomeCtrl.putCollegeInfoPage);

    return router.middleware();
}
