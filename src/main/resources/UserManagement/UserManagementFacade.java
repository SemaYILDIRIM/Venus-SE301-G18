package UserManagement;

import java.util.Date;
import java.util.List;


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
    
}
