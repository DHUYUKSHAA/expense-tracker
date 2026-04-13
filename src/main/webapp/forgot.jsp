<!DOCTYPE html>
<html>
<head>
<title>Forgot Password</title>
</head>
<body>

<h2>Reset Password</h2>

<form action="ForgotServlet" method="post">
    <input type="email" name="email" placeholder="Enter your email" required><br><br>
    <input type="password" name="newPassword" placeholder="New Password" required><br><br>
    <button type="submit">Update Password</button>
</form>

</body>
</html>