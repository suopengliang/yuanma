<template>
  <div class="header-css">
    <router-link to="/home">
    <img class="header-back" src="../../../assets/img/left.png">
      <span class="header-text">搜索</span>
    </router-link>
  </div>
</template>

<script>
  export default{
    name:'CityHeader'
  }
</script>

<style lang="stylus" scoped>
  .header-back{
    width:2em;
    height:0.5rem ;
    margin-top:0.18rem
    margin-left:0.18rem

  }
  .header-css{
    width:100%;
    position:relative;
    /*border:1px solid black;*/
    height:0.9rem;
  }
  .header-text{
    position:absolute;
    margin-left:2.5rem;
    font-size 0.4rem;
    margin-top :0.15rem
  }
</style>
