
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login</title>
      <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
      
     <style> 

  h3 {
  display: block;
  font-size: 1.17em;
  margin-left: 6em;
  
}
img.avatar {
  width: 72%;
  height: 400px;
  border-radius: 90%;
   margin-left:150px;
}

.outerDiv
			{
				
				 background-image: url(images/background1.jpg);
				height: 600px;
				width: 100%;
				margin: 0px auto;
				padding: 5px;
			}
			.leftDiv
			{
				
				 text-align: center;
                                 margin-top:2%;
				height: 53px;
				width: 50%;
				float: left;
			}
			.rightDiv
			{
                            background-color: #ffffff;
				
				height: 235px;
				width: 450px;
				float: right;
                                margin-right:20px;
                                margin-top:140px;
                                
			}	
                       
                        .btn1{
                            width: 100px;
                            height: 40px;
                            margin-left: 42px;
                            color: #006699;
                            text-align: center;
                            
                        }
                        .textRight{
                            text-align: right;
                        }
                        .button {
                            background-color: darkslategrey; /* Green */
                            border: none;
                            color: white;
                            padding: 10px 32px;
                            text-align: center;
                            text-decoration: none;
                            display: inline-block;
                            font-size: 16px;
                            margin: 4px 80px;
                            cursor: pointer;
                        }
                        
  </style>
    </head>
    <body>
        
        <form method="POST" action="LoginRegister">
            <div class="outerDiv">
                <h1 style="color: white; text-align: center;">Voice Of Arunnottimangalam </h1>
            <div class="leftDiv">
                <img src="images/logo1.jpg" alt="Avatar" class="avatar">
            </div>
             <div class="rightDiv">
                 <h3> Welcome to VOA</h3>
                  <h4 style="color: red;margin-left: 10px">${message}</h4>
                             <h4 style="color: green">${successMessage}</h4>
                <table>
                     
                <tr class="textRight">
                    <td >Username :</td>
                    <td> <input type="text" name="uname"></td>
                </tr> 
                <tr class="textRight">
                    <td >Password  :</td>
                    <td > <input type="password" name="password1"></td>
                </tr> 
               
                 <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                   <td></td>
                </tr>
                <tr>
                     <td class="textRight">
                         <div class="btn1"><input type="submit" name="submit" class="button" value="Sign In"></div>
                         </td>
                         <td class="textRight"> <a href="welcome.jsp?userType=New">New User</a></td>
                </tr> 
             
           
            </table>
           
            </div>   
            </div>
        </form>
    </body>
</html>
