package nexonapitest;

import java.io.*;
import java.net.*;
import java.nio.charset.*;

public class MapleAPI {
	
	private static MapleAPI instance;
	
	private MapleAPI() {
	}
	
	public static MapleAPI getInstance() {
		if (instance == null) {
			instance = new MapleAPI();
		}// end if
		return instance;
	}// getInstance
	

	public String getOCID(String charName) {
		String result = "";
		
		try {
	        String API_KEY = "test_5069773ae24c176d2c070dfb7bad77e1143755f8730b893ba2fe3496a5d93427efe8d04e6d233bd35cf2fabdeb93fb0d";
	        String characterName = URLEncoder.encode(charName, StandardCharsets.UTF_8);
	  
	        String urlString = "https://open.api.nexon.com/maplestory/v1/id?character_name=" + characterName;
	        URL url = new URL(urlString);
	  
	        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
	        connection.setRequestMethod("GET");
	        connection.setRequestProperty("x-nxopen-api-key", API_KEY);
	  
	        int responseCode = connection.getResponseCode();
	  
	        BufferedReader in;
	        if(responseCode == 200) {
	          in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
	        } else {
	          in = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
	        }// end if-else
	  
	        String inputLine;
	        StringBuffer response = new StringBuffer();
	        while ((inputLine = in.readLine()) != null) {
	          response.append(inputLine);
	        }// end while
	        in.close();
	  
	        result = response.toString();
	        
	      } catch (Exception exception) {
	    	  exception.getMessage();
	      }// end try-catch
		
		return result;
	}// getOCID
	
	public String getCharacterBasicInfo(String ocid, String date) {
	    String result = "";
	    try {
	        String API_KEY = "test_5069773ae24c176d2c070dfb7bad77e1143755f8730b893ba2fe3496a5d93427efe8d04e6d233bd35cf2fabdeb93fb0d";
	        String urlString = "https://open.api.nexon.com/maplestory/v1/character/basic?ocid="+ ocid +"&date=" + date;
	        URL url = new URL(urlString);
	        
	        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
	        connection.setRequestMethod("GET");
	        connection.setRequestProperty("x-nxopen-api-key", API_KEY);

	        int responseCode = connection.getResponseCode();
	        BufferedReader in;
	        if(responseCode == 200) {
	            in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
	        } else {
	            in = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
	        }
	        String inputLine;
	        StringBuffer response = new StringBuffer();
	        while ((inputLine = in.readLine()) != null) {
	            response.append(inputLine);
	        }
	        in.close();

	        result = response.toString();
	    } catch (Exception exception) {
	        exception.getMessage();
	    }
	    return result;
	}// getCharacterBasicInfo
	
}//class
