/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package capchar;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import javax.net.ssl.HttpsURLConnection;

/**
 *
 * @author ADMIN
 */
public class GoogleRecapchar {
    private static final String RECAPTCHA_SERVICE_URL = "https://www.google.com/recaptcha/api/siteverify";
	private static final String SECRET_KEY = "6LdZp8IeAAAAAF727ndDx1-Mh4eo-9P13jc-H28u";
	
	public static boolean isValid(String clientRecaptchaResponse) throws IOException, ParseException {
		if (clientRecaptchaResponse == null || "".equals(clientRecaptchaResponse)) {
			return false;
		}

		URL obj = new URL(RECAPTCHA_SERVICE_URL);
		HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();

		con.setRequestMethod("POST");
		con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");

		//add client result as post parameter
		String postParams =
				"secret=" + SECRET_KEY +
				"&response=" + clientRecaptchaResponse;

		// send post request to google recaptcha server
		con.setDoOutput(true);
		DataOutputStream wr = new DataOutputStream(con.getOutputStream());
		wr.writeBytes(postParams);
		wr.flush();
		wr.close();

		int responseCode = con.getResponseCode();

		System.out.println("Post parameters: " + postParams);
		System.out.println("Response Code: " + responseCode);

		BufferedReader in = new BufferedReader(new InputStreamReader(
				con.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();

		System.out.println(response.toString());

		//Parse JSON-response
		JSONParser parser = new JSONParser();
		JSONObject json = (JSONObject) parser.parse(response.toString());


		Boolean success = (Boolean) json.get("success");
		Double score = (Double) json.get("score");

		System.out.println("success : " + success);
		System.out.println("score : " + score);

		//result should be sucessfull and spam score above 0.5
		return (success && score >= 0.5);
        }
}
