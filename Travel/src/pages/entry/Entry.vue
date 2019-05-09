<template>
  <div >
  <div class="entry-bg">
    <img class="entry-bg-img" src="../../assets/img/1.jpg">
  </div>
    <div class="entry-icon">
      <img class="entry-icon-img" src="../../assets/img/icon.png">
    </div>
    <div class="titles">
    </div>
    <div class="title-text">爱旅游</div>
    <div class="entry-text">欢迎访问爱旅游</div>
    <div class="all-login-text">
      <div class="entry-username"><img class="user-pic" src="../../assets/img/usename.png"><input placeholder="请输入用户名" class="entry-input" type='text'  name="username" v-model='userName'/></div>
      <div class="border-line"></div>
      <div class="entry-password"><img class="user-pic" src="../../assets/img/password.png"><input placeholder="请输入密码" class="entry-input" type='password' name="password" v-model='passWord'/></div>
      <div class="border-line"></div>
      <button class="entry-submit" type='button'  @click="checkform">登陆账户</button><br><br>
      <router-link to="/found">
      <span class="login-text" >忘记密码</span>
      </router-link>
      <router-link to="/register">
        <span class="login-text">账号注册</span>
      </router-link>
      <!--<button class="entry-submit" type='button'  @click="register">注册</button>-->
    </div>
    <div class="entry-toast">密码不能为空</div>
  </div>
</template>
<script>
  export default {
    name:"Entry",
    data (){
      return {
        userName:'',
        passWord:'',
      }
    },
    mounted:function(){
      $(".all-login-text").css("z-index","10");
        $("#first-page").animate(
          {'opacity':"1",
          },3000);
    },
    methods:{
     toast(text) {
    $(".entry-toast").text(text)
    $(".entry-toast").css("display","block");
    setTimeout(function(){
      $(".entry-toast").css("display","none");
    },2000)
  },
      checkform(){
        var name = this.userName;
        var prd = this.passWord;
        this.$http.post('/api/checkuser/fontUser',{
          username:name,
        },{}).then((data) =>{
          if(name != ''){
            if(data.data.length==0){
              this.userName = ''
              this.toast("用户名不存在")
            }else{
              if(prd  == ''){
                this.passWord = ''
                this.toast("密码不能为空")
              }else{
                if(data.data[0].password == prd){
                  console.log("登录成功")
                  window.localStorage.setItem("userName",name)
                  this.$router.push({name:"Home"})
                }else{
                  this.toast("密码错误")
                }
              }
            }
          }else{
            this.toast("用户名不能为空")
          }
        })
      },
    }
  }
  </script>

<style>
  .entry-bg{
  width:100%;
  height:100%;
 }
.entry-bg-img{
  width:100%;
  height:100%;
  /*-webkit-filter: blur(4px);*/
}
  .titles{
    position:absolute;
    left:2.7rem;
    top:2rem;
    width:2rem;
    height:2rem;
    background-color: #fff;
    opacity: 0.3;
    border-radius: 2rem;
  }
  .title-text{
    top:3.2rem;
    left:39%;
    text-align: center;
    position: absolute;
    height:1rem;
    width:20%;
    /*border:1px solid black;*/
    color:#fff;
    font-size: 0.4rem;
  }
  .entry-icon{
   position: absolute;
    z-index: 1;
    top:2.4rem;
    left:3.2rem;
    width:1rem;
    height:0.8rem;
  }
  .entry-icon-img{
    width:100%;
    height:100%;
  }
  .all-login-text{
    position:absolute;
    left:0.6rem;
    top:7rem;
    width:6.2rem;
    height:5rem;
    /*border:1px solid black;*/
    text-align: center;
    color:#fff;
    font-size: 0.3rem;
    /*z-index: 10;*/
  }
  .entry-input{
    outline:none;
    height:0.6rem;
    width:3.5rem;
    border:0;
    background-color:transparent;
    padding-left: 0.1rem;
    color:#a45359;
    /*background-color: #fff;*/
    /*opacity: 0.3;*/
  }
  .entry-username{
     margin-top:0.6rem;
   }
  .entry-password{
    margin-top:0.6rem;
  }
  .entry-submit{
    margin-top:0.6rem;
    height:0.6rem;
    width:4.0rem;
    font-size:0.3rem;
    border-radius: 0.3rem;
    background-color:#be725b;
    border:0;
    color:#fff;
  }
  .user-pic{
    width:0.4rem;
    hieght:0.4rem;
    margin-top:-0.14rem;
    margin-right:0.1rem
  }
  .border-line{
    height:0rem;
    width:4.3rem;
    border:0.01rem solid #fff;
    margin-left:1rem;
  }
  .login-text{
    color:#fff;
    margin:1rem;
    font-size:0.25rem;
  }
  .entry-text{
    margin-top:-9rem;
    margin-left:2rem;
    color:#fff;
    font-size:0.5rem ;
  }
  .entry-toast{
    width:3.5rem;
    height:0.9rem;
    /*border:1px solid black;*/
    border-radius: 0.5rem;
    position:absolute;
    top:11.5rem;
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
