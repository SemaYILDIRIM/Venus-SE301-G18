/*
 * To change this license header, choose License Headers in ProjectTester Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import proman.Project;

/**
 *
 * @author SemaYıldırım
 */
public class ProjectTester {
    
    public ProjectTester() {
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
     @Test
     public void getvalidProUserTester(){
         Project p=new Project();
         List l1=p.getProjects(2);
         assertTrue(l1.size()>0);
     } 
     @Test
     public void getlongProUserTester(){
         Project p=new Project();
         List l1=p.getProjects(1212);
         assertTrue(l1.size()==0);
     } 
     @Test
     public void getnegativeProUserTester(){
         Project p=new Project();
         List l1=p.getProjects(-2);
         assertTrue(l1.size()==0);
     } 
     @Test
     public void getnegProUserTester(){
         Project p=new Project();
         List l1=p.getProjects(-2000);
         assertTrue(l1.size()==0);
     }
     @Test
     public void getProDetailTester(){
         Project p=new Project();
         Project l1=p.getProjectDetails(1);
         assertTrue(l1.getId()==1);
     }
     @Test
     public void getinValidProDetailTester(){
         Project p=new Project();
         Project l1=p.getProjectDetails(1000);
         assertTrue(l1.getId()!=1000);
     }
     @Test
     public void getValidNameProDetailTester(){
         Project p=new Project();
         Project l1=p.getProjectDetails(1);
         assertTrue(l1.getName().equals("project"));
     }
     @Test
     public void getinValidNameProDetailTester(){
         Project p=new Project();
         Project l1=p.getProjectDetails(1000);
         assertTrue(!l1.getName().equals("Project1"));
     }
     @Test
     public void getinValidDescriptionProDetailTester(){
         Project p=new Project();
         Project l1=p.getProjectDetails(1000);
         assertTrue(!l1.getName().equals("Project1Description"));
     }
}
