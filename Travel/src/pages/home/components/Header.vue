<template>
  <div class="header">
    <span class="stateClass">{{state}}</span><img class="header-pull" src="../../../assets/img/pull.png">
    <router-link :to="{path:'/city',query:{states:state}}">
    <div class="input-border"><img src="../../../assets/img/search.png">搜索城市/景点/攻略</div>
    </router-link>
  </div>
</template>
<script>
export default {
  name: "HomeHeader",
  props:{
    state:String,
    clickState:String
  },
data(){
    return{
      states:this.state,
//      useState:"",
    }
},
  mounted(){
   if(this.clickState!=""){
     $(".stateClass").text(this.clickState)
   }
    },

};
</script>
<style lang="stylus" scoped>
.header {
  display: flex;
  line-height: 0.5rem;
  background: #01ca7a;
  color: #fff;
  height: 1rem;
}

.header-pull {
  margin-top: 0rem;
  width: 0.7rem;
  height: 1rem;
}

.header-left {
  width: 32px;
  float: left;
}

.header-left img {
  width: 15px;
  height: 10px;
}

.header-input {
  display: block;
  background: #fff;
  border-radius: 5px;
  margin-top: 1px;
  line-height: 32px;
  color: #ccc;
  height: 32px;
  width: 500px;
  margin-left: 20px;
  text-align: center;
}

.header-right {
  width: 124px;
  float: right;
  margin-left: 20px;
  color: #fff;
}

.header-right img {
  width: 15px;
  height: 20px;
}

.imgss {
  position: absolute;
  width: 15px;
  height: 20px;
  left: 3rem;
  top: 10px;
}
.stateClass{
  // border:1px solid red;
  height:1rem;
  line-height 1rem;
  width:1rem;
  text-align:center;
}
.input-border{
  color:#a3a3a3;
  width:4.5rem;
  height:0.7rem;
  // border:1px solid black;
  border-radius :0.5rem;
  margin-left:0.3rem;
  margin-top:0.14rem;
  background-color:#fff;
  line-height :0.7rem;
  font-size :0.3rem;
}
.input-border img{
  width:0.5rem;
  height:0.5rem;
  margin-left:0.1rem;

}
</style>
