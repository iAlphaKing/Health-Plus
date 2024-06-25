import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class ChatbotClient {

    public String sendMessageToChatbot(String message) {
        try {
            // Replace with your chatbot API URL
            String apiUrl = "https://your-chatbot-api-url";
            URL url = new URL(apiUrl);

            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setDoOutput(true);

            // Replace with your chatbot API key or authentication headers
            connection.setRequestProperty("Authorization", "Bearer your-api-key");

            // Construct the request payload
            String payload = "{\"message\": \"" + message + "\"}";

            // Send the request
            connection.getOutputStream().write(payload.getBytes("UTF-8"));

            // Read the response
            BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            StringBuilder response = new StringBuilder();
            String line;

            while ((line = reader.readLine()) != null) {
                response.append(line);
            }

            reader.close();

            return response.toString();
        } catch (Exception e) {
            e.printStackTrace();
            return "Error communicating with the chatbot.";
        }
    }
}
