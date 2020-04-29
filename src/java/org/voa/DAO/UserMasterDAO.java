/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.voa.DAO;

import org.voa.entity.UserMaster;

/**
 *
 * @author Susha
 */
public interface UserMasterDAO {
   public int createUser(UserMaster us);
   public UserMaster getUser(String username,String password);
}
