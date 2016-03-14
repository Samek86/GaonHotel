<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.util.ArrayList"%>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="utility.*"%>
<%@ page import="reservation.common.*"%>
<%@ page import="rooms.common.*"%>
<%@ page import="java.util.*" %>

<%
request.setCharacterEncoding("utf-8");
%>
<%
String upDir = "/rooms/img";
String downDir = "/rooms/img";
upDir = application.getRealPath(upDir);
String tempDir = application.getRealPath("/rooms/temp");

%>
