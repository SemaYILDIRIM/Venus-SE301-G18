/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import UserManagement.User;
import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author SemaYıldırım
 */
public class UserTester {
    
    public UserTester() {
    }
    
//    @BeforeClass
//    public static void setUpClass() {
//    }
//    
//    @AfterClass
//    public static void tearDownClass() {
//    }
//    
//    @Before
//    public void setUp() {
//    }
//    
//    @After
//    public void tearDown() {
//    }

//     TODO add test methods here.
//     The methods must be annotated with annotation @Test. For example:
    
     @Test
     public void loginTesterValidUser() {
         User u=new User();
         String email="s@gmail.com";
         String password="123";
         u.login(email, password);
         int observer=u.getList().size();
         int expected=1;
         assertTrue(observer==expected);
        }
     @Test
     public void loginTesterinValidEmail() {
         User u=new User();
         String email="s@gmail.comassssssssssssssssssssssssssssssssssssssss";
         String password="123";
         u.login(email, password);
         int observer=u.getList().size();
         int expected=1;
         assertTrue(observer==expected);
        }
     @Test
     public void loginTesterinValidUser() {
         User u=new User();
         String email="s";
         String password="12das3";
         u.login(email, password);
         int observer=u.getList().size();
         int expected=0;
         assertTrue(observer==expected);
        }
     @Test
     public void ValidUserInValidPasswordloginTester() {
         User u=new User();
         String email="s@gmail.com";
         String password="11111111111111111112das3";
         u.login(email, password);
         int observer=u.getList().size();
         int expected=0;
         assertTrue(observer==expected);
        }
     @Test
     public void getValidUserIdTester(){
         User u=new User();
         int observer=u.getId("1");
         int expected=1;
         assertTrue(observer==expected);
     }
     @Test
     public void getinValidUserIdTester(){
         User u=new User();
         int observer=u.getId("0");
         int expected=0;
         assertTrue(observer==expected);
     }
     @Test
     public void getinValidUserNegativeIdTester(){
         User u=new User();
         int observer=u.getId("-200");
         int expected=0;
         assertTrue(observer==expected);
     }
      @Test
     public void getValidUserTester(){
         User u=new User();
         User nwObserver=u.getUser("1");
         u.setId(1);
         assertTrue(nwObserver.getId()== u.getId());
     }
     @Test
     public void getinValidUserTester(){
         User u=new User();
         User nwObserver=u.getUser("0");
         u.setId(0);
         assertTrue(nwObserver.getId()!= u.getId());
     }
      @Test
     public void getProUserTester(){
         User u=new User();
         List l=u.getProUser(2);
          assertTrue(l.size()>0);
     }
     @Test
     public void getnoProUserTester(){
         User u=new User();
         List l=u.getProUser(0);
          assertTrue(l.isEmpty());
     }
     @Test
     public void getnegativeInputProUserTester(){
         User u=new User();
         List l=u.getProUser(-10);
          assertTrue(l.isEmpty());
     }
     @Test
     public void getlongProUserTester(){
         User u=new User();
         List l=u.getProUser(-220);
          assertTrue(l.isEmpty());
     }
     
}
