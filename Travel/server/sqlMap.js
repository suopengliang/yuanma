var sqlMap = {
  // 用户
  user: {
    fontuser:'select * from login where username=?',
    insertuser:'insert into login(username,password,email,fav) values(?,?,?,?)',
    // foundpassword:'select * from login where username=?'
    updatepassword:'update login set password = ? where username = ?',
    all:'select * from login',
    updateusername:'update login set username = ? where username = ?',
    updatenicks:'update orders set nicks = ? where nicks = ?',
    updateemail:'update login set email = ? where username = ?',
    delete:'delete from login where username = ?',
    deleteorder:'delete from orders where nicks = ?',
    addfav:'update login set fav = ? where username = ?'
  },
feature:{
    icons:'select * from icons where city = ?',
    hot:'select * from hot where city = ?',
    favorite:'select * from favorite where city = ?  ',
 },
 intro:{
    alldata:'select * from introduce where scenname = ?'
 },
  comment:{
    update:'update introduce set comment = ? where scenname = ?'
  },
  add:{
    // order:'insert into order(name,phonenum,date,num,prices,scenname) values(?,?,?,?,?,?)'
    order:'insert into orders(nicks,names,phonenum,dates,nums,prices,scenname,ispay,isuse,favs) values(?,?,?,?,?,?,?,?,?,?)'
  },
  find:{
    order:'select * from orders where nicks=?'
  },
  update:{
    order:'update orders set ispay = "是" where ids = ?'
  },
  delete:{
    order:'delete from orders where ids = ?'
  },
  updateuse:{
    order:'update orders set isuse = "是" where ids = ?'
  },
  findids:{
    order:'select isuse from orders where ids = ?'
  },
  updatefavs:{
    order:'update orders set favs = ? where ids = ?'
  }
}


module.exports = sqlMap;
