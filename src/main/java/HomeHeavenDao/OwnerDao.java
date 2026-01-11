package HomeHeavenDao;

import HomeHeavenmodel.Owner;
import HomeHeaven.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class OwnerDao{

    public boolean registerOwner(Owner owner) {
        String sql = "INSERT INTO owners(name,email,phone,dob,id_type,id_number,password) VALUES (?,?,?,?,?,?,?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, owner.getName());
            ps.setString(2, owner.getEmail());
            ps.setString(3, owner.getPhone());
            ps.setString(4, owner.getDob());
            ps.setString(5, owner.getIdType());
            ps.setString(6, owner.getIdNumber());
            ps.setString(7, owner.getPassword());

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
