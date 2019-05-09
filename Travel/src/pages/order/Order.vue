<template>
  <div>
    <div class="all-naviga">
      <div class="naviga-box"></div>
      <div class="naviga-text" @click = "indexClick"><img class="index-img" src="../../static/img/index.png">首页</div>
      <div class="naviga-text order-text naviga-left" ><img class="index-img" src="../../static/img/order2.png">订单</div>
      <div class="naviga-text naviga-left" @click = "setClick"><img class="index-img" src="../../static/img/set.png">设置</div>
      <div class="naviga-text naviga-left" @click = "quitClick"><img class="index-img" src="../../static/img/quit.png">退出</div>
    </div>
    <div class="order-head">
      我的订单
    </div>
    <div @click = "noPay" class="order-ispay-class order-ispay-class1">未支付订单</div><div @click="yesPay" class="order-ispay-class order-ispay-class2">已支付订单</div>
    <div class="order-detail-box">
    <div  class="order-list" v-for="item of this.allData" :key="item.ids">
      <input  @click = "choiceClick"  class="input" type="checkbox" name="choice" :value="item.ids" />
      <div class="order-scenname">{{item.scenname}}</div>
      <span class="order-list-date">时间:{{item.dates}}</span>
      <div class="order-list-right">{{item.names}}<br/>{{item.phonenum}}</div><br>
      <span class="order-prices">￥{{item.prices}}<span v-if="item.favs!=0" class="order-fav">优惠:{{item.favs}}元</span></span>
      <div class="order-choice-num">1张</div>
      <div @click="orderUse" class="order-use" v-if="allSueecss" :value="item.ids">使用</div>
      <!--<div class="order-choice-num"><div class="order-choice-every1">-</div><div class="order-choice-middle">1</div><div class="order-choice-every2">+</div></div>-->
    </div>
      <div class="order-bottoms"></div>
      <div class="order-pay-box">
        <input @click="choiceAll" type="checkbox" class="choice-all" name="choice" value="" />&nbsp;全选
        <div @click="deleteOrder" class="order-delete" v-model="howMuch">删除({{howMuch}})</div>
        <div v-if="showALL"class="order-pay-prices" v-model="allPrices">合计
          <span class="order-pay-prices-color">￥{{allPrices}}</span>
          <div @click = "jumpPay" class="order-submit" v-model="howMuch">结算({{howMuch}})</div>
        </div>
      </div>
    </div>
    <div   v-model="howMuch" class="toast-pay">
      <div class="pay-istrue">是否支付</div>
      {{howMuch}}张<br>
      <span class="allprices-css" v-model="allPrices">￥{{allPrices}}</span>
      <div @click="paySuccess" class="pay-yes">是</div>
      <div @click="orderQuit" class="pay-no">否</div>
    </div>
    <div class="pay-success">支付成功</div>
    <div class="order-useor">不能重复使用</div>
  </div>
</template>

<script>
export default{
  name:"Order",
  data(){
    return{
      allData:[],
      allPrices:0,
      howMuch:0,
      checkArray:[],
      allSueecss:false,
      choiceAllLength:0,
      fav:0,
      showALL:true,
    }
  },
  created(){
//    console.log(window.localStorage.getItem("userName"))
//    document.getElementsByClassName("order-ispay-class2")[0].style.backgroundColor = "#fff";

    this.$http.post('/api/foundicon/findorder',{
      nicks:window.localStorage.getItem("userName")
    },{}).then((data) =>{
      for(var i = 0;i<data.data.length;i++){
        console.log(data.data[i].ispay)
        if(data.data[i].ispay == '否'){
          this.allData.push(data.data[i]);
        }
      }
      this.$http.post('/api/checkuser/fontUser',{
        username:window.localStorage.getItem("userName"),
      },{}).then((data) =>{
        console.log(data)
        if(data.data[0].fav == 1){
          this.fav = 1;
        }
        if(data.data[0].fav == 2){
          this.fav = 5;
        }
      })

//      console.log(this.allData.data)

    })//查询订单
  },
  methods:{
   indexClick(){
     this.$router.push({name:"Home"})
   },
    setClick(){
      this.$router.push({name:"Setall"})
    },
    quitClick(){
      this.$router.push({name:"Entry"})
    },
    choiceClick(){

      this.allPrices = 0;
      this.howMuch = 0;
      this.checkArray = [];
      var inputArra = document.getElementsByClassName("input");
      var useLength = 0;
      console.log(this.choiceAllLength)
      console.log(inputArra.length)

      for(var i=0;i<inputArra.length;i++){
        if(inputArra[i].checked){
          useLength++;
          this.checkArray.push(inputArra[i].value)
          this.allPrices = this.allData[i].prices+this.allPrices;
          if(i == inputArra.length-1){
            this.allPrices = this.allPrices-this.fav;
          }
          this.howMuch++;
        }
      }
      if(this.choiceAllLength != useLength){
        document.getElementsByClassName("choice-all")[0].checked = false;
      }else{
        document.getElementsByClassName("choice-all")[0].checked = true;
      }
      if(useLength == inputArra.length){
        document.getElementsByClassName("choice-all")[0].checked = true;
      }
    },
    choiceAll(){
      this.allPrices = 0;
      this.howMuch = 0;
      this.checkArray = [];
      var inputArra = document.getElementsByClassName("input");
      this.choiceAllLength = inputArra.length;
      if(document.getElementsByClassName("choice-all")[0].checked){
        for(var i=0;i<inputArra.length;i++){
          this.checkArray.push(inputArra[i].value)
          inputArra[i].checked = "true"
            this.allPrices = this.allData[i].prices+this.allPrices;
            this.howMuch++;
        }
      }else{
        for(var i=0;i<inputArra.length;i++){
          inputArra[i].checked = false;
        }
      }
    },
    jumpPay(){
      if(this.howMuch>0){
        document.getElementsByClassName("toast-pay")[0].style.display="block";
      }
    },
    orderQuit(){
      document.getElementsByClassName("toast-pay")[0].style.display="none";
    },
    paySuccess(){
      console.log(this.checkArray)
      for(var i=0;i <this.checkArray.length;i++){
        this.$http.post('/api/foundicon/updateorder',{
          ids:this.checkArray[i],
        },{}).then((data) =>{
          console.log("成功"+i)
          this.$http.post('/api/checkuser/updatefav',{
            fav: 0,
            username:window.localStorage.getItem("userName"),
          },{}).then((data) =>{

          })
//      console.log(this.allData.data)

        })
      }
      this.$http.post('/api/foundicon/updatefavs',{
        ids:this.checkArray[0],
        favs:this.fav,
      },{}).then((data) =>{

      })//


      this.allData = [];
      this.$http.post('/api/foundicon/findorder',{
        nicks:window.localStorage.getItem("userName")
      },{}).then((data) =>{
        for(var i = 0;i<data.data.length;i++){
          console.log(data.data[i].ispay)
          if(data.data[i].ispay == '否'){
            this.allData.push(data.data[i]);
          }
        }
      })//查询订单
      document.getElementsByClassName("toast-pay")[0].style.display="none";
      document.getElementsByClassName("pay-success")[0].style.display="block";
      setTimeout(function(){
        document.getElementsByClassName("pay-success")[0].style.display="none";
      },2000)
      this.allPrices = 0;
      this.howMuch = 0;
    },
    noPay(){
      this.showALL = true;
      this.allData = [];
      this.allSueecss = false
      this.$http.post('/api/foundicon/findorder',{
        nicks:window.localStorage.getItem("userName")
      },{}).then((data) =>{
        for(var i = 0;i<data.data.length;i++){
          console.log(data.data[i].ispay)
          if(data.data[i].ispay == '否'){
            this.allData.push(data.data[i]);
          }
        }
      })//查询订单
      document.getElementsByClassName("order-ispay-class2")[0].style.backgroundColor = "#fff";
      document.getElementsByClassName("order-ispay-class2")[0].style.color = "black";
      document.getElementsByClassName("order-ispay-class1")[0].style.backgroundColor = "#ff8f13";
      document.getElementsByClassName("order-ispay-class1")[0].style.color = "#fff";
    },
    yesPay(){
      this.showALL = false;
      this.allSueecss = true
      this.allData = [];
      this.$http.post('/api/foundicon/findorder',{
        nicks:window.localStorage.getItem("userName")
      },{}).then((data) =>{
        for(var i = 0;i<data.data.length;i++){
          console.log(data.data[i].ispay)
          if(data.data[i].ispay == '是'){
            this.allData.push(data.data[i]);
          }
        }
      })//查询订单
      document.getElementsByClassName("order-ispay-class2")[0].style.backgroundColor = "#ff8f13";
      document.getElementsByClassName("order-ispay-class2")[0].style.color = "#fff";
      document.getElementsByClassName("order-ispay-class1")[0].style.backgroundColor = "#fff";
      document.getElementsByClassName("order-ispay-class1")[0].style.color = "black";
    },
    deleteOrder(){
      for(var i=0;i <this.checkArray.length;i++){
        this.$http.post('/api/foundicon/deleteorder',{
          ids:this.checkArray[i],
        },{}).then((data) =>{
          console.log("成功删除")
//      console.log(this.allData.data)
        })
      }
      this.allData = [];
      this.$http.post('/api/foundicon/findorder',{
        nicks:window.localStorage.getItem("userName")
      },{}).then((data) =>{
        for(var i = 0;i<data.data.length;i++){
          console.log(data.data[i].ispay)
          if(data.data[i].ispay == '否'){
            this.allData.push(data.data[i]);
          }
        }
      })//查询订单
      document.getElementsByClassName("order-ispay-class2")[0].style.backgroundColor = "#fff";
      document.getElementsByClassName("order-ispay-class2")[0].style.color = "black";
      document.getElementsByClassName("order-ispay-class1")[0].style.backgroundColor = "#ff8f13";
      document.getElementsByClassName("order-ispay-class1")[0].style.color = "#fff";
      this.allPrices = 0;
      this.howMuch = 0;
    },
    orderUse(e){
//      updateuseorder
      this.$http.post('/api/foundicon/findindsorder',{
        ids:e.target.getAttribute("value")
      },{}).then((data) =>{
//        var k = ;
        console.log(data.data[0])
        if(data.data[0].isuse == "是"){
          console.log("不能重复使用")
          document.getElementsByClassName("order-useor")[0].innerHTML = "不能重复使用";
          document.getElementsByClassName("order-useor")[0].style.display = "block";
          setTimeout(function(){
            document.getElementsByClassName("order-useor")[0].style.display = "none";
          },2000)
        }else{
          this.$http.post('/api/foundicon/updateuseorder',{
            ids:e.target.getAttribute("value")
          },{}).then((data) =>{

            document.getElementsByClassName("order-useor")[0].innerHTML = "使用成功";
            document.getElementsByClassName("order-useor")[0].style.display = "block";
            setTimeout(function(){
              document.getElementsByClassName("order-useor")[0].style.display = "none";
            },2000)
          })
        }
      })//查询订单
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
  .order-text{
    color:#ff9900;
  }
  .index-img{
    width:0.4rem;
    height:0.4rem;
  }
  .order-head{
    width:100%;
    height:0.8rem;
    background-color:#ff9900;
    color:#fff;
    text-align: center;
    line-height: 0.8rem;
    font-size: 0.38rem;
  }
  .order-detail-box{
    margin-top:1rem;
  }
  .order-list{
    margin-left: 0.5rem;
    margin-top:0.2rem;
    background-color: #eee;
    width:6.5rem;
    height:2rem;
    border-radius: 0.2rem;
    padding:0.2rem;
  }
  .order-list-date{
    margin-left:0.3rem;
  }
  .order-scenname{
    font-size: 0.3rem;
    margin-left:0.3rem;
    margin-top:-0.1rem;
  }
  .order-list-right{
    /*position: absolute;*/
    margin-top:-1rem;
    margin-left:4.4rem;
  }
  .order-prices{
    color:#ff9900;
    font-size: 0.35rem;
    margin-left:0.3rem;
  }
  .order-fav{
    margin-left:0.3rem;
    color:red;
  }
  .order-choice-num{
    width:1.2rem;
    height:0.4rem;
    /*border:0.01rem solid #d2d4d6;*/
    margin-left:4.5rem;
    margin-top:-0.4rem;
  }
  .order-pay-box{
    position:fixed;
    width:100%;
    height:1rem;
    bottom:0.82rem;
    border:0.01rem solid #eee;
    line-height: 1rem;
    background-color: #fff;
  }
  .order-pay-prices{
    position:absolute;
    top:0;
    left:4rem;

  }
  .order-pay-prices-color{
    color:#ff9900;
  }
  .order-submit{
    position:absolute;
    top:0.1rem;
    left:1.8rem;
    width:1.4rem;
    height:0.7rem;
    color:#fff;
    text-align: center;
    line-height: 0.7rem;
    background:linear-gradient(to right,#ffab1e,#ff8f13);
    border-radius: 0.3rem;

    /*top:0;*/
    /*left:4rem;*/
  }
  .choice-all{
    margin-left: 0.1rem;
  }
  .pay-istrue{
    width:100%;
    height:0.5rem;
    color:#fff;
    line-height: 0.5rem;
    font-size: 0.4rem;
    background:linear-gradient(to right,#ffab1e,#ff8f13);
  }
  .toast-pay{

    width:4rem;
    height:2rem;
    position:absolute;
    left:0;
    right:0;
    top:0;
    bottom:0;
    margin:auto auto;
    text-align: center;
    border:0.01rem solid #eee;
    background-color: #fff;
    display: none;
  }
  .pay-yes{
    width:0.8rem;
    height:0.5rem;
    text-align: center;
    line-height: 0.5rem;
    border-radius: 0.2rem;
    background-color:#ff8f13 ;
    margin-top:0rem;
    margin-left:0.8rem;
    color:#fff;
  }
  .pay-no{
    width:0.8rem;
    height:0.5rem;
    text-align: center;
    line-height: 0.5rem;
    border-radius: 0.2rem;
    margin-top:-0.48rem;
    margin-left:2.5rem;
    color:#fff;
    background-color:#ff8f13 ;
  }
  .allprices-css{
    color:#ff8f13;
    font-size: 0.35rem;
  }
  .pay-success{
    position:fixed;
    width:1.9rem;
    height:0.8rem;
    top:8rem;
    left:3.2rem;
    background-color: black;
    opacity: 0.7;
    color:#fff;
    text-align: center;
    line-height: 0.8rem;
    border-radius: 0.4rem;
    font-size: 0.35rem;
    display: none;
  }
  .order-bottoms{
    height:2rem;
  }
  .order-ispay-class{
    background-color: #ff8f13;
    width:50%;
    float:left;
    text-align: center;
    height:0.8rem;
    line-height: 0.8rem;
    color:#fff;
    font-size: 0.35rem;
    border-bottom:0.01rem solid #eee ;
    position: relative;
  }
  .order-ispay-class1{
    left:-0.1rem;
    background-color: #ff8f13;
    color:#fff;
  }
  .order-ispay-class2{
    /*left:-0.1rem;*/
    background-color: #fff;
    color:black;
  }
  .order-delete{
    background:linear-gradient(to right,#ffab1e,#ff8f13);
    position:absolute;
    width:1.5rem;
    height:0.7rem;
    text-align: center;
    line-height: 0.7rem;
    border-radius: 0.3rem;
    color:#fff;
    top:0.1rem;
    left:1.2rem;
  }
  .order-use{
    background:linear-gradient(to right,#ffab1e,#ff8f13);
    position: relative;
    top:-0.3rem;
    left:5.4rem;
    color:#fff;
     text-align: center;
    line-height: 0.5rem;
    width:0.8rem;
    height:0.5rem;
    border-radius: 0.2rem;
  }
  .order-useor{
    width:2.3rem;
    background-color: black;
    color:#fff;
    height:0.8rem;
    text-align: center;
    line-height: 0.8rem;
    border-radius: 0.5rem;
    opacity: 0.8;
    position: fixed;
    top:7rem;
    left:2.8rem;
    display: none;
  }
  /*.order-choice-every1{*/
    /*width:0.3rem;*/
    /*height:0.39rem;*/
    /*border-right:0.01rem solid #d2d4d6;*/
    /*float:left;*/
    /*text-align: center;*/
  /*}*/
  /*.order-choice-every2{*/
    /*width:0.3rem;*/
    /*height:0.39rem;*/
    /*border-right:0.01rem solid #d2d4d6;*/
    /*float:right;*/
    /*margin-top:-0.39rem;*/
    /*text-align: center;*/
  /*}*/
  /*.order-choice-middle{*/
    /*border-right:0.01rem solid #d2d4d6;*/
    /*width:0.6rem;*/
    /*height:0.39rem;*/
    /*!*position:absolute;*!*/
    /*float:left;*/
    /*left:0.5rem;*/
    /*line-height: 0.39rem;*/
    /*font-size: 0.2rem;*/
    /*text-align: center;*/
  /*}*/
</style>
