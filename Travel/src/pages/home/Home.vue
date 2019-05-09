<template>
  <div>
    <home-header :state="state" :clickState="clickState"></home-header>
    <home-swiper></home-swiper>
    <home-icons :pic="pic" :detail="detail"></home-icons>
    <home-reconmmend :hot="hot"></home-reconmmend>
    <div id="home-mid"></div>
    <home-middle :like = "like"></home-middle>
    <home-naviga></home-naviga>
    <!--<img src="../../static/img/11-1.jpg">-->
    <!--<img src="../../static/img/11-2.jpg">-->
    <!--<img src="../../static/img/11-3.jpg">-->
    <!--<img src="../../static/img/11-4.jpg">-->
    <!--<img src="../../static/img/11-5.jpg">-->
    <!--<img src="../../static/img/11-6.jpg">-->
 </div>
</template>
<script>
  import HomeHeader from './components/Header.vue'
  import HomeSwiper from "./components/Swiper.vue"
  import HomeIcons from "./components/Icons.vue"
  import HomeReconmmend from "./components/Reconmmend.vue"
  import HomeMiddle from "./components/Middle.vue"
  import axios from 'axios'
  import BMap from 'BMap'
  import HomeNaviga from './components/Naviga.vue'
  export default{
    name:"Home",
    components:{
      HomeReconmmend: HomeReconmmend,
      HomeHeader:HomeHeader,
      HomeSwiper:HomeSwiper,
      HomeIcons:HomeIcons,
      HomeMiddle:HomeMiddle,
      HomeNaviga:HomeNaviga,
    },
    data(){
      return{
        iconlist:[],
        state:"",
        clickState:"",
        num:"",
        city:"",
        pic:[],
        hot:[],
        like:[],
        detail:[],
      }
    },
    methods:{
      status() {
        var _this = this;
        var geolocation = new BMap.Geolocation();
        // 创建地理编码实例
        var myGeo = new BMap.Geocoder();
        geolocation.getCurrentPosition(function(r) {
          if (this.getStatus() == BMAP_STATUS_SUCCESS) {
            var pt = r.point;
            // 根据坐标得到地址描述
            myGeo.getLocation(pt, function(result) {
              if (result) {
                var addComp = result.addressComponents;
                _this.state = addComp.city.substr(0,addComp.city.length-1);
                _this.city = _this.state
                console.log( _this.city)
//                _this.feature();
//               console.log(addComp.city);
                // console.log(addComp.district);

//                 alert(
//                   addComp.province + "," + addComp.city + "," + addComp.district
//                 );
              }
            });
          }
        });
      },
      feature(){
        console.log(this.city)
        this.$http.post('/api/foundicon/icons',{
          iconname:this.city,
        },{}).then((data) =>{
          console.log(data)

          this.pic=JSON.parse(data.data[0].pic)
          this.detail=JSON.parse(data.data[0].detail)
        })//获取图标图片
        this.$http.post('/api/foundicon/hot',{
          hotname:this.city,
        },{}).then((data) =>{
          this.hot =JSON.parse(data.data[0].data)
          console.log(this.hot)
        })
        this.$http.post('/api/foundicon/favorite',{
          likename:this.city,
        },{}).then((data) =>{
          this.like =JSON.parse(data.data[0].data)
          console.log(this.like)
        })
      }
    },
    created(){
      for(var i=1;i<=10;i++){
       require("../../static/img/"+i+".png")
      }
      for(var i=1;i<=6;i++){
        require("../../static/img/2-"+i+".jpg")
      }
      for(var i=1;i<=2;i++){
        require("../../static/img/3-"+i+".jpg")
      }
      for(var i=1;i<=4;i++){
        require("../../static/img/6-"+i+".jpg")
      }
      for(var i=1;i<=6;i++){
        require("../../static/img/8-"+i+".jpg")
      }
      for(var i=1;i<=6;i++){
        require("../../static/img/7-"+i+".jpg")
      }
      for(var i=1;i<=6;i++){
        require("../../static/img/9-"+i+".jpg")
      }
      for(var i=1;i<=6;i++){
        require("../../static/img/10-"+i+".jpg")
      }
      for(var i=1;i<=6;i++){
        require("../../static/img/11-"+i+".jpg")
      }
      require("../../static/img/4-1.jpg")
//      this.status();
      this.city = "郑州",
      this.state = "郑州"
      this.num = this.$route.query.num;
      if(this.num == 2){
        this.clickState = this.$route.query.states;
        this.city = this.clickState;
      }
      this.feature();
      console.log(this.city);

    },
  }
</script>
<style>
#home-mid{
  background-color: #eee;
  width:100%;
  height:20px;
}
 #first-page{
   opacity: 1
  }
</style>
