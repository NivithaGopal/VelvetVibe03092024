package dao;

import bean.GalleryBean;
import dbconnection.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.ResultSet;
import com.mysql.jdbc.Statement;

public class GalleryDAO {

    // Method to add a new gallery entry
    public boolean addGallery(GalleryBean gallery) {
        String query = "INSERT INTO gallery (image1, image2) VALUES (?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, gallery.getImage1());
            ps.setString(2, gallery.getImage2());
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
 // Method to retrieve all gallery entries
    public List<GalleryBean> getAllGalleries() {
        List<GalleryBean> galleries = new ArrayList<>();
        String query = "SELECT * FROM gallery";
        try (Connection con = DBConnection.getConnection();
             Statement stmt = (Statement) con.createStatement();
             ResultSet rs = (ResultSet) stmt.executeQuery(query)) {
            while (rs.next()) {
                GalleryBean gallery = new GalleryBean();
                gallery.setGalleryId(rs.getInt("gallery_id"));
                gallery.setImage1(rs.getString("image1"));
                gallery.setImage2(rs.getString("image2"));
                galleries.add(gallery);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return galleries;
    }
}
