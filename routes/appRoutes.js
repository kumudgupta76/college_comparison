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

    return router.middleware();
}
