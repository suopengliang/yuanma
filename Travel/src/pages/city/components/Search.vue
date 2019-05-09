<template>
  <div>
  <div class="search">
      <input v-model="keyWord" class="search-input" type="text" placeholder="输入城市名"/>
  </div>
    <div v-if="controlS"class="search-content">
      <ul >
        <li v-if="controlD" class="no-data">无符合搜索条件</li>
        <router-link :to="{path:'/home',query:{states:item,num:'2'}}"  v-for="item in list">
        <li class="search-item border-bottom" >{{item}}</li>
        </router-link>
      </ul>
    </div>
  </div>
</template>

<script>
  export default{
    name:'CitySearch',
    props:{
      allCity:Array,
      required:true,

    },
    data (){
      return{
        keyWord:"",
        list:[],
        timer:null,
        controlS:false,
        controlD:false
      }
    },
    watch:{

      keyWord () {
        this.controlS = true
        if(this.timer){
          clearTimeout(this.timer)
        }
        this.timer=setTimeout(()=>{
          const result = [];
          for(let i=0;i<this.allCity.length;i++ ){
            this.allCity[i].city.forEach((value)=>{
              if(value.indexOf(this.keyWord)>-1){
                this.controlD=false
                result.push(value)
              }
            })
          }
//          $(".search-content").css("height",`${result.length*0.4}rem`)
          this.list = result
          if(result.length==0){
            this.controlD=true
          }
          if(this.keyWord==""){
            this.controlS = false
          }
        },100)
      }
    }
  }
</script>

<style lang="stylus" scoped>
.search{
  background:#00bcd4;
  padding:0.3rem;
}
 .search-input{
   outline:none;
   box-sizing:border-box;
   border-radius :0.5rem;
   padding:0.3rem;
   width:98%;
   height:0.2rem;
   text-align :center;
   color:#666;
 }
  .search-content{
    z-index :1;
    overflow hidden;
    position:absolute;
    top:2.2rem;
    left:0rem;
    right:0;
    bottom:0;
    background:#eee;
    /*height:4rem;*/
    width:8rem;
  }
  .search-item{
    line-height:0.62rem;
    padding-left :0.2rem;
    background:#fff;
    color:#666
  }
  .no-data{
    text-align :center;
    line-height:0.62rem;
  }
</style>
