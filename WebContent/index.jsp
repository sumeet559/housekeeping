<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title>Login</title>
	<h1 style="font-family:verdana">HouseKeeping.com</h1>
		 <link rel="stylesheet" href="css/style.css">
	 </head>
	 

  <body>
  <style>
body {
    background-image: url("4.jpg");
    background-repeat: no-repeat;
    background-size: cover;
}
</style>

    <body class="align">

  <div class="site__container">

    <div class="grid__container">
		<div class="invalid" style="color:red">${messages}</div><br>
      <form action="LogIn" method="post" class="form form--login">

        <div class="form__field">
        
          <label class="fontawesome-user" for="login__username"><span class="hidden">Username</span></label>
          <input id="login__username" type="text" name = "username" class="form__input" placeholder="Username" required>
        </div>

        <div class="form__field">
          <label class="fontawesome-lock" for="login__password"><span class="hidden">Password</span></label>
          <input id="login__password" type="password" name = "pwd" class="form__input" placeholder="Password" required>
        </div>

        <div class="form__field">
          <input type="submit" value="Sign In">
        </div>

      </form>

      <p class="text--center">Not a member? <a href="register.html">Sign up now</a> <span class="fontawesome-arrow-right"></span></p>
    </div>

  </div>

</body>

    </body>
</html>