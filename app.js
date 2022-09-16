//jshint esversion:6

const express = require("express");

const ejs = require("ejs");
const _ = require("lodash");
const mysql = require("mysql");
const path = require("path");



const app = express();
const port = process.env.PORT || 3000;
app.set('view engine', 'ejs');
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.use(express.static("public"));
app.set("views", path.join(__dirname, "/public/views"));
const db = mysql.createConnection({
  connectionLimit: 10,
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'uniproject'
});

db.connect((err) => {
  if (err) {
    throw err;
  }
  console.log('database connected');
});
var bfrom = "";
var bto = '';
var bcategory = '';
var bticket = 0;
var bname = '';

var tfrom = "";
var tto = '';
var tcategory = '';
var tticket = '';
var tname = '';
var tprice = 0;
var bprice = 0;
var name = '';
var phone = 0;
var email = '';
var age = '';
var password = '';
var lemail = '';
var lpassword = '';
var tseat = 0;
var bseat = 0;
var bnooftickets = 0;
var tnooftickets = 0;
var nprice = 1;
var text = 0;
var cemail = '';
var message = '';
var cname = '';


app.get("/", function (req, res) {
  res.render('login');
});
app.get("/register", function (req, res) {
  res.render('register');

});


// login
app.post('/', function (req, res) {

  lemail = req.body.lemail;
  lpassword = req.body.lpassword;
  db.query(
    `SELECT * FROM users WHERE email=? AND password=?`,
    [lemail, lpassword],
    (err, result) => {
      if (err) {
        res.send({ err: err });
      } else {
        if (result.length > 0) {
          // console.log(result[0].password); 
          db.query(
            // `SELECT * FROM users WHERE email=? AND password=?`
            // `SELECT * FROM bus WHERE Bus_name=? AND Bus_category=? AND from=?`,
            `SELECT * FROM users WHERE email=? and password=? `,
            [lemail, lpassword],
            (err, result) => {
              if (err) {
                res.send({ err: err });
              } else {
                // console.log(bname,bcategory,bfrom);
                name = result[0].name;

              }

            }
          );
          res.redirect('/location');
        } else {
          res.redirect('/error');
        }
      }
    }
  );

})

//register
app.post('/register', function (req, res) {
  name = req.body.fname;
  phone = req.body.phone;
  age = req.body.age;
  email = req.body.email;
  password = req.body.password;
  // console.log(req.body.fname,req.body.email,req.body.password,req.body.phone);
  db.query(
    `INSERT INTO users (name, phone_number, age, email, password, confirm_password) VALUES (?,?,?,?,?,?)`,
    [name, phone, age, email, password, password],
    (err, result) => {
      console.log(err);
    }
  );
  res.redirect('/')
});

app.get("/vehicles", function (req, res) {
  res.render('vehicles');

});






// select current location 

app.get("/location", (req, res) => {
  res.render("location")
})

app.get("/location/:resortLocation", (req, res) => {
  const { resortLocation } = req.params
  res.render(resortLocation)
})

app.get("/resort/:resortName", (req, res) => {
  const { resortName } = req.params


  let resortTable = {
    "BalishiraResort": "Balishira Resort",
    "DhakaRegencyHotelandResort": "Dhaka Regency Hotel & Resort",
    "DoreenHotelsandResorts": "Doreen Hotels & Resorts",
    "LabahTongHillResortLtd": "Labah Tong Hill Resort Ltd.",
    "LaRiveriaResortandPark": "La Riveria Resort & Park",
    "MermaidBeachResort": "Mermaid Beach Resort",
    "NazimgarhGardenResort": "Nazimgarh Garden Resort",
    "NilacholNilamboriResort": "Nilachol Nilambori Resort",
    "PalmRiviera": "Palm Riviera",
    "SairuHillResort": "Sairu Hill Resort",
    "SayemanBeachResort": "Sayeman Beach Resort",
    "ShuktaraNatureRetreat": "Shuktara Nature Retreat"
  }

  db.query(
    // `SELECT * FROM users WHERE email=? AND password=?`
    // `SELECT * FROM bus WHERE Bus_name=? AND Bus_category=? AND from=?`,
    `SELECT * FROM resort_payment_history WHERE resort_name=?`,
    [resortTable[resortName]],
    (err, result) => {
      if (err) {
        res.send({ err: err });
      } else {
        if (result.length == 0) {
          res.render(resortName)
        } else {
          res.render("resortBooked")
        }
      }

    }
  );


})

app.get("/pay/:bkashPayment", (req, res) => {
  const { bkashPayment } = req.params
  res.render(bkashPayment)
})

app.get("/extra", (req, res) => {
  res.render("extra")
})

app.post("/pay/arrival", (req, res) => {

  db.query(
    `SELECT * FROM resort_payment_history WHERE resort_name=?`,
    [req.body.resort],
    (err, result) => {
      if (err != null) {
        console.log(err)
      }
      if (result.length == 0) {

        db.query(
          `INSERT INTO resort_payment_history ( email, payment, resort_name, package, vfrom, vto) VALUES (?,?,?,?,?,?)`,
          [req.body.email, req.body.payment, req.body.resort, req.body.package, req.body.currentLocation, req.body.destination],
          (err, result) => {
            if (err != null) {
              console.log(err)
            }
            ;
          }
        );


      }

      ;
    }
  );
})

app.get("/admin", (req, res) => {
  res.render("adminLogin")
})



app.post("/admin", (req, res) => {
  if (req.body.password != "fahad123") {
    res.render("loginerror")

  } else {

    var resort_names = []
    var resorts_booked = []
    var payOnArrival = []
    var bkashPayment = []
    var transportPayment = []


    db.query(
      `SELECT resort_name from resorts`,
      (err, result) => {
        if (err != null) {
          console.log(err)
        } else {
          resort_names = result

        }
        ;
      }
    );

    db.query(
      `SELECT username from payment_history`,
      (err, result) => {
        if (err != null) {
          console.log(err)
        } else {
          transportPayment = result

        }
        ;
      }
    );

    db.query(
      `SELECT resort_name from resort_payment_history`,
      (err, result) => {
        if (err != null) {
          console.log(err)
        } else {
          resorts_booked = result
        }
        ;
      }
    );

    db.query(
      `SELECT email FROM resort_payment_history WHERE payment='payOnArrival'`,
      (err, result) => {
        if (err != null) {
          console.log(err)
        } else {
          payOnArrival = result
        }
        ;
      }
    );

    db.query(
      `SELECT email FROM resort_payment_history WHERE payment='bkash'`,
      (err, result) => {
        if (err != null) {
          console.log(err)
        } else {
          bkashPayment = result
          res.render("admin", { resort_names, resorts_booked, payOnArrival, bkashPayment,transportPayment })
        }
        ;
      }
    );

  }
})














app.get("/bus", function (req, res) {
  res.render('bus');
});

app.post("/bus", function (req, res) {

  bfrom = req.body.bstartPoint;
  bto = req.body.busendingPoint;
  bcategory = req.body.buscategory;
  bticket = req.body.bticket;
  bname = req.body.bname;
  console.log('bus tikcet', bticket);

  db.query(
    // `SELECT * FROM users WHERE email=? AND password=?`
    // `SELECT * FROM bus WHERE Bus_name=? AND Bus_category=? AND from=?`,
    `SELECT * FROM bus WHERE Bus_name=? and bus_category=? and bfrom=? `,
    [bname, bcategory, bfrom],
    (err, result) => {
      if (err) {
        res.send({ err: err });
      } else {
        console.log(bname, bcategory, bfrom);
        bseat = result[0].Seat_status;
        console.log(bseat);
      }

    }
  );

  res.redirect("bticket");

});

app.get("/bticket", function (req, res) {
  res.render('busticket', {
    bfrom, bto, bticket, bcategory, bname, name, bseat
  });

});

app.post("/bticket", function (req, res) {
  bnooftickets = bseat - (parseInt(bticket));
  console.log(bnooftickets);

  if (bnooftickets > -1) {
    db.query(

      `UPDATE bus SET Seat_status =? WHERE  Bus_name =? and Bus_category=? and bfrom=? `,
      [bnooftickets, bname, bcategory, bfrom],
      (err, result) => {
        if (err != null) {
          res.send({ err: err });
        } else {
          // console.log(bname,bcategory,bfrom);
          // seat = result[0].Seat_status;
          // console.log(seat);
        }
      }
    );

    db.query(
      `SELECT * from ticket_info where type like '${bcategory}' `,
      (err, result) => {
        if (err != null) {
          res.send({ err: err });
        } else {
          nprice = (result[0].Price * parseInt(bticket));
        }
      }
    );

    db.query(
      `INSERT INTO payment_history (username, vehicle_name, vehicle_type, vfrom, vto, total_ticket) VALUES (?,?,?,?,?,?) `,
      [name, bname, bcategory, bfrom, bto, bticket],
      (err, result) => {
        if (err != null) {
          res.send({ err: err });
        } else {
          // console.log(nprice);
          // nprice = (result[0].Price * parseInt(tticket));
          // console.log(nprice,bnooftickets);
          res.redirect('/bpayment');
        }
      }
    );
  } else {
    res.redirect('/busticketerror');
  }
});


app.get("/bpayment", function (req, res) {

  res.render('buspayment', {
    bfrom, bto, bticket, bcategory, bname, name, nprice, bcategory
  });

});


app.get("/train", function (req, res) {
  res.render('train'  /*, { tprice }*/);
});


app.post("/train", function (req, res) {
  tfrom = req.body.tstartPoint;
  tto = req.body.tendingPoint;
  tcategory = req.body.tcategory;
  tticket = req.body.tticket;
  tname = req.body.tname;

  db.query(
    // `SELECT * FROM users WHERE email=? AND password=?`
    // `SELECT * FROM bus WHERE Bus_name=? AND Bus_category=? AND from=?`,
    `SELECT * FROM train WHERE Train_name=? and Train_class=? and tfrom=? `,
    [tname, tcategory, tfrom],
    (err, result) => {
      if (err != null) {
        res.send({ err: err });
      } else {
        // console.log(tname,tcategory,tfrom);
        tseat = result[0].Seat_status;

      }

    }
  );
  res.redirect("/tticket");
});



app.get("/tticket", function (req, res) {

  res.render('trainticket', {
    tfrom, tto, tticket, tcategory, tname, name, tseat
  });

});
app.post("/tticket", function (req, res) {
  tnooftickets = tseat - (parseInt(tticket));
  // console.log(nooftickets);
  if (tnooftickets > -1) {

    db.query(

      `UPDATE train SET Seat_status =? WHERE  Train_name =? and Train_class=? and tfrom=? `,
      [tnooftickets, tname, tcategory, tfrom],
      (err, result) => {
        if (err != null) {
          res.send({ err: err });
        } else {
          // console.log(bname,bcategory,bfrom);
          // seat = result[0].Seat_status;
          // console.log(seat);
        }
      }
    );

    db.query(

      `SELECT * from ticket_info where type like '${tcategory}' `,

      (err, result) => {
        if (err != null) {
          res.send({ err: err });
        } else {
          nprice = (result[0].Price * parseInt(tticket));
          console.log(nprice, bnooftickets);
        }

      }
    );

    db.query(

      `INSERT INTO payment_history (username, vehicle_name, vehicle_type, vfrom, vto, total_ticket) VALUES (?,?,?,?,?,?) `,
      [name, tname, tcategory, tfrom, tto, tticket],
      (err, result) => {
        if (err != null) {
          res.send({ err: err });
        } else {
          // console.log(nprice);

          // nprice = (result[0].Price * parseInt(tticket));
          // console.log(nprice,bnooftickets);
          res.redirect('/tpayment');
        }

      }
    );

  } else {
    res.redirect('/trainticketerror');
  }

});

app.get("/tpayment", function (req, res) {
  res.render('trainpayment', {
    tfrom, tto, tticket, tcategory, tname, name, nprice, tcategory
  });

});


app.get("/error", function (req, res) {
  res.render('loginerror');

});

app.get("/trainticketerror", function (req, res) {
  res.render('trainticketerror', { tseat });

});
app.get("/busticketerror", function (req, res) {
  res.render('busticketerror', { bseat });

});

app.get("/contact", function (req, res) {
  res.render('contact');

});
app.post("/contact", function (req, res) {
  cname = req.body.cname;
  cemail = req.body.cemail;
  message = req.body.message;

  db.query(

    `INSERT INTO contact_us (name, email, message) VALUES (?,?,?) `,
    [cname, cemail, message],
    (err, result) => {
      if (err) {
        res.send({ err: err });
      } else {
        // console.log(nprice);

        // nprice = (result[0].Price * parseInt(tticket));
        // console.log(nprice,bnooftickets);
      }

    }
  );
  res.redirect('/');

});

// // urlencoded api is localhost:3000/resort/Cox%27s%20bazar
// app.get("/resort/:location", (req, res, next) => {
//   let loc = req.params.location

//   let sql = `SELECT * FROM resorts WHERE resort_location =?`;

//   db.query(sql, [loc], (error, results, fields) => {
//     if (error) {
//       return console.error(error.message);
//     }

//     console.log(results);
//     res.render("resorts", { results })

//   });

// })

app.listen(port, function () {
  console.log("Server started on port 3000");
});
