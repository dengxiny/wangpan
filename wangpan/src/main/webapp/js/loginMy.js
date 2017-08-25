
//获取input的所有id
var user = document.getElementById("user");
var pwd = document.getElementById("pwd");
var surePwd = document.getElementById("surePwd");
var flagsub1;
var flagsub2;
//获取span的所有id
var user_pass = document.getElementById("user_pass");
var pwd_pass = document.getElementById("pwd_pass");
var surePwd_pass = document.getElementById("surePwd_pass");
//var username=$("#username").val();

function checkUser(){
    //如果昵称未输入，则提示输入昵称

	var pattern = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;    
		flag = pattern.test(user.value);
    if(!user.value){
        user_pass.style.fontSize = "13px";
        user_pass.style.width="31%";
        user_pass.style.height="2em";
        user_pass.style.textAlign="center";
        user_pass.style.lineHeight="2em";
        user_pass.style.marginTop='0.05%'
        user_pass.innerHTML = '你还没有填写用户名哦。';
        user_pass.style.display="block";
        user.focus().select();
        
        	
    }
    else if(user.value!=null&&flag){
        user_pass.style.display="none";
        flagsub1=true;
       
    }
    else if(user.value&&!flag){
    
    	 user_pass.style.fontSize = "13px";
         user_pass.style.width="31%";
         user_pass.style.height="2em";
         user_pass.style.textAlign="center";
         user_pass.style.lineHeight="2em";
         user_pass.style.marginTop='0.05%'
         user_pass.innerHTML = '你的邮箱格式不正确。';
         user_pass.style.display="block";
         user.focus().select();
        
    }
}



//确认密码提示
function checkUser2(){
    //再次确认密码
    if(!surePwd.value){
        surePwd_pass.style.fontSize = "13px";
        surePwd_pass.style.width="31%";
        surePwd_pass.style.height="2em";
        surePwd_pass.style.textAlign="center";
        surePwd_pass.style.lineHeight="2em";
        surePwd_pass.innerHTML = '你还没有填写验证码哦';
        surePwd_pass.style.display="block";
       // surePwd.focus().select();
     
    }
    else{	
    	$.ajax({ 
    	
    	  url: 'yanzheng.do',
  		  type: 'POST',
  		  data: "yanzhengma="+surePwd.value,
  		  dataType: 'text',
  		  success: function(data){
  		 if(data=="success"){
  			surePwd_pass.innerHTML ='';
  	        surePwd_pass.style.backgroundColor= "#fff";
  	        surePwd_pass.style.border="none";
  	        surePwd_pass.style.display="none";
  	       flagsub2=true;
  	        }
  		  else{
  			
  			 surePwd_pass.style.fontSize = "13px";
  	        surePwd_pass.style.width="31%";
  	        surePwd_pass.style.height="2em";
  	        surePwd_pass.style.textAlign="center";
  	        surePwd_pass.style.lineHeight="2em";
  	        surePwd_pass.innerHTML = '验证码错误';
  	        surePwd_pass.style.display="block";
  	      //surePwd.focus().select();
        
  	        }
  		  },
  		  error:function(){
  		  },
  		});
    }
}

function  submitB(){

    if( flagsub1==true&&flagsub2==true){
    	return true;
    }
    else{
    	return false;
    }
}

