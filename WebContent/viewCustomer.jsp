<%@page import="java.sql.*" %>
<%@page import="com.nipun.databaseconnec.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer List</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #00b4db, #0083b0);
            color: #fff;
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
            margin: 0;
            color: #ff6b6b;
        }
        .container .welcome {
            font-size: 48px;
            color: red;
            font-weight: bold;
            margin: 0;
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
            background-color: #f06595; /* Solid color matching the navbar gradient */
            color: #000; /* Black text color */
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
        .delete-button {
            display: inline-block;
            text-decoration: none;
            color: white;
            background: linear-gradient(45deg, #ff6b6b, #f06595);
            padding: 8px 12px;
            border-radius: 5px;
            font-size: 0.9em;
            transition: background-color 0.3s, transform 0.3s, box-shadow 0.3s;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }
        .delete-button:hover {
            background: linear-gradient(45deg, #f06595, #ff6b6b);
            transform: scale(1.05);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
        }
        .delete-button:active {
            background: linear-gradient(45deg, #d43f3a, #c03a2d);
        }
        .delete-button i {
            margin-right: 6px;
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
        <h1>Customers</h1>
        <div class="table-container">
            <table>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Contact</th>
                    <th>Address</th>
                    <th>Pincode</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Action</th>
                </tr>
                <%
                    try {
                        Connection con = ConnectDB.dbcon();
                        PreparedStatement ps = con.prepareStatement("select * from customer");
                        ResultSet rs = ps.executeQuery();
                        
                        while (rs.next()) {
                    %>
                        <tr>
                            <td><%= rs.getInt(1) %></td>
                            <td><%= rs.getString(2) %></td>
                            <td><%= rs.getString(3) %></td>
                            <td><%= rs.getString(4) %></td>
                            <td><%= rs.getString(5) %></td>
                            <td><%= rs.getString(6) %></td>
                            <td><%= rs.getString(7) %></td>
                            <td><a href="deleteCustomer.jsp?id=<%=rs.getInt(1)%>" class="delete-button"><i class="fas fa-trash-alt"></i>Delete</a></td>
                        </tr>
                    <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </table>
            <a href="adminFunction.html" class="back-button"><i class="fas fa-arrow-circle-left"></i>Back</a>
        </div>
    </div>
</body>
</html>
