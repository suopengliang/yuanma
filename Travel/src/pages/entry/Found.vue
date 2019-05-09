<template>
  <div>
    <img class="found-bg" src="../../assets/img/1.jpg">
    <div class="found-top">
      忘记密码
    </div>
    <router-link to="/"><img class="quit-na" src="../../assets/img/quit.png"></router-link>
    <div class="found-text">
      <img class="found-pic" src="../../assets/img/usename.png"><input  placeholder="请输入用户名" class="fount-input" type='text'  name="username" v-model='userName'/><br>
      <div class="found-line"></div>
      <img class="found-pic found-email" src="../../assets/img/email.png"><input  placeholder="请输入邮箱" class="fount-input" type='text'  name="userEmail" v-model='userEmail'/>
      <div class="found-line"></div>
      <img class="found-pic" src="../../assets/img/password.png"><input  placeholder="请输入密码" class="fount-input" type='password'  name="userPassword" v-model='userPassword'/>
      <div class="found-line"></div>
      <img class="found-pic" src="../../assets/img/password.png"><input  placeholder="请再次输入密码" class="fount-input" type='password'  name="againPassword" v-model='againPassword'/>
      <div class="found-line"></div>
      <button class="found-submit" type='button'  @click="foundSubmit">提交</button><br><br>
    </div>
    <div class="found-toast"></div>
  </div>
</template>
 <script>
   export default {
     name:"Found",
     data (){
       return{
         userName:'',
         userEmail:'',
         userPassword:'',
         againPassword:'',
       }
     },
     methods:{
   toast(text) {
           $(".found-toast").text(text)
           $(".found-toast").css("display","block");
         setTimeout(function(){
            $(".found-toast").css("display","none");
         },2000)
       },
       foundSubmit(){
         var name = this.userName;
         var email = this.userEmail;
         var password = this.userPassword;
         var againpassword = this.againPassword;
         this.$http.post("/api/checkuser/fontUser",{
           username:name
         }).then((data) =>{
           if(name == ''&& email=="" && password==""&&againpassword==""){
             this.toast("任一项不能为空")
           }else{
             if(data.data.length == 0){
               this.userName = ''
               this.toast("该用户不存在")
             }else{
               if(data.data[0].email != email){
                 this.email = ""
                 this.toast("邮箱错误")
               }else{
                 if(password != againpassword){
                   this.userPassword = ""
                   this.againPassword = ""

                   this.toast("两次密码不一致")
                 }else{
                   this.$http.post("/api/checkuser/updatepassword",{
                     password:password,
                     username:name,
                   }).then((data) =>{
                     if(data.ok){
                       this.toast("修改密码成功")
                     }
                   })
                 }
               }
             }
           }
         })
       },
     }
   }
  </script>

<style>
  #first-page{
    opacity: 1;
  }
  .found-bg{
    width:100%;
    height:100%;
  }
  .found-top{
    width:100%;
    height:1rem;
    background-color: #564b69;
    position:absolute;
    top:0;
    color:#fff;
    text-align: center;
    line-height: 1rem;
    font-size: 0.4rem;
  }
  .quit-na{
    position:absolute;
      width:0.8rem;
      height:0.7rem;
       left:0rem;
       top:0.1rem
  }
  .found-text{
    position:absolute;
    /*border:1px solid black;*/
    top:4rem;
    width:100%;
    text-align: center;
    color:#fff;
    font-size:0.3rem;
  }
  .found-line{
    border:0.01rem solid #6b6d89;
    margin-top:0.1rem;
    margin-left:1.4rem;
    width:4.8rem;

  }
  .fount-input{
    border:0;
    height:0.5rem;
    width:4rem;
    margin-top:0.4rem;
    background-color:transparent;
    outline: none;
     color:#fff;
  }
  .found-submit{
    margin-top:0.6rem;
    height:0.6rem;
    width:3.3rem;
    font-size:0.3rem;
    border-radius: 0.3rem;
    background-color:#be725b;
    border:0;
    color:#fff;
  }
  .found-pic{
    width:0.4rem;
    hieght:0.4rem;
    margin-top:-0.14rem;
    margin-right:0.1rem
  }
  .found-email{
    width:0.6rem;
    hieght:0.6rem;
  }
  .fount-input::-webkit-input-placeholder{
    color:#fff;
  }
  .found-toast{
    width:3.5rem;
    height:0.9rem;
    /*border:1px solid black;*/
    border-radius: 0.5rem;
    position:absolute;
    top:10rem;
    left:2rem;
    background-color: #666666;
    color:#fff;
    font-size: 0.3rem;
    padding:0.1rem;
    text-align: center;
    line-height: 0.7rem;
    display:none;
  }
</style>
