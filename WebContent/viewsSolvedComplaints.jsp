<%@page import="java.sql.*" %>
<%@page import="com.nipun.databaseconnec.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Solved Complaints</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #00b4db, #0083b0);
            margin: 0;
            display: flex;
            height: 100vh;
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
            color: #333;
            text-decoration: none;
            padding: 10px 15px;
            margin: 10px 0;
            display: flex;
            align-items: center;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.3s;
            background: linear-gradient(45deg, #ff6b6b, #f06595);
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

        .container {
            margin-left: 270px;
            padding: 20px;
            flex-grow: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            text-align: center;
        }

        .container h1 {
            font-size: 36px;
            color: #ff6b6b; /* Heading color */
            margin-bottom: 20px;
        }

        .table-container {
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 45px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 1000px;
            box-sizing: border-box;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            color: #000; /* Set text color inside table to black */
        }

        th {
            background: linear-gradient(45deg, #ff6b6b, #f06595); /* Match navbar gradient */
            color: #000; /* Set heading text color to black */
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        a {
            text-decoration: none;
            color: #4a90e2;
        }

        a:hover {
            text-decoration: underline;
        }

        .back-button {
            display: inline-block;
            text-decoration: none;
            color: white;
            background: linear-gradient(45deg, #ff6b6b, #f06595);
            padding: 10px 20px;
            margin-top: 20px;
            border-radius: 5px;
            font-size: 1em;
            transition: background-color 0.3s, transform 0.3s, box-shadow 0.3s;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        .back-button:hover {
            background: linear-gradient(45deg, #f06595, #ff6b6b);
            transform: scale(1.05);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
        }

        .back-button:active {
            background: linear-gradient(45deg, #2d5f90, #1f3c5a);
        }

        .back-button i {
            margin-right: 8px;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <h2>Admin Dashboard</h2>
        <a href="addCustomer.html">
            <i class="fas fa-user-plus"></i> Add Customer
        </a>
        <a href="viewCustomer.jsp">
            <i class="fas fa-users"></i> View Customer
        </a>
        <a href="addSman.html">
            <i class="fas fa-user-cog"></i> Add Service Man
        </a>
        <a href="viewSman.jsp">
            <i class="fas fa-users-cog"></i> View Service Man
        </a>
        <a href="viewUnsolvedComplaints.jsp">
            <i class="fas fa-exclamation-circle"></i> View Unsolved Complaints
        </a>
        <a href="viewsSolvedComplaints.jsp">
            <i class="fas fa-check-circle"></i> View Solved Complaints
        </a>
        <div class="logout-container">
            <a href="index.html" class="logout">
                <i class="fas fa-sign-out-alt"></i> Log Out
            </a>
        </div>
    </div>
    <div class="container">
        <h1>Solved Complaints</h1>
        <div class="table-container">
            <table>
                <tr>
                    <th>Id</th>
                    <th>CusID</th>
                    <th>SmanId</th>
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
                        Connection con = ConnectDB.dbcon();
                        PreparedStatement ps = con.prepareStatement("select * from complaints where status=?");
                        ps.setString(1, "Solved");
                        ResultSet rs = ps.executeQuery();
                        
                        while (rs.next()) {
                    %>
                        <tr>
                            <td><%= rs.getInt(1) %></td>
                            <td><%= rs.getInt(2) %></td>
                            <td><%= rs.getInt(3) %></td>
                            <td><%= rs.getString(4) %></td>
                            <td><%= rs.getString(5) %></td>
                            <td><%= rs.getString(6) %></td>
                            <td><%= rs.getString(7) %></td>
                            <td><%= rs.getDate(8) %></td>
                            <td><%= rs.getTime(9) %></td>
                            <td><%= rs.getString(10) %></td>
                            <td><%= rs.getInt(11) %></td>
                        </tr>
                <%
                    }
                    
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </table>
            <a href="adminFunction.html" class="back-button"><i class="fas fa-arrow-circle-left"></i> Back</a>
        </div>
    </div>
</body>
</html>
