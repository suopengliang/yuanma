<template>
  <div>
  <div class="re-title">本周热门榜单 </div>
    <div class="all-item">
    <ul>
      <li  class="item" v-for="item of hot" :key="item.id">
        <div @click="hotClick">
        <img class="item-img" :src='item.imgurl'/>
        <p class="re-label1">{{item.rel}}</p>
        <p class="re-label"><span style="color:#ff9a2f">{{item.res}}</span>起</p>
        </div>
      </li>
    </ul>
    </div>
  </div>
</template>

<script>
  export default{
    props:{
      hot:Array,
    },
    name:"HomeReconmmend",
    methods:{
      hotClick(e){
        this.$http.post('/api/foundicon/intro',{
          name:e.path[1].getElementsByClassName("re-label1")[0].innerHTML,
        },{}).then((data) =>{
          console.log(data.data[0])
          this.$router.push({name: 'Introduce',params:{data:data.data[0]}})
//          console.log()

//          this.pic=JSON.parse(data.data[0].pic)
//          this.detail=JSON.parse(data.data[0].detail)
        })//跳转
      }
    }
  }
</script>

<style lang="stylus" scoped>
.re-title{
  margin-top:0.04rem;
  line-height:0.8rem;
  background:#eee;
  text-indet:0.2rem;
}
.item-img{
    width:2rem;
    height:2rem;
    margin-left:0.2rem;
    margin-top:0.2rem;
  }
.all-item{
      position relative;
      overflow-x:scroll;
      height:3rem;
    }
.all-item ul{
    display:flex;
    width:8rem;
  }
.re-label1{
  position absolute
  color:black;
  font-size:0.2rem;
  text-align:center;
  width:2.3rem;
  height:0.3rem;
  top:2.5rem;
  /*margin-left:0.2rem;*/
  overflow hidden;
  text-overflow:ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 1;
  -webkit-box-orient: vertical;
}
.re-label{
    color:black;
    font-size:0.2rem;
    text-align:center;
  }
  </style>
