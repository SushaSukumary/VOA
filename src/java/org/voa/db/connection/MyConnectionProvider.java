/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.voa.db.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Susha
 */
public class MyConnectionProvider implements MyProvider{
    static Connection con = null;
    public static Connection getConnection(){
        try{
           Class.forName("org.postgresql.Driver");//com.mysql.jdbc.Driver
           con = DriverManager.getConnection(connUrl,username,password);
           System.out.println("Connected to the PostgreSQL server successfully.");
        }catch(ClassNotFoundException | SQLException e){
           System.out.println(e.getMessage()); 
            
        }
        return con;
        
    }
}
