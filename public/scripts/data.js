var list_data = [];
function addData(){
	var data = {
		usrId: $('#usrId').val(),
		item: $('#item').val(),
		qty: $('#qty').val(),
		price: $('#price').val()
	}
	$.post('https://anndata-gusov.run.goorm.io/items', data, function(response){
		// console.log(response);
      alert("success");
		showUsrData([response],'n');
		
});
}
function getData(){
	$.get('https://anndata-gusov.run.goorm.io/items',{usrId: $('#usrId').val()},function(res){
		showUsrData(res,'n');
		showListData(res);
	})
}
$(document).ready(function(){
	getData();
	console.log(list_data);
})
$("#addBtn").click(function(){
	$("#addForm").toggleClass('h-0');
})

function delData(x){
	$.ajax({
    url: "https://anndata-gusov.run.goorm.io/items/"+x,
    method: 'DELETE',
	data:{objId:x},
    contentType: 'application/json',
    success: function(result) {
        alert("deleted")
		showUsrData(result,'c');
    },
    error: function(request,msg,error) {
        // handle failure
    }
});
}
function showListData(l_data){
	var id = $('#usrId').val()
	l_data.forEach(function(item,index){
			if(item.usrId != id){
				$('#d').append(`<tr>\
										  <th scope = 'row'>${index+1}</td>\
										  <td>${item['item']}</td>\
										  <td>${item['qty']}</td>\
										  <td>${item['price']}</td>\
										  <td><button class = 'btn btn-secondary' onclick = getContact('${id}')>Get Contact</button></td>\
										</tr>`)
			}
			
		})
}
function getContact(x){
	$.get('https://anndata-gusov.run.goorm.io/contact/'+x,{usrId: x},function(res){
		var num = $('#num').text();
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
    \"content\": \"Name: ${res.uname},Number: ${res.username}\",\r
    \"from\": \"ANNDATA\",\r
    \"to\": 91${num}\r
	}`
	}
	$.ajax(settings).done(function (response) {
		alert('Contact details sent');
	});
	})
}
function showUsrData(ldata,i){
	if(i === 'c'){
		$('#list_data').html("");
	}
	ldata.forEach(function(item,index){
			if(item.usrId === $('#usrId').val()){
				$('#list_data').append(`<tr>\
										  <td>${item['item']}</td>\
										  <td>${item['qty']}</td>\
										  <td>${item['price']}</td>\
										  <td><button class = 'btn btn-danger' onclick = delData('${item['_id']}')>Delete</button></td>\
										</tr>`)
			}
			
		})
}