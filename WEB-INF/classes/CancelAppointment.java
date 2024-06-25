import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;

@WebServlet("/CancelAppointment")
public class CancelAppointment extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try
		{
            int appointmentID = Integer.parseInt(request.getParameter("id"));

            // System.out.println("appointment ID: " + appointmentID);

            boolean success = MySQLDataStoreUtilities.cancelAppointment(appointmentID);
            // System.out.println("appointmentID: " + request.getAttribute("appointmentID0"));
            
            if(success) {
                RequestDispatcher rd = request.getRequestDispatcher("HomeUser.jsp");
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
