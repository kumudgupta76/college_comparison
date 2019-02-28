// ajax call for login

  $('#error').hide();
   $(function(){ 
    $('#loginbtn').on('click',function () {
      // alert("login");
      $.ajax({
url:"/app/login",
method:"POST",
data:{mob:$("#mobl").val(),psw:$("#pswl").val()},
dataType:"text",
success: function(data){
  if(data=="loged in")
  {
  window.location.reload();
  $('#loginmodal').remove();
$(".modal-backdrop").remove();

}
else{$('#error').show();}
},
});

$('#mobl').val('');
$('#pswl').val('');
});});
 

