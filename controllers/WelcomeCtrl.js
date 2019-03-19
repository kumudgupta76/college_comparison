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


        // yield this.render('listColleges',{

        // });
    },
    showCDetailPage: function* (next) {
        var collid=this.request.query.cid;
        console.log(collid);
        /* add a query to get Details of colleges return to listColleges page */
        //todo-RDX

        yield this.render('collegeDetail',{

        });
    },
    putCollegeInfoPage: function* (next) {
        var cname=this.request.body.cname;
        var clocation=this.request.body.clocation;
        console.log(cname+" "+clocation);
        /* add a query to insert college data in to database*/
        //todo - RDX
        console.log("data  insrted");
    },
    showComparePage: function* (next) {
        yield this.render('home',{

        });
    },
    
    pass: function* (next) {
        var pws = this.request.body.psd;
        var emai = this.request.body.email;
        console.log(pws);

        console.log("------"+emai);
    var queryString = 'update user set password="%s" where user_email="%s"';
        var query = util.format(queryString,pws,emai);
        var results = yield databaseUtils.executeQuery(query);
        this.redirect("/app/home");
    },
    

    // showUserDetailPage: function* (next) {
    //     yield this.render('home',{

    //     });
    // },
    

    forgotpassword: function* (next) {
        var errorMessage;
        yield this.render('forgotPassword',{
            errorMessage:errorMessage
    
        });
    },
    checkotp: function* (next) {
        var email=this.request.body.email;
        var otp = this.request.body.otp;
            console.log(otp);
            console.log("+++++++++++++++++++++"+email);
            var queryString2= 'DELETE FROM otp WHERE time < (CURTIME() - INTERVAL 2 MINUTE)';
            var query1 = util.format(queryString2);
            var result2 = yield databaseUtils.executeQuery(query1);
        
        
        
        var queryString = 'select * from otp where otp = "%s"';
        var query = util.format(queryString,otp);
        var result = yield databaseUtils.executeQuery(query);
        var userDetails=result[0];
        var errorMessage;
        if(result.length == 0) {
        queryString = 'select * from user where user_email= "%s"';
        query = util.format(queryString,email);
        result = yield databaseUtils.executeQuery(query);
        var user=result[0];
          error = "wrong otp";
          //console.log(user);
          yield this.render('otp',{
          userDetail:user,
          errorMessage:error
           });
               }else {
        yield this.render('newpass',{
        userDetails:userDetails
        });
        
        }
    },
        
    logout: function* (next) {
        var sessionId = this.cookies.get("SESSION_ID");
        if(sessionId) {
            sessionUtils.deleteSession(sessionId);
        }
        this.cookies.set("SESSION_ID", '', {expires: new Date(1), path: '/'});

        this.redirect('/');
    }
}
