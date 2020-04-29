
package org.voa.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.voa.DAOImpl.UserMasterDAOImpl;
import org.voa.entity.UserMaster;

/**
 *
 * @author Susha
 */
@WebServlet("/loginRegister")
public class LoginRegister extends HttpServlet {
    private static final long serialVersionUID= 1L;
    public LoginRegister(){
        
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserMasterDAOImpl userMasterDAOImpl = new UserMasterDAOImpl();
        String userName = request.getParameter("uname");
        String passWord = request.getParameter("password1");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String submitType= request.getParameter("submit");
        String userType  = request.getParameter("newUser");
       
        UserMaster userMaster = userMasterDAOImpl.getUser(userName, passWord);
        if(submitType.equals("Sign In") && userMaster !=null && userMaster.getName() != null){
           request.setAttribute("message", userMaster.getName());
           request.setAttribute("userType", "Old");
           request.getRequestDispatcher("welcome.jsp").forward(request, response);
       }else if(submitType.equals("Register")){
           if(userMaster !=null){
                userMaster.setName(name);
                userMaster.setUsername(userName);
                userMaster.setPassword(passWord);
                userMaster.setPhone(phone);
                userMaster.setEmail(email);
                userMaster.setUserType(userType);
                if(request.getParameter("role") !=null){
                   if("Admin".equals(request.getParameter("role"))){
                         userMaster.setAdminUser("Admin");
                   }else {
                       userMaster.setAdminUser("Member");
                   }  
                }
                 else{
                     userMaster.setAdminUser("Public");
                 }
                
                userMasterDAOImpl.createUser(userMaster);
                request.setAttribute("successMessage", "Registration done please login to continue!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
           }
          
       }else{
           request.setAttribute("message", "Invalid User,Click on Register!");
           request.getRequestDispatcher("login.jsp").forward(request, response);
       }
    }


}
