<template>
  <ul class="list">
    <li class="item"
        :ref="item"
        @touchstart="handleTouchStart"
        @touchmove="handleTouchMove"
        @click="handleLetterClick"
        @touchend="handleTouchEnd"
        v-for="item in word"
       >{{item}}</li>
  </ul>
</template>

<script>
  export default{
    name:'CityAlphabet',
    data(){
      return{
        word:["A","B","C","D","E","F","G","H","J","K","L","M","N","P","Q","R","S","T","W","X","Y","Z"],
        touchStatus:false,
        startY:0,
        timer:null,
      }

    },
    updated (){
      this.startY = this.$refs['B'][0].offsetTop
    },
    methods:{
      handleLetterClick(e){
        this.$emit('change',e.target.innerText)
//console.log(e.target.innerText)
      },
      handleTouchStart(){
        this.touchStatus = true;
      },
      handleTouchMove(e){
        if(this.touchStatus){
          if(this.timer){
            clearTimeout(this.timer)
          }
          this.timer = setTimeout(()=>{
            const touchY = e.touches[0].clientY-219 - this.startY
            const index = Math.floor((touchY - this.startY)/19)
            if(index >=0 && index < this.word.length){
              this.$emit("change",this.word[index])
            }
            console.log(this.word[index])
          },16)

        }
      },
      handleTouchEnd(){
        this.touchStatus = false;
      }
  }

  }
</script>

<style lang="stylus" scoped>
.list{
  position:absolute;
  right:0.2rem;
  bottom: 0;
  top:4.5rem
  width:0.5rem;
  display:flex;
  flex-direction:column;
  justify-content:center;
}
  .item{
    text-align :center;
    color:#aaa;
    height:1rem;
  }
</style>
