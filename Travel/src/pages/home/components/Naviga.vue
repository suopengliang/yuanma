<template>
<div >
  <div class="all-naviga">
  <div class="naviga-box"></div>
  <div class="naviga-text index-text"><img class="index-img" src="../../../static/img/index2.png">首页</div>
  <div class="naviga-text naviga-left" @click = "orderClick"><img class="index-img" src="../../../static/img/order.png">订单</div>
  <div class="naviga-text naviga-left" @click = "setClick"><img class="index-img" src="../../../static/img/set.png">设置</div>
  <div class="naviga-text naviga-left" @click = "quitClick"><img class="index-img" src="../../../static/img/quit.png">退出</div>
  </div>
</div>
</template>

<script>
  export default {
    name:"Naviga",
    data(){
      return{

      }
    },

    methods:{
      orderClick(){
        this.$router.push({name:"Order"})
      },
      setClick(){
        this.$router.push({name:"Setall"})

      },
      quitClick(){
        this.$router.push({name:"Entry"})
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
</style>
