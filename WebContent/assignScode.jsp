<%@page import="java.sql.*" %>
<%@page import="com.nipun.databaseconnec.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assign Service Code</title>
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

        .container {
            text-align: center;
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 45px rgba(0, 0, 0, 0.3);
            width: 90%;
            max-width: 600px;
        }

        h1 {
            color: #4a90e2;
            margin-bottom: 30px;
            font-size: 2.5em;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
        }

        input[type="text"], input[type="password"] {
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: calc(100% - 24px);
            font-size: 1.2em;
            transition: border-color 0.3s;
        }

        input[type="submit"] {
            padding: 12px;
            margin-top: 20px;
            background-color: #4a90e2;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s, box-shadow 0.3s;
            border: none;
            border-radius: 5px;
            font-size: 1.2em;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #357ab8;
            transform: scale(1.05);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
        }

        input[type="submit"]:active {
            background-color: #2d5f90;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Assign Service Code</h1>
        <form action="AssignScode" method="post">
            <% int cid = Integer.parseInt(request.getParameter("id")); %>
            <input type="text" name="cid" value="<%= cid %>" readonly>
            <br><br>
            <input type="text" name="scode" placeholder="Enter Service Man Service Code" required>
            <br><br>
            <input type="submit" value="Submit">
        </form>
    </div>
</body>
</html>
