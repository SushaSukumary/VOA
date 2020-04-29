/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.voa.db.connection;

/**
 *
 * @author susha
 */
public interface MyProvider {
    String username="postgres";
    String password="admin";
    String connUrl = "jdbc:postgresql://localhost:5432/postgres";//mysql
}
