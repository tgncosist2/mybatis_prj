<%@page import="day0613.SelectService6"%>
<%@page import="kr.co.sist.domain.CpEmp"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%
int empno = Integer.parseInt(request.getParameter("empno"));

SelectService6 ss6 = new SelectService6();
CpEmp ceDTO = ss6.selectOneEmp(empno);

String ename = ceDTO.getEname();
String job = ceDTO.getJob();
String sal = String.valueOf(ceDTO.getSal());
String comm = String.valueOf(ceDTO.getComm());

JSONObject jsonObj = new JSONObject();
jsonObj.put("ename", ename);
jsonObj.put("job", job);
jsonObj.put("sal", sal);
jsonObj.put("comm", comm);
%>
<%= jsonObj.toString()%>