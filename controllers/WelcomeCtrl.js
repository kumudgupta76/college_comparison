var sessionUtils = require('../utils/sessionUtils');
var util = require('util');
var databaseUtils = require('../utils/databaseUtils');
module.exports = {
    showHomePage: function* (next) {
        /* add home page - that is put filter which I am using in showCollegesPage*/
        //todo - MANU
        console.log("home page");
        yield this.render('home', {
            data: "home page"
        });
    },
    showAboutusPage: function* (next) {
        // todo - PVR
        /*add aboutus page just put that page in to views folder*/
        yield this.render('aboutus', {
        });

    },

    showOurteamPage: function* (next) {
        // todo - PVR
        /*add ourteam page*/
        yield this.render('ourteam', {
        });

    },
    showContactPage: function* (next) {
        // todo - PVR
        /*add ourteam page*/
        yield this.render('contact', {
        });

    },

    showCollegesPage: function* (next) {
        /* query perameter form get url */
        var loc = this.request.query.loc;
        var colltype = this.request.query.colltype;
        console.log(loc + " " + colltype);
        /* add a query to get list of colleges according to above perameters and return to listColleges file */
        //todo-RDX
        var list = 'select * from college_details where city="%s" and type_id="%s"';
        var list1 = util.format(list, loc, colltype);

        var result1 = yield databaseUtils.executeQuery(list1);
        yield this.render('listcolleges', {
            listcollege: result1,
            loc: loc,
            colltype: colltype
        });
    },
    showOrderedCollegesPage: function* (next) {
        /* query perameter form get url */
        var feek1 = this.request.query.fee;
        var bfhm = this.request.query.bfhm;
        var bhfacility = this.request.query.bhfacility;
        var infra = this.request.query.infra;
        var placements = this.request.query.placements;
        var discipline = this.request.query.discipline;
        var clubs = this.request.query.clubs;
        var userreview = this.request.query.userreview;
        var affiliations = this.request.query.affiliations;
        var curricullum = this.request.query.curricullum;
        var avgduration = this.request.query.avgduration;
        var collegesurroundings = this.request.query.collegesurroundings;
        var loc = this.request.query.loc;
        var colltype = this.request.query.colltype;
        console.log(loc + " ** " + colltype);
        var fee1 = "";

        var list = 'select * from college_details where city="%s" and type_id="%s"';
        var list1 = util.format(list, loc, colltype);
        var result1 = yield databaseUtils.executeQuery(list1);
        var sortedArray = [];

        var rows = [];
        var akm;
        for (var i in result1) {
            akm = result1[i].id;
            console.log(akm);
            var taken = 'select * from cfw where college_id="%s"';
            var taken1 = util.format(taken, akm);
            var result2 = yield databaseUtils.executeQuery(taken1);
            console.log("here goes result2\n");
            console.log(result2[0]);
            rows.push(result2[0]);
        }
        console.log(rows);
        for (var i in rows) {
            console.log("manu" + userreview);
        }
        console.log(loc + " " + colltype);
        /* add a query to get list of colleges according to above perameters and return to listColleges file */
        //todo-RDX


        var list = 'select * from college_details where city="%s" and type_id="%s"';
        var list1 = util.format(list, loc, colltype);

        var result1 = yield databaseUtils.executeQuery(list1);
        yield this.render('listColleges', {
            listcollege: result1,
            loc: loc,
            colltype: colltype
        });
    },
    showCDetailPage: function* (next) {
        var collid = this.request.query.cid;
        console.log(collid);
        /* add a query to get Details of colleges return to listColleges page */
        //todo-RDX

        yield this.render('collegeDetail', {

        });
    },
    showCollegeFormPage: function* (next) {
        yield this.render('collegeDetailForm', {});
    },

    putCollegeInfoPage: function* (next) {
        console.log(this.request.body);
        var name = this.request.body.fields.name;
        var email = this.request.body.fields.email;
        var contact = this.request.body.fields.contact;
        var city = this.request.body.fields.city;
        var state = this.request.body.fields.state;
        var pincode = this.request.body.fields.pincode;
        var ctype = this.request.body.fields.ctype;
        var cfee = this.request.body.fields.cfee;
        var fee = this.request.body.fields.fee;
        var bus = this.request.body.fields.bus;
        var hostel = this.request.body.fields.hostel;
        var infra = this.request.body.fields.infra;
        var placement = this.request.body.fields.placement;
        var discipline = this.request.body.fields.discipline;
        var clubs = this.request.body.fields.clubs;
        var reviews = this.request.body.fields.reviews;
        var affiliations = this.request.body.fields.affiliations;
        var curriculum = this.request.body.fields.curricullum;
        var duration = this.request.body.fields.duration;
        var surroundings = this.request.body.fields.surroundings;

        var userUploadedFile = this.request.body.files.image;
        var pic = userUploadedFile.path.split('/');
        var img = pic[3];
        console.log(name, email, contact, city, state, pincode, ctype, fee, bus, hostel, infra, placement, discipline, clubs, reviews, affiliations, curriculum, duration, surroundings, img);
        var list1 = 'INSERT INTO `college_details`(name,email,contact,city,state,pincode,type_id,img) VALUES ("%s","%s","%s","%s","%s","%s","%s","%s")';
        var query = util.format(list1, name, email, contact, city, state, pincode, ctype, img);
        var result1 = yield databaseUtils.executeQuery(query);
        console.log(result1.insertId);
        var fq = 'insert into course_fee(course_id,college_id,avgfee) values("%s","%s","%s")';
        var query1 = util.format(fq, 1, result1.insertId, cfee);
        var res = yield databaseUtils.executeQuery(query1);
        list1 = 'INSERT INTO `cfw`(college_id,fee,bus,hostel,infra,placement,discipline,clubs,reviews,affiliations,curriculum,duration,surrounding) VALUES ("%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s")';
        query = util.format(list1, result1.insertId, fee, bus, hostel, infra, placement, discipline, clubs, reviews, affiliations, curriculum, duration, surroundings);
        result1 = yield databaseUtils.executeQuery(query);
        console.log("data inserted");
        yield this.render('404', {

        });
    },

    showTestPage: function* (next) {
        yield this.render('index', {

        });
    },
    showComparePage: function* (next) {
        yield this.render('home', {

        });
    },

}
