/*
 * UserController.java
 *
 * Created on March 6, 2006, 5:51 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package java.org.uta.sams.controller;

import java.sql.SQLException;
import java.org.uta.sams.beans.UserBean;
import java.org.uta.sams.dbconnection.UserDBManager;

/**
 *
 * @author Administrator
 */
public class UserController {
    
    /** Creates a new instance of maUserController */
    public UserController() {
    }
    
    public UserBean check(UserBean userbean){
        UserDBManager userdbmanager= new UserDBManager();
        UserBean ub;
        try {
            ub = userdbmanager.getUser(userbean.getUsername());
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
            return null;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
       // if(ub==null)return ub;
       // if(ub.isCorrectPassword(userbean.getPassword()))return ub;
       // else
       //     return null;
        return ub;
        
    
    }
    
}
