import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;

@WebServlet("/BookAppointment")
public class BookAppointment extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try
		{
            HttpSession session = request.getSession();

            int userID = (Integer) session.getAttribute("currentUser");
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            String name = request.getParameter("name");
            String type = request.getParameter("type");
            String contact = request.getParameter("contact");
            String address = request.getParameter("address");
            String maps = request.getParameter("maps");
            String website = request.getParameter("website");

            // System.out.println("userID: " + userID);
            // System.out.println("date: " + date);
            // System.out.println("time: " + time);
            // System.out.println("name: " + name);
            // System.out.println("type: " + type);
            // System.out.println("contact: " + contact);
            // System.out.println("address: " + address);
            // System.out.println("maps: " + maps);
            // System.out.println("website: " + website);

            boolean success = MySQLDataStoreUtilities.bookAppointment(userID, date, time, name, type, contact, address, maps, website);
            
            if(success) {
                request.setAttribute("date", date);
                request.setAttribute("time", time);
                RequestDispatcher rd = request.getRequestDispatcher("BookingSuccess.jsp");
                rd.forward(request,response);
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("HomeUser.jsp");
                rd.forward(request,response);
            }
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
    }
}
