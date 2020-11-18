let isVerified = false;
$('#icon').click(function(){
	  $('#icon i').toggleClass("fa-eye fa-eye-slash");
	var p_input = $('#upass');
	if(p_input.attr("type") == 'password'){
		p_input.attr("type","text");
	} else {
		p_input.attr("type","password");
	}
})
var strength = {
  0: ["Worst","red"],
  1: ["Bad","#ff3300"],
  2: ["Weak","#ffcc00"],
  3: ["Good","#ccff33"],
  4: ["Strong","#66ff33"]
}


$("#upass").keyup(function(){
	var text = document.getElementById('password-strength-text');
	var val = $(this).val();
	var result = zxcvbn(val);
	 // meter.value = result.score;

  // Update the text indicator
  if (val !== "") {
    text.innerHTML = "Strength: " + strength[result.score][0]; 
	  $(".progress-bar").css("width",result.score*25+"%");
	  $(".progress-bar").css("background-color",strength[result.score][1])
  } else {
    text.innerHTML = "";
  }
})
$("#cpass").keyup(function(){
	var pass = $("#upass").val();
	var cpass = $(this).val();
	if(pass != cpass){
		$(this).css("border","1px solid red");
		$(this).css("box-shadow","0 0 10px#ff3300 ");
		$("button[type='submit']").attr("disabled","");
	} else {
		$(this).css("border","1px solid grey");
		$(this).css("box-shadow","0 0 blue ");
			$("button[type='submit']").removeAttr("disabled");
	}
})

$('#verify-btn').click(()=>{
	var num = $('#uNum').val();
	var otp = Math.floor(Math.random()*10000);
	const settings = {
	"async": true,
	"crossDomain": true,
	"url": "https://d7sms.p.rapidapi.com/secure/send",
	"method": "POST",
	"headers": {
		"content-type": "application/json",
		"authorization": "Basic a3FtajU1ODc6VTFVZFp0dFM=",
		"x-rapidapi-key": "659a3ddbfamsh24649b9d7ac0ed5p1d40efjsnd41bc3cee08a",
		"x-rapidapi-host": "d7sms.p.rapidapi.com"
	},
	"processData": false,
	"data": `{\r
    \"content\": \"${otp}\",\r
    \"from\": \"ANNDATA\",\r
    \"to\": 91${num}\r
	}`
	};

	$.ajax(settings).done(function (response) {
		var conf = prompt("Enter the otp")
		if(conf == otp){
			isVerified = true;
		}
	});
})