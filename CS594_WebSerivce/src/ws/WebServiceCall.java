package ws;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class WebServiceCall {
	static String result1;
	public static void WSCall(String url) {
		try {
			
			URL url_weather = new URL(url);

			HttpURLConnection httpURLConnection = (HttpURLConnection) url_weather
					.openConnection();

			if (httpURLConnection.getResponseCode() == HttpURLConnection.HTTP_OK) {

				InputStreamReader inputStreamReader = new InputStreamReader(
						httpURLConnection.getInputStream());
				BufferedReader bufferedReader = new BufferedReader(
						inputStreamReader, 8192);
				String line = null;
				while ((line = bufferedReader.readLine()) != null) {
					result1 += line;
				}

				bufferedReader.close();

				// String weatherResult = ParseResult(result1);

				// System.out.println(weatherResult);


			} else {
				System.out
						.println("Error in httpURLConnection.getResponseCode()!!!");
			}

		} catch (Exception e) {

		}

	}

}
