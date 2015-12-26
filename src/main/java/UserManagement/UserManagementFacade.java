package UserManagement;

import HibernateSettings.HibernateUtil;
import common.VenusSession;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;


public class UserManagementFacade {
    private User u=new User();
                           
    public List<User> SearchStaff(String searchString){
        return u.searchString(searchString);
      }
    public User getUserInfo(String id){
        return u.getUser(id);
            }
    public void SaveUser(String name, String surname, String email, String password,String role){
       User u1 = new User();
       u1.setName(name);
       u1.setSurname(surname);
       u1.setEmail(email);
       u1.setPassword(password);
       u1.setRole(role);
       u1.setStatus(1);
       u1.setPhotoPath("");
       u1.setCreationDate(new Date());
       u1.setUpdateDate(new Date());
       u1.save();
    }
    public void deleteUser(String id){
        u.setId(Integer.parseInt(id));
        u.delete();
        
        
    }
    public String getpicture(String name){
       return u.getpicture(name);
    }
    
    
    public User getLoggedUser(){
       return VenusSession.getSession().getUser();
                
     
    }
   public String getUserEmail(int id){
       
     return u.getUserEmaill(id);
       
   }
    public boolean changeEmail(String email, String newemail){
        return u.changeEmaill(email, newemail);
    }
    public String getUserPassword(String email){
        
        return u.getUserPasswordd(email);
    }
    public boolean changePassword(String currentpassword, String newpassword){
        return u.changePasswordd(currentpassword, newpassword);
    }
    public User login(String name, String password){
        return u.loginn(name, password);
    }
    public List getAllUser(){
        return u.getAllUserr();
    }
    
    /**
     * @param sessionl the sessionl to set
     */
     public void setSessionl(HttpSession sessionl) {
        this.u.setSessionl(sessionl);
    }

    public User findById(Integer id){
        return u.findByIdd(id);
    }
}
