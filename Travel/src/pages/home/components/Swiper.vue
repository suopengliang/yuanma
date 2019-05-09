<template>
  <div class="wrapper">
  <swiper  :options="swiperOption">
    <!-- slides -->
    <swiper-slide v-for="item of imglist" :key="item.id">
      <img class="swiper-img " :class="item.id" :src="item.imgUrl"/>
    </swiper-slide>
    <!--<swiper-slide>-->
      <!--<img class="swiper-img" src="../../../assets/img/picture2.jpg"/>-->
    <!--</swiper-slide>-->
    <!-- Optional controls -->
    <div class="swiper-pagination"  slot="pagination"></div>
  </swiper>
  </div>
</template>

<script>
export default{
  name:"HomeSwiper",
  data:function(){
    return{
      swiperOption:{
        pagination:'.swiper-pagination',
        loop:true,
        autoplay: 5000,
      },
      imglist:[{ id:"1", imgUrl:require("../../../assets/img/picture1.jpg")},
                 {id:"2",imgUrl:require("../../../assets/img/picture2.jpg")},
                 {id:"3",imgUrl:require("../../../assets/img/picture4.png")}
      ]
    }
},
mounted:function(){
  var _this = this;
//  var swiper=new Swiper('.swiper-container',{
//            // autoplay: 5000,
//
//    //   onClick:function(ins,event){
//    //     console.log(event);
//
//    // },
//    //  onClick: function(swiper){
//    //        console.log(swiper.clickedIndex)
//    // }
//  })
 $(".swiper-img").click(function(){

   if(this.classList[1] == 3){
     _this.$router.push({name:"Game"})
   }
 })
 },
}
  </script>

<style lang="stylus" scoped>
  .wrapper >>> .swiper-pagination-bullet-active{
                 background:#fff !important
  }

  .swiper-img{
    width:100%;
    heigt:25%;
  }
  .wrapper{
    height:30%;
    width:100%;
  }
</style>
