var sessionUtils = require('../utils/sessionUtils');

module.exports = {
    showHomePage: function* (next) {
        /* add home page - that is put filter which I am using in showCollegesPage*/
        //todo - MANU
        console.log("home page");
        yield this.render('home',{
            data:"home page"
        });
    },
    showAboutusPage: function* (next) {
        // todo - PVR
        /*add aboutus page just put that page in to views folder*/
    yield this.render('aboutus',{
    });
    
    },
    
    showOurteamPage: function* (next) {
        // todo - PVR
        /*add ourteam page*/
    yield this.render('ourteam',{
    });
    
    },


    showCollegesPage: function* (next) {
        /* query perameter form get url */
        var loc = this.request.query.loc;
        var colltype = this.request.query.colltype;
        console.log(loc+" "+colltype);
        /* add a query to get list of colleges according to above perameters and return to listColleges file */
        //todo-RDX


        yield this.render('listColleges',{

        });
    },
    showCDetailPage: function* (next) {
        var collid=this.request.query.cid;
        console.log(collid);
        /* add a query to get Details of colleges return to listColleges page */
        //todo-RDX

        yield this.render('collegeDetail',{

        });
    },
    showCollegeFormPage:function* (next) {
        yield this.render('collegeDetailForm',{});
    },
    putCollegeInfoPage: function* (next) {
        var cname=this.request.body.cname;
        var clocation=this.request.body.clocation;
        console.log(cname+" "+clocation);
        /* add a query to insert college data in to database*/
        //todo - RDX
        console.log("data  insrted");
    },
    showTestPage:function* (next) {
        yield this.render('index',{

        });
    },
    showComparePage: function* (next) {
        yield this.render('home',{

        });
    },
   
}
