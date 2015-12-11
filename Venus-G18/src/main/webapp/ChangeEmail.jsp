<%@ include file="header.jsp"%>
<jsp:useBean id="userpwd"  class="UserManagement.User"></jsp:useBean>
<div class="changepasswordform">
        <div class="changepassword">
            <form id="form" class="changepasswordform1" method = "get" action = "changeEmailCheck.jsp" onsubmit="return validateFormofChangeEmail()">
            <p class="n"><h3>Change e-mail</h3></p>
            <p> You will be prompted to log in again after setting your new e-mail
            <p id="pp" style="font-size: 11px; color: crimson"></p>
            <p class="n">Email:</p>
            <input class="fieldareaofchangepassword" type = "text" name = "currentemail" placeholder="Your current email" required=""/>
            <img class="fieldareaofchangepassword" id="img" src="https://dialectline.files.wordpress.com/2013/06/sign-error-icon.png" alt="Mountain View" style="width: 15px; height: 15px; visibility: hidden">
           
            <p id="pp" style="font-size: 11px; color: crimson"></p>
            <p id="pp" style="font-size: 11px; color: crimson"></p>
            <br>
            <p class="n">New email:</p>
            <input class="fieldareaofchangepassword" type = "text" name = "newemail" placeholder="Your new email" required=""/>
            
            <input class="Setchangepassword" type = "submit" name = "Submit"
            value = "Submit" />
            <input class="Setchangepasswordcancel" type = "reset" name = "reset" value = "Cancel" />
        </form>
        </div></div>
<script type="text/javascript">
function validateFormofChangeEmail() {
    var x = document.forms["form"]["currentemail"].value;
   if (currentemail === null || currentemail === "") {
        var img = document.createElement("IMG");
	img.src = "http://www.othona-bradwell.org.uk/assets/icons/field-required.png";
	$("#ii").empty();
	document.getElementById('ii').appendChild(img);
        return false;
    }
   var newemail = document.forms["form"]["newemail"].value;
  
   if (newemail === null || newemail === "")
    {
    
    document.getElementById("img").style.visibility = "visible";
    var img = document.createElement("IMG");
	img.src = "http://www.othona-bradwell.org.uk/assets/icons/field-required.png";
	$("#ii").empty();
	document.getElementById('ii').appendChild(img);
        return false;
}


}
</script>

    </body>
</html>
