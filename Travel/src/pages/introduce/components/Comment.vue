<template>
  <div class="comment-box" id="comment-boxs">
    <div class="comment-title">
      <img class="comment-line" src="../../../static/img/line.png">用户评论
    </div>
    <div v-for="item of comment">
      <span class="comment-name">{{item.names}}</span><span class="comment-data">{{item.data}}</span>
      <div class="comment-content">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{item.content}}</div>
    </div>
    <div class="comment-no">已无更多评论</div>
  </div>
</template>

<script>
  export default{
    name:"IntroduceComment",
    props:{
      comment:Array,
    },
    created(){
      console.log(this.comment)
    }
  }
</script>

<style>
 .comment-box{
  background-color: #fff;
  margin-top:0.3rem;
  font-size:0.35rem;
   /*display: none;*/
}
  .comment-title{
     border-bottom: 0.01rem solid #eee;
     height:0.8rem;
    line-height: 0.8rem;
  }
  .comment-line{
    height: 0.35rem;
  }
  .comment-name{
    font-size: 0.2rem;
    margin-left:0.4rem;
  }
  .comment-data{
    font-size: 0.2rem;
    margin-left:5rem;
  }
  .comment-content{
    word-wrap:break-word;
    border-bottom:0.01rem solid #eee;
    width:6.6rem;
    /*height:0.5rem;*/
    font-size: 0.25rem;
    margin-left:0.4rem;
    padding-top: 0.2rem;
    padding-bottom: 0.2rem;
  }
  .comment-no{
    text-align: center;
    line-height: 0.8rem;
    height:0.8rem;
  }
</style>
