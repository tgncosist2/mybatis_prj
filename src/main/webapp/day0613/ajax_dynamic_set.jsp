<%@page import="day0613.SelectService6"%>
<%@page import="kr.co.sist.domain.CpEmp"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%
String empno = request.getParameter("empno");
String ename = request.getParameter("ename");
String job = request.getParameter("job");
String sal = request.getParameter("sal");
String comm = request.getParameter("comm");

CpEmp ceDTO = new CpEmp();
ceDTO.setEmpno(Integer.parseInt(empno));
ceDTO.setEname(ename);
ceDTO.setJob(job);
ceDTO.setSal(Integer.parseInt(sal));
ceDTO.setComm(Integer.parseInt(comm));

SelectService6 ss6 = new SelectService6();

JSONObject jsonObj = new JSONObject();
jsonObj.put("modifyResult", ss6.modifyEmp(ceDTO));
%>
<%= jsonObj.toString()%>