<template>
  <div class="prices-box">
    <div class="prices-title">
     <img class="prices-groom" src="../../../static/img/yes.png">爱旅游推荐
    </div>
    <div class="prices-adult-box">
     <div @click="addAdult" class="prices-realstyle">
       {{this.scenname}}成人票
       <div class="prices-money">
          {{this.scendata.adult}}
         <div class="prices-button">
           预定
         </div>
       </div>
     </div>
    <div class="prices-buy">
      <img class="price-buy-pic" src="../../../static/img/right.png">17:30前随买随用
      <div class="prices-buy-text-box">
        <span class="prices-buy-text">自营</span><span class="prices-buy-text">无需换票</span>
      </div>
    </div>
    </div>

    <div class="prices-children-box">
      <div @click="addChildren" class="prices-realstyle">
        {{this.scenname}}学生票
        <div class="prices-money">
          {{this.scendata.children}}
          <div class="prices-button">
            预定
          </div>
        </div>
      </div>
      <div class="prices-buy">
        <img class="price-buy-pic" src="../../../static/img/right.png">17:30前随买随用
        <div class="prices-buy-text-box">
          <span class="prices-buy-text">自营</span><span class="prices-buy-text">无需换票</span>
        </div>
      </div>
    </div>

    <div class="prices-pay-alldata-box">
    <div class="prices-pay-box">
    </div>
      <div id="prices-pay-realboxs" class="prices-pay-realbox">
        <h5 class="prices-pay-realbox-title" v-model="payTitle">{{payTitle}}</h5>
        <img class="prices-pay-realbox-close" @click="payQuit" src="../../../static/img/close.png">
        <div><span class="prices-pay-realbox-money" v-model="prices">{{prices}}</span>/张</div>
        <div class="prices-pay-input">姓名:<input class="prices-pay-name" type="text" placeholder="请输入名字"></div>
        <div class="prices-pay-input">手机号:<input class="prices-pay-phnumber" type="text" placeholder="请输入手机号"></div>
        <div class="prices-pay-realbox-date-box">
          <span class="">价格日历</span><br/>
          <div @click="todday" class="prices-pay-datesquire prices-pay-datesquire1">今天<br/>{{this.month+1}}月{{this.day}}日</div>
          <div @click="tomorrow" class="prices-pay-datesquire prices-pay-datesquire2">明天<br/>{{this.month+1}}月{{this.day+1}}日</div>
          <div @click="acquired" class="prices-pay-datesquire prices-pay-datesquire3">后天<br/>{{this.month+1}}月{{this.day+2}}日</div><br/>
          <br/><br/><br/>
          <div class="prices-pay-data-text">只可预定三天，需要在游玩当天的17:30前预订</div>
          <div class="price-pay-submit" @click="paySubmit">立即预定</div>
        </div>
      </div>

    </div>
    <div class="toasts">已添加至我的订单</div>
    <div class="toast">已weikong</div>
  </div>
</template>

<script>
export default{
  name:"IntroducePrices",
  data(){
    return{
      month:"",
      day:"",
      payTitle:"",
      prices:"",
      choiceDate:"",
      choiceName:"",
      choicePhone:"",
      choiceNum:"",
      choiceScenname:"",

    }
  },
  props:{
    scendata:Object,
    scenname:String
  },
  created(){
    var date = new Date();
    this.month = date.getMonth();
    this.day = date.getDate();
    this.choiceData = "2019-"+this.month+1+"-"+this.day;
  },
  methods:{
    addAdult(){
      document.getElementsByClassName("prices-pay-alldata-box")[0].style.display = "block";
      document.getElementsByClassName("prices-pay-datesquire1")[0].style.color = "#fff";
      document.getElementsByClassName("prices-pay-datesquire1")[0].style.backgroundColor = "#00afc7";
      var priStyle = document.getElementsByClassName("prices-pay-realbox")[0].style;
      var num =-54;
     this.payTitle = this.scenname+"成人票";
     this.prices = this.scendata.adult;

      var controlMove = setInterval(function(){
        num = num+1;
        priStyle.bottom = num/10+"rem";
        if(num == 0){
          clearInterval(controlMove);
        }
      },5)
    },
    addChildren(){
      document.getElementsByClassName("prices-pay-alldata-box")[0].style.display = "block";
      var priStyle = document.getElementsByClassName("prices-pay-realbox")[0].style;
      var num =-54;
      this.payTitle = this.scenname+"学生票";
      this.prices = this.scendata.children;
      console.log(this.prices.split("￥")[1])
      document.getElementsByClassName("prices-pay-datesquire1")[0].style.color = "#fff";
      document.getElementsByClassName("prices-pay-datesquire1")[0].style.backgroundColor = "#00afc7";
      document.getElementsByClassName("prices-pay-datesquire2")[0].style.color = "black";
      document.getElementsByClassName("prices-pay-datesquire2")[0].style.backgroundColor = "#fff";
      document.getElementsByClassName("prices-pay-datesquire3")[0].style.color = "black";
      document.getElementsByClassName("prices-pay-datesquire3")[0].style.backgroundColor = "#fff";
      var controlMove = setInterval(function(){
        num = num+1;
        priStyle.bottom = num/10+"rem";
        if(num == 0){
          clearInterval(controlMove);
        }
      },5)

    },
    payQuit(){
      var priStyle = document.getElementsByClassName("prices-pay-realbox")[0].style;
      var num =0;
      var controlMove = setInterval(function(){
        num = num-1;
        priStyle.bottom = num/10+"rem";

        if(num == -54){
          clearInterval(controlMove);

          document.getElementsByClassName("prices-pay-alldata-box")[0].style.display = "none";
          setTimeout(function(){
            document.getElementsByClassName("toasts")[0].style.display = "none";
          },2000)
        }
      },5)
      document.getElementsByClassName("prices-pay-datesquire1")[0].style.color = "#fff";
      document.getElementsByClassName("prices-pay-datesquire1")[0].style.backgroundColor = "#00afc7";
      document.getElementsByClassName("prices-pay-datesquire2")[0].style.color = "black";
      document.getElementsByClassName("prices-pay-datesquire2")[0].style.backgroundColor = "#fff";
      document.getElementsByClassName("prices-pay-datesquire3")[0].style.color = "black";
      document.getElementsByClassName("prices-pay-datesquire3")[0].style.backgroundColor = "#fff";
     document.getElementsByClassName("prices-pay-name")[0].value ="";
      document.getElementsByClassName("prices-pay-phnumber")[0].value ="";
    },
    todday(){
      var date = new Date();
      this.month = date.getMonth();
      this.choiceData = "2019-"+(this.month+1)+"-"+this.day;
      document.getElementsByClassName("prices-pay-datesquire1")[0].style.color = "#fff";
      document.getElementsByClassName("prices-pay-datesquire1")[0].style.backgroundColor = "#00afc7";
      document.getElementsByClassName("prices-pay-datesquire2")[0].style.color = "black";
      document.getElementsByClassName("prices-pay-datesquire2")[0].style.backgroundColor = "#fff";
      document.getElementsByClassName("prices-pay-datesquire3")[0].style.color = "black";
      document.getElementsByClassName("prices-pay-datesquire3")[0].style.backgroundColor = "#fff";
    },
    tomorrow(){
      var date = new Date();
      this.month = date.getMonth();
      this.choiceData = "2019-"+(this.month+1)+"-"+(this.day+1);
      document.getElementsByClassName("prices-pay-datesquire2")[0].style.color = "#fff";
      document.getElementsByClassName("prices-pay-datesquire2")[0].style.backgroundColor = "#00afc7";
      document.getElementsByClassName("prices-pay-datesquire1")[0].style.color = "black";
      document.getElementsByClassName("prices-pay-datesquire1")[0].style.backgroundColor = "#fff";
      document.getElementsByClassName("prices-pay-datesquire3")[0].style.color = "black";
      document.getElementsByClassName("prices-pay-datesquire3")[0].style.backgroundColor = "#fff";
    },
    acquired(){
      var date = new Date();
      this.month = date.getMonth();
      this.choiceData = "2019-"+(this.month+1)+"-"+(this.day+2);
      document.getElementsByClassName("prices-pay-datesquire3")[0].style.color = "#fff";
      document.getElementsByClassName("prices-pay-datesquire3")[0].style.backgroundColor = "#00afc7";
      document.getElementsByClassName("prices-pay-datesquire1")[0].style.color = "black";
      document.getElementsByClassName("prices-pay-datesquire1")[0].style.backgroundColor = "#fff";
      document.getElementsByClassName("prices-pay-datesquire2")[0].style.color = "black";
      document.getElementsByClassName("prices-pay-datesquire2")[0].style.backgroundColor = "#fff";
    },
    paySubmit(){
      this.choiceName = document.getElementsByClassName("prices-pay-name")[0].value;
      this.choicePhone = document.getElementsByClassName("prices-pay-phnumber")[0].value;
      if(this.choiceName == ""){
        this.toast("名字不能为空");
        return;
      }
      if(this.choicePhone == ""){
        this.toast("手机号码不能为空");
        return;
      }
      if(!(/^1[34578]\d{9}$/.test(this.choicePhone))){
        this.toast("手机号码有误，请重填");
        return false;
      }
      this.$http.post('/api/foundicon/addorder',{
        nicks:window.localStorage.getItem("userName"),
        username:this.choiceName,
        phonenum:this.choicePhone,
        date:this.choiceData,
        num:"1",
        prices:this.prices.split("￥")[1],
        scenname:this.payTitle,
        ispay:"否",
        isuse:"否",
        favs:0,
      },{}).then((data) =>{
        document.getElementsByClassName("toasts")[0].style.display = "block";
        this.payQuit();
          console.log(data)
      })//添加订单
//
    },
    toast(test){
      document.getElementsByClassName("toast")[0].innerHTML = test;
      document.getElementsByClassName("toast")[0].style.display = "block";
      setTimeout(function(){
        document.getElementsByClassName("toast")[0].style.display = "none";
      },2000)
    },
  }
}
</script>

<style>
.prices-box{
  margin-top:0.3rem;
  background-color: #fff;
}
  .prices-title{
    width:100%;
    height:0.8rem;
    font-size: 0.35rem;
    line-height: 0.8rem;
    border-bottom: 0.01rem solid #eee;
  }
  .prices-groom{
    margin-left:0.3rem;
    margin-right:0.3rem;
     width:0.5rem;
     height:0.5rem;

  }
  .prices-realstyle{
    width:100%;
    height:1.6rem;
    font-size: 0.35rem;
    line-height: 1rem;
    padding-left:0.5rem;
    border-bottom:0.01rem solid #eee;
    position: relative;
    z-index: 8;

  }
.prices-money{
  float:right;
  color:#ff8f13;
  width:2rem;
  padding-left: 0.2rem;

}
  .prices-button{
    background:linear-gradient(to right,#ffab1e,#ff8f13);
    color:#fff;
    width:1.7rem;
    height:0.7rem;
    text-align: center;
    line-height:0.7rem;
    margin-left:-0.2rem;
    margin-top:-0.3rem;
    border-radius: 0.1rem;
  }
  .prices-buy{
    position:relative;
    top:-0.8rem;
  }
  .price-buy-pic{
    width:0.3rem;
    height:0.3rem;
    margin-left:0.45rem;
  }
  .prices-buy-text-box{
    margin-left:0.4rem;
  }
  .prices-buy-text{
    border:0.01rem solid #00afc7;
    color:#00afc7;
    font-size: 0.2rem;
    margin-left:0.1rem;

  }
  .prices-children-box{
    /*border:0.01rem solid black;*/
    margin-top:-0.7rem;
    height:1.6rem;
  }
  .prices-pay-box{
    width:100%;
    height:100%;
    background-color: black;
    opacity: 0.4;
    position: fixed;
    z-index: 9;
    top:0
  }
  .prices-pay-realbox{
    background-color: #fff;
    width:100%;
    height:5.4rem;
    position: fixed;
    z-index: 10;
    bottom:-5.4rem;
  }
  .prices-pay-realbox-title{
    margin-left: .2rem;
    margin-top: .2rem;
    /*padding: .3rem 0 .1rem;*/
    color: #212121;
    font-size: .34rem;
    line-height: .4rem;
  }
  .prices-pay-realbox-close{
    width:.5rem;
    height:.5rem;
    margin-top:-.8rem;
    margin-left:6.8rem;
  }
  .prices-pay-realbox-money{
    color:#ff8f13;
    font-size: .4rem;
    margin-left: .2rem;
  }
  .prices-pay-realbox-date-box{
    margin-left: .2rem;
  }
  .prices-pay-datesquire{
    width:1.5rem;
    height:0.9rem;
    padding-top: .05rem;
    margin-top:.1rem;
    margin-left:0.6rem;
    text-align: center;
    border-radius: 0.1rem;
    float:left;
    border:0.01rem solid #ccc;
    /*color:#fff;*/
    /*background-color:#00afc7 ;*/
  }
  .prices-pay-data-text{
    font-size: .1rem;
    color:#ff8300;
  }
  .price-pay-submit{
    width:7.5rem;
    height:1rem;
    margin-left: -0.2rem;
    color:#fff;
    font-size: 0.4rem;
    text-align: center;
    line-height: 1rem;
    background-color: #ff8300;
  }
  .prices-pay-input{
    margin-left: .2rem;
    margin-top: .1rem;
  }
  .prices-pay-name{
    margin-left:.3rem;
  }
  .prices-pay-alldata-box{
    display: none;
  }
  .toasts{
       background-color: black;
       opacity:0.8;
       width:3rem;
       height:0.8rem;
       position: fixed;
       z-index: 99;
       color:#fff;
       border-radius: 0.4rem;
       line-height: 0.8rem;
       text-align: center;
       font-size: 0.3rem;
       left: 0;
       right:0;
       margin: 0 auto;
       display: none;
     }
.toast{
  background-color: black;
  opacity:0.8;
  width:4rem;
  height:0.8rem;
  position: fixed;
  z-index: 99;
  color:#fff;
  border-radius: 0.4rem;
  line-height: 0.8rem;
  text-align: center;
  font-size: 0.3rem;
  left: 0;
  right:0;
  margin: 0 auto;
  display: none;
}
</style>
