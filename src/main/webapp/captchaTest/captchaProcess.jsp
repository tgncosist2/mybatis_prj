<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.DataOutputStream"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%
String token = request.getParameter("g-recaptcha-response");

String secretKey = "6Lc7UlsrAAAAAJzcdVfOkuKxI1aQoq4omVw4_-7e";

String url = "https://www.google.com/recaptcha/api/siteverify";
String params = "secret=" + secretKey + "&response=" + token;

URL obj = new URL(url);
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
con.setDoOutput(true);

DataOutputStream dos = new DataOutputStream(con.getOutputStream());
dos.writeBytes(params);
dos.flush();
dos.close();

BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer sb = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
	sb.append(inputLine);
}
in.close();

// 4. 결과(JSON) 파싱해서 success 여부 확인
String result = sb.toString();
if(result.contains("\"success\": true")) {
    out.println("캡차 인증 성공!<br>");
    out.println(result);
} else {
    out.println("캡차 인증 실패!<br>");
    out.println(result);
}
%>