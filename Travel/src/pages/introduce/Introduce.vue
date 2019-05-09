<template>
  <div class="box-style">
    <introduce-top :scenpic = "scenpic" :scenname="scenname"></introduce-top>
    <introduce-brief  :scenname = "scenname" :static="scendata.static" :comment="comment" :scenprief="scenprief"></introduce-brief>
    <introduce-prices :scenname="scenname" :scendata="scendata"></introduce-prices>
    <introduce-comment :comment="comment"></introduce-comment>

  </div>
</template>

<script>
  import IntroduceTop from './components/Top.vue'
  import IntroduceBrife from './components/Brief.vue'
  import IntroducePrices from './components/Prices.vue'
  import IntroduceComment from './components/Comment.vue'
export default {
  name:"Introduce",
  components:{
    IntroduceTop:IntroduceTop,
    IntroduceBrief:IntroduceBrife,
    IntroducePrices:IntroducePrices,
    IntroduceComment:IntroduceComment,
  },
  data(){
    return{
     alldata:this.$route.params.data,
      scendata:"",
      scenname:"",
      scenpic:"",
      scenprief:"",
      comment:""
//      scendata:JSON.parse(this.$route.params.data.scendata)[0],
//      scenname:this.$route.params.data.scenname,
//      scenpic:JSON.parse(this.$route.params.data.scenpic),
//      scenprief:JSON.parse(this.$route.params.data.scenprief)[0],
//      comment:JSON.parse(this.$route.params.data.comment)
    }
  },
  created(){
       if(this.alldata !=undefined){
         window.localStorage.setItem("introduceData",JSON.stringify(this.alldata))
         this.scenname = this.$route.params.data.scenname;
         this.scenpic = JSON.parse(this.$route.params.data.scenpic);
         this.scenprief = JSON.parse(this.$route.params.data.scenprief)[0];
         this.comment = JSON.parse(this.$route.params.data.comment);
         this.scendata = JSON.parse(this.$route.params.data.scendata)[0];
       }else{
        var useData = JSON.parse(window.localStorage.getItem("introduceData",this.alldata));

           this.scenname = useData.scenname;
           this.scenpic = JSON.parse(useData.scenpic);
           this.scenprief = JSON.parse(useData.scenprief)[0];
           this.comment = JSON.parse(useData.comment);
         this.scendata = JSON.parse(useData.scendata)[0];
       }
    for(var i=1;i<=this.scenpic.length;i++){
      require("../../static/img/5-"+i+".jpg")
    }
  },
  }
</script>
<style>
.box-style{
  background-color: #eee;
}
</style>
