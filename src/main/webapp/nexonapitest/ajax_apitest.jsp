<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="nexonapitest.MapleAPI"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%
String charName = request.getParameter("charName");

MapleAPI mAPI = MapleAPI.getInstance();

String result = mAPI.getOCID(charName);

JSONObject ocidJson= new JSONObject(result);
String ocid = ocidJson.getString("ocid");

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
JSONObject totalJson = new JSONObject(mAPI.getCharacterBasicInfo(ocid, "2025-06-08"));
%>	
<%= totalJson.toString()%>