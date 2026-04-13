<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    font-family:'Poppins',sans-serif;
    height:100vh;
    background:#fff8e6;
    display:flex;
    justify-content:center;
    align-items:center;
}

/* main box */
.container{
    width:850px;
    height:450px;
    background:white;
    display:flex;
    border-radius:20px;
    box-shadow:0 10px 25px rgba(0,0,0,0.1);
    overflow:hidden;
}

/* left */
.left{
    width:50%;
    background:#fff3cc;
    display:flex;
    flex-direction:column;
    justify-content:center;
    align-items:center;
    padding:20px;
}

.left img{
    width:200px;
}

.left h2{
    margin-top:10px;
    color:#333;
}

/* right */
.right{
    width:50%;
    padding:40px;
    display:flex;
    flex-direction:column;
    justify-content:center;
}

.right h1{
    margin-bottom:20px;
}

/* inputs */
input{
    width:100%;
    padding:10px;
    margin:10px 0;
    border-radius:8px;
    border:1px solid #ccc;
}

/* button */
button{
    padding:10px;
    background:#f4b400;
    border:none;
    color:white;
    border-radius:8px;
    cursor:pointer;
}

/* link */
.link{
    margin-top:10px;
    font-size:14px;
}
</style>

</head>

<body>

<div class="container">

    <!-- LEFT -->
    <div class="left">
        <img src="https://cdn-icons-png.flaticon.com/512/2489/2489756.png">
        <h2>Expense Tracker</h2>
    </div>

    <!-- RIGHT -->
    <div class="right">

        <h1>Login</h1>

        <form action="LoginServlet" method="post">

            <input type="email" name="email" placeholder="Email" required>

            <input type="password" name="password" placeholder="Password" required>

            <button type="submit">Login</button>

        </form>

        <div class="link">
            New user? <a href="signup.jsp">Sign up</a>
            <a href="forgot.jsp">Forgot Password?</a>
        </div>

    </div>

</div>

</body>
</html>