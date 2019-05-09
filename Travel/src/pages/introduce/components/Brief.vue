<template>
  <div>

    <div class="brief-box">
      <div class="brief-div brief-comment-style" @click="selfComment">
        <span class="brief-text">5.0分&nbsp;&nbsp;超赞</span>
        <div class="brief-comment">评论</div>
        <img class="brief-next" src="../../../static/img/next.png">
      </div>
      <div @click="briefIntroduce" class="brief-div brief-introduce-style">
        <span class="brief-time-text">景点简介</span>
        <div class="brief-time-tips">开放时间、贴士</div>
        <img class="brief-nexts" src="../../../static/img/next.png">
      </div>
      <div class="brief-static">
        <img class="brief-static-img" src="../../../static/img/static.png">
        {{this.static}}
      </div>
    </div>

    <div id="brief-comment-pages" class="brief-comment-page">
      <div class="brief-title-box">
        <img @click="quitAll" class="brief-fanui-pic" src="../../../static/img/fanhui.png">
        <span class="brief-title-dianping">点评</span>
      </div>
      <div v-for="item of comment">
        <span class="comment-name">{{item.names}}</span><span class="comment-data">{{item.data}}</span>
        <div class="comment-content">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{item.content}}</div>
      </div>
      <div class="comment-no">已无更多评论</div>
      <div @click="writeComment" class="brife-comment-button">
        写点评
      </div>
      <div class="brief-writer-comment-box">
        <div class="brief-comment-submit" @click="commentSubmit">发布</div> <div @click="commentQuit" class="brief-comment-quit">返回</div>
        <textarea type="text" id="comment-text" class="brief-writer-comment" placeholder="写评论"></textarea>
      </div>
      <div class="comment-success">发布成功</div>
    </div>


    <div class="introduce-brief-box">
      <img @click = "introduceQuits" class="introduce-brief-quit" src="../../../static/img/fanhui2.png">
      <div class="introduce-brief-top">详情介绍</div>
      <div class="introduce-brief-into-text">
        <img class="introduce-brief-into-pic" src="../../../static/img/line.png">
        入园参考
      </div>
      <div class="introduce-brief-into-time">
        <span class="introduce-brief-into-time-title">开放时间</span>
        <br/>{{this.scenprief.time}}
      </div>
      <div class="introduce-brief-into-time">
        <span class="introduce-brief-into-time-title">优惠政策</span>
        <br/> {{this.scenprief.favourable}}
      </div>
      <div class="introduce-brief-slipe"></div>
      <div class="introduce-brief-into-text">
        <img class="introduce-brief-into-pic" src="../../../static/img/line.png">
        温馨提示
      </div>
      <div class="introduce-brief-into-time">
        <span class="introduce-brief-into-time-title">小贴士</span>
        <br/> {{this.scenprief.hint}}
      </div>
      <div class="introduce-brief-into-text">
        <img class="introduce-brief-into-pic" src="../../../static/img/line.png">
        交通和到达
      </div>
      <div class="introduce-brief-into-time">
        <span class="introduce-brief-into-time-title">交通信息</span>
        <br/> {{this.scenprief.traffice}}
      </div>
    </div>


  </div>
</template>

<script>
  export default{
    name:"IntroduceBrief",
    props:{
      static:String,
      comment:Array,
      scenprief:Object,
      scenname:String
    },
    created(){
//      document.getElementsByClassName("comment-success")[0].style.display="none";
    },
    methods:{
      selfComment(){
        document.getElementsByClassName("brief-comment-page")[0].style.display="block";
        document.getElementsByClassName("comment-box")[0].style.display="none";

      },
      writeComment(){
        document.getElementsByClassName("brief-writer-comment-box")[0].style.display="block"

      },
      commentSubmit(){
        var date = new Date();
        var year = date.getFullYear();
        var month = date.getMonth()+1;
        var day = date.getDate();
        var dates = year+"-"+month+"-"+day;
        var commObj = {content:document.getElementById("comment-text").value,data:dates,names:window.localStorage.getItem("userName")}
        var commentAaary = this.comment;
        commentAaary.push(commObj)
        this.$http.post('/api/foundicon/updatecomment',{
          upscenname:this.scenname,
          upcomment:JSON.stringify(commentAaary),
        },{}).then((data) =>{
         console.log(data)
//          console.log()
          document.getElementsByClassName("comment-success")[0].style.display="block";
          setTimeout(function(){
            document.getElementsByClassName("brief-writer-comment-box")[0].style.display="none";
            document.getElementsByClassName("comment-success")[0].style.display="none";
            document.getElementsByClassName("comment-box")[0].style.display="block";
          },1000)

//          this.pic=JSON.parse(data.data[0].pic)
//          this.detail=JSON.parse(data.data[0].detail)
        })//更新评论
//
      },
      commentQuit(){
        document.getElementsByClassName("brief-writer-comment-box")[0].style.display="none";
        document.getElementsByClassName("comment-success")[0].style.display="none";
      },
      quitAll(){
        document.getElementsByClassName("brief-comment-page")[0].style.display="none"
        document.getElementsByClassName("comment-box")[0].style.display="block";
      },
      briefIntroduce(){
        document.getElementsByClassName("introduce-brief-box")[0].style.display="block";
        document.getElementsByClassName("comment-box")[0].style.display="none";
      },
      introduceQuits(){
        document.getElementsByClassName("introduce-brief-box")[0].style.display="none";
        document.getElementsByClassName("comment-box")[0].style.display="block";
      }
    }
  }
</script>

<style>
.brief-box{
  width:100%;
  height:2rem;
  background-color: #fff;
  border-top-left-radius: 0.15rem;
  border-top-right-radius: 0.15rem;
  margin-top:-0.1rem;
  position:relative;
  }
  .brief-div{
    border-right:0.01rem solid #eee;
    border-bottom:0.01rem solid #eee;
    width:50%;
    height:1.4rem;
    float:left;

  }
  .brief-comment-style{
   line-height: 0.9rem;
    padding-left:0.5rem;
    font-size: 0.4rem;
  }
  .brief-text{
    color:#ff8300;

  }
  .brief-comment{
    margin-top:-0.3rem;
    font-size: 0.3rem;
    color:#9e9e9e;
  }
  .brief-next{
    width:0.5rem;
    height:0.5rem;
    margin-top:-2.5rem;
    margin-left:2.6rem;
  }
  .brief-introduce-style{
    line-height: 0.8rem;
    padding-left:0.4rem;
  }
  .brief-time-tips{
    color:#9e9e9e;
    margin-top:-0.4rem;
    font-size: 0.2rem;
  }
.brief-nexts{
  width:0.5rem;
  height:0.5rem;
  margin-top:-2rem;
  margin-left:2.6rem;
}
  .brief-static-img{
    width:0.5rem;
    height:0.5rem;
    margin-left:0.3rem;
    margin-right:0.3rem;
  }
  .brief-comment-page{
    position:absolute;
    top:0;;
    z-index: 9;
    width:100%;
    height:100%;

    background-color: #fff;
  }
  #brief-comment-pages{
    display: none;
  }
  .brief-title-box{
    height:0.8rem;
    line-height: 0.8rem;
    border-bottom: 0.01rem solid #eee;
  }
  .brief-title-dianping{
    margin-left:2.8rem;
    font-size: 0.35rem;
  }
  .brief-fanui-pic{
    width:0.5rem;
    height:0.5rem;
    margin-left:0.2rem;
  }
  .brife-comment-button{
    width:90%;
    left:5%;
    height:0.6rem;
    line-height: 0.6rem;
    background-color:#00bcd4 ;
    text-align: center;
    color:#fff;
    position:fixed;
    bottom: 0.1rem;
    border-radius: 0.1rem;
  }
  .brief-writer-comment-box{
    width:90%;
    height:4rem;
    background-color: #fff;
    border:0.01rem solid #a9a9a9;
    position:absolute;
    top:67%;
    left:5%;
    display: none;

  }
  .brief-writer-comment{
     width:100%;
     height:3rem;
     margin-top: 0.3rem;
    word-wrap:break-word;
    resize:none;
    /*border-top:0.01rem solid #eee;*/
    /*border-bottom:0.01rem solid #eee;*/

    background-color: #fff;
  }
.brief-comment-submit{
  width:1rem;
  height:0.5rem;
  color:#fff;
  text-align: center;
  line-height: 0.5rem;
  border-radius: 0.2rem;
  margin-left:0.2rem;
  margin-top:0.2rem;
  background-color:#00bcd4 ;
}
  .brief-comment-quit{
    width:1rem;
    height:0.5rem;
    color:#fff;
    text-align: center;
    line-height: 0.5rem;
    border-radius: 0.2rem;
    margin-right:0.2rem;
    margin-top:-0.5rem;
    background-color:#00bcd4 ;
    float: right;
  }



  .introduce-brief-box{
    position:absolute;
    top:0;;
    z-index: 9;
    width:100%;
    height:100%;
    background-color: #fff;
    display: none;
  }
  .introduce-brief-top{
    width:100%;
    height:0.9rem;
    color:#fff;
    text-align: center;
    line-height: 0.9rem;
    font-size: 0.35rem;
    background-color: #00bcd4;
  }
  .introduce-brief-quit{
    width:0.5rem;
    height:0.5rem;
    position:absolute;
    top:0.15rem;
    left:0.2rem;
  }
  .introduce-brief-into-pic{
    height:0.3rem;
    margin-left:0.2rem;
  }
.introduce-brief-into-text{
  color:#212121;
  font-size: 0.3rem;
  border-bottom: 0.01rem solid #eee;
  height:0.8rem;
  line-height: 0.8rem;
  font-weight: bold;
}
.introduce-brief-into-time{
  margin-left:0.2rem;
  margin-top:0.2rem;
}
.introduce-brief-into-time-title{
  color:#212121;
  font-size: 0.3rem;
  font-weight: bold;
}
  .introduce-brief-slipe{
    width:100%;
    height:0.25rem;
    background-color: #eee;
    margin-top:0.2rem;
    margin-bottom:0.2rem;
  }
  .comment-success{
    background-color: black;
    color:#fff;
    opacity: 0.6;
    width:3rem;
    height:0.8rem;
    font-size: 0.35rem;
    border-radius: 0.4rem;
    line-height: 0.8rem;
    text-align: center;
    left:2rem;
    /*margin-top:-1rem;*/
    top:9rem;
    display: none;
    position: fixed;
    z-index: 9999;

  }
</style>
