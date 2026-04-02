<%@page import="java.sql.*" %>
<%@page import="com.nipun.databaseconnec.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Complaints</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            display: flex;
            height: 100vh;
            background: linear-gradient(135deg, #89f7fe, #66a6ff); /* Soft gradient background */
        }

        .navbar {
            width: 250px;
            background-color: #fff;
            display: flex;
            flex-direction: column;
            padding: 15px;
            height: 100vh;
            position: fixed;
            overflow-y: auto;
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
        }

        .navbar h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
        }

        .navbar a {
            color: #fff;
            text-decoration: none;
            padding: 10px 15px;
            margin: 10px 0;
            display: flex;
            align-items: center;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.3s;
            background: linear-gradient(45deg, #ff6b6b, #f06595); /* Navbar gradient color */
        }

        .navbar a:hover {
            background-color: #ddd;
            transform: translateX(5px);
        }

        .navbar a i {
            margin-right: 10px;
        }

        .navbar .logout {
            background-color: red;
            color: #fff;
        }

        .navbar .logout:hover {
            background-color: #d43f3a;
        }

        .logout-container {
            margin-top: auto;
            margin-bottom: 20px;
        }

        .main-content {
            margin-left: 250px; /* Adjusted margin to accommodate the fixed navbar */
            display: flex;
            justify-content: center;
            align-items: center;
            width: calc(100% - 250px);
        }

        .container {
            background: rgba(255, 255, 255, 0.95);
            padding: 60px;
            border-radius: 20px;
            box-shadow: 0 15px 45px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 1000px;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        h1 {
            color: #ff6b6b; /* Same color as navbar options */
            margin-bottom: 30px;
            font-size: 2.5em;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background: linear-gradient(45deg, #ff6b6b, #f06595); /* Same color as navbar options */
            color: white; /* Text color inside table header */
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        .back-button-container {
            text-align: center;
            margin-top: 20px;
        }

        .back-button {
            display: inline-block;
            text-decoration: none;
            color: white;
            background: linear-gradient(45deg, #ff6b6b, #f06595); /* Same color as navbar options */
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 1em;
            transition: background-color 0.3s, transform 0.3s, box-shadow 0.3s;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        .back-button:hover {
            background-color: #ddd;
            color: #333; /* Adjust color on hover */
            transform: scale(1.05);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
        }

        .back-button:active {
            background-color: #d43f3a; /* Darker shade on click */
        }

        .back-button i {
            margin-right: 8px;
        }

        @media (max-width: 768px) {
            .main-content {
                margin-left: 0;
                width: 100%;
            }
            .container {
                width: 90%; /* Responsive width */
                padding: 40px; /* Reduced padding on smaller screens */
            }
            .navbar {
                width: 200px;
            }
        }
    </style>
</head>
<body>
    <div class="navbar">
        <h2>Customer Dashboard</h2>
        <a href="addComplaints.html">
            <i class="fas fa-plus-circle"></i> Add Complaints
        </a>
        <a href="customerUnsolvedComplaints.jsp">
            <i class="fas fa-exclamation-circle"></i> View Unsolved Complaints
        </a>
        <a href="customerSolvedComplaints.jsp">
            <i class="fas fa-check-circle"></i> View Solved Complaints
        </a>
        <a href="customerChangePassword.html">
            <i class="fas fa-key"></i> Change Password
        </a>
        <div class="logout-container">
            <a href="index.html" class="logout">
                <i class="fas fa-sign-out-alt"></i> Log Out
            </a>
        </div>
    </div>
    <div class="main-content">
        <div class="container">
            <h1>Customer Complaints</h1>
            <table>
                <tr>
                    <th>Id</th>
                    <th>Title</th>
                    <th>Detail</th>
                    <th>Contact</th>
                    <th>Address</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Status</th>
                    <th>Scode</th>
                </tr>

                <% 
                try {
                    int cusid = Integer.parseInt(user.getId());

                    Connection con = ConnectDB.dbcon();

                    PreparedStatement ps = con.prepareStatement("select * from complaints where status=? and cusid=?");
                    ps.setString(1, "Unsolved");
                    ps.setInt(2, cusid);

                    ResultSet rs = ps.executeQuery();

                    while (rs.next()) {
                %>
                        <tr>
                            <td><%= rs.getInt(1) %></td>
                            <td><%= rs.getString(4) %></td>
                            <td><%= rs.getString(5) %></td>
                            <td><%= rs.getString(6) %></td>
                            <td><%= rs.getString(7) %></td>
                            <td><%= rs.getDate(8) %></td>
                            <td><%= rs.getTime(9) %></td>
                            <td><%= rs.getString(10) %></td>
                            <td><%= rs.getInt(11) %></td>
                        </tr>
                <%      }

                } catch (Exception e) {
                    e.printStackTrace();
                }
                %>
            </table>
            <div class="back-button-container">
                <a href="customerFunction.html" class="back-button"><i class="fas fa-arrow-circle-left"></i>Back</a>
            </div>
        </div>
    </div>
</body>
</html>
