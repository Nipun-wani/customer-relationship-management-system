<%@page import="java.sql.*" %>
<%@page import="com.nipun.databaseconnec.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Service Man Unsolved Complaints</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            display: flex;
            height: 100vh;
            margin: 0;
            background: linear-gradient(to right, #00b4db, #0083b0);
            color: #fff;
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
            color: #f06595; /* Heading color */
            margin-bottom: 20px;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #f9f9f9; /* Light background for the table */
        }

        th, td {
            padding: 12px;
            text-align: left;
            color: #000; /* Black text color */
            border-bottom: 1px solid #ddd;
        }

        th {
            background: linear-gradient(45deg, #ff6b6b, #f06595); /* Gradient background for headers */
            color: #000; /* Black text color for headers */
        }

        tr:nth-child(even) {
            background-color: #f2f2f2; /* Slightly lighter background for even rows */
        }

        tr:hover {
            background-color: #e0e0e0; /* Slightly lighter background on hover */
        }

        a {
            text-decoration: none;
            color: #f06595; /* Link color */
        }

        a:hover {
            text-decoration: underline;
        }

        .back-button {
            display: inline-block;
            text-decoration: none;
            color: white;
            background-color: #f06595; /* Back button color */
            padding: 10px 20px;
            margin-top: 20px;
            border-radius: 5px;
            font-size: 1em;
            transition: background-color 0.3s, transform 0.3s, box-shadow 0.3s;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        .back-button:hover {
            background-color: #e0558c; /* Darker shade on hover */
            transform: scale(1.05);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
        }

        .back-button:active {
            background-color: #d43f3a; /* Even darker shade on active */
        }

        .back-button i {
            margin-right: 8px;
        }

        .mark-solved {
            display: inline-block;
            text-decoration: none;
            color: #fff;
            background: linear-gradient(45deg, #ff6b6b, #f06595); /* Gradient background matching navbar */
            padding: 8px 16px;
            border-radius: 5px;
            font-size: 0.9em;
            transition: background-color 0.3s, transform 0.3s, box-shadow 0.3s;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        .mark-solved:hover {
            background-color: #e0558c; /* Darker shade on hover */
            transform: scale(1.05);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
        }

        .mark-solved:active {
            background-color: #d43f3a; /* Even darker shade on active */
        }

        .mark-solved i {
            margin-right: 8px;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <h2>Service Man Dashboard</h2>
        <a href="viewSmanUnsolvedComplaints.jsp">
            <i class="fas fa-exclamation-circle"></i> View Own Unsolved Complaints
        </a>
        <a href="viewSmanSolvedComplaints.jsp">
            <i class="fas fa-check-circle"></i> View Solved Complaints
        </a>
        <a href="smanChangePassword.html">
            <i class="fas fa-key"></i> Change Password
        </a>
        <div class="logout-container">
            <a href="index.html" class="logout">
                <i class="fas fa-sign-out-alt"></i> Log Out
            </a>
        </div>
    </div>
    <div class="container">
        <h1>Service Man Unsolved Complaints</h1>
        <table>
            <tr>
                <th>Complaint-Id</th>
                <th>CusID</th>
                <th>SmanId</th>
                <th>Title</th>
                <th>Detail</th>
                <th>Contact</th>
                <th>Address</th>
                <th>Date</th>
                <th>Time</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            
            <%
                try {
                    int smanid = Integer.parseInt(user.getId());
                    Connection con = ConnectDB.dbcon();
                    PreparedStatement ps = con.prepareStatement("select * from complaints where status=? and smanid=?");
                    ps.setString(1, "Unsolved");
                    ps.setInt(2, smanid);
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
                            <td><a href="assignScode.jsp?id=<%= rs.getInt(1) %>" class="mark-solved"><i class="fas fa-check-circle"></i>Mark SOLVED</a></td>
                        </tr>
                <%
                    }
                    
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </table>
        <a href="smanFunction.html" class="back-button"><i class="fas fa-arrow-circle-left"></i>Back</a>
    </div>
</body>
</html>
