<%@ Language="javascript" %>
<%
    var emailFrom=Session("txtEmail") ;
    var refMemb = Request.QueryString("refM");

    var mycon = new ActiveXObject("ADODB.Connection");
    var myRec = new ActiveXObject("ADODB.Recordset");

    mycon.Open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\\LASALLE\\Semester4\\ASP\\Fode\\DatingProject\\WebSiteDating2\\Longuehil-Life\\longueuilLife\\App_data\\longueuilLife.mdb");
    var sql = "SELECT * FROM Members";
    myRec.Open(sql, mycon);
    
    
    
    
    %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
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
</head>
<body>

    <div class="header-wrapper">
        <div class="container">
            <div class="row-fluid">

                <div class="site-name">
                    <h1><img src="img/ll1.png" alt=""> longueuil life</h1>
                </div>


                <div class="menu-icons">

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
                        <li class="active"><a href="index.html">Home</a></li>
                        <li><a href="about.html">About</a></li>
                        <li><a href="MyProfile.asp?txtEmail=<%= Session("txtEmail") %>&txtPassword=<%= Session("txtPassword") %>" >Profile</a></li>
                        <li><a href="Search.asp">Search</a></li>
                        <li><a href="contact.html">Contact</a></li>
                    </ul>
                </div><!--/.nav-collapse -->
            </div>


        </div>
    </div>
  

    <div class="container bg-white">
        <div class="row-fluid">
            <div class="block">
                <div class="formBody">
                    <form action="verifySendMessage.asp" method="get">

                        <div class="textboxField ">
                            <!--  -->

                            <h2>Send Message</h2>
                       
                       

                            <!--Full NAme-->
                            <div class="textboxField">
                                <lable>From</lable><br />
                                <input id="txtemailfrom" name="txtemailfrom" type="text" class="userInput" value="<%= emailFrom %>"  readonly/>
                            </div>
                            <!--TO-->
                             <div class="textboxField">                 
                                <lable>To</lable><br />
                
                                 <!-- <input id="txtemailTo" name="txtemailTo" type="text" class="userInput" value="<%= refMemb %>"  readonly/>-->
                                 <select id="txtemailTo" name="txtemailTo">
                                      <% while (!myRec.EOF)  { %>
                                     <option value="<%=myRec.Fields("refMember").value %>"><%=myRec.Fields("Email").value  %></option>
                                      <%                                
                                            myRec.MoveNext();
                                            }
                       
                                         %>
                                 </select>
                                 <%  myRec.Close();
                                    mycon.Close();
                                    %>
                             </div>


                            <!--Subject-->
                            <div class="textboxField">
                                <lable>Subject</lable><br />
                                <input id="txtSubject" name="txtSubject" type="text" class="userInput" placeholder="Subject">
                            </div>
                            <!--Message-->
                            <div class="textboxField">
                                <textarea class="userInput" name="txtareaMsg" id="txtareaMsg"></textarea>
                            </div>
                            <!--SUBMIT PROFILE-->
                            <div class="textboxField">
                                <div id="joinSignup1">
                                    <input type="submit" class="btn btn-danger" value=" Send Message ">
                                </div>
                            </div>





                        </div>
                    </form>
                </div>
                <div id="loginImg">
                    <img src="img/dating5.jpg" alt="datingLogin" />
                </div>


            </div>
        </div>
    </div>



    <div class="container bg-white">
        <div class="row-fluid">

            <div class="featured-images">
                <ul class="grid effect-8" id="grid">
                    <li>
                        <div class="block">

                            <h4>Have FUN SINGLES!</h4>
                            <h6>
                                Send message!
                            </h6>

                        </div>
                    </li>
                </ul>
                <div class="block-content">



                </div>
            </div>

        </div>
    </div>




    <div class="wrap bg-black">
        <div class="container ">
            <div class="row-fluid">
                <div class="span12">
                    <div class="copy-rights">
                        Copyright(c) website name. <span>Designed by: <a href="http://www.longueuillife.com">www.longueuillife.com</a></span>
                    </div>
                </div>
            </div>
        </div>
    </div>

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

