import com.mongodb.MongoClient;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.DBCursor;
import com.mongodb.AggregationOutput;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.*;

public class MongoDBDataStoreUtilities {
    static DBCollection myReviews;
	
	public static DBCollection getConnection()
	{
		MongoClient mongo;
		mongo = new MongoClient("localhost", 27017);

		DB db = mongo.getDB("HealthPlus");
		myReviews= db.getCollection("ServiceReviews");
		return myReviews; 
	}


	public static String insertReview(String serviceName, String authorName, String placeID, int rating, String reviewText, String publishTime, String type)
	{
		try
		{		
			getConnection();
			BasicDBObject doc = new BasicDBObject("title", "myReviews").
			append("userName", authorName).
			append("serviceName", serviceName).
			append("placeID", placeID).
			append("rating", rating).
			append("reviewDate", publishTime).
			append("reviewText", reviewText).
			append("type", type);
			myReviews.insert(doc);
			return "Successfull";
		}
		catch(Exception e)
		{
			return "UnSuccessfull";
		}	
		
	}

    public static boolean reviewRead(String placeId, HttpServletRequest request){
        try
		{

			getConnection();

            BasicDBObject query = new BasicDBObject();
            query.put("placeID", placeId);

			DBCursor cursor = myReviews.find(query);

            int i = 0;
			while (cursor.hasNext())
			{
				BasicDBObject obj = (BasicDBObject) cursor.next();				

				request.setAttribute("serviceName"+i, obj.getString("serviceName"));
                request.setAttribute("userName"+i, obj.getString("userName"));
                request.setAttribute("placeID"+i, obj.getString("placeID"));
                request.setAttribute("rating"+i, obj.getInt("rating"));
                request.setAttribute("reviewDate"+i, obj.getString("reviewDate"));
                request.setAttribute("reviewText"+i, obj.getString("reviewText"));
                request.setAttribute("type"+i, obj.getString("type"));
                i++;
			}

            request.setAttribute("count", i); 
            return true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

        return false;
    }

    public static void deleteAllReviews() {
        try {
            getConnection();
            myReviews.remove(new BasicDBObject());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
