import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet("/Login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try
		{
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String usertype = request.getParameter("usertype");
            String latitude = request.getParameter("latitude");
            String longitude = request.getParameter("longitude");

            // System.out.println("latitude: " + latitude);
            // System.out.println("longitude: " + longitude);

            String hashedPassword = hashPassword(password);

            String redirectPage = MySQLDataStoreUtilities.login(email, hashedPassword, usertype, latitude, longitude, request);

            if(redirectPage.contains("Home")) {
                fetchServices(request);
            }
            
            // System.out.println("Redirect To: " + redirectPage);
            response.getWriter().write(redirectPage);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
    }

     private String hashPassword(String pwd) {
        try {
            // Create MessageDigest instance for SHA-256
            MessageDigest md = MessageDigest.getInstance("SHA-256");

            // Add password bytes to digest
            md.update(pwd.getBytes());

            // Get the hash's bytes
            byte[] bytes = md.digest();

            // Convert byte array to a string
            return Base64.getEncoder().encodeToString(bytes);

        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }

    private void fetchServices(HttpServletRequest request) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String apiKey = "AIzaSyAOhwrEXTnNLnDT2UT3_9ccsuufod3GaDk";

        // Construct the URL
        String url = "https://places.googleapis.com/v1/places:searchNearby";

        String[] includedTypes = { "hospital", "fitness_center", "dental_clinic", "dentist", "doctor",
                "medical_lab", "physiotherapist", "spa", "gym", "sports_club", "swimming_pool",
                "drugstore", "pharmacy" };
        JSONArray allResults = new JSONArray();

        for (String type : includedTypes) {

            // Construct the request parameters
            String requestBody = "{\n" +
                    "  \"includedTypes\": [\"" + type + "\"],\n" +
                    "  \"maxResultCount\": 20,\n" +
                    "  \"locationRestriction\": {\n" +
                    "    \"circle\": {\n" +
                    "      \"center\": {\n" +
                    "        \"latitude\":" + session.getAttribute("latitude") + ",\n" +
                    "        \"longitude\":" + session.getAttribute("longitude") + "\n" +
                    "      },\n" +
                    "      \"radius\": 5000.0\n" +
                    "    }\n" +
                    "  }\n" +
                    "}";

            // Create the connection
            URL obj = new URL(url);
            HttpURLConnection connection = (HttpURLConnection) obj.openConnection();

            // Set the request method and headers
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setRequestProperty("X-Goog-Api-Key", apiKey);
            connection.setRequestProperty("X-Goog-FieldMask",
                    "places.id,places.displayName,places.formattedAddress,places.primaryType,"
                            + "places.rating,"
                            + "places.userRatingCount,"
                            + "places.googleMapsUri,"
                            // + "places.currentOpeningHours,"
                            + "places.nationalPhoneNumber,"
                            + "places.websiteUri,"
                            + "places.reviews,"
                            // + "places.photos,"
                            + "places.types");

            // Enable input/output streams
            connection.setDoOutput(true);

            // Write the request body
            try (OutputStream os = connection.getOutputStream()) {
                byte[] input = requestBody.getBytes("utf-8");
                os.write(input, 0, input.length);
            } catch (Exception e) {
                e.printStackTrace();
            }

            // Get the response
            int responseCode = connection.getResponseCode();

            try (BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
                StringBuilder responseStringBuilder = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                    responseStringBuilder.append(line);
                }
                String responseString = responseStringBuilder.toString();

                JSONObject jsonResponse = new JSONObject(responseString);

                // Access data from the response
                JSONArray results = jsonResponse.getJSONArray("places");

                // Add the results to the allResults array
                for (int i = 0; i < results.length(); i++) {
                    allResults.put(results.getJSONObject(i));
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                // Close the connection
                connection.disconnect();
            }
        }

        // System.out.println("--------------------------------\n" + allResults.getJSONObject(0));
        // System.out.println("--------------------------------\n\n\nLength: " +
        // results.length());

        for (int i = 0; i < allResults.length(); i++) {
            JSONObject place = allResults.getJSONObject(i);

            String placeId = place.getString("id");
            String name = place.getJSONObject("displayName").getString("text");
            String address = place.getString("formattedAddress");
            JSONArray types = place.has("types") ? place.getJSONArray("types") : null;
            String type = place.has("primaryType") ? place.getString("primaryType") : "Health";
            Double rating = place.has("rating") ? place.getDouble("rating") : 0.0;
            int ratingCount = place.has("userRatingCount") ? place.getInt("userRatingCount") : 0;
            String mapsUri = place.getString("googleMapsUri");
            // JSONArray timings = place.has("currentOpeningHours") ?
            // place.getJSONObject("currentOpeningHours").getJSONArray("weekdayDescriptions")
            // : null;
            String contact = place.has("nationalPhoneNumber") ? place.getString("nationalPhoneNumber")
                    : "Contact Not Found";
            String website = place.has("websiteUri") ? place.getString("websiteUri") : "Website Not Found";

            // System.out.println("Types: " + types);
            // System.out.println("Place ID: " + placeId);
            // System.out.println("Name: " + name);
            // System.out.println("Address: " + address);
            // System.out.println("Type: " + type);
            // System.out.println("Rating: " + rating);
            // System.out.println("Rating Count: " + ratingCount);
            // System.out.println("Maps URL: " + mapsUri);
            // // System.out.println("Timings: " + timings);
            // System.out.println("Contact: " + contact);
            // System.out.println("Website URL: " + website);

            boolean success = MySQLDataStoreUtilities.storeServices(placeId, name, address, type, rating, ratingCount,
                    mapsUri, contact, website);

            JSONArray reviewsArray = place.has("reviews") ? place.getJSONArray("reviews") : null;

            if(reviewsArray != null){
                for (int j = 0; j < reviewsArray.length(); j++) {
                    JSONObject review = reviewsArray.getJSONObject(j);

                    String text = review.has("originalText") ? review.getJSONObject("originalText").getString("text") : "";

                    // System.out.println("Review " + (j + 1) + " Text: " + text);

                    String userName = review.getJSONObject("authorAttribution").getString("displayName");
                    int userRating = review.getInt("rating");
                    String reviewTime = review.getString("relativePublishTimeDescription");

                    MongoDBDataStoreUtilities.insertReview(name, userName, placeId, userRating, text, reviewTime, type);
                }
            }

            // System.out.println("Services Stored in Table: " + success);
        }
    }
}
