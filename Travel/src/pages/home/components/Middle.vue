<template>
  <div>
  <div>
  <p class="mid-gues">猜你喜欢</p>
    <div class="middle-box">
    <ul  >
      <li v-for="item of like"class="m-item" @click="guseClick">
        <img class="item-img" :src=item.imgurl>
        <div class="item-info">
          <p class="item-title">{{item.rel}}</p>
          <p class="item-comment">
            <img v-if="item.start>0" class="how-star" src="../../../assets/img/star.png"/>
            <img v-if="item.start>1" class="how-star" src="../../../assets/img/star.png"/>
            <img v-if="item.start>2" class="how-star" src="../../../assets/img/star.png"/>
            <img v-if="item.start>3" class="how-star" src="../../../assets/img/star.png"/>
            <img v-if="item.start>4" class="how-star" src="../../../assets/img/star.png"/>
            &nbsp;&nbsp;
            {{item.speak}}条评论</p>
          <div class="item-price">{{item.res}}起</div>
          <div class="middle-border"></div>
        </div>
      </li>

    </ul>
      <div class="home-middle-botto"></div>
    </div>
    </div>
  </div>
</template>
<script>
  export default {
   name:"Middle",
    props:{
      like:Array,
    },
    methods:{
      guseClick(e){
        this.$http.post('/api/foundicon/intro',{
          name:e.path[1].getElementsByClassName("item-title")[0].innerHTML,
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

<style>
.mid-gues{
  font-size:0.35rem;
  color:#212121;
  height:1rem;
  line-height: 0.8rem;
  margin-left:0.4rem;
}
.middle-box{
  position:relative;
}
.middle-border{
  margin-top:0.6rem;
  width:165%;
  height:0.01rem;
  margin-left:-64%;
 border:0.01rem solid #f1f1f1;
}
  /*.m-item{*/
    /*height:7.5rem;*/
    /*width:100%;*/
  /*}*/
.item-img{
  width:2rem;
  height:2rem;
  margin-left:0.5rem;
  float:left;
}
.item-info{
  width:4.5rem;
  height:2rem;
  margin-left:0.4rem;
  margin-top:0.3rem;
  float:left;
}
.item-title{
  font-size: 0.35rem;
}
.how-star{
  width:0.28rem;
  height:0.28rem;
  margin-top:-0.1rem;
}
.home-middle-botto{
  top:7rem;
  height:0.5rem;
  position: relative;

}
</style>
