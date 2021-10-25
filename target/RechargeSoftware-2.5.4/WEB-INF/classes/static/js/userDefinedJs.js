	$(document).ready(function() {
		$("#confirm_password").on("keyup",function(){
			var b = $("#user_password").val();
			console.log(b);
			var a = this.value;
			console.log(a);
			if(b.length > 0 && a!= b){
			$("#small_cnf_pwd").html("Password does not match").css("color","red !important");
			}
			else{
			$("#small_cnf_pwd").html(" ");
			}
		});
		});