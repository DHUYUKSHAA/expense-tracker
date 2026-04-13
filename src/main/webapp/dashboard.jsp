<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="com.expense.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expense Dashboard</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    font-family:'Poppins',sans-serif;
    background:#f7f4ea;
    color:#1f2937;
}

.container{
    display:flex;
    min-height:100vh;
}

.sidebar{
    width:220px;
    background:#ffffff;
    border-right:1px solid #ece7d8;
    padding:28px 20px;
}

.sidebar h2{
    font-size:30px;
    margin-bottom:28px;
    color:#233;
}

.sidebar ul{
    list-style:none;
}

.sidebar ul li{
    padding:12px 0;
    font-size:16px;
    color:#56616f;
    border-bottom:1px solid #f2efe5;
}

.main{
    flex:1;
    padding:24px;
}

.hero{
    background:#ffffff;
    border-radius:20px;
    padding:24px;
    display:grid;
    grid-template-columns: 1.2fr 1fr;
    gap:22px;
    align-items:center;
    box-shadow:0 4px 14px rgba(0,0,0,0.05);
    margin-bottom:20px;
}

.hero-left{
    display:flex;
    align-items:center;
    gap:20px;
}

.hero-left img{
    width:120px;
    height:120px;
    object-fit:contain;
}

.hero-text h1{
    font-size:42px;
    line-height:1.1;
    color:#253238;
    margin-bottom:10px;
    letter-spacing:1px;
}

.hero-text p{
    font-size:15px;
    color:#667085;
    line-height:1.7;
    max-width:520px;
}

.hero-right{
    display:grid;
    grid-template-columns:repeat(2,1fr);
    gap:14px;
}

.mini-card{
    background:#eef3e7;
    border-radius:14px;
    padding:16px;
    min-height:92px;
    display:flex;
    flex-direction:column;
    justify-content:center;
}

.mini-card:nth-child(2){
    background:#f7ecd7;
}
.mini-card:nth-child(3){
    background:#e7f0f0;
}
.mini-card:nth-child(4){
    background:#f3ece5;
}

.mini-card h3{
    font-size:14px;
    color:#5b6572;
    margin-bottom:6px;
}

.mini-card p{
    font-size:28px;
    font-weight:700;
    color:#1f2937;
}

.top-grid{
    display:grid;
    grid-template-columns: 1.25fr 0.95fr;
    gap:20px;
    margin-bottom:20px;
}

.form-box{
    background:#ffffff;
    border-radius:18px;
    padding:20px;
    box-shadow:0 4px 14px rgba(0,0,0,0.05);
}

.form-box h2{
    font-size:22px;
    margin-bottom:16px;
    color:#253238;
}

.form-row{
    display:grid;
    grid-template-columns:1fr 1fr 1fr 130px;
    gap:12px;
}

.form-row input,
.form-row select{
    height:44px;
    border:1px solid #d8dde3;
    border-radius:10px;
    padding:0 12px;
    font-size:14px;
    font-family:'Poppins',sans-serif;
    background:#fff;
    outline:none;
}

.form-row button{
    height:44px;
    border:none;
    border-radius:10px;
    background:#e0b14c;
    color:white;
    font-size:14px;
    font-weight:600;
    cursor:pointer;
    font-family:'Poppins',sans-serif;
}

.chart-panel{
    display:grid;
    grid-template-columns:1fr 1fr;
    gap:14px;
}

.chart-box{
    background:#ffffff;
    border-radius:18px;
    padding:16px;
    box-shadow:0 4px 14px rgba(0,0,0,0.05);
    height:250px;
}

.chart-box h3{
    font-size:16px;
    margin-bottom:8px;
    color:#253238;
    text-align:center;
}

.chart-box canvas{
    width:100% !important;
    height:180px !important;
}

.sections{
    display:grid;
    grid-template-columns:1fr 1fr;
    gap:20px;
}

.section-box{
    background:#ffffff;
    border-radius:18px;
    padding:18px;
    box-shadow:0 4px 14px rgba(0,0,0,0.05);
}

.section-box h2{
    font-size:18px;
    margin-bottom:14px;
    color:#253238;
}

table{
    width:100%;
    border-collapse:collapse;
}

th, td{
    padding:10px 8px;
    text-align:left;
    border-bottom:1px solid #ececec;
    font-size:14px;
}

th{
    background:#f8f8f4;
    color:#3a4350;
    font-weight:600;
}

.total-row{
    margin-top:12px;
    font-size:15px;
    font-weight:700;
    color:#253238;
}

.delete-link{
    color:#d62828;
    text-decoration:none;
    font-weight:600;
}

.no-data{
    color:#7a8491;
    text-align:center;
    padding:12px 0;
}

@media (max-width: 1200px){
    .hero{
        grid-template-columns:1fr;
    }

    .top-grid{
        grid-template-columns:1fr;
    }
}

@media (max-width: 950px){
    .container{
        flex-direction:column;
    }

    .sidebar{
        width:100%;
        border-right:none;
        border-bottom:1px solid #ece7d8;
    }

    .form-row{
        grid-template-columns:1fr;
    }

    .sections{
        grid-template-columns:1fr;
    }

    .chart-panel{
        grid-template-columns:1fr;
    }

    .hero-right{
        grid-template-columns:1fr 1fr;
    }

    .hero-left{
        flex-direction:column;
        align-items:flex-start;
    }
}
</style>
</head>

<body>

<%
HttpSession sessionObj = request.getSession(false);

if (sessionObj == null || sessionObj.getAttribute("user_id") == null) {
    response.sendRedirect("login.jsp");
    return;
}

int userId = (int) sessionObj.getAttribute("user_id");

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

int total = 0;
int bills = 0;
int savings = 0;
int variable = 0;
int debt = 0;

try {
    con = DBConnection.getConnection();

    ps = con.prepareStatement("SELECT COALESCE(SUM(amount),0) FROM expenses WHERE user_id = ?");
    ps.setInt(1, userId);
    rs = ps.executeQuery();
    if (rs.next()) total = rs.getInt(1);
    rs.close();
    ps.close();

    ps = con.prepareStatement("SELECT COALESCE(SUM(amount),0) FROM expenses WHERE user_id = ? AND category = 'Bills'");
    ps.setInt(1, userId);
    rs = ps.executeQuery();
    if (rs.next()) bills = rs.getInt(1);
    rs.close();
    ps.close();

    ps = con.prepareStatement("SELECT COALESCE(SUM(amount),0) FROM expenses WHERE user_id = ? AND category = 'Savings'");
    ps.setInt(1, userId);
    rs = ps.executeQuery();
    if (rs.next()) savings = rs.getInt(1);
    rs.close();
    ps.close();

    ps = con.prepareStatement("SELECT COALESCE(SUM(amount),0) FROM expenses WHERE user_id = ? AND category = 'Variable'");
    ps.setInt(1, userId);
    rs = ps.executeQuery();
    if (rs.next()) variable = rs.getInt(1);
    rs.close();
    ps.close();

    ps = con.prepareStatement("SELECT COALESCE(SUM(amount),0) FROM expenses WHERE user_id = ? AND category = 'Debt'");
    ps.setInt(1, userId);
    rs = ps.executeQuery();
    if (rs.next()) debt = rs.getInt(1);
    rs.close();
    ps.close();

} catch (Exception e) {
    out.println("Error: " + e.getMessage());
}
%>

<div class="container">

    <div class="sidebar">
        <h2>Budget</h2>
        <ul>
            <li>Dashboard</li>
            <li>Bills</li>
            <li>Savings</li>
            <li>Variable</li>
            <li>Debt</li>
        </ul>
    </div>

    <div class="main">

        <div class="hero">
            <div class="hero-left">
                <img src="https://cdn-icons-png.flaticon.com/512/2489/2489756.png" alt="Money">
                <div class="hero-text">
                    <h1>BALANCING<br>THE BUDGET</h1>
                    <p>
                        Track expenses clearly, manage each category properly, and monitor
                        how your spending is distributed across bills, savings, variable costs, and debt.
                    </p>
                </div>
            </div>

            <div class="hero-right">
                <div class="mini-card">
                    <h3>Total</h3>
                    <p><%= total %></p>
                </div>

                <div class="mini-card">
                    <h3>Bills</h3>
                    <p><%= bills %></p>
                </div>

                <div class="mini-card">
                    <h3>Savings</h3>
                    <p><%= savings %></p>
                </div>

                <div class="mini-card">
                    <h3>Variable</h3>
                    <p><%= variable %></p>
                </div>
            </div>
        </div>

        <div class="top-grid">

            <div class="form-box">
                <h2>Add Expense</h2>
                <form action="AddExpenseServlet" method="post">
                    <div class="form-row">
                        <input type="text" name="title" placeholder="Enter title" required>
                        <input type="number" name="amount" placeholder="Enter amount" required>

                        <select name="category" required>
                            <option value="">Select category</option>
                            <option value="Bills">Bills</option>
                            <option value="Savings">Savings</option>
                            <option value="Variable">Variable</option>
                            <option value="Debt">Debt</option>
                        </select>

                        <button type="submit">Add Expense</button>
                    </div>
                </form>
            </div>

            <div class="chart-panel">
                <div class="chart-box">
                    <h3>Distribution</h3>
                    <canvas id="pieChart"></canvas>
                </div>

                <div class="chart-box">
                    <h3>Comparison</h3>
                    <canvas id="barChart"></canvas>
                </div>
            </div>

        </div>

        <div class="sections">

<%
String[] categories = {"Bills", "Savings", "Variable", "Debt"};

for (String c : categories) {
    int sectionTotal = 0;
    if (c.equals("Bills")) sectionTotal = bills;
    else if (c.equals("Savings")) sectionTotal = savings;
    else if (c.equals("Variable")) sectionTotal = variable;
    else if (c.equals("Debt")) sectionTotal = debt;
%>

            <div class="section-box">
                <h2><%= c %></h2>

                <table>
                    <tr>
                        <th>Title</th>
                        <th>Amount</th>
                        <th>Action</th>
                    </tr>

<%
    try {
        ps = con.prepareStatement("SELECT * FROM expenses WHERE user_id = ? AND category = ? ORDER BY id ASC");
        ps.setInt(1, userId);
        ps.setString(2, c);
        rs = ps.executeQuery();

        boolean hasData = false;

        while (rs.next()) {
            hasData = true;
%>
                    <tr>
                        <td><%= rs.getString("title") %></td>
                        <td><%= rs.getInt("amount") %></td>
                        <td>
                            <a class="delete-link" href="DeleteExpenseServlet?id=<%= rs.getInt("id") %>">Delete</a>
                        </td>
                    </tr>
<%
        }

        if (!hasData) {
%>
                    <tr>
                        <td colspan="3" class="no-data">No data available</td>
                    </tr>
<%
        }

        rs.close();
        ps.close();

    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>

                </table>

                <div class="total-row">Total: <%= sectionTotal %></div>
            </div>

<%
}
%>

        </div>

    </div>
</div>

<script>
const chartData = [<%= bills %>, <%= savings %>, <%= variable %>, <%= debt %>];

new Chart(document.getElementById("pieChart"), {
    type: 'pie',
    data: {
        labels: ['Bills', 'Savings', 'Variable', 'Debt'],
        datasets: [{
            data: chartData,
            backgroundColor: ['#d8b14a', '#7bb17b', '#7aa7c7', '#d59e7a'],
            borderColor: '#ffffff',
            borderWidth: 2
        }]
    },
    options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
            legend: {
                position: 'bottom',
                labels: {
                    boxWidth: 10,
                    font: {
                        size: 10
                    }
                }
            }
        }
    }
});

new Chart(document.getElementById("barChart"), {
    type: 'bar',
    data: {
        labels: ['Bills', 'Savings', 'Variable', 'Debt'],
        datasets: [{
            data: chartData,
            backgroundColor: ['#d8b14a', '#7bb17b', '#7aa7c7', '#d59e7a']
        }]
    },
    options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
            legend: {
                display: false
            }
        },
        scales: {
            x: {
                ticks: {
                    font: {
                        size: 10
                    }
                },
                grid: {
                    display: false
                }
            },
            y: {
                ticks: {
                    font: {
                        size: 10
                    }
                }
            }
        }
    }
});
</script>

</body>
</html>