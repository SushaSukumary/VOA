
<%@page contentType="text/html" pageEncoding="UTF-8"  import="java.util.*" import="java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        
      
        <style>
          
            .header img {
                        float: left;
                        width: 80px;
                        height: 78px;
                        background: #555;
            }
            
            
            .outerDiv{
			
			width: 100%;
			margin: 0px auto;
                        padding: 5px;
		}
			
			.rightDiv
			{
                            background-color: #ffffff;
				
				height: 545px;
				width: 80%;
				float: right;
                                margin-right:2px;
                                margin-top:1px;
                               
			}
  
                        
        </style>
        <script type="text/javascript">
        
      
        </script>
    </head>
    <body>
        
              <form method="POST" action="LoginRegister">
                 
                    <%
                        String  type = "";
                        if(request.getAttribute("userType")!= null){
                            type = request.getAttribute("userType").toString();
                        }else if(request.getParameter("userType") != null){
                            type = request.getParameter("userType"); 
                        }
                    
                          if( type!=null){
                            if( !type.equalsIgnoreCase("New")){
                               
                          %>
                   <div class="menu-bar">
                      	<div class="header">
                            <img src="images/voa_logo.jpg" alt="" />
                          </div>
                       <ul>
                           <li class="active"><a href=""><i class="fa fa-home"></i>Home</a></li>
                           <li><a href=""><i class="fa fa-user"></i>About Us</a>
                               <div class="sub-menu-1">
                                   <ul>
                                       <li><a href="#">Mission</a></li>
                                       <li><a href="#">Vission</a></li>
                                       <li><a href="#">Team</a></li>
                                   </ul>
                               </div>
                           
                           
                           
                           </li>
                            <li><a href=""><i class="fa fa-clone"></i>Services</a>
                                <div class="sub-menu-1">
                                   <ul>
                                       <li><a href="#">Add Services</a></li>
                                       <li><a href="#">View Services</a></li>
                                       <li><a href="#">Update Services</a></li>
                                       <li><a href="#">View Reports</a></li>
                                   </ul>
                               </div>
                            </li>
                            <li><a href=""><i class="fa fa-lock"></i>Admin</a> 
                                <div class="sub-menu-1">
                                   <ul>
                                       <li><a href="#">Add Admin</a></li>
                                       <li><a href="#">View Admin</a></li>
                                       <li><a href="#">Update Admin</a></li>
                                   </ul>
                               </div>
                            </li>
                            <li><a href=""><i class="fa fa-users"></i>Members</a>
                                <div class="sub-menu-1">
                                   <ul>
                                       <li><a href="#">Working Committy Members</a></li>
                                       <li><a href="#">Charity Board Members </a></li>
                                   </ul>
                               </div>
                            </li>
                            <li><a href=""><i class="fa fa-picture-o"></i>Gallary</a>
                                <div class="sub-menu-1">
                                   <ul>
                                       <li><a href="#">View Events</a></li>
                                       <li><a href="#">Add Event</a></li>
                                       <li><a href="#">Update Event</a></li>
                                   </ul>
                               </div>
                            </li>
                            <li><a href=""><i class="fa fa-phone"></i>Contact</a></li>
                            
                       </ul>
                       <a href="login.jsp" style="margin-right: 2px"><i class="fa fa-sign-out"></i>Sign Out</a>
                   </div>
                  
                        <%
                            }else{
                          %>
                                <div class="rightDiv">
                                    <jsp:include page="registration.jsp" /> 
                                 </div>  
                         <%
                             }
                           }
                         %>     
                        
        </form>
    </body>
</html>

