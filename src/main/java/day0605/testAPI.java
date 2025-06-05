package day0605;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONArray;
import org.json.JSONObject;

public class testAPI {
	
	private static String callGeminiApi(String prompt) throws Exception {
		String urlString = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=AIzaSyBP2X5LTWKddvQrGrOQy57JuztCULDZ1Hk";
		
		URL url = new URL(urlString);
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		
		conn.setRequestMethod("POST"); // POST방식
		conn.setRequestProperty("Content-Type", "application/json"); // json 형태로 출력(?)
		conn.setDoOutput(true); // ?
		
		// JSON 형식이 올바른지 확인.
		String jsonInputStr = String.format("{\"contents\": [{\"parts\": [{\"text\": \"%s\"}]}]}", prompt.replace("\n", "\\n"));
		
		try(OutputStream os = conn.getOutputStream()) {
			byte[] input = jsonInputStr.getBytes("UTF-8");
			os.write(input, 0, input.length);
		}// end try
		
		int responseCode = conn.getResponseCode(); // 응답 코드?
		
		if (responseCode == 200) { // 응답 성공(200)
		
			try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"))) {
				StringBuilder response = new StringBuilder();
				String responseLine;
				
				while ((responseLine = br.readLine()) != null) {
					response.append(responseLine.trim());
				}// end while
				
				// JSON 응답에서 메시지만 추출
				JSONObject jsonResponse = new JSONObject(response.toString());
				
				if(jsonResponse.has("candidates")) {
					JSONArray candidates = jsonResponse.getJSONArray("candidates");
					StringBuilder message = new StringBuilder();
					
					for (int i = 0; i < candidates.length(); i++) {
						JSONObject content = candidates.getJSONObject(i).getJSONObject("content");
						JSONArray parts = content.getJSONArray("parts");
						
						for (int j = 0; j < parts.length(); j++) {
							message.append(parts.getJSONObject(j).getString("text")).append("\n");
						}// end for
					}// end for
					return message.toString().trim();
				} else {
					return "No candidates found in the response.";
				}// end else-if
				
			}// end try
			
		} else if (responseCode == 401) {
			throw new RuntimeException("Failed : HTTP error code : 401 Unauthorized. Please check your API key and permissions.");
		} else if (responseCode == 400) {
			
			try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "utf-8"))) {
				StringBuilder response = new StringBuilder();
				String responseLine;
				while ((responseLine = br.readLine()) != null) {
					response.append(responseLine.trim());
				}// end while
				throw new RuntimeException("Failed : HTTP error code : 400 Bad Request. Response: " + response.toString());
			}// end try
			
		} else {
			throw new RuntimeException("Failed : HTTP error code : " + responseCode);
		}// end else-if
	}// callGeminiApi

	public static void main(String[] args) {
		String prompt = "서울 인구수";

		try {
			String response = callGeminiApi(prompt);
			System.out.println("Response from API: " + response);
		} catch (Exception e) {
			e.printStackTrace();
		}// end try-catch
	}// main
}// class
