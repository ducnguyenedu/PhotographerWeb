/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Gallery;
import model.Image;

/**
 *
 * @author duchi
 */
public class DAOGallery extends DBContext {

    public boolean insertGalleary(Gallery gallery) {
        boolean isSuc = false;
        System.out.println("isRun");
        try {
            String sql = "DECLARE @name varchar(150) = ? \n"
                    + "DECLARE @description varchar(150) = ? \n"
                    + "INSERT INTO [dbo].[Gallery]\n"
                    + "           ([name]\n"
                    + "           ,[description])\n"
                    + "     VALUES\n"
                    + "           (@name\n"
                    + "           ,@description)\n"
                    + "DECLARE @gid int = 0\n"
                    + "SET @gid = (SELECT COUNT(id) FROM [dbo].[Gallery])\n"
                    + "\n";
            for (Image image : gallery.getImages()) {
                System.out.println("is Run img");
                sql = sql + "INSERT INTO [dbo].[Image]\n"
                        + "           ([Filepic]\n"
                        + "           ,[gid])\n"
                        + "     VALUES\n"
                        + "           (?\n"
                        + "           ,@gid)";
            }

            PreparedStatement stm = connection.prepareStatement(sql);
            int index = 1;
            stm.setString(index, gallery.getName());
            index++;
            stm.setString(index, gallery.getDescription());
            index++;
            for (Image image : gallery.getImages()) {
                stm.setBytes(index, image.getImage());
                index++;
            }
            int count = stm.executeUpdate();
            isSuc = count > 0;
            System.out.println("dal.DAOGallery.insertGalleary()  " + count);
        } catch (SQLException ex) {
            Logger.getLogger(DAOGallery.class.getName()).log(Level.SEVERE, null, ex);
        }

        return isSuc;
    }

    public ArrayList<Gallery> getFrontPageDisplay() {
        ArrayList<Gallery> gallerys = new ArrayList<>();
        try {
            String sql = "SELECT g.[id] as id, g.[name] as gname, g.[description] as gdescription, m.[id] as iid, m.[Filepic] as picdata\n"
                    + "  FROM [dbo].Gallery g\n"
                    + "  OUTER APPLY \n"
                    + "  (SELECT TOP 1 * \n"
                    + "    FROM [Image] i\n"
                    + "    WHERE i.[gid] = g.[id]\n"
                    + "    )\n"
                    + "   m ";

            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {

                int id = rs.getInt("id");
                String gname = rs.getString("gname");
                String gdescription = rs.getString("gdescription");
                Gallery gallery = new Gallery(id, gname, gdescription);
                int iid = rs.getInt("iid");
                byte[] encode = rs.getBytes("picdata");
                Image image = new Image(iid, encode);

                gallery.getImages().add(image);
                gallerys.add(gallery);

            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOGallery.class.getName()).log(Level.SEVERE, null, ex);
        }
        return gallerys;

    }

    public ArrayList<Gallery> getGallerys() {
        ArrayList<Gallery> gallerys = new ArrayList<>();
        try {
            String sql = "SELECT g.[id] as gid\n"
                    + "      ,g.[name]\n"
                    + "      ,g.[description]\n"
                    + "	  ,i.[id]\n"
                    + "	  ,i.[Filepic]\n"
                    + "  FROM [dbo].[Gallery] g INNER JOIN [dbo].[Image] i ON g.id = i.gid\n"
                    + "  ORDER By gid";

            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            Gallery gallery = new Gallery();
            while (rs.next()) {

                int id = rs.getInt("gid");
                if (id != gallery.getId()) {
                    gallery = new Gallery();
                    String gname = rs.getString("name");
                    String gdescription = rs.getString("description");
                    gallery.setId(id);
                    gallery.setName(gname);
                    gallery.setDescription(gdescription);
                    gallerys.add(gallery);
                }
                int iid = rs.getInt("id");
                byte[] encode = rs.getBytes("Filepic");
                Image image = new Image(iid, encode);

                gallery.getImages().add(image);
                

            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOGallery.class.getName()).log(Level.SEVERE, null, ex);
        }
        return gallerys;
    }
}
