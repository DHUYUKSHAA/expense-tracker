<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    font-family:'Poppins',sans-serif;
    background:linear-gradient(135deg,#fffdf5,#fff7d8);
    min-height:100vh;
    overflow-x:hidden;
    position:relative;
}

/* background */
.shape1{
    position:absolute;
    top:-100px;
    right:-100px;
    width:280px;
    height:280px;
    border-radius:50%;
    background:#ffe082;
    opacity:0.40;
}

.shape2{
    position:absolute;
    bottom:-120px;
    left:-120px;
    width:320px;
    height:320px;
    border-radius:50%;
    background:#ffd54f;
    opacity:0.25;
}

.container{
    width:100%;
    min-height:100vh;
    display:flex;
    align-items:center;
    justify-content:center;
    padding:30px 20px;
    position:relative;
    z-index:2;
}

.wrapper{
    width:100%;
    max-width:1180px;
    display:grid;
    grid-template-columns:0.95fr 1.05fr;
    background:#ffffff;
    border-radius:30px;
    overflow:hidden;
    box-shadow:0 20px 50px rgba(0,0,0,0.09);
}

/* left side */
.left{
    background:linear-gradient(160deg,#fff4bf,#fff9e8);
    padding:55px 45px;
    display:flex;
    flex-direction:column;
    justify-content:center;
}

.left .tag{
    display:inline-block;
    width:fit-content;
    background:#f4b400;
    color:#fff;
    padding:10px 18px;
    border-radius:25px;
    font-size:14px;
    font-weight:600;
    margin-bottom:24px;
}

.left h1{
    font-size:42px;
    line-height:1.25;
    color:#1f2230;
    margin-bottom:18px;
}

.left p{
    font-size:16px;
    line-height:1.8;
    color:#555;
    margin-bottom:28px;
    max-width:430px;
}

.info-box{
    background:rgba(255,255,255,0.75);
    border:1px solid #f1df9d;
    border-radius:20px;
    padding:22px;
    max-width:400px;
    margin-bottom:28px;
}

.info-box h3{
    font-size:22px;
    color:#1f2230;
    margin-bottom:14px;
}

.info-box ul{
    list-style:none;
}

.info-box ul li{
    font-size:15px;
    color:#444;
    margin-bottom:12px;
    padding-left:18px;
    position:relative;
    line-height:1.6;
}

.info-box ul li::before{
    content:"";
    position:absolute;
    left:0;
    top:10px;
    width:8px;
    height:8px;
    border-radius:50%;
    background:#f4b400;
}

.left img{
    width:220px;
    max-width:100%;
}

/* right side */
.right{
    padding:55px 45px;
    display:flex;
    align-items:center;
    justify-content:center;
    background:#fff;
}

.form-card{
    width:100%;
    max-width:420px;
}

.form-card h2{
    font-size:36px;
    color:#1f2230;
    margin-bottom:10px;
}

.form-card .subtext{
    font-size:15px;
    color:#667085;
    margin-bottom:28px;
}

.input-group{
    margin-bottom:18px;
}

.input-group label{
    display:block;
    font-size:14px;
    font-weight:500;
    color:#333;
    margin-bottom:8px;
}

.input-group input{
    width:100%;
    padding:15px 16px;
    border:1px solid #ececec;
    border-radius:14px;
    font-size:15px;
    outline:none;
    background:#f9fbff;
    transition:0.3s;
}

.input-group input:focus{
    border-color:#f4b400;
    box-shadow:0 0 0 4px rgba(244,180,0,0.12);
    background:#fff;
}

.signup-btn{
    width:100%;
    padding:15px;
    border:none;
    border-radius:14px;
    background:#f4b400;
    color:#fff;
    font-size:17px;
    font-weight:600;
    cursor:pointer;
    transition:0.3s;
    margin-top:8px;
}

.signup-btn:hover{
    background:#dd9f00;
}

.bottom-link{
    margin-top:18px;
    text-align:center;
    font-size:14px;
    color:#555;
}

.bottom-link a{
    color:#1d4ed8;
    font-weight:600;
    text-decoration:none;
}

.bottom-link a:hover{
    text-decoration:underline;
}

@media(max-width:950px){
    .wrapper{
        grid-template-columns:1fr;
    }

    .left,
    .right{
        padding:35px 25px;
    }

    .left h1{
        font-size:32px;
    }

    .left img{
        width:180px;
    }
}
</style>
</head>

<body>

<div class="shape1"></div>
<div class="shape2"></div>

<div class="container">
    <div class="wrapper">

        <div class="left">
            <div class="tag">Create Account</div>

            <h1>Build better spending habits from day one</h1>

            <p>
                Create your account to manage expenses, monitor your money flow,
                and stay in control of your savings goals.
            </p>

            <div class="info-box">
                <h3>Why use this app?</h3>
                <ul>
                    <li>Record daily income and expenses clearly</li>
                    <li>Understand where your money goes</li>
                    <li>Develop smarter saving habits over time</li>
                </ul>
            </div>

            <img src="https://cdn-icons-png.flaticon.com/512/2489/2489756.png" alt="Money Savings">
        </div>

        <div class="right">
            <div class="form-card">
                <h2>Sign Up</h2>
                <div class="subtext">Create your new expense tracker account</div>

                <form action="SignupServlet" method="post">
                    <div class="input-group">
                        <label>Full Name</label>
                        <input type="text" name="name" placeholder="Enter your full name" required>
                    </div>

                    <div class="input-group">
                        <label>Email Address</label>
                        <input type="email" name="email" placeholder="Enter your email" required>
                    </div>

                    <div class="input-group">
                        <label>Password</label>
                        <input type="password" name="password" placeholder="Create a password" required>
                    </div>

                    <button type="submit" class="signup-btn">Create Account</button>
                </form>

                <div class="bottom-link">
                    Already have an account? <a href="login.jsp">Login</a>
                </div>
            </div>
        </div>

    </div>
</div>

</body>
</html>