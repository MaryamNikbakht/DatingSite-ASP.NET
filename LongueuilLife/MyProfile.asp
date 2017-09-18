<%@ Language="javascript" %>
<%
    var email = Request.QueryString("txtEmail");
    var pass = Request.QueryString("txtPassword");

   

    var mycon = new ActiveXObject("ADODB.Connection");
    var myRec = new ActiveXObject("ADODB.Recordset");

    mycon.Open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=App_data\\longueuilLife.mdb");
    var sql = "SELECT * FROM Members WHERE Email='" + email + "' AND Password='" + pass + "'";
    myRec.Open(sql, mycon);

    if (myRec.EOF) {// if empty that means no member found
        myRec.Close();
        mycon.Close();
        Session("MSGLogin")="Please Enter correct user name and password!";
        Response.Redirect("login.asp");
    }
    Session("MSGLogin")="";
    Session("txtEmail")=Request.QueryString("txtEmail").Item;
    //Session("txtEmail")=myRec.Fields("Email").Value;
    Session("refSender")=myRec.Fields("refMember").Value;
    Session("txtPassword")=Request.QueryString("txtPassword").Item;

    //Message

    var refMsg = parseInt(myRec.Fields("refMember").value);
    var sql3 = "SELECT * From Messeges WHERE Reciever="+refMsg+" AND [New]=Yes";
    var recMsg = new ActiveXObject("ADODB.Recordset");
    recMsg.Open(sql3, mycon,3,3);

    %>

<html class="no-js"> 
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


    	<style type="text/css">
.auto-style1 {
	float: left;
	margin-left: 96px;
   /*  margin-bottom: 1rem;*/
}
.auto-style2 {
	align-content: center;
	text-align: center;
	width: 50%;
	height: auto;
	margin-right: 4;
}
.auto-style3 {
	margin-left: 28px;
}
</style>


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
                                    <li><a href="#">Profile</a></li>
                                    <li><a href="Search.asp">Search</a></li>
                                    <li><a href="contact.html">Contact</a></li>
                                </ul>
                            </div>
                        </div>
	
                    
            </div>
            </div>
         
        
         <div class="container bg-white">
             
                <div class="row-fluid" >
                    
                    <div class="block">

                        
                         
                             <div id="formBody">
                                 <!--<img src="img/22.jpg" alt="profileIMG" style="align-content:center;" class="auto-style3" width="500" />--><br /><br />
                                 <form action="#" method="get" class="auto-style2">
                                   <!-- <div id="loginImg">
                                        <img src="img/profile.png" alt="profileIMG" />
                                    </div><br />-->
                                     
                                     <div class="auto-style1">
                                         <table>
                                             <thead>
                                                  <h2>Hello <%= myRec.Fields("FirstName").value %> </h2><br /><br />
                                                
                                                 
                                             </thead>
                                             <tr>
                                                 <td style="width: 132px">
                                                      <p> You have <label style="color:red;"><%= recMsg.RecordCount %> </label> unread messages!</p><br />
                                                 </td>
                                                 <td>
                                                     <a href="ReadMessage.asp?MsgID=<%= myRec.Fields("RefMember") %>"> Read Messages?</a>
                                                     <br /><a href="composeMessage.asp?"> Send Messages?</a>
                                                 </td>
                                               
                                             </tr>
                                             
                                            <tr>
                                                   <td style="width: 132px">You are </td>
                                                <td>
                                                    <% if(myRec.Fields("Gender").Value==1){ %>
                                                       
                                                        <input type="text"  value="A woman seeking man" readonly="readonly"/>
                                                    <%} %>
                                                    <% if(myRec.Fields("Gender").Value==2){ %>
                                                   
                                                        <input type="text"  value="A man seeking woman" readonly="readonly"/>
                                                    <%} %> 
                                                     <% if(myRec.Fields("Gender").Value==3){ %>
                                                        <input type="text"  value="A man seeking man" readonly="readonly"/>
                                                    <%} %> 
                                                     <% if(myRec.Fields("Gender").Value==4){ %>
                                                        <input type="text"  value="A woman seeking woman" readonly="readonly"/>
                                                    <%} %> 
                                                    
                                                </td>
                                            </tr>
                                                <tr>
                                                <td style="width: 132px">Looking for</td>
                                                <td>
                                                    <% if(myRec.Fields("LookingFor").Value==1){ %>
                                                        <input type="text"  value="Causual Dates" readonly="readonly"/>
                                                    <%} %>
                                                    <% if(myRec.Fields("LookingFor").Value==1){ %>
                                                        <input type="text"  value="Relationship" readonly="readonly"/>
                                                    <%} %>
                                                     <% if(myRec.Fields("LookingFor").Value==2){ %>
                                                        <input type="text"  value="Long-Term" readonly="readonly"/>
                                                    <%} %>
                                                    <% if(myRec.Fields("LookingFor").Value==3){ %>
                                                        <input type="text"  value="Friends" readonly="readonly"/>
                                                    <%} %> 
                                                    <% if(myRec.Fields("LookingFor").Value==4){ %>
                                                        <input type="text"  value="Hookup" readonly="readonly"/>
                                                    <%} %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 132px">Birth Date</td>
                                                <td>
                                                    <input type="text"  value="<%= myRec.Fields("BirthDay").Value %>" readonly="readonly"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 132px" >Email Address</td>
                                                <td>
                                                    <input type="text"  value="<%= myRec.Fields("Email").Value %>" readonly="readonly"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 132px">Height </td>
                                                <td>   
                                                    <% if(myRec.Fields("Height").Value==1){ %>
                                                        <input type="text"  value="Under 160cm" readonly="readonly"/>
                                                    <%} %>
                                                     <% if(myRec.Fields("Height").Value==2){ %>
                                                        <input type="text"  value="160cm -170cm" readonly="readonly"/>
                                                    <%} %>
                                                    <% if(myRec.Fields("Height").Value==3){ %>
                                                        <input type="text"  value="170cm - 180cm" readonly="readonly"/>
                                                    <%} %> 
                                                    <% if(myRec.Fields("Height").Value==4){ %>
                                                        <input type="text"  value="180cm - 190cm" readonly="readonly"/>
                                                    <%} %>
                                                    <% if(myRec.Fields("Height").Value==5){ %>
                                                        <input type="text"  value="190cm - 200cm" readonly="readonly"/>
                                                    <%} %>
                                                    <% if(myRec.Fields("Height").Value==6){ %>
                                                        <input type="text"  value="Over 200cm" readonly="readonly"/>
                                                    <%} %>
                                                   
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 132px">Body Type</td>
                                                <td>
                                                    <% if(myRec.Fields("BodyType").Value==1){ %>
                                                        <input type="text"  value="Athletic" readonly="readonly"/>
                                                    <%} %>
                                                    <% if(myRec.Fields("BodyType").Value==2){ %>
                                                        <input type="text"  value="Average" readonly="readonly"/>
                                                    <%} %>
                                                     <% if(myRec.Fields("BodyType").Value==3){ %>
                                                        <input type="text"  value="Curvy" readonly="readonly"/>
                                                    <%} %>
                                                    <% if(myRec.Fields("BodyType").Value==4){ %>
                                                        <input type="text"  value="Plus Size" readonly="readonly"/>
                                                    <%} %> 
                                                    <% if(myRec.Fields("BodyType").Value==5){ %>
                                                        <input type="text"  value="Slim" readonly="readonly"/>
                                                    <%} %> 
                                                      <% if(myRec.Fields("BodyType").Value==6){ %>
                                                        <input type="text"  value="Ask me later" readonly="readonly"/>
                                                    <%} %> 

                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 132px">Ethnicity</td>
                                                <td>
                                                    <% if(myRec.Fields("Ethnicity").Value==1){ %>
                                                        <input type="text"  value="Asian" readonly="readonly"/>
                                                    <%} %>
                                                    <% if(myRec.Fields("Ethnicity").Value==2){ %>
                                                        <input type="text"  value="American" readonly="readonly"/>
                                                    <%} %>
                                                    <% if(myRec.Fields("Ethnicity").Value==3){ %>
                                                        <input type="text"  value="Middle Eastern" readonly="readonly"/>
                                                    <%} %>
                                                    <% if(myRec.Fields("Ethnicity").Value==4){ %>
                                                        <input type="text"  value="African American" readonly="readonly"/>
                                                    <%} %> 
                                                    <% if(myRec.Fields("Ethnicity").Value==5){ %>
                                                        <input type="text"  value="African" readonly="readonly"/>
                                                    <%} %>
                                                    <% if(myRec.Fields("Ethnicity").Value==6){ %>
                                                        <input type="text"  value="Europian" readonly="readonly"/>
                                                    <%} %>
                                                     <% if(myRec.Fields("Ethnicity").Value==7){ %>
                                                        <input type="text"  value="Hispanle" readonly="readonly"/>
                                                    <%} %>
                                                

                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 132px">Religion</td>
                                                <td>
                                                    <% if(myRec.Fields("Religion").Value==1){ %>
                                                        <input type="text"  value="Christian" readonly="readonly"/>
                                                    <%} %>
                                                    <% if(myRec.Fields("Religion").Value==2){ %>
                                                        <input type="text"  value="Jawism" readonly="readonly"/>
                                                    <%} %>
                                                    <% if(myRec.Fields("Religion").Value==3){ %>
                                                        <input type="text"  value="Buddhist" readonly="readonly"/>
                                                    <%} %>
                                                    <% if(myRec.Fields("Religion").Value==4){ %>
                                                        <input type="text"  value="Atheist" readonly="readonly"/>
                                                    <%} %> 
                                                    <% if(myRec.Fields("Religion").Value==5){ %>
                                                        <input type="text"  value="Ask me later" readonly="readonly"/>
                                                    <%} %>
                                                    
                                                  
                                                </td>
                                            </tr>
                                                 <tr>
                                                <td style="width: 132px">I Smoke</td>
                                                <td>
                                                    <% if(myRec.Fields("SmokingHabit").Value==1){ %>
                                                        <input type="text"  value="Never" readonly="readonly"/>
                                                    <%} %>
                                                    <% if(myRec.Fields("SmokingHabit").Value==2){ %>
                                                        <input type="text"  value="Socially" readonly="readonly"/>
                                                    <%} %>
                                                    <% if(myRec.Fields("SmokingHabit").Value==3){ %>
                                                        <input type="text"  value="Regularly" readonly="readonly"/>
                                                    <%} %>
                                                    <% if(myRec.Fields("SmokingHabit").Value==4){ %>
                                                        <input type="text"  value="Trying to Quit" readonly="readonly"/>
                                                    <%} %> 
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 132px" >I Drink</td>
                                                <td>
                                                    <% if(myRec.Fields("DrinkingHabit").Value==1){ %>
                                                        <input type="text"  value="Never" readonly="readonly"/>
                                                    <%} %>
                                                    <% if(myRec.Fields("DrinkingHabit").Value==2){ %>
                                                        <input type="text"  value="Socially" readonly="readonly"/>
                                                    <%} %>
                                                    <% if(myRec.Fields("DrinkingHabit").Value==3){ %>
                                                        <input type="text"  value="Regularly" readonly="readonly"/>
                                                    <%} %>
                                                    <% if(myRec.Fields("DrinkingHabit").Value==4){ %>
                                                        <input type="text"  value="Trying To Quit" readonly="readonly"/>
                                                    <%} %>
                                                </td>
                                            </tr>
                                                <tr>
                                                <td style="width: 132px">Have Children</td>
                                                <td>
                                                    <% if(myRec.Fields("Children").Value==1){ %>
                                                        <input type="text"  value="Yes" readonly="readonly"/>
                                                    <%} %>
                                                    <% if(myRec.Fields("Children").Value==2){ %>
                                                        <input type="text"  value="No" readonly="readonly"/>
                                                    <%} %>
                                                </td>
                                            </tr>
                                                                                   
                                            <tr>
                                                <td style="width: 132px">Education</td>
                                                <td>
                                                    <% if(myRec.Fields("Education").Value==1){ %>
                                                        <input type="text"  value="High School" readonly="readonly"/>
                                                    <%} %>
                                                    <% if(myRec.Fields("Education").Value==2){ %>
                                                        <input type="text"  value="College" readonly="readonly"/>
                                                    <%} %>
                                                    <% if(myRec.Fields("Education").Value==3){ %>
                                                        <input type="text"  value="University" readonly="readonly"/>
                                                    <%} %>
                                                    <% if(myRec.Fields("Education").Value==4){ %>
                                                        <input type="text"  value="Master" readonly="readonly"/>
                                                    <%} %> 
                                                    <% if(myRec.Fields("Education").Value==5){ %>
                                                        <input type="text"  value="PHD" readonly="readonly"/>
                                                    <%} %>
                                                    <% if(myRec.Fields("Education").Value==6){ %>
                                                        <input type="text"  value="Other" readonly="readonly"/>
                                                    <%} %>
                                                </td>
                                            </tr>
                                           <tr>
                                                <td style="width: 132px">Annual Income</td>
                                                <td>
                                                    <% if(myRec.Fields("Income").Value==1){ %>
                                                        <input type="text"  value="UNDER $40k" readonly="readonly"/>
                                                    <%} %>
                                                    <% if(myRec.Fields("Income").Value==2){ %>
                                                        <input type="text"  value="$40K - $60K" readonly="readonly"/>
                                                    <%} %>
                                                     <% if(myRec.Fields("Income").Value==3){ %>
                                                        <input type="text"  value="$60K - $80K" readonly="readonly"/>
                                                    <%} %>
                                                    <% if(myRec.Fields("Income").Value==4){ %>
                                                        <input type="text"  value="$80K - $100K" readonly="readonly"/>
                                                    <%} %> 
                                                    <% if(myRec.Fields("Income").Value==5){ %>
                                                        <input type="text"  value="Over $100K" readonly="readonly"/>
                                                    <%} %>
                                                   
                                                </td>
                                            </tr>   
                                              <tr>
                                                 <td style="width: 132px">
                                                      <br /><p></p>
                                                 </td>
                                                 <td>
                                                     <br /><a href="composeMessage.asp?"> Send Messages?</a>
                                                 </td>
                                             </tr>                

                                         </table>
                                              <%

                                          recMsg.Close();
                                          //recMem.Close();
                                                 myRec.Close();
                                                 
                                                 
                                                mycon.Close();
                                                %>
                                      
                                     </div>

                                 </form>
                                 </div>      
                        
                        
                           <div id="loginImg">
                    <img src="img/dating5.jpg" alt="datingLogin" />
                               <img src="img/cute.jpg" alt="datingLogin" />
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
                                 
                                        <h4></h4>
                                        <h6>Have Fun!</h6>
                                      
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


