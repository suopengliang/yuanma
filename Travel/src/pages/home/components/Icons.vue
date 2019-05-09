<template>
  <div class="icons">
    <swiper :options="swiperOption">
      <swiper-slide v-for="(page,index) of pages" :key="index">
    <div class="icon" v-for="item of page" :key="item.id">
      <router-link :to="{path:'/detail',query:{num:item.id,detail:detail}}">
      <div class="icon-img"  @click="findWhich">
     <img  class="icon-img-content" :class="item.id" :src="item.url"/>
        </div>
      <p class="icon-desc">{{item.name}}</p>
        </router-link>
    </div>
        </swiper-slide>
    </swiper>
    <!--<img src="../../../img/5.png">-->
    <div class="swiper-pagination"></div>
  </div>

</template>

<script>
import SwiperSlide from "../../../../node_modules/vue-awesome-swiper/src/slide.vue";
export default {
  components: {SwiperSlide},
  name:"HomeIcons",
  props:{
    pic:Array,
    detail:Array,
  },
  data (){
    return {
      alldata:[],
      urls:"",
      swiperOption:{
        autoplay:false,
        pagination:'.swiper-pagination',
      }
    }
  },
  computed:{
    pages ( ) {
        const pages = []
        this.pic.forEach(function(item,index) {
          const page = Math.floor(index / 8)
          if(!pages[page]) {
            pages[page] = []
          }
          pages[page].push(item)
        })
      console.log(pages)
        return pages
    }
  },
  methods:{
    findWhich(e){
//      console.log(e.srcElement.classList[1])

    }
  },
  created(){

  }

}
</script>

<style lang="stylus" scoped>
.icons >>> .swiper-container{
    width:100%;
    height:180px;
  }
.icons{
    width:100%;
    height:180px;
  }
.swiper-pagination-bullets{
                position absolute;
  top:7rem !important;
  left:3.1rem;
  width:1rem;
  /*margin:0 auto;*/
}
.icons >>>.swiper-pagination-bullet{
  margin-left:0.2rem !important;
}
.icon{
 float:left;
  width:25%;
  height:50%;
  position:relative;
}
.icon-img{
  posotion:absolute;
  bottom:10px;
}
.icon-img-content{
     display:block;
    margin:0 auto;
    height:70px;
    left:10px;
  }
.icon-desc{
    margin:0 auto;
    color:#333;
    text-align:center;
    overflow:hidden;
    white-space:nowrap;
    text-overflow ellipsis;
  }
</style>
