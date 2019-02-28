/*var coordinates = [];
				var interval = null;
					var x=0, y=0;
					var msg = '';
						$(window).mousemove(function(event){
						x = event.pageX;
						y = event.pageY;
						msg = 'x: ' + x + ', y: ' + y +', page: ' + window.location.pathname+', user'+$('#username').val();
						$("#coordinates").text(msg);
            coordinates.push(msg);
            if(coordinates.length>50)
            {
              myFunction();
            }
					});*/
          function myfun () {
            $.ajax({
								method:"POST",
								url:"/app/coordinates",
								data:{'coordinates':coordinates},
								success:function(){
									console.log('done ');
								}
							});
              coordinates = [];
          }
					
				
if($('#username').val())
					{
						var mevent=0;
						var actual_time=0;
						var login_time=0;
						var coordinates=[];
						window.setInterval(function () {
							console.log('\n'+mevent+'\n'+actual_time);
							
							if (mevent){
							actual_time+=5;
							mevent=0;
						}
						coordinates.push(actual_time);
						console.log(mevent+'\n'+actual_time);
						},5000)
						$(window).mousemove(function(event){
							mevent=1;
						});
					}
					window.onbeforeunload = function(){
						myfun();
					 return 'Are you sure you want to leave?';
					};