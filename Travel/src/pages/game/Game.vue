<template>
  <div>
    <img class="game-ditu" src="../../static/img/getditu.png">

    <div class="game-content-box">
    <div class="game-head">
      领取奖励
    </div>
      <img @click="gameQuit" class="game-quit" src="../../static/img/fanhui2.png">
    <div class="game-button" @click="getRe">点击随机领取</div>
      <div class="game-div-keep"></div>
      <img v-if="how == 0" class="price-pic" src="../../static/img/get.png">
      <img v-if="how == 1"class="price-pic" src="../../static/img/l-1.png">
      <img v-if="how == 2"class="price-pic" src="../../static/img/l-5.png">
      <h1 v-if="how == 0" class="price-text" >很遗憾！没有奖励</h1>
      <h1 v-if="how == 1" class="price-text" >恭喜你，获得一元优惠券</h1>
      <h1 v-if="how == 2" class="price-text" >恭喜你，获得五元优惠券</h1>
    </div>
  </div>
</template>

<script>
  export default {
    name:"Game",
    data(){
      return{
       how:3,
        name:window.localStorage.getItem("userName"),
        isfa:false,
      }
    },
    created(){
      console.log(window.localStorage.getItem("userName"))
      this.$http.post('/api/checkuser/fontUser',{
        username:this.name,
      },{}).then((data) =>{
        console.log(data)
        if(data.data[0].fav == 0){
          this.isfa = true;
        }
      })
    },
    methods:{
      getRe(){
        console.log(this.isfa)
          if(this.isfa){
            this.how = Math.round(Math.random()*2)
            this.$http.post('/api/checkuser/updatefav',{
              fav: this.how,
              username:this.name,
            },{}).then((data) =>{
              this.isfa = false;
            })
          }else{
            this.how = 0;
          }
      },
      gameQuit(){
        this.$router.push({name:"Home"})
      }
    }
  }
</script>

<style>
  .game-ditu{
    width:100%;
    margin-top:-0.3rem;
  }
  .game-content-box{
    position: absolute;
    top:0;
    width:100%;
  }
  .game-quit{
    width:0.5rem;
    height:0.5rem;
    position: absolute;
    top:0.25rem;
    left:0.25rem;
  }
.game-head{
  width:100%;
  height:1rem;
  color:#fff;
  text-align: center;
  line-height: 1rem;
  font-size: 0.35rem;

  background-color:#3dd8fd ;
}
  .game-button{
    width:2rem;
    height:0.8rem;
    text-align: center;
    line-height: 0.8rem;
    border-radius: 0.5rem;
    color:#fff;
    margin-top:0.2rem;

    background:#1bd2cd;
  }
  .game-div-keep{
    margin-top:4.9rem;
    margin-left:1rem;
    width:5rem;
    height:5.5rem;
    background-color: #fff;
  }
  .price-pic{
    position: absolute;
    width:3.5rem;
    height:3rem;
    left:0;
    top:0;
    right:0;
    bottom:0;
    margin:7rem auto;
  }
  .price-text{
    position: absolute;
    width:4rem;
    height:3rem;
    left:0;
    top:10.8rem;
    right:0;
    bottom:0;
    font-size: 0.35rem;
    margin:0 auto;
  }
</style>
