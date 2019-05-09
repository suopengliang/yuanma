<template>
<div>
  <div class="top-text"><img @click="$router.back(-1)"class="detail-quit"src="../../static/img/fanhui2.png">部分景点</div>
  <div  class="middle-box" v-for="item of detail">
    <ul :class="item.id"  @click="test">
      <li class="m-item" >
        <img class="item-img" :src=item.imgurl>
        <div class="item-info">
          <p class="item-title">{{item.rel}}</p>
          <p class="item-comment">
            <img v-if="item.start>0" class="how-star" src="../../assets/img/star.png"/>
            <img v-if="item.start>1" class="how-star" src="../../assets/img/star.png"/>
            <img v-if="item.start>2" class="how-star" src="../../assets/img/star.png"/>
            <img v-if="item.start>3" class="how-star" src="../../assets/img/star.png"/>
            <img v-if="item.start>4" class="how-star" src="../../assets/img/star.png"/>
            &nbsp;&nbsp;
            {{item.speak}}条评论</p>
          <div class="item-price">{{item.res}}起</div>
          <div class="middle-border"></div>
        </div>
      </li>
    </ul>
    <div class="adult-prize">{{item.rel}}成人票价格<div class="adult-money">{{item.adult}}</div></div>
    <div class="adult-prize">{{item.rel}}学生票 儿童票价格<div class="adult-money">{{item.student}}</div></div>
    <div class="box-next"></div>
  </div>
</div>
</template>

<script>
  export default {
    name:"Detail",
    data(){
      return{
        num:"",
        detail:""
      }
    },
    created(){

//      console.log(document.getElementsByClassName("top-text").offsetTop)
      if(this.$route.query.detail[0].imgurl != undefined){
        window.localStorage.setItem("data",JSON.stringify(this.$route.query))
        this.num = this.$route.query.num;
        this.detail = this.$route.query.detail;
      }else{
        var data = JSON.parse(window.localStorage.getItem("data",this.$route.query));
        this.num = data.num
        this.detail =  data.detail;
      }


    },
    methods:{

      test(e){
        var name = e.path[1].getElementsByClassName("item-title")[0].innerHTML;
        this.$http.post('/api/foundicon/intro',{
          name:name,
        },{}).then((data) =>{
          console.log(data.data[0])
          this.$router.push({name: 'Introduce',params:{data:data.data[0]}})
//          console.log()

//          this.pic=JSON.parse(data.data[0].pic)
//          this.detail=JSON.parse(data.data[0].detail)
        })//跳转
//
      }
    },
  }
  </script>

<style>
.top-text{
  border-bottom: 0.01rem solid #f1f1f1;
  text-align: center;
  font-size: 0.35rem;
  height:0.8rem;
  line-height:0.8rem;
  margin-bottom: 0.1rem;
  background-color: #ff8318;
  color:#fff;
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
.adult-prize{
   /*height:1rem;*/
  line-height: 0.8rem;
  border-bottom: 0.01rem solid #f1f1f1;
  padding-left:0.5rem;
}
  .adult-money{
    float:right;
    margin-right:0.2rem;
  }
.adult-money{
  color:#ff8318;
  font-size: 0.3rem;
}
.box-next{
  width:100%;
  height:0.4rem;
  background-color: #f1f1f1;
  margin-bottom:0.2rem;
}
  .detail-quit{
    width:0.5rem;
    hieght:0.5rem;
    /*float:left;*/
    left:0.2rem;
    top:0.1rem;
    position:absolute;
  }
</style>
