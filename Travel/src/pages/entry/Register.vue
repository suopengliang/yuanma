<template>
  <div>
    <img class="register-bg" src="../../assets/img/1.jpg">
    <div class="register-top">
      用户注册
    </div>
    <router-link to="/"><img class="quit-na" src="../../assets/img/quit.png"></router-link>
    <div class="register-text">
      <img class="register-pic" src="../../assets/img/usename.png"><input  placeholder="请输入用户名" class="register-input" type='text'  name="username" v-model='userName'/><br>
      <div class="register-line"></div>
      <img class="register-pic register-email" src="../../assets/img/email.png"><input  placeholder="请输入邮箱" class="register-input" type='text'  name="userEmail" v-model='userEmail'/>
      <div class="register-line"></div>
      <img class="register-pic" src="../../assets/img/password.png"><input  placeholder="请输入密码" class="register-input" type='password'  name="userPassword" v-model='userPassword'/>
      <div class="register-line"></div>
      <img class="register-pic" src="../../assets/img/password.png"><input  placeholder="请再次输入密码" class="register-input" type='password'  name="againPassword" v-model='againPassword'/>
      <div class="register-line"></div>
      <button class="register-submit" type='button'  @click="regSubmit">注册</button><br><br>
    </div>
    <div class="register-toast"></div>
  </div>
</template>

<script>
export default {
  name:"Register",
  data (){
    return{
      userName:'',
      userEmail:'',
      userPassword:'',
      againPassword:'',
      usernumber:0,
    }
  },
  methods: {
    toast(text){
      $(".register-toast").text(text)
      $(".register-toast").css("display","block");
      setTimeout(function(){
        $(".register-toast").css("display","none");
      },2000)
    },
    regSubmit() {
      var mailReg = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
      if(this.userName == "" && this.userEmail == "" && this.userPassword == "" && this.againPassword == ""){
        toast("任一项不能为空")
      }else{
        this.$http.post('/api/checkuser/seekall', {
        }).then((data) =>{
          for(var i = 0;i < data.body.length;i++){
            if(data.body[i] .username== this.userName){
              this.toast("用户名已存在");
              this.userName = '';
              this.usernumber = 1;
              break;
            }else{
              this.usernumber = 0;
            }
          }

          if(this.usernumber == 0){
            if(mailReg.test(this.userEmail)){
              if(this.userPassword != this.againPassword){
                this.toast("两次密码不一致");
                this.userPassword = "";
                this.againPassword = "";
              }else{
                this.$http.post("/api/checkuser/insertUser",{
                  username:this.userName,
                  email:this.userEmail,
                  password:this.userPassword,
                  fav:0
                }).then((data) => {
                  if(data.ok){
                    let _this= this;
                    _this.toast("注册成功")
                    setTimeout(function(){
                    _this.$router.push({name:"Entry"})
                    },1000)
//                       this.$router.push({name:"Entry"})s
                  }
                })
              }
            }else{
              this.toast("请输入有效的邮箱")
            }

          }
        })
      }
    }
  },
}
  </script>

<style>
  #first-page{
    opacity: 1;
  }
  .register-bg{
    width:100%;
    height:100%;
  }
  .register-top{
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
  .register-text{
    position:absolute;
    /*border:1px solid black;*/
    top:4rem;
    width:100%;
    text-align: center;
    color:#fff;
    font-size:0.3rem;
  }
  .register-line{
    border:0.01rem solid #6b6d89;
    margin-top:0.1rem;
    margin-left:1.4rem;
    width:4.8rem;

  }
  .register-input{
    border:0;
    height:0.5rem;
    width:4rem;
    margin-top:0.4rem;
    background-color:transparent;
    outline: none;
    color:#fff;
  }
  .register-submit{
    margin-top:0.6rem;
    height:0.6rem;
    width:3.3rem;
    font-size:0.3rem;
    border-radius: 0.3rem;
    background-color:#be725b;
    border:0;
    color:#fff;
  }
  .register-pic{
    width:0.4rem;
    hieght:0.4rem;
    margin-top:-0.14rem;
    margin-right:0.1rem
  }
  .register-email{
    width:0.6rem;
    hieght:0.6rem;
  }
  .register-input::-webkit-input-placeholder{
    color:#fff;
  }
  .register-toast{
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
