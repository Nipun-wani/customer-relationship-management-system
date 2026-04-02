<%@page import="java.sql.*" %>
<%@page import="com.nipun.databaseconnec.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Assign Service Man</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            overflow: hidden;
            background: linear-gradient(135deg, #89f7fe, #66a6ff); /* Soft gradient background */
        }

        form {
            text-align: center;
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 45px rgba(0, 0, 0, 0.3);
            width: 50%;
        }

        h1 {
            color: #4a90e2;
            margin-bottom: 30px;
            font-size: 2.5em;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
        }

        input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 1em;
        }

        input[type="submit"] {
            background-color: #4a90e2;
            color: white;
            cursor: pointer;
            font-size: 1.2em;
        }

        input[type="submit"]:hover {
            background-color: #357ebd;
        }
    </style>
</head>
<body>
    <form action="AssignSman" method="post">
        <h1>Login</h1>
        <% int cid = Integer.parseInt(request.getParameter("id")); %>
        <input type="text" name="cid" value="<%= cid %>">
        <br><br>
        <input type="text" name="sid" placeholder="Enter Service-Man id">
        <br><br>
        <input type="submit" value="Submit">
        <br><br>
    </form>
</body>
</html>
