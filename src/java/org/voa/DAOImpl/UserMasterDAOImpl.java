/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.voa.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import org.voa.db.connection.MyConnectionProvider;
import org.voa.entity.UserMaster;
import org.voa.DAO.UserMasterDAO;

/**
 *
 * @author lenovo
 */
public class UserMasterDAOImpl implements UserMasterDAO{

    static Connection con;
    static PreparedStatement ps;
    ResultSet rs = null;
    int userId = 0;
    String userName = null;
    @Override
    public int createUser(UserMaster us) {
        int status =0;
        try{
            con= MyConnectionProvider.getConnection();
            ps = con.prepareStatement("insert into voa_schema.user_master(username,password,name,email,phone,created_on,last_login)"
                    + " values(?,?,?,?,?,?,?)");
            
            ps.setString(1, us.getUsername());
            ps.setString(2, us.getPassword());
            ps.setString(3, us.getName());           
            ps.setString(4, us.getEmail());
            ps.setString(5, us.getPhone());
            LocalDate localDate = LocalDate.now();
            ps.setObject(6, localDate);
            ps.setObject(7, localDate);
            status=ps.executeUpdate();
            if(status > 0){
                rs  = ps.getGeneratedKeys();
                if(!rs.next()){
                } else {
                    userId = rs.getInt(1);
                    userName = rs.getString(2);
                    switch (us.getAdminUser()) {
                        case "Admin":
                            ps = con.prepareStatement("insert into voa_schema.user_role(user_id ,role_id,grant_date )\n" +
                                    "select grant_date, u.user_id, r.role_id\n" +
                                    "from voa_schema.user_master u,voa_schema.role r\n" +
                                    "where r.role_name = 'admin'\n" +
                                    "and u.username = userName");
                            break;
                        case "Member":
                            ps = con.prepareStatement("insert into voa_schema.user_role(user_id ,role_id,grant_date )\n" +
                                    "select grant_date, u.user_id, r.role_id\n" +
                                    "from voa_schema.user_master u,voa_schema.role r\n" +
                                    "where r.role_name = 'member'\n" +
                                    "and u.username = userName");
                            break;
                        default:
                            ps = con.prepareStatement("insert into voa_schema.user_role(user_id ,role_id,grant_date )\n" +
                                    "select grant_date, u.user_id, r.role_id\n" +
                                    "from voa_schema.user_master u,voa_schema.role r\n" +
                                    "where r.role_name = 'public'\n" +
                                    "and u.username = userName");
                            break;
                    }
                    status=ps.executeUpdate();
                    con.close();
                    ps.close();
                }
            }
            
        }catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            try {
                if(rs != null)
                    rs.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
        return status;
      
    }

    @Override
    public UserMaster getUser(String username, String password) {
        UserMaster user= new UserMaster();
        try{
            con = MyConnectionProvider.getConnection();
            System.out.println("Connection"+con.getSchema());
            ps = con.prepareStatement("select  um.user_id,um.name,um.username,um.email,um.phone,ur.role_id from voa_schema.user_master um "
                    + "inner join voa_schema.user_role ur on um.username=? and um.password=? and um.user_id = ur.user_id");
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                user.setUserId(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setRoleId(rs.getInt("role_id"));
            }        
        }catch(SQLException e ){
            System.out.println(e);
        }
        return user;
    }
    
}
