import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ViewReviewsServlet")
public class ViewReviewsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Call MongoDBDataStoreUtilities method to fetch reviews
        String placeId = request.getParameter("placeId");

        boolean reviewlist = MongoDBDataStoreUtilities.reviewRead(placeId, request);

        // Forward the request to the displayReviews.jsp page
        request.getRequestDispatcher("readReviews.jsp").forward(request, response);
    }
}
