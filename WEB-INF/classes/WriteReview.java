import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/WriteReview")
public class WriteReview extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String placeId = request.getParameter("placeId");
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String type = request.getParameter("type");
        String reviewDate = request.getParameter("reviewDateString");
        String text = request.getParameter("text");
        int rating = Integer.parseInt(request.getParameter("rating"));

        MongoDBDataStoreUtilities.insertReview(name, username, placeId, rating, text, reviewDate, type);

        // Forward the request to the displayReviews.jsp page
        request.getRequestDispatcher("readReviews.jsp").forward(request, response);
    }
}
