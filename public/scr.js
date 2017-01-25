//api key:3KIXRRUJ22OOZSUY
$(function(){

$('#like').click(function(ev){
      ev.preventDefault();
      console.log('click like');
      var para = ($('#para').text());
      var image = ($('#image').attr('src'));
      var userid = $('#usrid').text();

      var obj = {};
      obj.para = para;
      obj.image = image;
      obj.userid = Number(userid);
      console.log(obj);
       $.post('/likedlist',{art_name:obj.para,art_image:obj.image,userid:obj.userid},function(data){
           if(data==='done'){
             console.log('login success');
           }
    })




})


            var email = $('#email').text();
            var password = $('#newpass').text();
            var obj = {};
            obj.email = email;
            obj.password= password;
            user={email:email,password:password}
            $('#carnage').click(function(){
            $.ajax({
              url:'/update',
              method:'put',
              datatype:'json',
              data:user,
              success:function(data){
                console.log('data.email');
              }
            })
        })

            $('#submit').click(function(){$('#musicianpic').show('slow')})
              })
// var useid=$('#userid').text();
//   $('#getlikes').click(function(){
//     $.post('/getlikes',{userid:useid});
//   })




