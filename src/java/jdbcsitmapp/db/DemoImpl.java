/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jdbcsitmapp.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author docente
 */
public class DemoImpl {
/*
    public static void save(Demo demo) throws ClassNotFoundException, SQLException {
        Connection connect = JdbcConnect.connect();
        PreparedStatement pst = connect.prepareStatement("Insert into "
                + "demo values(?,?,?,?)");
        pst.setInt(1, demo.getId());
        pst.setString(2, demo.getName());
        pst.setString(3, demo.getLastName());
        pst.setTimestamp(4, new Timestamp(demo.getBirthDay().getTime()));
        pst.executeUpdate();

    }

    public static void delete(Demo demo) throws ClassNotFoundException, SQLException {
        Connection connect = JdbcConnect.connect();
        PreparedStatement pst = connect.prepareStatement("Delete from "
                + "demo where id=?");
        pst.setInt(1, demo.getId());

        pst.executeUpdate();

    }

    public static Demo consultar(Demo demo) throws ClassNotFoundException, SQLException, ParseException {
        Connection connect = JdbcConnect.connect();

        String query = "SELECT * FROM demo where id =" + demo.getId();

        Statement st = connect.createStatement();
        Demo p1 = new Demo();
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("name");
            String lastname = rs.getString("lastname");
            String birthday = rs.getString("birthday");

            String modelo = "MM-dd-yyyy";;
            SimpleDateFormat formato = new SimpleDateFormat(modelo);
            Date date = formato.parse(birthday);
            p1 = new Demo(id, name, lastname, date);
        }
        st.close();
        return p1;
    }

    public static void update(Demo demo) throws ClassNotFoundException, SQLException {
        Connection connect = JdbcConnect.connect();
        PreparedStatement pst = connect.prepareStatement("update  "
                + "demo set name =?, lastname=?,birthday=? where id=?");
        pst.setInt(4, demo.getId());
        pst.setString(1, demo.getName());
        pst.setString(2, demo.getLastName());
        pst.setTimestamp(3, new Timestamp(0));
        pst.executeUpdate();

    }
*/
}
