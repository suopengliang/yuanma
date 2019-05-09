<template>
  <div class="set-box">
    <div class="all-naviga">
      <div class="naviga-box"></div>
      <div class="naviga-text " @click = "indexClick"><img class="index-img" src="../../static/img/index.png">首页</div>
      <div class="naviga-text naviga-left" @click = "orderClick"><img class="index-img" src="../../static/img/order.png">订单</div>
      <div class="naviga-text naviga-left index-text" ><img class="index-img" src="../../static/img/set2.png">设置</div>
      <div class="naviga-text naviga-left" @click = "quitClick"><img class="index-img" src="../../static/img/quit.png">退出</div>
    </div>

    <div class="set-top">设置</div>
    <div class="set-head">
      <img class="set-head-img" src="../../static/img/head.png"> <div class="set-head-text" v-model="name">会员名：{{name}}</div>
    </div>
    <div @click="changeName" class="set-password">修改用户名</div><img class="set-next" src="../../static/img/next.png">
    <div @click="changePassword" class="set-password">修改密码</div><img class="set-next" src="../../static/img/next.png">
    <div @click="changeEmail"class="set-password">修改绑定邮箱</div><img class="set-next" src="../../static/img/next.png">
    <div @click="changeCancel" class="set-password">注销账户</div><img class="set-next" src="../../static/img/next.png">
    <div class="set-password">开发者名字：仓腾飞</div>
    <div class="set-password">版本：v0.0.1</div>
    <div class="set-password">更新：当前已是最新版本</div>
    <div class="set-content-box">
      <h1 class="set-name-title">修改用户名</h1>
      <!--<img class="change-close" src="../../static/img/close2.png">-->
      <div class="set-newname">新用户名：<input type="text" class="new-name" placeholder="输入新用户名"></div>
      <div class="set-c set-confirm" @click="setConfirm">确定</div><div @click="setCancel"class="set-c set-cancel">取消</div>
    </div>

    <div class="set-content-box-pas">
      <h1 class="set-name-title-pas">修改密码</h1>
      <!--<img class="change-close" src="../../static/img/close2.png">-->
      <div class="set-pas">旧密码：<input type="text" class="new-pas" placeholder="输入旧密码"></div>
      <div class="set-pas">新密码：<input type="text" class="new-pas2" placeholder="输入新密码"></div>
      <div class="set-c set-confirm" @click="setPasCon">确定</div><div @click="setPasCan"class="set-c set-cancel">取消</div>
    </div>

    <div class="set-content-box-email">
      <h1 class="set-name-title">修改邮箱</h1>
      <!--<img class="change-close" src="../../static/img/close2.png">-->
      <div class="set-email">新邮箱：<input type="text" class="new-email" placeholder="输入新邮箱"></div>
      <div class="set-c set-confirm" @click="setEmail">确定</div><div @click="setEmailCancel"class="set-c set-cancel">取消</div>
    </div>

    <div class="set-content-box-can">
      <h1 class="set-name-title">是否注销用户</h1>
      <div class="set-c set-confirm1" @click="setusecan">确定</div><div @click="setuseno"class="set-c set-cancel1">取消</div>
    </div>
    <div class="toast-box">用户名重复</div>
  </div>
</template>

<script>
export default {
  name:"Setall",
  data(){
    return{
      name:window.localStorage.getItem("userName"),
      password:"",
      username:"",
      email:"",
      alldata:[],

    }
  },
  created(){
//    window.localStorage.setItem("userName","yu")
    this.getData();
  },
  methods:{
    orderClick(){
      this.$router.push({name:"Order"})
    },
    indexClick(){
      this.$router.push({name:"Home"})
    },
    quitClick(){
      alert("退出")
    },
    changeName(){
      document.getElementsByClassName("set-content-box")[0].style.display = "block";
    },
    changePassword(){
      document.getElementsByClassName("set-content-box-pas")[0].style.display = "block"
    },
    changeEmail(){
      document.getElementsByClassName("set-content-box-email")[0].style.display = "block"
    },
    changeCancel(){
      document.getElementsByClassName("set-content-box-can")[0].style.display = "block"
    },
    getData(){
      this.$http.post('/api/checkuser/seekall',{
//        username:this.name,
      },{}).then((data) =>{
        this.alldata = data.data;
      })
      this.$http.post('/api/checkuser/fontUser',{
        username:this.name,
      },{}).then((data) =>{
        this.password = data.data[0].password;
        this.username = data.data[0].username;
        this.email = data.data[0].email;
      })
    },
    setConfirm(){
      this.getData();
      var nameInput = document.getElementsByClassName("new-name")[0].value;
      var j = 1;
      if(nameInput == ""){
        this.toast("不能为空")
      }else{
        for(var i = 0;i < this.alldata.length;i++){
          if(this.alldata[i].username == nameInput){
            console.log(this.alldata[i].username)
            j++;
            this.toast("用户名重复")

          }
        }
        if(j == 1){
          this.$http.post('/api/checkuser/updateusername',{
            newname:nameInput,
            username:window.localStorage.getItem("userName")
          },{}).then((data) =>{

          })
          this.$http.post('/api/checkuser/updatenicks',{
            newname:nameInput,
            username:window.localStorage.getItem("userName")
          },{}).then((data) =>{
             window.localStorage.setItem("userName",nameInput)
            this.name = window.localStorage.getItem("userName")
            this.toast("更改成功")
            document.getElementsByClassName("set-content-box")[0].style.display = "none";
          })
        }
      }

    },
    setCancel(){
      document.getElementsByClassName("set-content-box")[0].style.display = "none";
    },
    setPasCon(){
      if(document.getElementsByClassName("new-pas")[0].value == ""){
        this.toast("请输入旧密码");
        return;
      }
      if(document.getElementsByClassName("new-pas2")[0].value == ""){
        this.toast("请输入新密码");
        return;
      }
      if(document.getElementsByClassName("new-pas")[0].value == this.password){
        this.$http.post('/api/checkuser/updatepassword',{
          password: document.getElementsByClassName("new-pas2")[0].value,
          username:window.localStorage.getItem("userName")
        },{}).then((data) =>{
              this.toast("修改成功")
          this.getData();
          document.getElementsByClassName("set-content-box-pas")[0].style.display = "none"
        })
      }else{
        this.toast("旧密码输入错误")
      }
    },
    setPasCan(){
      document.getElementsByClassName("set-content-box-pas")[0].style.display = "none"
    },
    setEmail(){
      console.log("456")

      if(document.getElementsByClassName("new-email")[0].value == ""){
        this.toast("请输入邮箱")
        return
      }
      var mailReg = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
      if(!mailReg.test(document.getElementsByClassName("new-email")[0].value)){
        this.toast("请输入有效邮箱")
        return
      }

      this.$http.post('/api/checkuser/updateemail',{
        emails: document.getElementsByClassName("new-email")[0].value,
        username:window.localStorage.getItem("userName")
      },{}).then((data) =>{
        this.toast("修改成功")
        this.getData();
        document.getElementsByClassName("set-content-box-email")[0].style.display = "none"
      })
    },
    setEmailCancel(){
      document.getElementsByClassName("set-content-box-email")[0].style.display = "none"
    },
    setusecan(){
      this.$http.post('/api/checkuser/deletelogin',{
        username:window.localStorage.getItem("userName")
      },{}).then((data) =>{
      })
      this.$http.post('/api/checkuser/deleteorder',{
        username:window.localStorage.getItem("userName")
      },{}).then((data) =>{
        this.$router.push({name:"Entry"})
      })
    },
    setuseno(){
      document.getElementsByClassName("set-content-box-can")[0].style.display = "none"
    },
    toast(text){
      var toastDom = document.getElementsByClassName("toast-box")[0];
      toastDom.innerHTML = text;
      toastDom.style.display = "block";
      setTimeout(function(){
        toastDom.style.display = "none";
      },2000)
    }
  }
}
</script>

<style>
  .all-naviga{
    position:fixed;
    top:93.5%;
    width:100%;
    height:0.8rem;
  }
  .naviga-box{
    position:absolute;
    background-color: #fff;
    width:100%;
    height:0.9rem;
    border-top:0.01rem solid #eee
  }
  .naviga-text{
    position:relative;
    width:0.6rem;
    text-align: center;
    left:0.3rem;
    float:left;
    padding-top:0.1rem;
  }
  .naviga-left{
    margin-left:1.5rem;
  }
  .index-text{
    color:#ff9900;
  }
  .index-img{
    width:0.4rem;
    height:0.4rem;
  }
  .set-box{
    background-color: #eee;
    height:16rem;
  }
  .set-top{
    width:100%;
    height:0.8rem;
    background-color:#ff9900 ;
    text-align: center;
    color:#fff;
    font-size:0.4rem;
    line-height: 0.8rem;
  }
  .set-head{
    height:1rem;
    background-color: #fff;
  }
  .set-head-img{
    margin-top:0.2rem;
    margin-left:0.2rem;
  }
  .set-head-text{
    /*line-height: 0.2rem;*/
    margin-left: 0.2rem;
    position: absolute;
    top:1.1rem;
    left:1rem;
    font-size: 0.3rem;
    font-weight: bold;
  }
  .set-password{
    background-color: #fff;
    margin-top: 0.04rem;
    height:0.8rem;
    line-height: 0.8rem;
    padding-left:0.2rem; ;
    /*border:0.01rem solid black;*/
  }
  .set-next {
    width: 0.5rem;
    height: 0.5rem;
    position: absolute;
    margin-top: -0.6rem;
    left: 6.8rem;
  }
  .set-content-box{
    width:6rem;
    height:4rem;
    background-color: #fff;
    position:absolute;
    left:0;
    right:0;
    top:0;
    bottom:0;
    margin:auto auto;
    display:none;
  }
  .set-content-box-pas{
    width:6rem;
    height:4rem;
    background-color: #fff;
    position:absolute;
    left:0;
    right:0;
    top:0;
    bottom:0;
    margin:auto auto;
    display:none;
  }
  .set-content-box-email{
    width:6rem;
    height:4rem;
    background-color: #fff;
    position:absolute;
    left:0;
    right:0;
    top:0;
    bottom:0;
    margin:auto auto;
    display:none;
  }
  .set-content-box-can{
    width:4rem;
    height:2rem;
    background-color: #fff;
    position:absolute;
    left:0;
    right:0;
    top:0;
    bottom:0;
    margin:auto auto;
    display:none;
  }
  .set-name-title{
    height:0.7rem;
    color:#fff;
    line-height: 0.7rem;
    font-size: 0.3rem;
    text-align: center;
    background-color: #ff9900;

  }
  .set-name-title-pas{
    height:0.7rem;
    color:#fff;
    line-height: 0.7rem;
    font-size: 0.3rem;
    text-align: center;
    background-color: #ff9900;

  }
  /*.change-close{*/
    /*position: absolute;*/
    /*top:0.1rem;*/
    /*right:0.1rem;*/
    /*width:0.5rem;*/
    /*height:0.5rem;*/
  /*}*/
  .set-newname{
    /*margin-left:0.2rem;*/
    text-align: center;
    line-height: 2rem;
    font-size: 0.3rem;
  }
  .set-pas{
    /*margin-left:0.2rem;*/
    text-align: center;
    line-height: 0.8rem;
    font-size: 0.3rem;
  }
  .set-email{
    /*margin-left:0.2rem;*/
    text-align: center;
    line-height: 2rem;
    font-size: 0.3rem;
  }
  .set-c{
    width:0.8rem;
    height:0.5rem;
    text-align: center;
    line-height: 0.5rem;
    color:#fff;
    border-radius: 0.3rem;
    background-color:#ff9900;
  }
  .set-confirm{
    margin-left: 1rem;
    margin-top:0.6rem;
  }
  .set-cancel{
    margin-left: 4.2rem;
    margin-top:-0.5rem;
  }
  .set-confirm1{
    margin-left: 0.5rem;
    margin-top:0.6rem;
  }
  .set-cancel1{
    margin-left: 2.6rem;
    margin-top:-0.5rem;
  }
  .toast-box{
    left:0;
    right:0;
    top:0;
    bottom:0;
    width:2.5rem;
    height:0.8rem;
    text-align: center;
    line-height: 0.8rem ;
    color:#fff;
    background-color: black;
    margin:auto auto;
    position: absolute;
    opacity: 0.8;
    display: none;
    border-radius:0.4rem;
  }
</style>
