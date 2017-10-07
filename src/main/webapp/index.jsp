<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <title>Login Form</title>

    <style>
        body {
            background-image: url("log.jpg");
        }

        #container {

            position: fixed;
            width: 350px;
            height: 400px;
            top: 50%;
            left: 50%;
            margin-top: -140px;
            margin-left: -170px;
            background-color: #444444;
        }
        form {

            margin: 0 auto;
            margin-top: 20px;
        }
        label {
            color: #f0f0f0;
            display: inline-block;
            margin-left: 18px;
            padding-top: 10px;
            font-size: 14px;
        }
        p a {
            font-size: 15px;
            color: #aaa;
            float: right;
            margin-top: -13px;
            margin-right: 20px;
        }
        p a:hover {
            color: #555;
        }
        input {
            font-family: "Helvetica Neue", Helvetica, sans-serif;
            font-size: 12px;
            outline: none;
        }
        input[type=text],
        input[type=password] {
            color: black;
            padding-left: 10px;
            margin: 10px;
            margin-top: 12px;
            margin-left: 18px;
            width: 290px;
            height: 35px;
            border-radius: 10px;
        }
        
        input[type=radio] {
            margin-left: 5px;
            margin-top: 5px;
        }
        .check {
            margin-left: 3px;
        }
        input[type=submit] {
            float: right;
            margin-right: 12px;
            margin-top: 35px;
            width: 325px;
            height: 50px;
            font-size: 25px;
            color: black;
            border-radius: 10px;
            background-color: darkgrey;
        }
        input[type=submit]:hover{

            color: gray;
        }
    </style>


</head>

<body>
<center>
<h1 style="color: gainsboro">---Welcome---</h1>
</center>>
<div id="container">
    <center>
    <h2>login Page</h2>
        </center>
    <form method="post" action="">

        <label for="username">Username:</label>
        <input type="text" placeholder="username"  id="username" name="username"><br>
        <label for="password">Password:</label>
        <input type="password"  placeholder="password" id="password" name="password">

        <input type="radio" name="cookie" value="no"  checked> <label>no</label>
        <input type="radio" name="cookie" value="http"> <label> Http</label>
        <input type="radio" name="cookie" value="secure"> <label> secure</label>
        <input type="radio" name="cookie" value="both"> <label> both</label>

        <input type="submit" value="Login" name="login"/>

        </form>

</div>


</body>
</html>

<%
    if(request.getParameter("login")!=null)
    {
        
        if(request.getParameter("password")!=""&&request.getParameter("username")!="")
        {
            String uname = request.getParameter("username");
            String pass = request.getParameter("password");
            if ("kaveesha".equals(uname) && "12345".equals(pass)) //credentials are hardcoded
            {
                String radio =request.getParameter("cookie");
                if("no".equals(radio))
                {
                    // httponly flags
                    Cookie cook = new Cookie("_rxuuid","%7B%22rx_uuid%22%3A%22RX-4ad538d7-9b19-49c2-8336-1dc969e5e71e%22%7D"); // create object
                    cook.setMaxAge(60);
                    cook.setDomain("localhost");
                    cook.setPath("/MyLoginPage1");
                    response.addCookie(cook);
                    response.sendRedirect("MyLogin.jsp");
                
                }
                else if("secure".equals(radio))
                {
                    //secure flags
                    Cookie cook = new Cookie("_rxuuid", "%7B%22rx_uuid%22%3A%22RX-4ad538d7-9b19-49c2-8336-1dc969e5e71e%22%7D");
                    cook.setMaxAge(60);
                    cook.setSecure(true);
                    cook.setDomain("localhost");
                    cook.setPath("/MyLoginPage1");
                    response.addCookie(cook);
                    response.sendRedirect("MyLogin.jsp");
                    
                }
                else if("http".equals(radio))
                {
                    // httponly flags
                    Cookie cook = new Cookie("_rxuuid", "%7B%22rx_uuid%22%3A%22RX-4ad538d7-9b19-49c2-8336-1dc969e5e71e%22%7D");
                    cook.setMaxAge(60);
                    cook.setHttpOnly(true);
                    cook.setDomain("localhost");
                    cook.setPath("/MyLoginPage1");
                    response.addCookie(cook);
                    response.sendRedirect("MyLogin.jsp");
                    
                }
                else if("both".equals(radio))
                {
                    //it has secure and httponly flags
                    Cookie cook = new Cookie("_rxuuid", "%7B%22rx_uuid%22%3A%22RX-4ad538d7-9b19-49c2-8336-1dc969e5e71e%22%7D ");
                    cook.setMaxAge(60);
                    cook.setSecure(true);
                    cook.setHttpOnly(true);
                    cook.setDomain("localhost");
                    cook.setPath("/MyLoginPage1");
                    response.addCookie(cook);
                    response.sendRedirect("MyLogin.jsp");
                    
                }
            }
            else
            {
%>
<script>alert("Invalid Email or password")</script>
<%
    }
}
else
{
%>
<script>alert("Please enter the username and password")</script>
<%
        }
    }
    if(request.getParameter("logout")!=null)
    {
        Cookie cook = new Cookie("_rxuuid ","");
        cook.setMaxAge(0);
        cook.setDomain("localhost");
        cook.setPath("/MyLoginPage1");
        response.addCookie(cook);
    }
%>
