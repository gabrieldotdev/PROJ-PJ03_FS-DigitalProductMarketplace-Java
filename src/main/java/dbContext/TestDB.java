package dbContext;
import DAO.UserDAO;
import model.User;
import java.util.List;

public class TestDB {
    public static void main(String[] args) {
        UserDAO user = new UserDAO();
        List<User> listUser = user.getAllUsers();
        for (User item: listUser) {
            System.out.println(item.toString());
        }
    }
}