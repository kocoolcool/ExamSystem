<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import='java.util.*'  %>
<!DOCTYPE html >
<html>
<head>
<%
   Enumeration<String> en = request.getAttributeNames();
   while (en.hasMoreElements()){
	   String key = en.nextElement();
	   Object value = request.getAttribute(key);
	   out.println(key + "==>" + value + "<br>");
   }

%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome</title>
<link rel='stylesheet' href='css/styles.css' type="text/css" />
</head>
<body>
  <div style= "text-align:center">
     <h1>${title}</h1>
     <p>${subtitle}</p>
  </div>
</body>
</html>