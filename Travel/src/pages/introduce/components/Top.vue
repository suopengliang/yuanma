<template>
  <div>
      <div @click="$router.back(-1)" class="top-fanhui-box">
        <img class="top-fanhui" src="../../../static/img/fanhui2.png">
      </div>
    <img @click = "showPic" class="top-pic" :src="this.scenpic[0].url"/>
    <div class="top-pic-name">{{this.scenname}}</div>
    <div id="top-pic-box" class="pic-box" >
      <span class="top-texts">景点图片</span>
      <div class="top-head"><img @click = "closePic" class="top-quit" src="../../../static/img/fanhui.png"></div>
        <img  class="all-pic" v-for="item of scenpic" :src="item.url">
    </div>
  </div>
</template>

<script>
  export default{
    name:"IntroduceTop",
    props:{
      scenpic:Array,
      scenname:String,
    },
//    beforeMounted(){
//      console.log(document.getElementById("top-pic-boox"))
//
//
//    },
    methods:{
      showPic(){
        document.getElementById("top-pic-box").style.display = "block";
      },
      closePic(){
        console.log("123")
         document.getElementById("top-pic-box").style.display = "none";
      }
    }
  }
</script>

<style>
.top-pic{
  width:100%;
  height:4.5rem;
}
  .pic-box{
    width:100%;
    position:absolute;
    z-index:9;
    top:0;
    background-color: #f5f5f5;
    height:100%;
    display: none;
  }
  .all-pic{
    width:45%;
    margin-left:3%;
    margin-top:3%;

  }
  .top-head{
    width:100%;
    height:0.8rem;
    background-color: #fff;
  }
  .top-quit{
    width:0.5rem;
    height:0.5rem;
    margin-top:0.1rem;
    position: absolute;
    z-index: 2;
    /*margin-left:-1rem;*/
  }
  .top-texts{
    position:absolute;
    width:100%;
    text-align: center;
  }
  .top-fanhui-box{
    width:0.8rem;
    height:0.8rem;
    position:absolute;
    line-height: 0.75rem;
    border-radius: 0.5rem;
    background-color:#203043;
    top:0.1rem;
    left:0.1rem;
  }
  .top-fanhui{
    margin-left: 0.1rem;
    width:0.5rem;
    height:0.5rem;
    /*border-radius: 0.5rem;*/
    /*background-color:#203043;*/
  }
  .top-pic-name{
    position:absolute;
    top:3.5rem;
    color:#fff;
    left:0.3rem;
    font-size: 0.4rem;
  }
</style>
