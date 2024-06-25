import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;

import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet("/SearchServices")
public class SearchServices extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String id = request.getParameter("id");

            boolean success = MySQLDataStoreUtilities.getSearchService(id, request);

            if(success) {
                RequestDispatcher rd = request.getRequestDispatcher("AllServices.jsp");
                rd.forward(request,response);
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("HomeUser.jsp");
                rd.forward(request,response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
