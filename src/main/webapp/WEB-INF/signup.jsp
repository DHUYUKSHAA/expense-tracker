<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup</title>

<style>
body {
    font-family: Arial;
    background: #fffdf5;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.card {
    background: white;
    padding: 30px;
    border-radius: 10px;
    width: 300px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}

input {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
}

button {
    width: 100%;
    padding: 10px;
    background: #f4b400;
    color: white;
    border: none;
}

</style>
</head>

<body>

<div class="card">

<h2>Signup</h2>

<form action="SignupServlet" method="post">

<input type="text" name="name" placeholder="Name" required>

<input type="email" name="email" placeholder="Email" required>

<input type="password" name="password" placeholder="Password" required>

<button type="submit">Register</button>

</form>

</div>

</body>
</html>