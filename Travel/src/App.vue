<template>
  <div id="app">
    <!--<div class="index"><img src="./assets/img/zhu.png"></div>-->
    <router-view></router-view>
    <!--<div id="first-page"></div>-->
  </div>
</template>

<script>
  export default {
  name: 'App',
    mounted:function(){
      this.showH();
    },
    methods:{
      showH:function(){
        document.documentElement.style.fontSize=document.documentElement.clientWidth / 7.5+'px';
//        $(".index").animate(
//          {'opacity':"0",
//          },3000,function(){
//            $(".index").remove()
//          });
      }
    },
}
</script>

<style>
  .index{
    position:absolute;
    width:100%;
    height:100%;
  }
  .index img{
    width:100%;
    height:100%;
  }
  #first-page{
   opacity: 0
  }
</style>
<!--<template>-->
  <!--<div class="app">-->
    <!--<h1>{{ msg }}</h1>-->
    <!--<form>-->
      <!--<input type="text" name="username" v-model="userName"> <br>-->
      <!--<input type="text" name="age" v-model="age"> <br>-->
      <!--<a href="javascript:;" @click="addUser">提交</a><br>-->

      <!--<input type="text" name="username" v-model="pname"> <br>-->
      <!--<a href="javascript:;" @click="pics">查询</a><br>-->

      <!--&lt;!&ndash;<input type="text"  v-model="picc"> <br>&ndash;&gt;-->

      <!--<a href="javascript:;" @click="inster">插图片</a><br>-->

      <!--&lt;!&ndash;<a href="javascript:;" @click="deleteUser">删除</a><br>&ndash;&gt;-->

      <!--&lt;!&ndash;<input type="text" name="age" v-model="age"> <br>&ndash;&gt;-->
      <!--&lt;!&ndash;<a href="javascript:;" @click="addUser">提交</a>&ndash;&gt;-->

    <!--</form>-->
  <!--</div>-->
<!--</template>-->

<!--<script>-->
  <!--export default {-->
    <!--name: 'App',-->
    <!--data () {-->
      <!--return {-->
        <!--msg: 'Welcome to Your Vue.js App',-->
        <!--userName: '',-->
        <!--age: '',-->
        <!--dename:'',-->
        <!--pname:'',-->
        <!--src:''-->

      <!--}-->
    <!--},-->
    <!--methods: {-->


      <!--addUser() {-->
        <!--var name = this.userName;-->
        <!--var age = this.age;-->
        <!--this.$http.post('/api/user/addUser', {-->
          <!--username: name,-->
          <!--age: age-->
        <!--},{}).then((response) => {-->
          <!--console.log(response);-->
        <!--})-->
      <!--},-->
      <!--deleteUser() {-->
        <!--var names = this.dename;-->
          <!--this.$http.post('/api/user/deleteUser',{-->
            <!--dename:names,-->
          <!--},{}).then((response) =>{-->
            <!--console.log(response);-->
          <!--})-->
      <!--},-->
      <!--pics() {-->
        <!--var named=this.pname;-->
         <!--this.$http.post('/api/user/fontPic',{-->
           <!--dename:named,-->
         <!--},(data)=>{-->
           <!--console.log(data);-->
         <!--}).then((data) =>{-->

<!--//           var array = new Blob([data.data[0].picss.data]);-->
            <!--console.log(data.data[0].picss.data)-->
<!--//           data:image/png;base64,-->
<!--//             let reader    = new FileReader();-->
<!--//              reader.readAsDataURL(array);-->
<!--//-->
<!--//             reader.onload = function(e) {-->
<!--//               console.log(e.target.result)-->
<!--//             }-->
         <!--})-->
      <!--},-->

      <!--inster() {-->
       <!--function dataURLtoBlob(dataurl) {-->
          <!--var arr = dataurl.split(','),-->
            <!--mime = arr[0].match(/:(.*?);/)[1],-->
            <!--bstr = atob(arr[1]),-->
            <!--n = bstr.length,-->
            <!--u8arr = new Uint8Array(n);-->
          <!--while (n&#45;&#45;) {-->
            <!--u8arr[n] = bstr.charCodeAt(n);-->
          <!--}-->
          <!--return new Blob([u8arr], {-->
            <!--type: mime-->
          <!--});-->
        <!--}-->
        <!--var picc = dataURLtoBlob(this.src);-->
            <!--console.log(picc)-->
        <!--this.$http.post('/api/user/inPic', {-->
          <!--picss:picc-->
          <!--,-->
        <!--},{}).then((response) => {-->
          <!--console.log(response);-->
        <!--})-->
      <!--}-->
    <!--},-->

  <!--}-->
<!--</script>-->
