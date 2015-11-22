<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VENUS</title>
        <link rel="stylesheet" href="header.css">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

    </head>
    <body>
        <div class="header">
            <img src="http://icons.iconarchive.com/icons/zairaam/bumpy-planets/256/09-uranus-icon.png" alt="Mountain View" style="margin-left: 30px;">
        </div>
        <div class="form1">
        <div class="login">
            <form id="form" method = "get" action = "loginCheck.jsp" onsubmit="return validateForm()">
            <p class="n"><h3>Login</h3></p>
            <p id="loginfail"></p>
            <p class="n">Email:</p>
            <input class="imgp" type = "text" name = "email" placeholder="Your Email" required=""/>
            <img class="imgp" id="img" src="https://dialectline.files.wordpress.com/2013/06/sign-error-icon.png" alt="Mountain View" style="width: 15px; height: 15px; visibility: hidden">
            <br>
            <p id="pp" style="font-size: 11px; color: crimson"></p>
            <p class="n">Password:</p>
            <input class="imgp" type = "password" name = "password" placeholder="Your Password" required=""/>
            
            <input class="btn" type = "submit" name = "Submit"
            value = "Login" />
            <input class="btn2" type = "reset" value = "Reset" />
        </form>
        </div></div>
        <script type="text/javascript">
function validateForm() {
    var x = document.forms["form"]["email"].value;
    if (x == null || x == "") {
        var img = document.createElement("IMG");
	img.src = "http://www.othona-bradwell.org.uk/assets/icons/field-required.png";
	$("#ii").empty();
	document.getElementById('ii').appendChild(img);
        return false;
    }
   var email = document.forms["form"]["email"].value;
   var re = /[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}/igm;
if (!re.test(email)&& email!="")
{
    document.getElementById("img").style.visibility = "visible";
    $("#pp").text("InValid Email Pattern");
    return false;
}
}
</script>

    </body>
</html>
