<%@ include file="header.jsp"%>
<jsp:useBean id="useremail"  class="UserManagement.UserManagementFacade"></jsp:useBean>
<div class="changepasswordform">
        <div class="changepassword">
            <form id="form" class="changepasswordform1" method = "get" action = "changePasswordCheck.jsp" onsubmit="return validateFormofChangePassword()">
            <p class="n"><h3>Change password</h3></p>
            <p> You will be prompted to log in again after setting your new password
            <p id="pp" style="font-size: 11px; color: crimson"></p>
            <p class="n">Current password:</p>
            <input class="fieldareaofchangepassword" type = "password" name = "currentpassword" placeholder="Your current password" required="" />
        <br>
            <p id="pp" style="font-size: 11px; color: crimson"></p>
            <p class="n">New password:</p>
            <input class="fieldareaofchangepassword" type = "password" name = "newpassword" placeholder="Your new password" required=""/>
            
            <input class="Setchangepassword" type = "submit" name = "Submit"
            value = "Submit" />
            <input class="Setchangepasswordcancel" type = "reset" name = "reset" value = "Cancel" />
        </form>
        </div></div>
<script type="text/javascript">
function validateFormofChangePassword() {
    var currentpassword = document.forms["form"]["currentpassword"].value;
    if (currentpassword === null || currentpassword === "") {
        var img = document.createElement("IMG");
	img.src = "http://www.othona-bradwell.org.uk/assets/icons/field-required.png";
	$("#ii").empty();
	document.getElementById('ii').appendChild(img);
        return false;
    }
   var newpassword = document.forms["form"]["newpassword"].value;

if (newpassword === null || newpassword === "")
{
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
