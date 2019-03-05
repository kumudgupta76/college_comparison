var sessionUtils = require('../utils/sessionUtils');

module.exports = {
    showHomePage: function* (next) {
        console.log("home page");
        yield this.render('home',{
            data:"home page"
        });
    },
    showAboutusPage: function* (next) {
    yield this.render('aboutus',{
    });
    
    },
    
    showOurteamPage: function* (next) {
    yield this.render('ourteam',{
    });
    
    },


    showCollegesPage: function* (next) {
        yield this.render('home',{

        });
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
    showCDetailPage: function* (next) {
        yield this.render('home',{

        });
    },
    showUserDetailPage: function* (next) {
        yield this.render('home',{

        });
    },
    putCollegeInfoPage: function* (next) {
        yield this.render('home',{

        });
    },


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
