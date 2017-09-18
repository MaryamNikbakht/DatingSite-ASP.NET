<%@ Language="javascript" %>

<style type="text/css">
.auto-style1 {
	border: 1px solid #E5E5E5;
	margin-left: 234px;
	background-color: #DDDDDD;
}
.auto-style2 {
	text-align: center;
	margin-left: 145px;
}
</style>

<%

    var txtEmail=Request.QueryString("email");
    var txtPassword=Request.QueryString("pass");

    var interestedIn=Request.QueryString("cboInterested");
    var seeking=Request.QueryString("cbolookFor");
    var height=Request.QueryString("cboHeight");
    var bType=Request.QueryString("cboBodyType");
    var income=Request.QueryString("cboIncome");
    
    var mycon = new ActiveXObject("ADODB.Connection");
    var myrec = new ActiveXObject("ADODB.Recordset");

    mycon.Open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\\LASALLE\\Semester4\\ASP\\Fode\\DatingProject\\WebSiteDating2\\Longuehil-Life\\longueuilLife\\App_Data\\longueuilLife.mdb");
    var sql = "SELECT * FROM Members WHERE Gender='"+interestedIn+"' AND Email<>'"+ Session("txtEmail")+"' OR LookingFor='"+seeking+"' OR Height='"+height+"' OR BodyType='"+bType+"' OR Income='"+income+"'";
    myrec.Open(sql, mycon);

    if (myrec.EOF) {// if empty that means no member found
        myrec.Close();
        mycon.Close();
        Session("resMSG")="Not Found! Try Again!";
        Response.Redirect("Search.asp");
    }

    Session("resMSG")="";

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
                                    <li class="active"><a href="index.html">Home</a></li>
                                    <li><a href="about.html">About</a></li>
                                   
                                    <li><a href="MyProfile.asp?txtEmail=<%= Session("txtEmail") %>&txtPassword=<%= Session("txtPassword") %>" >Profile</a></li>
                                    <li><a href="Search.asp">Search</a></li>
                                    <li><a href="contact.html">Contact</a></li>
                                </ul>
                            </div>
                        </div>
	
                    
            </div>
            </div>
            <div class="container bg-white">
                <div class="row-fluid">
                    <div class="block" style="height: 541px">
                        <div class="formBody">
                            <form action="#" method="get" style="height: 240px">

                                    <!-- <div class="textboxField" style="width: 426px">-->
                                    
                                    <!-- <div class="displayProfile" style="width: 426px">-->
                                     
                                        
                                        <h2 class="auto-style2" style="width: 922px">
										<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Search Results</strong></h2>
										 <p class="auto-style2" style="width: 718px">
										 &nbsp;</p><br />
                                            
                                         <table class="auto-style1" style="width: 690; height: 276px" align="center" cellpadding="5">
                                                <tr>
                                                    <!--<th>#</th>-->
                                                    <th class="text-left" style="width: 135px">First Name</th>
                                                    <th class="text-left" style="width: 105px">Last Name</th>
                                                    <th class="text-left" style="width: 173px">Height</th>
                                                    <th class="text-left" style="width: 197px">Body Type</th>
                                                    <th class="text-left" style="width: 134px">Email</th>
                                                    <th class="text-left" style="width: 150px">Profile </th>
                                                 </tr>
                                                <tr>
                                                      <% while(!myrec.EOF){ %>
                                                  <!--  <td>
                                                        <img src="#" alt="Profile Pic" /></td>-->
                                                    <td style="width: 135px"><%= myrec.Fields("FirstName").Value %></td>
                                                    <td style="width: 105px"><%= myrec.Fields("LastName").Value %></td>
                                                    <td style="width: 173px">
                                                         <% if(myrec.Fields("Height").Value==1){ %>
                                                        <lable>Under 160cm</lable>
                                                    <%} %>
                                                     <% if(myrec.Fields("Height").Value==2){ %>
                                                        <lable>160cm -170cm</lable>
                                                    <%} %>
                                                    <% if(myrec.Fields("Height").Value==3){ %>
                                                        <lable>170cm - 180cm</lable>
                                                    <%} %> 
                                                    <% if(myrec.Fields("Height").Value==4){ %>
                                                        <lable>180cm - 190cm</lable>
                                                    <%} %>
                                                    <% if(myrec.Fields("Height").Value==5){ %>
                                                        <lable>190cm - 200cm</lable>
                                                    <%} %>
                                                    <% if(myrec.Fields("Height").Value==6){ %>
                                                        <lable>Over 200cm</lable>
                                                    <%} %>
                                                    </td>

                                                    
                                                    <!--<td style="width: 197px"><%= myrec.Fields("BodyType").Value %></td>-->
                                                     <td>
                                                    <% if(myrec.Fields("BodyType").Value==1){ %>
                                                        <lable>Athletic</lable>
                                                    <%} %>
                                                    <% if(myrec.Fields("BodyType").Value==2){ %>
                                                        <lable>Average</lable>
                                                    <%} %>
                                                     <% if(myrec.Fields("BodyType").Value==3){ %>
                                                        <lable>Curvy</lable>
                                                    <%} %>
                                                    <% if(myrec.Fields("BodyType").Value==4){ %>
                                                        <lable>Plus Size</lable>
                                                    <%} %> 
                                                    <% if(myrec.Fields("BodyType").Value==5){ %>
                                                        <lable>Slim</lable>
                                                    <%} %> 
                                                      <% if(myrec.Fields("BodyType").Value==6){ %>
                                                        <lable>Ask me later</lable>
                                                    <%} %> 

                                                </td>



                                                    <td style="width: 134px"><%= myrec.Fields("Email").Value %></td>
                                                    <td style="width: 150px">
                                                        
                                              
                                                         <a href="SeeProfile.asp?profileId=<%= myrec.Fields("refMember").Value %>"> See Profile</a> 
                                                    </td>                   
                                                
                                                </tr>
                                                <% myrec.MoveNext() } %>
                                            
                                            </table>

                                             <%
                                                 myrec.Close();
                                                 mycon.Close();
                                                 %>
                                     
                                  
                                         
                                        
                                   <!--  </div>-->
                             </form>
                        </div>
                    <!--    <div id="loginImg">
                            <img src="img/dating5.jpg" alt="datingLogin" />
                        </div>-->
                     
                        
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


