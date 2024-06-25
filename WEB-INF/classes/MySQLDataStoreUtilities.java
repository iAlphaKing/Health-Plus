import java.sql.*;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class MySQLDataStoreUtilities
{
	static Connection conn = null;
	static String message;
	public static String getConnection()
	{

		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/healthplus","root","root");						
			message="Successfull";
			return message;
		}
		catch(SQLException e)
		{
			message="unsuccessful";
			return message;
		}
		catch(Exception e)
		{
			message=e.getMessage();
			return message;
		}
	}

public static String login(String email, String hashedPassword, String usertype, String latitude, String longitude, HttpServletRequest request) {
	try {
		getConnection();

		PreparedStatement ps = conn.prepareStatement("select * from users where email=? and password=? and usertype=?");
        ps.setString(1, email);
        ps.setString(2, hashedPassword);
        ps.setString(3, usertype);

        ResultSet rs = ps.executeQuery();
        if(rs.next()) {
            HttpSession session = request.getSession();
            session.setAttribute("currentUser", rs.getInt("userid"));
            session.setAttribute("currentUserFirstname", rs.getString("firstname"));
            session.setAttribute("currentUserLastname", rs.getString("lastname"));
            session.setAttribute("currentUserAddress", rs.getString("address"));
            session.setAttribute("currentUserContact", rs.getLong("contact"));
            session.setAttribute("currentUserEmail", rs.getString("email"));
            session.setAttribute("currentUserType", rs.getString("usertype"));
            session.setAttribute("latitude", latitude);
            session.setAttribute("longitude", longitude);

            if(usertype.equals("customer"))
                return "/Health_Plus/HomeUser.jsp";

            return "/Health_Plus/HomeAdmin.jsp";
        }
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}

    return "/Health_Plus/login.html";
}

public static boolean bookAppointment(int userID, String date, String time, String name, String type, String contact, String address, String maps, String website) {
	try {
		getConnection();

        String bookingQuery = "insert into appointments (userid, date, time, name, type, contact, address, maps, website) values (?,?,?,?,?,?,?,?,?)";

		PreparedStatement ps = conn.prepareStatement(bookingQuery);
        ps.setInt(1, userID);
        ps.setString(2, date);
        ps.setString(3, time);
        ps.setString(4, name);
        ps.setString(5, type);
        ps.setString(6, contact);
        ps.setString(7, address);
        ps.setString(8, maps);
        ps.setString(9, website);

        ps.executeUpdate();

        return true;
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}

    return false;
}

public static boolean getAppointments(int userID, HttpServletRequest request) {
	try {
		getConnection();

		PreparedStatement ps = conn.prepareStatement("select * from appointments where userid=?");
        ps.setInt(1, userID);

        ResultSet rs = ps.executeQuery();
        int i = 0;
        if(rs.next()) {
            do {
                HttpSession session = request.getSession();
                request.setAttribute("appointmentID"+i, rs.getInt("appointmentId"));
                request.setAttribute("userID"+i, rs.getInt("userid"));
                request.setAttribute("date"+i, rs.getString("date"));
                request.setAttribute("time"+i, rs.getString("time"));
                request.setAttribute("name"+i, rs.getString("name"));
                request.setAttribute("type"+i, rs.getString("type"));
                request.setAttribute("contact"+i, rs.getString("contact"));
                request.setAttribute("address"+i, rs.getString("address"));

                i++;
            } while(rs.next());

            request.setAttribute("count", i);

            return true;
        }
        
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}

    return false;
}

public static boolean cancelAppointment(int appointmentID) {
	try {
		getConnection();

		PreparedStatement ps = conn.prepareStatement("delete from appointments where appointmentId=?");
        ps.setInt(1, appointmentID);

        ps.executeUpdate();

        return true; 
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}

    return false;
}

public static List<String> getSearch(String search) {
	List<String> results = new ArrayList<>();
    
    try {
		getConnection();

        String sql = "select * from services where name like ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, search + "%");
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            String name = rs.getString("name");
            String id = rs.getString("placeId");
            results.add(name + "," + id);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return results;
}

public static boolean storeServices(String placeId, String name, String address, String type, double rating, int ratingCount, String mapsUri, String contact, String website) {
	try {
		getConnection();

        String serviceQuery = "insert into services values (?,?,?,?,?,?,?,?,?)";

		PreparedStatement ps = conn.prepareStatement(serviceQuery);
        ps.setString(1, placeId);
        ps.setString(2, name);
        ps.setString(3, type);
        ps.setString(4, contact);
        ps.setString(5, address);
        ps.setString(6, mapsUri);
        ps.setString(7, website);
        ps.setDouble(8, rating);
        ps.setInt(9, ratingCount);

        ps.executeUpdate();

        return true;
	}
	catch(Exception e)
	{
		System.out.println("Fetched services for current user's location.\n");
	}

    return false;
}

public static boolean removeServices() {
	try {
		getConnection();

        String removeQuery = "delete from services";

		PreparedStatement ps = conn.prepareStatement(removeQuery);

        ps.executeUpdate();

        return true;
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}

    return false;
}

public static boolean getServices(String method, HttpServletRequest request, int count) {
    try {
		getConnection();

        String sql = "select * from services";
        PreparedStatement ps = conn.prepareStatement(sql);

        if(!method.equals("All")) {
            sql = "select * from services where type=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, method);
        }
        
        ResultSet rs = ps.executeQuery();
        int itr = 0;
        int i = 0;
        while (rs.next()) {
            itr = i + count;
            String placeId = rs.getString("placeId");
            String name = rs.getString("name");
            String type = rs.getString("type");
            String contact = rs.getString("contact");
            String address = rs.getString("address");
            String maps = rs.getString("maps");
            String website = rs.getString("website");
            Double rating = rs.getDouble("rating");
            int ratingCount = rs.getInt("ratingCount");

            request.setAttribute("placeId"+itr, placeId);
            request.setAttribute("name"+itr, name);
            request.setAttribute("address"+itr, address);
            request.setAttribute("type"+itr, type);
            request.setAttribute("rating"+itr, rating);
            request.setAttribute("ratingcount"+itr, ratingCount);
            request.setAttribute("maps"+itr, maps);
            request.setAttribute("contact"+itr, contact);
            request.setAttribute("website"+itr, website);

            i++;
        }

        itr = i + count;
        request.setAttribute("count", itr);

        return true;
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return false;
}

public static boolean getSearchService(String id, HttpServletRequest request) {
    try {
		getConnection();

        String sql = "select * from services where placeId=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, id);
        
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            String placeId = rs.getString("placeId");
            String name = rs.getString("name");
            String type = rs.getString("type");
            String contact = rs.getString("contact");
            String address = rs.getString("address");
            String maps = rs.getString("maps");
            String website = rs.getString("website");
            Double rating = rs.getDouble("rating");
            int ratingCount = rs.getInt("ratingCount");

            request.setAttribute("placeId0", placeId);
            request.setAttribute("name0", name);
            request.setAttribute("address0", address);
            request.setAttribute("type0", type);
            request.setAttribute("rating0", rating);
            request.setAttribute("ratingcount0", ratingCount);
            request.setAttribute("maps0", maps);
            request.setAttribute("contact0", contact);
            request.setAttribute("website0", website);
        }

        request.setAttribute("count", 1);

        return true;
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return false;
}

public static String changePassword(String oldPassword, String newPassword, HttpServletRequest request) {
    try {
        getConnection();

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("currentUserEmail");

        // Check if the old password matches the one in the database
        PreparedStatement checkPasswordPS = conn.prepareStatement("select * from users where email=? and password=?");
        checkPasswordPS.setString(1, email);
        checkPasswordPS.setString(2, oldPassword);

        ResultSet checkPasswordRS = checkPasswordPS.executeQuery();
        if (!checkPasswordRS.next()) {
            return "Incorrect old password";
        }

        // Update the password in the database
        PreparedStatement updatePasswordPS = conn.prepareStatement("update users set password=? where email=?");
        updatePasswordPS.setString(1, newPassword);
        updatePasswordPS.setString(2, email);

        int rowsAffected = updatePasswordPS.executeUpdate();
        if (rowsAffected > 0) {
            return "Password changed successfully";
        } else {
            return "Failed to change password";
        }
    } catch (SQLException e) {
        e.printStackTrace();
        return "Database error";
    } finally {
        // Close the database connection
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

}	