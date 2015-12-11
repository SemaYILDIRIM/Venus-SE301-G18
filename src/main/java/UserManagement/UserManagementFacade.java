package UserManagement;

import java.util.Date;
import java.util.List;


public class UserManagementFacade {
    private User u=new User();
    
    /**
     * This method searchs the user Detail information  from database
     * by using searchString
     * context User inv:
     * @inv u.email=searchString
     * @pre u.searchString(searchString);
     * 
     */
    public List<User> SearchStaff(String searchString){
        return u.searchString(searchString);
      }
    
    /**
     * This method gets user Detail information  from database
     * context User inv:
     * @inv u.id=id
     * @pre u.getUser(id)
     * 
     */
    public User getUserInfo(String id){
        return u.getUser(id);
            }
    /**
     * This method saves the user to database
     * context User inv:
     * @inv u1.name=name
     * @inv u1.surname=surname
     * @inv u1.email=email
     * @inv u1.password=password
     * @inv u1.role=role
     * @pre u1.save()
     * 
     */
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
    /**
     * This method deletes the user from database
     * context User inv:
     * @inv u.id=id
     * u.setId(id)=self.id
     * @pre u.delete()
     * 
     */
    public void deleteUser(String id){
        u.setId(Integer.parseInt(id));
        u.delete();
        
        
    }
    
    
}
