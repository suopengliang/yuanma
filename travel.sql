/*
Navicat MySQL Data Transfer
Source Host     : localhost:3306
Source Database : travel
Target Host     : localhost:3306
Target Database : travel
Date: 2019-03-29 10:57:50
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite` (
  `city` char(255) DEFAULT NULL,
  `data` longtext
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of favorite
-- ----------------------------
INSERT INTO `favorite` VALUES ('郑州', '[{\"imgurl\":\"/static/img/3-1.be0d32d.jpg\",\"rel\":\"黄帝宫御温泉\",\"res\":\"￥165元\",\"start\":\"5\",\"speak\":\"10\"},{\"imgurl\":\"/static/img/2-6.9404c79.jpg\",\"rel\":\"郑州方特欢乐世界(4A)\",\"res\":\"￥190元\",\"start\":\"5\",\"speak\":\"11\"},{\"imgurl\":\"/static/img/3-2.12e53b5.jpg\",\"rel\":\"世纪欢乐园\",\"res\":\"￥68元\",\"start\":\"5\",\"speak\":\"12\"}]');
INSERT INTO `favorite` VALUES ('洛阳', '[{\"imgurl\":\"/static/img/6-1.3beeb91.jpg\",\"rel\":\"鸡冠洞\",\"res\":\"￥75元\",\"start\":\"4\",\"speak\":\"10\"},{\"imgurl\":\"/static/img/6-2.ebeadae.jpg\",\"rel\":\"洛阳灵山寺\",\"res\":\"￥25.8元\",\"start\":\"5\",\"speak\":\"11\"},{\"imgurl\":\"/static/img/6-3.c2c4290.jpg\",\"rel\":\"老君山\",\"res\":\"￥44元\",\"start\":\"5\",\"speak\":\"12\"},{\"imgurl\":\"/static/img/6-4.b567561.jpg\",\"rel\":\"龙门石窟\",\"res\":\"￥100元\",\"start\":\"4\",\"speak\":\"10\"}]');

-- ----------------------------
-- Table structure for hot
-- ----------------------------
DROP TABLE IF EXISTS `hot`;
CREATE TABLE `hot` (
  `city` char(255) DEFAULT NULL,
  `data` longtext
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of hot
-- ----------------------------
INSERT INTO `hot` VALUES ('郑州', '[{\"imgurl\":\"/static/img/2-1.a2427ba.jpg\",\"rel\":\"郑州动物园\",\"res\":\"￥15元\"},{\"imgurl\":\"/static/img/2-2.1e5c14a.jpg\",\"rel\":\"少林寺\",\"res\":\"￥70元\"},{\"imgurl\":\"/static/img/2-3.5cc27f4.jpg\",\"rel\":\"黄帝宫御温泉\",\"res\":\"￥121\"},{\"imgurl\":\"/static/img/2-4.9d1539d.jpg\",\"rel\":\"探路者中岳嵩顶滑雪度假区\",\"res\":\"￥77元\"},{\"imgurl\":\"/static/img/2-5.b6a194f.jpg\",\"rel\":\"银基冰雪世界\",\"res\":\"￥96\"},{\"imgurl\":\"/static/img/2-6.9404c79.jpg\",\"rel\":\"郑州方特欢乐世界(4A)\",\"res\":\"￥190\"}]');
INSERT INTO `hot` VALUES ('洛阳', '[{\"imgurl\":\"/static/img/6-1.3beeb91.jpg\",\"rel\":\"鸡冠洞\",\"res\":\"￥75元\"},{\"imgurl\":\"/static/img/6-2.ebeadae.jpg\",\"rel\":\"洛阳灵山寺\",\"res\":\"￥25.8元\"},{\"imgurl\":\"/static/img/6-3.c2c4290.jpg\",\"rel\":\"老君山\",\"res\":\"￥44元\"},{\"imgurl\":\"/static/img/6-4.b567561.jpg\",\"rel\":\"龙门石窟\",\"res\":\"￥100元\"}]');

-- ----------------------------
-- Table structure for icons
-- ----------------------------
DROP TABLE IF EXISTS `icons`;
CREATE TABLE `icons` (
  `city` varchar(255) DEFAULT NULL,
  `pic` longtext,
  `detail` longtext,
  `oneday` longtext
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of icons
-- ----------------------------
INSERT INTO `icons` VALUES ('上海', '[{\"url\":\"/static/img/1.7f5686c.png\",\"name\":\"景点门票\"},{\"url\":\"/static/img/2.8f55e7d.png\",\"name\":\"一日游\"},{\"url\":\"/static/img/3.ebc5af4.png\",\"name\":\"当地必游\"},{\"url\":\"/static/img/4.ee5091d.png\",\"name\":\"当地好玩\"},{\"url\":\"/static/img/5.4cd5250.png\",\"name\":\"动物园\"},{\"url\":\"/static/img/6.dafc525.png\",\"name\":\"泡温泉\"},{\"url\":\"/static/img/7.db8ec0c.png\",\"name\":\"名胜古迹\"},{\"url\":\"/static/img/8.3c64d38.png\",\"name\":\"野生动物园\"},{\"url\":\"/static/img/10.ff540e8.png\",\"name\":\"游乐场\"}]', '[{\"imgurl\":\"/static/img/6-1.3beeb91.jpg\",\"rel\":\"鸡冠洞\",\"res\":\"￥75元\",\"start\":\"4\",\"speak\":\"10\",\"adult\":\"￥75\",\"student\":\"￥38\",\"id\":\"1\"},{\"imgurl\":\"/static/img/6-2.ebeadae.jpg\",\"rel\":\"洛阳灵山寺\",\"res\":\"￥25.8元\",\"start\":\"5\",\"speak\":\"11\",\"adult\":\"￥25.8\",\"student\":\"￥13\",\"id\":\"2\"},{\"imgurl\":\"/static/img/6-3.c2c4290.jpg\",\"rel\":\"老君山\",\"res\":\"￥44元\",\"start\":\"5\",\"speak\":\"12\",\"adult\":\"￥44\",\"student\":\"￥22\",\"id\":\"3\"},{\"imgurl\":\"/static/img/6-4.b567561.jpg\",\"rel\":\"龙门石窟\",\"res\":\"￥100元\",\"start\":\"4\",\"speak\":\"10\",\"adult\":\"￥100\",\"student\":\"￥50\",\"id\":\"4\"}]', null);
INSERT INTO `icons` VALUES ('郑州', '[{\"url\":\"/static/img/1.7f5686c.png\",\"name\":\"景点门票\",\"id\":\"1\"},{\"url\":\"/static/img/2.8f55e7d.png\",\"name\":\"一日游\",\"id\":\"2\"},{\"url\":\"/static/img/3.ebc5af4.png\",\"name\":\"当地必游\",\"id\":\"3\"},{\"url\":\"/static/img/4.ee5091d.png\",\"name\":\"当地好玩\",\"id\":\"4\"},{\"url\":\"/static/img/5.4cd5250.png\",\"name\":\"动物园\",\"id\":\"5\"},{\"url\":\"/static/img/6.dafc525.png\",\"name\":\"泡温泉\",\"id\":\"6\"},{\"url\":\"/static/img/7.db8ec0c.png\",\"name\":\"名胜古迹\",\"id\":\"7\"},{\"url\":\"/static/img/8.3c64d38.png\",\"name\":\"主题乐园\",\"id\":\"8\"}]', '[{\"imgurl\":\"/static/img/4-1.93428cc.jpg\",\"rel\":\"郑州园博园\",\"res\":\"￥32.5元\",\"start\":\"4\",\"speak\":\"10\",\"adult\":\"￥32.5\",\"student\":\"￥16\",\"id\":\"1\"},{\"imgurl\":\"/static/img/2-6.9404c79.jpg\",\"rel\":\"郑州方特欢乐世界(4A)\",\"res\":\"￥190元\",\"start\":\"5\",\"speak\":\"11\",\"adult\":\"￥255\",\"student\":\"￥190\",\"id\":\"2\"},{\"imgurl\":\"/static/img/3-2.12e53b5.jpg\",\"rel\":\"世纪欢乐园\",\"res\":\"￥68元\",\"start\":\"5\",\"speak\":\"12\",\"adult\":\"￥68\",\"student\":\"￥41\",\"id\":\"3\"}]', null);
INSERT INTO `icons` VALUES ('洛阳', '[{\"url\":\"/static/img/1.7f5686c.png\",\"name\":\"景点门票\"},{\"url\":\"/static/img/2.8f55e7d.png\",\"name\":\"一日游\"},{\"url\":\"/static/img/3.ebc5af4.png\",\"name\":\"当地必游\"},{\"url\":\"/static/img/4.ee5091d.png\",\"name\":\"当地好玩\"},{\"url\":\"/static/img/5.4cd5250.png\",\"name\":\"动物园\"},{\"url\":\"/static/img/6.dafc525.png\",\"name\":\"泡温泉\"},{\"url\":\"/static/img/7.db8ec0c.png\",\"name\":\"名胜古迹\"},{\"url\":\"/static/img/8.3c64d38.png\",\"name\":\"野生动物园\"},{\"url\":\"/static/img/10.ff540e8.png\",\"name\":\"游乐场\"}]', '[{\"imgurl\":\"/static/img/6-1.3beeb91.jpg\",\"rel\":\"鸡冠洞\",\"res\":\"￥75元\",\"start\":\"4\",\"speak\":\"10\",\"adult\":\"￥75\",\"student\":\"￥38\",\"id\":\"1\"},{\"imgurl\":\"/static/img/6-2.ebeadae.jpg\",\"rel\":\"洛阳灵山寺\",\"res\":\"￥25.8元\",\"start\":\"5\",\"speak\":\"11\",\"adult\":\"￥25.8\",\"student\":\"￥13\",\"id\":\"2\"},{\"imgurl\":\"/static/img/6-3.c2c4290.jpg\",\"rel\":\"老君山\",\"res\":\"￥44元\",\"start\":\"5\",\"speak\":\"12\",\"adult\":\"￥44\",\"student\":\"￥22\",\"id\":\"3\"},{\"imgurl\":\"/static/img/6-4.b567561.jpg\",\"rel\":\"龙门石窟\",\"res\":\"￥100元\",\"start\":\"4\",\"speak\":\"10\",\"adult\":\"￥100\",\"student\":\"￥50\",\"id\":\"4\"}]', null);

-- ----------------------------
-- Table structure for introduce
-- ----------------------------
DROP TABLE IF EXISTS `introduce`;
CREATE TABLE `introduce` (
  `scenname` char(30) DEFAULT NULL,
  `scenpic` longtext,
  `scendata` longtext,
  `scenprief` longtext,
  `comment` longtext
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of introduce
-- ----------------------------
INSERT INTO `introduce` VALUES ('郑州园博园', '[{\"url\":\"/static/img/5-1.3fc702b.jpg\"},{\"url\":\"/static/img/5-2.42d2611.jpg\"},{\"url\":\"/static/img/5-3.f46c93c.jpg\"},{\"url\":\"/static/img/5-4.5c4ca49.jpg\"},{\"url\":\"/static/img/5-5.091c348.jpg\"},{\"url\":\"/static/img/5-6.4814bf4.jpg\"}]', '[{\"static\":\"河南省郑州市航空港实验区\",\"adult\":\"￥32.5\",\"children\":\"￥16\",\"traffic\":\"￥14.9\"}]', '[{\"time\":\"09:00～18:00开放，17:30停止入园；\",\"favourable\":\" 学生、未成年人及60周岁以上老人享受优惠票价,70周岁以上老人、残疾人、1.4米及以下儿童、军人免费入园。\",\"hint\":\"为保证取票、入园顺利，预订时请务必填写真实姓名、手机号码等信息。\",\"traffice\":\"郑州市区乘坐郑机城铁或地铁2号线到机场，然后搭车或者换乘公交前往，大约16公里。从市区内规划有3条大站快线和9条直达巴士连接市区和园博园。\"}]', '[{\"names\":\"z*0 \",\"data\":\"2018-11-02\",\"content\":\"门票兑换很方便快捷，70岁以上老人凭身份证免费入园。园内景致很好，每个园区都各有特色，值得慢慢欣赏、细细体味，园区湖面的黑天鹅很是可爱，逍遥自在完全不畏惧游人，可以近距离观赏。但是也有不方便的地方，比如各个驿站基本上只做为乘车点，超市统统关门，而且标志不明显。园区内只有一处餐饮，质量地摊水平价格却很美丽。\"},{\"names\":\"w*4\",\"data\":\"2017-10-25\",\"content\":\"很好的一次旅行，园区很大，带老人小孩要有小车，园区里每个服务点都有热水，不远都有自动售货机，支持支付宝微信支付，去哪儿支付要去北门西边停车场有个美食广场那边换票，一次估计转不玩太大了，我们转了不到一圈走了3/2走了九公里，六个小时，真的很健身！\"},{\"names\":\"i*0\",\"data\":\"2018-10-24\",\"content\":\"还不错，几个人玩的比较好，园区很大，景点也比较多，唯一美中不足就是那天天气有点热，天气凉点去最合适不过了。很不错的地方\"},{\"names\":\"l*3\",\"data\":\"2018-04-26\",\"content\":\"还不错，几个人玩的比较好，园区很大，景点也比较多，唯一美中不足就是那天天气有点热，天气凉点去最合适不过了。很不错的地方\"},{\"content\":\"EEEEEEEEEE\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"56789444\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"56789444\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"好玩\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"测试用\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"测试用\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"zhende\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"fff\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"fffiiiiii\",\"data\":\"2019-2-22\",\"names\":\"fd\"}]');
INSERT INTO `introduce` VALUES ('鸡冠洞', '[{\"url\":\"/static/img/7-1.cea0b40.jpg\"},{\"url\":\"/static/img/7-2.63885d9.jpg\"},{\"url\":\"/static/img/7-3.fc8071e.jpg\"},{\"url\":\"/static/img/7-4.6e672b7.jpg\"},{\"url\":\"/static/img/7-5.b3d74a8.jpg\"},{\"url\":\"/static/img/7-6.08ef01d.jpg\"}]', '[{\"static\":\"河南省洛阳市栾川县栾川县城西三公里处\",\"adult\":\"￥75\",\"children\":\"￥38\",\"traffic\":\"￥14.9\"}]', '[{\"time\":\"08:00～17:00开放；\",\"favourable\":\" 1.4米以下儿童免票；2、70岁以上老人免票；军官、士兵凭有效证件免票。学生凭学生证购优惠票。 \",\"hint\":\"1.游玩过程中，请注意个人安全，保护好儿童及老人，以免发生意外；2.做文明乘客，保护景区环境\",\"traffice\":\"郑州到栾川鸡冠洞自驾车路线：郑州—郑少洛高速—转洛栾快速通道—过栾川—往鸡冠洞方向\"}]', '[{\"names\":\"z*0 \",\"data\":\"2018-11-02\",\"content\":\"山不在高，地下有宝！这是第一次看到这么有特色的地下宫殿！灯光照射可以，讲解也不错，适合带着小孩一块玩耍！路面湿滑，注意安全！\"},{\"names\":\"w*4\",\"data\":\"2017-10-25\",\"content\":\"感觉一般般，必须分批跟导游走，灯过会儿就灭。不能自已看。每批大几十号人，基本听不清导游说什么。景色比桂林的银子岩、河北的白云洞逊色，没太多独特之处，但比百里峡鱼骨洞强多了。景色总体感觉也就四A水平。\"},{\"names\":\"i*0\",\"data\":\"2018-10-24\",\"content\":\"哈哈哈哈\"},{\"names\":\"l*3\",\"data\":\"2018-04-26\",\"content\":\"还不错，几个人玩的比较好，园区很大，景点也比较多，唯一美中不足就是那天天气有点热，天气凉点去最合适不过了。很不错的地方\"},{\"content\":\"EEEEEEEEEE\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"56789444\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"56789444\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"好玩\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"测试用\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"测试用\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"zhende\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"fff\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"fffiiiiii\",\"data\":\"2019-2-22\",\"names\":\"fd\"}]');
INSERT INTO `introduce` VALUES ('少林寺', '[{\"url\":\"/static/img/8-1.3a5d5cf.jpg\"},{\"url\":\"/static/img/8-2.567ac7a.jpg\"},{\"url\":\"/static/img/8-3.2422e4f.jpg\"},{\"url\":\"/static/img/8-4.1326196.jpg\"},{\"url\":\"/static/img/8-5.9634d26.jpg\"},{\"url\":\"/static/img/8-6.af1a1c0.jpg\"}]', '[{\"static\":\"河南省郑州登封市西北13公里嵩山南麓\",\"adult\":\"￥70\",\"children\":\"￥35\",\"traffic\":\"￥14.9\"}]', '[{\"time\":\"07:30～18:00开放；\",\"favourable\":\" 1、儿童1.2米以下免票，对革命伤残军人、现役军人、残疾人、70岁（含70岁）以上老年人凭有效证件免票；对革命伤残军人、现役军人、残疾人、70岁（含70岁）以上老年人、6周岁（含6周岁）以下或身高1.2米（含1.2米）以下的儿童等实行免票。 D.登封市辖区内农村十四周岁以下独生子女及其父母，凭《独生子女父母光荣证》门票全免。 E.登封市辖区内有城乡常住户口、年满60周岁的老年人凭“河南省老年人优待证”可享受免票。  \",\"hint\":\"1、忌称呼不当。对寺庙的僧人、道人应尊称为“师”或“法师”，对主持僧人应称其为“长老”、“方丈”、“禅师”。忌直称为“和尚”、“出家人”，甚至其它污辱性称呼。2、忌礼节失当。与僧人见面常见的行礼方式为双手合十，微微低头，或单手竖掌于胸前、头略低，忌用握手、拥抱、摸僧人头部等不当之礼节。3、忌谈吐不当。与僧人道人交谈，不应提及杀戮之辞、婚配之事，以及食用腥荤等话，以免引起僧人反感。最后要照看好自己的孩子，以免孩子因年幼无知而做出不礼貌的事。\",\"traffice\":\"洛阳市区到少林寺80公里，顺高速一直到登封，转G207国道去少林寺。\"}]', '[{\"names\":\"z*0 \",\"data\":\"2018-11-02\",\"content\":\"古庙，名气巨大。景区内外都有武校，许多学生在练武，庙宇内有很多古代石碑，香火很旺。河南旅行必去景点之一吧，不过跟大多数庙宇也没什么差别。\"},{\"names\":\"w*4\",\"data\":\"2017-10-25\",\"content\":\"总体好可以。行程早6:50开始，到下午16:30开始回，行程还是比较紧张，三皇寨看到书册山，感慨大地造物，时间不是很充足，可以的话两天慢慢游览好些。小苏导游介绍还是很不错的。\"},{\"names\":\"i*0\",\"data\":\"2018-10-24\",\"content\":\"哈哈哈哈\"},{\"names\":\"l*3\",\"data\":\"2018-04-26\",\"content\":\"还不错，几个人玩的比较好，园区很大，景点也比较多，唯一美中不足就是那天天气有点热，天气凉点去最合适不过了。很不错的地方\"},{\"content\":\"EEEEEEEEEE\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"56789444\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"56789444\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"好玩\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"测试用\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"测试用\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"zhende\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"fff\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"fffiiiiii\",\"data\":\"2019-2-22\",\"names\":\"fd\"}]');
INSERT INTO `introduce` VALUES ('郑州方特欢乐世界(4A)', '[{\"url\":\"/static/img/9-1.6b5d2b3.jpg\"},{\"url\":\"/static/img/9-2.5cc8c37.jpg\"},{\"url\":\"/static/img/9-3.7358154.jpg\"},{\"url\":\"/static/img/9-4.967a7ad.jpg\"},{\"url\":\"/static/img/9-5.21d8205.jpg\"},{\"url\":\"/static/img/9-6.42884dd.jpg\"}]', '[{\"static\":\"河南省郑州市中牟县郑开大道与人文路交汇口以南\",\"adult\":\"￥190\",\"children\":\"￥95\",\"traffic\":\"￥14.9\"}]', '[{\"time\":\"09:00～21:30开放；\",\"favourable\":\" 身高1.2米以下的儿童及70周岁以上的老人（凭有效身份证件）免票，免票人士须有持全价票成人陪同，每名持票成人限带1名免票人士 \",\"hint\":\"因景区预定限制，每个身份证同一入园日期同一订单最多订5张票，超过5张票请更换身份证号码再次下单。\"}]', '[{\"names\":\"z*0 \",\"data\":\"2018-11-02\",\"content\":\"周二去的，人不多，最长排队不过20分钟，入园只是工作人员扫一下验证码就好了，不用拿身份证。园区我觉得厕所建的很好，很童话，里面卖东西的特别多，自助饮料机随处可见，东西价格我觉得挺好的，一瓶冰红茶5元，远比上海迪士尼最便宜的可乐15元1瓶划算，吃的灌汤包子15元，关东煮10元3串很美味。东西价格都可以接受，吃一会玩一会儿。不足的地方是里面有些玩得项目都需要另收费，比如服装使用费什么的，很不爽，希望能向迪士尼一样，只要一张门票通玩，不用多想这个要收费，那个要收费，玩的开心点！希望改进！\"},{\"names\":\"w*4\",\"data\":\"2017-10-25\",\"content\":\"河南地区最大的游乐项目区。以恐龙，熊出没为主题，丰富的游乐项目刺激心扉。确实老了，有的项目吓得不敢说话了。风景不错人了不是太多。里面的食物价格适中。鬼屋另行收费，但确实刺激。总体来说挺不错的。\"},{\"names\":\"i*0\",\"data\":\"2018-10-24\",\"content\":\"哈哈哈哈\"},{\"names\":\"l*3\",\"data\":\"2018-04-26\",\"content\":\"还不错，几个人玩的比较好，园区很大，景点也比较多，唯一美中不足就是那天天气有点热，天气凉点去最合适不过了。很不错的地方\"},{\"content\":\"EEEEEEEEEE\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"56789444\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"56789444\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"好玩\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"测试用\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"测试用\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"zhende\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"fff\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"fffiiiiii\",\"data\":\"2019-2-22\",\"names\":\"fd\"}]');
INSERT INTO `introduce` VALUES ('世纪欢乐园', '[{\"url\":\"/static/img/11-1.97c742e.jpg\"},{\"url\":\"/static/img/11-2.7f8e764.jpg\"},{\"url\":\"/static/img/11-3.a978ada.jpg\"},{\"url\":\"/static/img/11-4.e6c59c5.jpg\"},{\"url\":\"/static/img/11-5.f6ae2d0.jpg\"},{\"url\":\"/static/img/11-6.1a4563c.jpg\"}]', '[{\"static\":\"河南省郑州市管城回族区石化路1号\",\"adult\":\"￥41.4\",\"children\":\"￥20.7\",\"traffic\":\"￥14.9\"}]', '[{\"time\":\"开放时间：09:00～22:00开放；\",\"favourable\":\" 1、身高﹤1.2米的儿童；2、≥65周岁以上老人（凭有效身份证件）；3、免票人士入园仅限参观，不能乘坐任何游乐设备，且每名免票人士须有一名购全价票的成人陪同。   \",\"hint\":\"1.假日人自然多，可以平时去，几乎不用排队，图热闹的话那就假日去。4. 项目可以玩n次，过山车、激流勇进多玩几次，很过瘾的。其中古墓丽影是分时间点的，进去后要注意时间安排，记得大概下午两点有一场，买的票要带好了~~一个项目是要验一次票的。不过提醒下，欢乐园项目是定期检查，就是说也许去的当天会关闭某些项目。\",\"traffice\":\"从东边来：  1.从郑开大道向西方向,前往223省道,22.3公里  2.继续前行,上金水路3.9公里  3.在东四环路上向左转3.2公里  ；4.在商都路向右转5.3公里  5.在中州大道向左转2.5公里  6.在石化路向右转即到  \"}]', '[{\"names\":\"z*0 \",\"data\":\"2018-11-02\",\"content\":\"夜景是非常不错的，真的太美了，美得让我陶醉，就是可以玩的娱乐项目太少了，有很多项目都要再付款，来这里鬼屋是必去的，紧张冒险又刺激，感觉太爽了。\"},{\"names\":\"w*4\",\"data\":\"2017-10-25\",\"content\":\"非常好的一次旅行，超级开心，很美的心情加上很好的景色实在令人身心愉悦，而且巨划算，游玩的人有点多，建议大家去玩\"},{\"names\":\"i*0\",\"data\":\"2018-10-24\",\"content\":\"除了天气有点热  总体还可以  票价也便宜很多  只是里面还有很多需要自费的项目  不过一般大型项目都是通票的  里面有一些项目都还蛮好玩的  坐着很舒服  但是出门没穿防晒服一定晒黑了\"},{\"content\":\"EEEEEEEEEE\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"56789444\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"56789444\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"好玩\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"测试用\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"测试用\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"zhende\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"fff\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"fffiiiiii\",\"data\":\"2019-2-22\",\"names\":\"fd\"}]');
INSERT INTO `introduce` VALUES ('黄帝宫御温泉', '[{\"url\":\"/static/img/10-1.ee747de.jpg\"},{\"url\":\"/static/img/10-2.e242bf9.jpg\"},{\"url\":\"/static/img/10-3.c41e82f.jpg\"},{\"url\":\"/static/img/10-4.5c0ae92.jpg\"},{\"url\":\"/static/img/10-5.7521d46.jpg\"},{\"url\":\"/static/img/10-6.3d4a0b1.jpg\"}]', '[{\"static\":\"河南省郑州市新密市刘寨镇黄帝宫御温泉景区\",\"adult\":\"￥136\",\"children\":\"￥68\",\"traffic\":\"￥14.9\"}]', '[{\"time\":\"开放时间：10:00-20:00\",\"favourable\":\" 仅有学生票优惠\",\"hint\":\"注意随身物品\",\"traffice\":\"郑州市区乘坐地铁到达。\"}]', '[{\"names\":\"z*0 \",\"data\":\"2018-11-02\",\"content\":\"春节期间人多，但商家准备充分，服务人员很多，安排的井然有序，服务设施齐全，服务人员热情周到，很是值得一去，去哪里订票，刷身份证直接入园，非常方便\"},{\"names\":\"w*4\",\"data\":\"2017-10-25\",\"content\":\"今天人很少，水很干净。各种温泉池都尝试了。简直是专场。美美哒！\"},{\"names\":\"i*0\",\"data\":\"2018-10-24\",\"content\":\"特别好第二次来啦。现在两园通用。票也划算，可以白天玩水晚上泡温泉。太舒服啦一天。服务人员并没有因为星期天人多。服务特别热情见我们就打招呼。哈哈。下次还来\"},{\"content\":\"EEEEEEEEEE\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"56789444\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"56789444\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"好玩\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"测试用\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"测试用\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"zhende\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"fff\",\"data\":\"2019-2-22\",\"names\":\"fd\"},{\"content\":\"fffiiiiii\",\"data\":\"2019-2-22\",\"names\":\"fd\"}]');

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `username` varchar(15) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `fav` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES ('liu', '9999', '456@qq.com', '0');
INSERT INTO `login` VALUES ('ti', '555', '123@qq.com', '0');
INSERT INTO `login` VALUES ('王思', '555', '333@qq.com', '0');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `ids` int(11) NOT NULL AUTO_INCREMENT,
  `nicks` char(10) DEFAULT NULL,
  `names` char(15) DEFAULT NULL,
  `phonenum` char(15) DEFAULT NULL,
  `dates` char(20) DEFAULT NULL,
  `nums` int(3) DEFAULT NULL,
  `prices` float DEFAULT NULL,
  `scenname` varchar(255) DEFAULT NULL,
  `ispay` char(255) DEFAULT NULL,
  `isuse` char(255) DEFAULT NULL,
  `favs` int(10) DEFAULT NULL,
  PRIMARY KEY (`ids`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('18', 'liu', '张三', '123456789', '2019-2-29', '1', '190', '郑州方特欢乐世界(4A)成人票', '否', '否', '0');
INSERT INTO `orders` VALUES ('19', 'liu', 'ff', '11111111111', '2019-2-29', '1', '32.5', '郑州园博园成人票', '是', '否', '5');
INSERT INTO `orders` VALUES ('23', 'ti', '张三', '13256897412', '2019-3-20', '1', '32.5', '郑州园博园成人票', '否', '否', '0');
INSERT INTO `orders` VALUES ('24', 'ti', '李四', '13545678912', '2019-3-21', '1', '190', '郑州方特欢乐世界(4A)成人票', '否', '否', '0');
INSERT INTO `orders` VALUES ('25', 'ti', '王五', '18956457894', '2019-3-19', '1', '41.4', '世纪欢乐园成人票', '是', '否', '0');
INSERT INTO `orders` VALUES ('26', 'ti', '天天', '17989784563', '2019-21-19', '1', '190', '郑州方特欢乐世界(4A)成人票', '是', '否', '0');
INSERT INTO `orders` VALUES ('27', '王思', '123', '13515697894', '2019-21-19', '1', '32.5', '郑州园博园成人票', '否', '否', '0');
INSERT INTO `orders` VALUES ('28', '王思', '小明', '15645678945', '2019-21-19', '1', '32.5', '郑州园博园成人票', '否', '否', '0');
