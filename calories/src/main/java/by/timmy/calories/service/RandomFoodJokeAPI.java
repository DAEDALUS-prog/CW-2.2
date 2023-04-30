package by.timmy.calories.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONObject;

public class RandomFoodJokeAPI {
    
    public String getJoke() {
        String joke = null;
        try {
            URL url = new URL("https://api.spoonacular.com/food/jokes/random?apiKey=c9ec5e68c1e841a59ae29be71d052a47&maxLength=30");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");

            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String inputLine;
            StringBuffer content = new StringBuffer();
            while ((inputLine = in.readLine()) != null) {
                content.append(inputLine);
            }
            in.close();
            connection.disconnect();

            JSONObject jsonObj = new JSONObject(content.toString());
            String jokeJson = jsonObj.toString(4);
            JSONObject jsonObject = new JSONObject(jokeJson);
            joke = jsonObject.getString("text");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return joke;
    }
}
