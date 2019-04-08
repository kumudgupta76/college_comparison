var sessionUtils = require('../utils/sessionUtils');
var util = require('util');
var databaseUtils =require('../utils/databaseUtils');
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
    showContactPage: function* (next) {
        // todo - PVR
        /*add ourteam page*/
    yield this.render('contact',{
    });
    
    },
    
    showCollegesPage: function* (next) {
        /* query perameter form get url */
        var loc = this.request.query.loc;
        var colltype = this.request.query.colltype;
        console.log(loc+" "+colltype);
        /* add a query to get list of colleges according to above perameters and return to listColleges file */
        //todo-RDX
        var list= 'select * from college_details where city="%s" and type_id="%s"';
        var list1=util.format(list,loc,colltype);

        var result1 = yield databaseUtils.executeQuery(list1);
        yield this.render('listColleges',{
            listcollege:result1,
            loc:loc,
            colltype:colltype
        });
    },
    showOrderedCollegesPage: function* (next) {
        var feek1 = parseInt(this.request.query.fee);
        var bfhm = parseInt(this.request.query.bfhm);
        var bhfacility = parseInt(this.request.query.bhfacility);
        var infra = parseInt(this.request.query.infra);
        var placements=parseInt(this.request.query.placements);
        var discipline = parseInt(this.request.query.discipline);
        var clubs = parseInt(this.request.query.clubs);
        var userreview = parseInt(this.request.query.userreviews);
        var affiliations = parseInt(this.request.query.affiliations);
        var curricullum = parseInt(this.request.query.curricullum);
        var avgduration = parseInt(this.request.query.avgduration);
        var collegesurroundings = parseInt(this.request.query.collegesurroundings);
        var loc = this.request.query.loc;
        var colltype = this.request.query.colltype;
        console.log(loc+" ** "+colltype);
        var fee1="";
        
        var list= 'select * from college_details where city="%s" and type_id="%s"';
        var list1=util.format(list,loc,colltype);
        var result1 = yield databaseUtils.executeQuery(list1);
        var sortedArray=[];
        var rows=[];
        var akm;
        for( var i in result1)
        {
            akm=result1[i].id; 
            console.log(akm); 
            var taken='select * from cfw where college_id="%s"';
            var taken1=util.format(taken,akm);
            var result2 = yield databaseUtils.executeQuery(taken1);
            console.log("here goes result2\n");
            console.log(result2[0]);
            rows.push(result2[0]);
        }
        console.log(rows);
        var score=0
        var newarr=[]
        for( var i in rows)
        {
            var query='select * from course_fee where college_id="%s"';
            var newresult=util.format(query,rows[i].college_id);
            newarr.push(newresult[0]);
        }
        var finallist={}
        var denominator
        for ( var i in rows)
        {
            console.log("rows[i].reviews="+rows[i].reviews);
            console.log("userreview="+userreview);
            if(bfhm==0)
            {
                score=score+(1+bhfacility)*(rows[i].bus);
                denominator=155+(bhfacility)*(rows[i].bus);
            }
            else
            {
                score=score+(1+bhfacility)*(rows[i].hostel);
                denominator=160+(bhfacility)*(rows[i].hostel);
            }
            score=score+(1+infra)*(rows[i].infra);
            score=score+(1+placements)*(rows[i].placement);
            score=score+(1+discipline)*(rows[i].discipline);
            score=score+(1+clubs)*(rows[i].clubs);
            score=score+(1+userreview)*(rows[i].reviews);
            score=score+(1+affiliations)*(rows[i].affiliations);
            score=score+(1+curricullum)*(rows[i].curriculum);
            score=score+(1+avgduration)*(rows[i].duration);
            score=score+(1+collegesurroundings)*(rows[i].surrounding);
            denominator=denominator+( infra)*(rows[i].infra);
            denominator=denominator+( placements)*(rows[i].placement);
            denominator=denominator+( discipline)*(rows[i].discipline);
            denominator=denominator+( clubs)*(rows[i].clubs);
            denominator=denominator+( userreview)*(rows[i].reviews);
            denominator=denominator+( affiliations)*(rows[i].affiliations);
            denominator=denominator+( curricullum)*(rows[i].curriculum);
            denominator=denominator+( avgduration)*(rows[i].duration);
            denominator=denominator+( collegesurroundings)*(rows[i].surrounding);
            var newfee;
            for(var j in newarr)
            {
                if(newarr[j].college_id==rows[i].college_id)
                    newfee=newarr[j].avgfee;
            }
            if(newfee>feek1)
            {
                var diff=newfee-feek1;
                if(diff>=50000)
                    score=score+23;
                else score=score+31;
            }
            else 
                score=score+40;
            console.log("manu "+score+"over");
            console.log("manu2 "+denominator+"over");
            //console.log("rajul "+feek1+"over");
            finallycalucaltedrating=((score*100)/denominator);
            //console.log("manu "+finallycalucaltedrating);
            finallist[rows[i].college_id]=-finallycalucaltedrating;
        }
        finallist[4]=-80.32;
        finallist[3]=-12.33;
        sortedlist=[];
        function sortProperties(obj)
        {
        // convert object into array
            var sortable=[];
            for(var key in obj)
                if(obj.hasOwnProperty(key))
                    sortable.push([key, obj[key]]); // each item is an array in format [key, value]
            
            // sort items by value
            sortable.sort(function(a, b)
            {
            return a[1]-b[1]; // compare numbers
            });
            return sortable; // array in format [ [ key1, val1 ], [ key2, val2 ], ... ]
        }
        sortedlist=sortProperties(finallist);
        //console.log(sortedlist);
        //finallist.sort();
        for(var i in sortedlist)
        {
             var id=sortedlist[i][0];
             var score=-sortedlist[i][1];
             console.log("id="+id+"score="+score);
        }
        console.log(loc+" "+colltype);
        /* add a query to get list of colleges according to above perameters and return to listColleges file */
        //todo-RDX


        var list= 'select * from college_details where city="%s" and type_id="%s"';
        var list1=util.format(list,loc,colltype);
        
        var result1 = yield databaseUtils.executeQuery(list1);
        yield this.render('listColleges',{
            listcollege:result1,
            loc:loc,
            colltype:colltype
        });

    },
    showCDetailPage: function* (next) {
        var collid=this.request.query.id;
        console.log(collid);
        /* add a query to get Details of colleges return to listColleges page */
        //todo-RDX

        yield this.render('collegedetail',{

        });
    },
    showCollegeFormPage:function* (next) {
        yield this.render('collegeDetailForm',{});
    },
    
putCollegeInfoPage: function* (next) {
     console.log(this.request.body);
    var name=this.request.body.fields.name;
    var email=this.request.body.fields.email;
    var contact=this.request.body.fields.contact;
    var city=this.request.body.fields.city;
    var state=this.request.body.fields.state;
    var pincode=this.request.body.fields.pincode;
    var ctype=this.request.body.fields.ctype;
    var cfee=this.request.body.fields.cfee;
    var fee=this.request.body.fields.fee;
    var bus=this.request.body.fields.bus;
    var hostel=this.request.body.fields.hostel;
    var infra=this.request.body.fields.infra;
    var placement=this.request.body.fields.placement;
    var discipline=this.request.body.fields.discipline;
    var clubs=this.request.body.fields.clubs;
    var reviews=this.request.body.fields.reviews;
    var affiliations=this.request.body.fields.affiliations;
    var curriculum=this.request.body.fields.curricullum;
    var duration=this.request.body.fields.duration;
    var surroundings=this.request.body.fields.surroundings;

    var userUploadedFile = this.request.body.files.image; 
    var pic = userUploadedFile.path.split('/');
    var img=pic[3];
    console.log(name,email,contact,city,state,pincode,ctype,fee,bus,hostel,infra,placement,discipline,clubs,reviews,affiliations,curriculum,duration,surroundings,img);
    var list1= 'INSERT INTO `college_details`(name,email,contact,city,state,pincode,type_id,img) VALUES ("%s","%s","%s","%s","%s","%s","%s","%s")';
    var query=util.format(list1,name,email,contact,city,state,pincode,ctype,img);
    var result1 = yield databaseUtils.executeQuery(query);
    console.log(result1.insertId);
    var fq='insert into course_fee(course_id,college_id,avgfee) values("%s","%s","%s")';
    var query1=util.format(fq,1,result1.insertId,cfee);
    var res = yield databaseUtils.executeQuery(query1);
    list1='INSERT INTO `cfw`(college_id,fee,bus,hostel,infra,placement,discipline,clubs,reviews,affiliations,curriculum,duration,surrounding) VALUES ("%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s","%s")';
    query=util.format(list1,result1.insertId,fee,bus,hostel,infra,placement,discipline,clubs,reviews,affiliations,curriculum,duration,surroundings);
    result1 = yield databaseUtils.executeQuery(query);
    console.log("data inserted");
    yield this.render('404',{

    });
},
showErrorPage:function* (next) {
    yield this.render('404',{

    });
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
