<%-- 
    Document   : registration
    Created on : Apr 26, 2020, 9:33:19 AM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*" import="java.io.*"%>
<!DOCTYPE html>
<html lang="ml" >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
         	
			
            table.center 
            {
                margin-left:auto; 
                margin-right:auto;
                margin-top:0;
                margin-bottom:0;
                background-color: #ccccff;
                width:1100px;
                height:610px;
                
            }
            h3 
            {
                 display: block;
                 font-size: 1.17em;
                 margin-left: 10em;
            }
            .btn1
            {
                width: 100px;
                height: 40px;
                margin-left: 42px;
                color: #006699;
                text-align: center;
                margin-left: 100px;
                margin-bottom: 20px
            }
            .button 
            {
                background-color: darkslategrey; 
                border: none;
                color: white;
                padding: 10px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 80px;
                cursor: pointer;
                position: absolute;
            }
   
              
                        
        </style>
    </head>
    <body>
              <form method="POST" action="LoginRegister">
                  
                  <div style="align-content: center;">
                        <table class="center" >
                             <tr>
                                 
                                 <td colspan="2" > <%String userType = request.getParameter("userType"); 
                            
                            if(userType.equals("New")){
                          %>
                                <h3> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;User Registration </h3> 
                         <%
                             }else if(userType.equals("Admin")){

                         %>
                   <h3> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Admin Registration </h3>  
                   <%
                       }
                       %>
                    </td>
                    <td></td>
                </tr>
                            
                            <tr>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;Name :</td>
                                <td> <input type="text" name="name" size="30"></td>
                            </tr> 
                              <tr>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;Username :</td>
                                <td> <input type="text" name="uname" size="30"></td>
                            </tr> 
                            <tr>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;Password  :</td>
                                <td> <input type="password" name="password1"size="30"></td>
                            </tr> 
                             <tr>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;Re-type Password  :</td>
                                <td> <input type="password" name="password2" size="30"></td>
                            </tr> 
                             <tr>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;Phone No  :</td>
                                <td> <input type="text" name="phone" size="30"></td>
                            </tr> 
                             <tr>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;Email  :</td>
                                <td> <input type="text" name="email" size="30"></td>
                            </tr> 
                           <%String type = request.getParameter("userType"); 
                            
                            if(!type.equals("New")){
                          %>
                            <tr>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;Are you in the admin panel?  :</td>
                                <td> <input type="checkbox" name="role"  value="Admin"></td>
                            </tr> 
                            <%
                                }
                                %>
                <tr>
                    <td colspan="2">
                         <div class="btn1"><input type="submit" name="submit" class="button"  value="Register"></div>
                         </td>
                      <td> </td>
                </tr>  

                        </table>
                  </div>
                      
                  
        </form>
    </body>
</html>
