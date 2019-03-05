var nodemailer = require('nodemailer');
var databaseUtils = require('./../utils/databaseUtils');
var redisUtils = require('./../utils/redisUtils');
var util = require('util');
var sessionUtils = require('./../utils/sessionUtils');
var Constants = require('./../constants');
var config = require('./../config');



module.exports = {

sendotp: function* (next){
var email= this.request.body.email;
var rand=Math.floor((Math.random() * 1000000) + 54);
console.log("---------"+email);
var queryString = 'select * from user where user_email= "%s"';
var query = util.format(queryString,email);
var result = yield databaseUtils.executeQuery(query);
var userDetail=result[0];
var errorMessage;
console.log(userDetail);
if(result.length == 0) {
    errorMessage = "Email is not registered";
    yield this.render('forgotPassword',{
      errorMessage:errorMessage

  });

}
else {
console.log("start1");
var transporter = nodemailer.createTransport({


  service: 'gmail',
  auth: {
    user: 'reviewit.projectorclub@gmail.com',
    pass: 'scanqrcode'
  }
});
console.log("start3");
var mailOptions = {


  from: 'reviewit.projectorclub@gmail.com',
  to: email,
  subject: 'account recovery',
  text: 'your code is '+rand,
};
console.log("start5");
transporter.sendMail(mailOptions, function(error, info){
  if (error) {
    console.log("start6");
    console.log(error);
  } else {
    console.log(rand);
    console.log('Email sent: ' + info.response);
  }
});

var queryString1 = 'insert into otp(email,otp,time) values("%s","%s",now())';
var query1 = util.format(queryString1,email,rand);
var result1 = yield databaseUtils.executeQuery(query1);
//var queryString2= 'DELETE FROM otp WHERE dt < (CURTIME() - INTERVAL 2 MINUTE)';
//var query1 = util.format(queryString);
//var result2 = yield databaseUtils.executeQuery(query1);
    yield this.render('otp',{
userDetail : userDetail,
errorMessage : errorMessage
    });
}
}
}