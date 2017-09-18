<%@ Language="javascript" %>

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
                            <form action="SearchResult.asp" method="get">

                                     <div class="textboxField ">
                                     
                                        
                                        <h2>Search</h2><br /><br />
                                            

                                         <p style="color:red;"><%= Session("resMSG") %></p>
                                          <div class="textboxField">
                                              <lable class="lableTextOne">Gender </lable><br />
                                             <select name="cboInterested" >
                                                 <option value="0">Gender</option>
                                                 <option value="1">A woman seeking man</option>
                                                 <option value="2">A man seeking woman</option>
                                                 <option value="3">A man seeking man</option>
                                                 <option value="3">A woman seeking woman</option>
                                             </select>

                                          </div>

                                          <!--Looking for-->
                                         <div class="textboxField">
                                              <lable>Looking for </lable><br />
                                             <select name="cbolookFor">
                                                 <option value="0">Select</option>
                                                 <option value="1">Casual Dates</option>
                                                 <option value="2">Relationship</option>
                                                 <option value="3">Long-Term</option>
                                                 <option value="4">Friends</option>
                                                 <option value="5">Hookups</option>
                                             </select>

                                          </div>
                                          <!--Height-->
                                         <div class="textboxField">
                                             <lable>Height(cm)</lable><br />
                                                <select name="cboHeight"  class="selectSmall">
                                                     <option value="0">Select</option>
                                                     <option value="1">Under 160cm</option>
                                                     <option value="2">160cm -170cm</option>
                                                     <option value="3">170cm - 180cm</option>
                                                     <option value="4">180cm - 190cm</option>
                                                     <option value="5">190cm - 200cm</option>
                                                    <option value="6">Over 200cm</option>
                                             </select>
                                         </div>
                                         <!--Body Type-->
                                         <div class="textboxField">
                                             <lable >Body Type</lable><br />
                                                   <select name="cboBodyType" >
                                                       <option value="0">Select</option>
                                                         <option value="1"> Athletic</option>
                                                         <option value="2"> Average</option>  
                                                          <option value="3"> Curvy</option>
                                                          <option value="4 "> Plus Size</option>
                                                          <option value="5"> Slim</option>
                                                          <option value="6"> Ask me later</option>
                                                   </select>
                                             
                                         </div>
                                      
                                          <!--Income-->
                                          <div class="textboxField">
                                              <lable>Annual Income </lable><br />
                                             <select name="cboIncome" >
                                                 <option value="0">Select</option>
                                                 <option value="1">Under $40K</option>
                                                 <option value="2">$40K - $60K</option>
                                                 <option value="3">$60K - $80K</option>
                                                 <option value="4">$80K - $100K</option>
                                                 <option value="4">Over $100K</option>
                                               
                                             </select>

                                          </div>

                            
                                     
                                         <!--SUBMIT PROFILE-->
                                         <div class="textboxField">
                                         <div id="joinSignup1">
                                             <input type="submit" class="btn btn-danger" value="             Submit            ">
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
                                 
                                        <h4>MEET  SINGLES!</h4>
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


