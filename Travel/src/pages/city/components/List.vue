<template>
  <div class="list" ref="wrapper">
    <div>
    <div class="area">
      <div class="title border-topbottom">当前城市</div>
      <div class="button-list">
        <div class="button-wrapper">
          <router-link :to="{path:'/home',query:{states:state,num:'2'}}">
          <div class="button">{{state}}</div>
          </router-link>
        </div>
      </div>
    </div>
    <div class="area" >
      <div class="title border-topbottom">热门城市</div>
      <div class="button-list">
        <div class="button-wrapper" v-for="(item,index) in hotCity">
          <router-link :to="{path:'/home',query:{states:item,num:'2'}}">
          <div class="button">{{item}}</div>
          </router-link>
        </div>
      </div>

    </div>
      <div  v-for="item in allCity" class="area" :ref="item.id" >
        <div class="title border-topbottom">{{item.id}}</div>
        <div class="item-list">
          <router-link  v-for="item in item.city" :to="{path:'/home',query:{states:item,num:'2'}}"  >
          <div class="item border-bottom" >
            {{item}}
          </div>
          </router-link>
        </div>
      </div>
      </div>
    </div>
</template>

<script>
  import Bscroll from 'better-scroll'
  export default{
    name:'CityList',

    props:{
      letter:String,
      state:String,
      allCity:Array,
      required:true
    },
    data(){
      return{
//        location:state.charAt(state.length - 1),
        hotCity:["郑州","洛阳","开封","焦作","登封","平顶山","信阳",],

        }
    },
    mounted(){
//        this.scroll = new Bscroll(this.$refs.wrapper)

      this.$nextTick(() => {
        if (!this.scroll) {
          this.scroll = new Bscroll(this.$refs.wrapper, {})
          console.log(this.scroll)
        }
      })
//      console.log(this.$refs.wrapper)
    },
 watch:{
   letter(){
     if(this.letter){
       const element = this.$refs[this.letter][0]
       this.scroll.scrollToElement(element)
     }
   }
    },
  }
</script>

<style lang="stylus" scoped>
  .list{
    font-size:100%;
    position absolute;
    overflow hidden;
    height:11rem;
  }

  .border-topbottom
  &:before
       border-color:#ccc;
  &:after
        border-color:#ccc;

  .title{
    line-height:0.6rem;
    background :#eee;
    padding-left:0.2rem;
    color:#666;
    font-size:0.3rem;
  }
  .button-list{
    padding:0.01rem 0.1rem 0.1rem 0.1rem;
    overflow :hidden;
  }
 .button-wrapper{
    float:left;
    width:20%;
    margin:0.3rem;
  }
  .button{
    margin-left:0.1rem;
     text-align:center;
     border:0.05rem solid #ccc;
     border-radius:0.3rem;
  }
  .item{
    line-height :0.6rem;
    color:#666;
    padding-left:0.2rem;
    /*float:left;*/
  }
  .border-bottom
  &:before
    border-color:#ccc;
</style>
