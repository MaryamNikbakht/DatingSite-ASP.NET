<%@ Language="javascript" %>
<%
    //var email = Request.QueryString("txtEmailSign");
    //var user = Request.QueryString("txtUserNameSign");
    //var firstName = Request.QueryString("txtFirstName");
    //var lastName = Request.QueryString("txtLastName");
    //var birthDate = Request.QueryString("txtBirthDate");
    //var password = Request.QueryString("txtPasswordSign");
    //var gender = Request.QueryString("genderSign");
    //var secQ = Request.QueryString("cboSecQuestion");
    //var secAwnser = Request.QueryString("txtQuestionSecur");



    var lookfor = Request.QueryString("lookFor");
    var education = Request.QueryString("Education");
    var smoking = Request.QueryString("cboSmok");
    var drinking = Request.QueryString("cboDrink");
    var child = Request.QueryString("cboChildren");
    var income = Request.QueryString("cboIncome");
    var height = Request.QueryString("cboHeight");
    var body = Request.QueryString("cboBodyType");
    var ethnic = Request.QueryString("cboEthnicity");
    var relig = Request.QueryString("cboReligion");
  //  var Bday = Date(Session("txtBirthDate"), "MM/DD/yyyy").toString();
   

    var mycon = new ActiveXObject("ADODB.Connection");
    var myRec = new ActiveXObject("ADODB.Recordset");

    mycon.Open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\\LASALLE\\Semester4\\ASP\\Fode\\DatingProject\\WebSiteDating2\\Longuehil-Life\\longueuilLife\\App_data\\longueuilLife.mdb");

    //Session("txtEmailSign") = Request.QueryString("txtEmailSign").Item;
    //Session("txtUserNameSign") = Request.QueryString("txtUserNameSign").Item;
    //Session("txtFirstName") = Request.QueryString("txtFirstName").Item;
    //Session("txtLastName") = Request.QueryString("txtLastName").Item;
    //Session("txtBirthDate") = Request.QueryString("txtBirthDate").Item;
    //Session("txtPasswordSign") = Request.QueryString("txtPasswordSign").Item;
    //Session("genderSign") = Request.QueryString("genderSign").Item;
    //Session("cboSecQuestion") = Request.QueryString("cboSecQuestion").Item;
    //Session("txtQuestionSecur") = Request.QueryString("txtQuestionSecur").Item;


    //var sql2 = "INSERT INTO Members(User,Email, Password,FirstName,LastName,BirthDay,Gender,SecQuestion,SecAwnser,LookingFor,Education,";
    //    sql2 +=" SmokingHabit,DrinkingHabit,Children,Income,Height,BodyType,Ethnicity,Religion)";
    //    sql2 += " VALUES('" + Session("txtUserNameSign") + "','" + Session("txtEmailSign") + "','" + Session("txtPasswordSign");
    //    sql2 += "','" + Session("txtFirstName") + "','" + Session("txtLastName") + "', FORMAT('" + Session("txtBirthDate") + "', 'MM/DD/YYYY')";
    //    sql2 += "','" + Session("genderSign") + "','" + Session("cboSecQuestion") + "','" + Session("txtQuestionSecur") + "',' ";
    //    sql2 += lookfor + "','" + education + "','" + smoking + "','" + drinking + "','" + child + "','" + income + "','";
    //    sql2 += height + "','" + body + "','" + ethnic + "','" + relig + "')";

    var sql2 = "INSERT INTO Members([User],[Email], [Password],[FirstName],[LastName],[BirthDay],[Gender],[SecQuestion],[SecAwnser],[LookingFor],[Education],";
    sql2 += " [SmokingHabit],[DrinkingHabit],[Children],[Income],[Height],[BodyType],[Ethnicity],[Religion])";
    sql2 += " VALUES( '"+ Session("txtUserNameSign") +"','"+ Session("txtEmailSign")  +"','"+ Session("txtPasswordSign");
    sql2 += "','" + Session("txtFirstName") + "','" + Session("txtLastName") + "'," + Session("txtBirthDate");
    sql2 += ",'" + Session("genderSign") + "','" + Session("cboSecQuestion") + "','" + Session("txtQuestionSecur") + "','";
    sql2 += lookfor + "','" + education + "','" + smoking + "','" + drinking + "','" + child + "','" + income + "','";
    sql2 += height + "','" + body + "','" + ethnic + "','" + relig + "')";

         mycon.Execute(sql2);


    Response.Redirect("login.asp");

    
    %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">
       
       <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap-responsive.css"> 
        <link rel="stylesheet" href="css/custom-styles.css">
        <link rel="stylesheet" href="css/font-awesome.css">
        <link rel="stylesheet" href="css/component.css">
        <link rel="stylesheet" href="css/font-awesome-ie7.css">
        <link rel="stylesheet" href="css/LoginStyleSheet.css">

        <script src="js/modernizr.custom.js"></script>
        <script src="js/modernizr-2.6.2-respond-1.1.0.min.js"></script>
            <!-- Insert to your webpage before the </head> -->
    <script src="sliderengine/jquery.js"></script>
    <script src="sliderengine/amazingslider.js"></script>
    <script src="sliderengine/initslider-1.js"></script>
    <!-- End of head section HTML codes -->

        <script type="text/javascript">    
        window.onload = function() {            
            document.getElementById('checkUser').style.display = 'none';
            
        }


        function Opentext(){
            document.getElementById('checkUser').style.display = '';
        }

      
    </script>


    </head>
    <body>
 
            <div class="header-wrapper">
                <div class="container">
                    <div class="row-fluid">
                    
                        <div class="site-name">
                            <h1><img src="img/ll1.png" alt=""> longueuil life</h1>
                        </div>
                    
                    
                    </div>
                </div>
            </div>
            <div class="container">
            <div class="menu">
                
                        <div class="navbar">
                            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                                <i class="fw-icon-th-list"></i>
                            </a>
                            <div class="nav-collapse collapse">
                                <ul class="nav">
                                    <li class="active"><a href="#">Home</a></li>
                                    <li><a href="about.html">About</a></li>
                                    <li><a href="#">Profile</a></li>
                                    <li><a href="#">Search</a></li>
                                    <li><a href="contact.html">Contact</a></li>
                                </ul>
                            </div>
                        </div>
	
                    
            </div>
            </div>
            <div class="container bg-white">
                <div class="row-fluid">
                    <div class="block">
                        <div class="formBody">
                              <div id="checkUser">
                               <br />
                               <h4></h4><br />
                              
                            </div>
                         

                          
                        </div>
                     
                       
                        
                    </div>
                       <div id="loginImg">
                            <img src="img/dating5.jpg" alt="dating" />
                        </div>
                </div>
              
            </div>

           
                <div class="container bg-white">
                <div class="row-fluid">
                 
                           <div class="featured-images">
                            <ul class="grid effect-8" id="grid">
                              <li>
                                <div class="block">
                                 
                                        <h4>MEET FUN SINGLES!</h4>
                                        <h6>Since 2001, longueuillife.com has been committed to helping its
										members find dates, relationships and even soul mates.</h6>
                                      
                                </div>
                              </li>
                            </ul>
                                <div class="block-content">
                                    
                                    <div class="followUs">
                                        <h3> Follow us</h3>
                                        <a href="http://www.tweeter.com"><img src="img/tweeter.png" alt="tweeter" /></a>
                                        <a href="http://www.google.com"><img src="img/google.png" alt="google" /></a>
                                        <a href="http://www.facebook.com"><img src="img/facebook.png" alt="facebook" /></a>
                                        
                                        
                                    </div>
                                    
                                </div>
                            </div>
                    
                </div>
            </div>
              

                    <footer>
                    <div class="wrap bg-black">
                      <div class="container ">
                        <div class="row-fluid">
                          <div class="span12">
                            <div class="copy-rights">
                                Copyright(c) website name. <span>Designed by: <a href="https://www.linkedin.com/in/maryam-nikbakht?trk=nav_responsive_tab_profile_pic">@Maryam-Nikbakht</a></span> <br />
                                <p id="demo"><script> document.getElementById("demo").innerHTML = Date(); </script></p>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    </footer>

          <script src="js/jquery-1.9.1.js"></script> 
<script src="js/bootstrap.js"></script>
<script src="js/masonry.pkgd.min.js"></script>
    <script src="js/imagesloaded.js"></script>
    <script src="js/classie.js"></script>
    <script src="js/AnimOnScroll.js"></script>
    
    <script>
      new AnimOnScroll( document.getElementById( 'grid' ), {
        minDuration : 0.4,
        maxDuration : 0.7,
        viewportFactor : 0.2
      } );
    </script>
<script>
$('#myCarousel').carousel({
    interval: 1800
});
</script>


    </body>
</html>

