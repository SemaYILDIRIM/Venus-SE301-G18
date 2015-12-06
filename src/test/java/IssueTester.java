/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import IssueManagement.Issue;
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
public class IssueTester {
    
    public IssueTester() {
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
     public void getProjectIssueTester(){
         Issue issue=new Issue();
         List l2=issue.getIssueList(2);
         assertTrue(l2.size()>0);
     }
     @Test
     public void getProjectIssue2Tester(){
         Issue issue=new Issue();
         List l2=issue.getIssueList(20);
         assertFalse(l2.size()<0);
     }
     @Test
     public void getProjectIssueIVTester(){
         Issue issue=new Issue();
         List l2=issue.getIssueList(-1);
         assertTrue(l2.size()==0);
     }
     @Test
     public void getProjectIssueIV2Tester(){
         Issue issue=new Issue();
         List l2=issue.getIssueList(-1000);
         assertTrue(l2.size()==0);
     }
     @Test
     public void getIssueAssigneeListTester(){
         Issue issue=new Issue();
         List l2=issue.getIssueAssigneeList(1, 1);
         assertTrue(l2.size()>0);
     }
     @Test
     public void getIssueAssigneeListValidProjectTester(){
         Issue issue=new Issue();
         List l2=issue.getIssueAssigneeList(100000, 1);
         assertTrue(l2.size()==0);
     }
     @Test
     public void getIssueAssigneeListValidassigneeTester(){
         Issue issue=new Issue();
         List l2=issue.getIssueAssigneeList(1, 100000);
         assertTrue(l2.size()==0);
     }
     @Test
     public void getIssueAssigneeListinValidInputTester(){
         Issue issue=new Issue();
         List l2=issue.getIssueAssigneeList(10000, 100000);
         assertTrue(l2.size()==0);
     }
     @Test
     public void getIssueAssigneeListNegInputTester(){
         Issue issue=new Issue();
         List l2=issue.getIssueAssigneeList(-10, -10);
         assertTrue(l2.size()==0);
     }
}
