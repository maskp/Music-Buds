var express = require('express');
var app = express();
var pgp = require('pg-promise')();
var mustacheExpress = require('mustache-express');
var bodyParser = require("body-parser");
//var session = require('express-session');
var fetch = require('node-fetch');
methodOverride = require('method-override');
/* BCrypt stuff here */
//var bcrypt = require('bcrypt');

app.engine('html', mustacheExpress());
app.set('view engine', 'html');
app.set('views', __dirname + '/views');
app.use("/", express.static(__dirname + '/public'));
app.use(bodyParser.urlencoded({
    extended: true
}));
app.use(bodyParser.json());
app.use(methodOverride('_method'))


var db = pgp(process.env.DATABASE_URL||'postgres://student_15:@localhost:5432/linkedlist');
//var dbs = pgp('postgres://student_15:@localhost:5432/userinfo');
//var db = pgp(process.env.DATABASE_URL || 'postgres://myname@localhost:5432/mydatabasename');




//routes
app.get("/frontin", function(req, res) {
    res.render('frontin');

});

app.post('/frontin', function(req, res) {
    var data = req.body;


    //node fetch
    fetch('https://freemusicarchive.org/api/get/artists.json?api_key=3KIXRRUJ22OOZSUY&artist_name=' + data.search)
        .then(function(resp) {
            return resp.json();
        }).then(function(json) {

             res.render('yourlikes', {

                artist_name: json.dataset[0].artist_name,
                artist_image: json.dataset[0].artist_image_file,
                username: data.username,
                userid: data.userid
            })

        }).catch(function(error) {
            res.send('could not find artist. please go back and enter correctly.')
        })
});

// app.get('/yourlikes',function(req,res){
//     console.log(req.body);
// })


app.post('/likedlist', function(req, res) {
    var data = req.body;
   //console.log(data);
    db.none('INSERT INTO muzician (musician_name,musician_image,userid) values ($1,$2,$3)', [data.art_name, data.art_image, Number(data.userid)])
        .then(function() {
            console.log('data inserted')
            res.render('yourlikes');
        })
        .catch(function(error) {
            console.log('musician not inserted');
            res.send('musician not inserted!!');
    })

})


//signin signout update delete

app.get('/signup', function(req, res) {
    res.render('signup.html', {
        message: 'password limit: 20 characters'
    })
})

app.post('/signup', function(req, res) {
    var data = req.body;
    //console.log(data);
    db.none('Insert into users (name,email,password,username,question,answers ) values ($1,$2,$3,$4,$5,$6)', [data.name, data.email, data.password, data.username, data.question, data.answers])
        .then(function() {
            //console.log('village')
            res.render('signin')

        })
        .catch(function(error) {
                res.render('signup', {
                message: 'Something went wrong try again'
            });
        })
})

app.get('/signin', function(req, res) {
    res.render('signin')
})



app.post('/signin', function(req, res) {
        var pata = req.body;
        //console.log(pata); returns username and password


        //db.any('select * from users inner join muzician on users.id = muzician.userid where users.username=$1 and users.password=$2', [pata.username, pata.password])
        db.one('select * from users where username=$1 and password=$2' , [pata.username,pata.password])
            .then(function(data) {
               //console.log(data.id);
                res.render('frontin', {
                        'username': pata.username,
                        'userid': data.id,
                        //data: data
                            // })
                    }) //res render
            })
            .catch(function(error) {
                //res.send('no username found');

                setTimeout(function() {
                    res.render('signup.html');
                }, 5000);
            }) //catch
    }) //then

app.get('/update', function(req, res) {
    res.render('update')
})

app.put('/update', function(req, res) {
    var sata = req.body;

    db.none('UPDATE users SET password=$1 where email=$2 and question=$3', [sata.password, sata.email, sata.question])
        .then(function(data) {
            res.render('signin.html')
        })
        .catch(function(error) {
            res.send('Something went wrong go back and change it')
        })
})

/
app.get('/',function(req,render){
  render.render('signin')
})


app.get('/memberlist', function(req, res) {
    db.many('select * from users')
        .then(function(data) {
            //xconsole.log(data);
            res.render('memberlist', {
                'users': data
            })
        })
})

app.get('/memberlist/:id', function(req, res) {
        db.any('Select distinct musician_name,musician_image from users inner join muzician on users.id = muzician.userid where users.id=$1', [req.params.id])
            .then(function(data) {

                res.render('singleuser', {
                    'user': data
                })
            })
    })

app.get('/getlikes/:id',function(req,res){
   db.any('select distinct muzician.musician_name,muzician.musician_image,users.id from users inner join muzician on users.id = muzician.userid where users.id=$1',[req.params.id])
    .then(function(data){
      //console.log(data)
      res.render('getlikes',{data:data})

    })

})

app.delete('/getlikes/:id',function(req, res){
var data= req.body;
console.log(data);
  db.none("DELETE FROM muzician WHERE musician_name=$1", [data.musician_name])
  res.render('getlikes')
});


app.listen(3000, function() {
    console.log('listening on port 3000!');
});
