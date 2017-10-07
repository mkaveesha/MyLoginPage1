<%--
  Created by IntelliJ IDEA.
  User: methmi
  Date: 10/6/17
  Time: 6:00 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script>alert(document.cookie)</script>
</head>
<body>
<%
    String userId = null;
    Cookie[] cookies = request.getCookies();
    if(cookies != null)
    {
        for(Cookie cookie : cookies)
        {
            if(cookie.getName().equals("_rxuuid"))
            {
                userId = cookie.getValue();
            }
        }
    }
    if(userId==null)
    {
        response.sendRedirect("index.jsp");
    }
%>
<h2>Welcome</h2>
<h3>Assignment 01- SSS</h3>
<h4>_rxuuid : <%=userId%></h4>


<form method="post" action="index.jsp" name="logout">
    <input type="submit" value="logout" name="logout"/>
</form>
</body>
</html>