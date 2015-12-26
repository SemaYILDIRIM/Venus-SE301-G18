/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package common;

import UserManagement.User;

/**
 *
 * @author packard bell
 */
public class VenusSession {
    private static VenusSession session = new VenusSession();

    private UserManagement.User user;
    
    private VenusSession() {
    }
    
    public static VenusSession getSession() {
        return session;
    }

    public void setUser(User user) {
        System.out.println("Setting user->" + user);
        this.user = user;
    }

    public User getUser() {
        return user;
    }
}
