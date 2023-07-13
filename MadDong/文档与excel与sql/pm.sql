/*
Navicat MySQL Data Transfer

Source Server         : pm
Source Server Version : 50719
Source Host           : 47.94.255.213:3306
Source Database       : pm

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2017-11-03 17:06:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for business
-- ----------------------------
DROP TABLE IF EXISTS `business`;
CREATE TABLE `business` (
  `bus_id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_userName` varchar(50) DEFAULT NULL,
  `bus_image` varchar(100) DEFAULT NULL,
  `bus_password` varchar(50) DEFAULT NULL,
  `bus_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`bus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business
-- ----------------------------
INSERT INTO `business` VALUES ('3', '13031635498', '14f9d851-f9fd-427d-9f43-b813e97123bc', '123456', '熊猫炒饭');
INSERT INTO `business` VALUES ('4', '18865502175', 'de1ae3b2-dc9f-4e0c-9466-0313bddc64ff', '888', '良品铺子');

-- ----------------------------
-- Table structure for bus_good
-- ----------------------------
DROP TABLE IF EXISTS `bus_good`;
CREATE TABLE `bus_good` (
  `bus_good_id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_good_name` varchar(255) DEFAULT NULL,
  `bus_good_image` varchar(255) DEFAULT NULL,
  `bus_good_price` double DEFAULT NULL,
  `bus_good_content` text,
  `bus_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`bus_good_id`),
  KEY `bus_id` (`bus_id`),
  CONSTRAINT `bus_good_ibfk_1` FOREIGN KEY (`bus_id`) REFERENCES `business` (`bus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bus_good
-- ----------------------------
INSERT INTO `bus_good` VALUES ('3', '农夫山泉', 'ca0ca064-0c9a-4352-bb38-5cd946fdd422', '45', '<p>&mdash;&mdash;坚持水源地建厂，水源地生产。每一瓶农夫山泉都清晰标注水源地，确保消费者知情权。农夫山泉坚持在远离都市的深山密林中建立生产基地，全部生产过程在水源地完成。您喝的每一瓶农夫山泉，都经过了漫长的运输线路，从大自然远道而来。农夫山泉占据四大优质的天然饮用水源&mdash;&mdash;浙江千岛湖、吉林长白山、湖北丹江口、广东万绿湖。</p>\r\n\r\n<p>广告语：&ldquo;我们不生产水，我们只是大自然的搬运工。&rdquo;</p>\r\n', '3');
INSERT INTO `bus_good` VALUES ('6', '油焖大虾', '925b529d-63bb-4d5d-8ae4-5a5106c65952', '158', '<p>清代山东学者郝懿行所著《记海错》一书载，渤海&ldquo;海中有虾，长尺许，大如小儿臂，渔者网得之，两两而合，日干或腌渍，货之谓对虾。&rdquo;山东海域所产对虾占全国总产量的2/3.此菜选用正式这种大对虾，身长15至20厘米，晶莹饱满、体形硕大、头部长满虾脑，滋味最佳。</p>\r\n\r\n<p>在鲁菜中，油焖是主要以调味油和调料汁进行焖制成 菜的一种方法。焖制时加汤量比其他焖法要少, 焖制时间要短, 初步熟处理一般采用煸炒或油炸的方法。油焖要求原料鲜嫩易熟, 成菜色泽浅红油亮。</p>\r\n', '3');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(20) unsigned zerofill NOT NULL,
  `per_id` int(50) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '00000000000000000001', '00000000000000000000000000000000000000000000000001');
INSERT INTO `role_permission` VALUES ('4', '00000000000000000002', '00000000000000000000000000000000000000000000000003');
INSERT INTO `role_permission` VALUES ('8', '00000000000000000004', '00000000000000000000000000000000000000000000000004');
INSERT INTO `role_permission` VALUES ('12', '00000000000000000006', '00000000000000000000000000000000000000000000000003');
INSERT INTO `role_permission` VALUES ('22', '00000000000000000006', '00000000000000000000000000000000000000000000000001');
INSERT INTO `role_permission` VALUES ('26', '00000000000000000003', '00000000000000000000000000000000000000000000000002');
INSERT INTO `role_permission` VALUES ('29', '00000000000000000004', '00000000000000000000000000000000000000000000000003');
INSERT INTO `role_permission` VALUES ('30', '00000000000000000003', '00000000000000000000000000000000000000000000000004');

-- ----------------------------
-- Table structure for tb_about_us
-- ----------------------------
DROP TABLE IF EXISTS `tb_about_us`;
CREATE TABLE `tb_about_us` (
  `di_tel` varchar(50) DEFAULT NULL,
  `di_intro` text,
  `di_com` text,
  `about_us_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`about_us_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_about_us
-- ----------------------------

-- ----------------------------
-- Table structure for tb_activity
-- ----------------------------
DROP TABLE IF EXISTS `tb_activity`;
CREATE TABLE `tb_activity` (
  `act_id` int(11) NOT NULL AUTO_INCREMENT,
  `act_theme` varchar(50) DEFAULT NULL,
  `act_content` text,
  `comm_id` int(11) DEFAULT NULL,
  `s_time` datetime DEFAULT NULL,
  `f_time` datetime DEFAULT NULL,
  PRIMARY KEY (`act_id`),
  KEY `FK_Relationship_9` (`comm_id`),
  CONSTRAINT `FK_Relationship_9` FOREIGN KEY (`comm_id`) REFERENCES `tb_comm` (`comm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_activity
-- ----------------------------

-- ----------------------------
-- Table structure for tb_activity_participants
-- ----------------------------
DROP TABLE IF EXISTS `tb_activity_participants`;
CREATE TABLE `tb_activity_participants` (
  `pp_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `act_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`pp_id`),
  KEY `FK_Relationship_23` (`act_id`),
  KEY `FK_Relationship_24` (`user_id`),
  CONSTRAINT `FK_Relationship_23` FOREIGN KEY (`act_id`) REFERENCES `tb_activity` (`act_id`),
  CONSTRAINT `FK_Relationship_24` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_activity_participants
-- ----------------------------

-- ----------------------------
-- Table structure for tb_comm
-- ----------------------------
DROP TABLE IF EXISTS `tb_comm`;
CREATE TABLE `tb_comm` (
  `comm_id` int(11) NOT NULL AUTO_INCREMENT,
  `comm_name` varchar(30) DEFAULT NULL,
  `comm_address` varchar(50) DEFAULT NULL,
  `comm_brief` text,
  PRIMARY KEY (`comm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_comm
-- ----------------------------
INSERT INTO `tb_comm` VALUES ('1', '智慧园', '江西', '好好好');
INSERT INTO `tb_comm` VALUES ('2', '青年公寓', '武汉', '好好好');
INSERT INTO `tb_comm` VALUES ('3', '鹏翔花园', '武汉', '不好');

-- ----------------------------
-- Table structure for tb_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment` (
  `comment_id` int(255) NOT NULL AUTO_INCREMENT,
  `comment_content` text,
  `comment_time` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `help_id` int(11) DEFAULT NULL,
  `comment_dianzan` int(11) DEFAULT NULL,
  `share_id` int(11) DEFAULT NULL,
  `congress_hall_id` int(11) DEFAULT NULL,
  `act_id` int(11) DEFAULT NULL,
  `good_id` int(11) DEFAULT NULL,
  `reply_id` int(255) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `FK_Relationship_14` (`user_id`),
  KEY `FK_Relationship_16` (`help_id`),
  KEY `FK_Relationship_17` (`congress_hall_id`),
  KEY `FK_Relationship_18` (`share_id`),
  KEY `FK_Relationship_19` (`act_id`),
  KEY `FK_Relationship_20` (`good_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_comment
-- ----------------------------
INSERT INTO `tb_comment` VALUES ('2', '不错', '2017-10-31 12:06:15', '2', null, null, null, '5', null, null, null);
INSERT INTO `tb_comment` VALUES ('3', '哈哈', '2017-10-19 14:59:50', '1', null, null, null, '5', null, null, null);
INSERT INTO `tb_comment` VALUES ('4', '？？', '2017-10-31 17:41:33', '1', null, null, null, '5', null, null, null);
INSERT INTO `tb_comment` VALUES ('5', '发发发', '2017-10-31 17:50:52', '2', null, null, null, '5', null, null, null);
INSERT INTO `tb_comment` VALUES ('7', '试试', '2017-10-31 19:41:39', '2', null, null, null, '5', null, null, null);
INSERT INTO `tb_comment` VALUES ('8', '的', '2017-10-31 21:02:44', '1', null, null, null, '10', null, null, null);
INSERT INTO `tb_comment` VALUES ('9', '的', '2017-10-31 21:02:59', '1', null, null, null, '10', null, null, null);
INSERT INTO `tb_comment` VALUES ('10', '发多少', '2017-10-31 21:05:19', '1', null, null, null, '11', null, null, null);
INSERT INTO `tb_comment` VALUES ('17', '反反复复付付', '2017-11-02 09:42:28', '2', null, null, null, '17', null, null, null);
INSERT INTO `tb_comment` VALUES ('18', 'eeee', '2017-11-02 14:40:44', '1', null, null, null, '20', null, null, null);
INSERT INTO `tb_comment` VALUES ('19', '33333', '2017-11-02 17:36:34', '1', null, null, null, '11', null, null, null);
INSERT INTO `tb_comment` VALUES ('20', '大大大', '2017-11-02 17:49:55', '1', null, null, null, '12', null, null, null);
INSERT INTO `tb_comment` VALUES ('21', '啦啦啦', '2017-11-02 18:10:52', '1', null, null, null, '19', null, null, null);
INSERT INTO `tb_comment` VALUES ('22', 'ddddd', '2017-11-02 19:29:59', '1', null, null, null, '11', null, null, null);
INSERT INTO `tb_comment` VALUES ('23', 'dddd', '2017-11-02 19:30:29', '1', null, null, null, '21', null, null, null);
INSERT INTO `tb_comment` VALUES ('24', '地方的', '2017-11-02 22:32:17', '4', null, null, null, '7', null, null, null);
INSERT INTO `tb_comment` VALUES ('25', '？？？', '2017-11-03 09:30:17', '2', null, null, null, '11', null, null, null);
INSERT INTO `tb_comment` VALUES ('26', '割发代首', '2017-11-03 10:21:04', '1', null, null, null, '23', null, null, null);

-- ----------------------------
-- Table structure for tb_complain
-- ----------------------------
DROP TABLE IF EXISTS `tb_complain`;
CREATE TABLE `tb_complain` (
  `complain_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `complain_content` text,
  `complain_time` datetime DEFAULT NULL,
  `complain_fdb` text,
  `fdb_time` datetime DEFAULT NULL,
  `fdb_situation` int(11) NOT NULL DEFAULT '0',
  `handleman` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`complain_id`),
  KEY `FK_Relationship_7` (`user_id`),
  CONSTRAINT `FK_Relationship_7` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_complain
-- ----------------------------
INSERT INTO `tb_complain` VALUES ('24', '4', 'dsdsdsds', '2017-11-02 17:22:46', null, null, '0', null);
INSERT INTO `tb_complain` VALUES ('25', '1', '', '2017-11-03 10:27:18', null, null, '0', null);

-- ----------------------------
-- Table structure for tb_congpicture
-- ----------------------------
DROP TABLE IF EXISTS `tb_congpicture`;
CREATE TABLE `tb_congpicture` (
  `cong_picture_id` int(11) NOT NULL AUTO_INCREMENT,
  `cong_picture_name` varchar(255) DEFAULT NULL,
  `cong_picture_attribute` varchar(255) DEFAULT NULL,
  `congress_hall_id` int(50) DEFAULT NULL,
  PRIMARY KEY (`cong_picture_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_congpicture
-- ----------------------------
INSERT INTO `tb_congpicture` VALUES ('4', '8.png', '234e74d9-22d5-49bc-9649-23f11a343f1f', '5');
INSERT INTO `tb_congpicture` VALUES ('6', '10.jpg', '115894b0-eb34-4bb9-bca7-29f5e5c1346e', '7');
INSERT INTO `tb_congpicture` VALUES ('7', '1.jpg', 'a1f5647b-ed61-4072-b2a3-290948d5c56f', '8');
INSERT INTO `tb_congpicture` VALUES ('9', 'studio27.jpg', '6862474d-a8c9-40b5-a257-b42376816ff6', '10');
INSERT INTO `tb_congpicture` VALUES ('10', 'landscape7.jpg', '546083f6-4f8d-49bf-ab6e-8b9b0c3c6167', '11');
INSERT INTO `tb_congpicture` VALUES ('11', '5.jpg', '8f8d9b2b-bb3c-412a-809e-b507435cae02', '12');
INSERT INTO `tb_congpicture` VALUES ('12', '3.jpg', '2be5898b-00fe-4522-a177-d4d7f3777b6c', '13');
INSERT INTO `tb_congpicture` VALUES ('13', 'landscape14.jpg', '41c7b94f-97b8-41fa-8a3e-d05dbe0501af', '14');
INSERT INTO `tb_congpicture` VALUES ('14', 'baidu.png', '74c7e2ca-ae67-4330-9a93-cbcba34d468c', '15');
INSERT INTO `tb_congpicture` VALUES ('15', '8.png', 'eecc2306-1e3b-4f34-bd81-8de1db7190ed', '16');
INSERT INTO `tb_congpicture` VALUES ('16', '20.jpg', 'd4ad6509-6b3b-4d42-a567-c117d558345e', '17');
INSERT INTO `tb_congpicture` VALUES ('17', '10.jpg', '822b6b7c-8fd6-4d05-b6ca-3842d761728d', '18');
INSERT INTO `tb_congpicture` VALUES ('18', '20.jpg', '643a1f8b-89a2-465c-95b5-72ef4c7a70d8', '19');
INSERT INTO `tb_congpicture` VALUES ('19', '3.jpg', '34cc9964-cd37-448e-9fcd-23a5b1b970b2', '20');
INSERT INTO `tb_congpicture` VALUES ('20', '9.jpg', '584e740b-20e5-42eb-ac1d-53f42368f68c', '21');
INSERT INTO `tb_congpicture` VALUES ('21', '8.jpg', '1ba25d43-0e75-40a6-b478-8d2bb322578a', '22');
INSERT INTO `tb_congpicture` VALUES ('22', '596dd071N3b9f94f8.jpg', '777f4fdc-d58c-4bf3-a20f-20ce4d0a3b58', '23');

-- ----------------------------
-- Table structure for tb_congress_hall
-- ----------------------------
DROP TABLE IF EXISTS `tb_congress_hall`;
CREATE TABLE `tb_congress_hall` (
  `congress_hall_id` int(11) NOT NULL AUTO_INCREMENT,
  `congress_hall_headline` varchar(50) DEFAULT NULL,
  `congress_hall_content` text,
  `congress_hall_time` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`congress_hall_id`),
  KEY `FK_Relationship_11` (`user_id`),
  CONSTRAINT `FK_Relationship_11` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_congress_hall
-- ----------------------------
INSERT INTO `tb_congress_hall` VALUES ('5', 'ddd', 'sss', '2017-10-27 19:07:44', '1');
INSERT INTO `tb_congress_hall` VALUES ('7', '陈再辉', '据澳洲房产网10月28日报道，在澳大利亚维多利亚州的巴拉腊特，有一座历史悠久的矿工小屋，这个石头砌的小屋建于一百多年前，有着极大的开发价值，因此受到了大量买家的关注，其中，一名来自墨尔本的买家最终以32万美元（约213万人民币）买下这个小屋。', '2017-10-29 14:41:36', '1');
INSERT INTO `tb_congress_hall` VALUES ('10', '我', '是', '2017-10-29 15:15:30', '1');
INSERT INTO `tb_congress_hall` VALUES ('11', '测试添加', '海报上公布的阵容相当豪华了，除了马云，还有袁和平、洪金宝、程小东、李连杰、甄子丹、吴京、邹市明、朝青龙、托尼·贾、向佐、刘承羽等一众功夫明星，可以说汇集了功夫电影的半壁江山，影片将会在双十一旗舰上映，具体是院线还是网络尚不清楚。', '2017-10-29 15:22:59', '1');
INSERT INTO `tb_congress_hall` VALUES ('12', '飞', '飞', '2017-10-30 15:05:58', '1');
INSERT INTO `tb_congress_hall` VALUES ('14', '哈哈哈', '呵呵呵', '2017-10-30 21:14:50', '2');
INSERT INTO `tb_congress_hall` VALUES ('16', '啦啦啦啦啦啦', '哦哦哦哦哦哦哦哦哦哦', '2017-11-01 14:02:19', '1');
INSERT INTO `tb_congress_hall` VALUES ('19', '测试5', '333333', '2017-11-02 09:43:14', '2');
INSERT INTO `tb_congress_hall` VALUES ('20', '3333', '333333', '2017-11-02 14:40:31', '1');
INSERT INTO `tb_congress_hall` VALUES ('23', '456', '的点点滴滴', '2017-11-03 10:20:40', '1');

-- ----------------------------
-- Table structure for tb_feedback
-- ----------------------------
DROP TABLE IF EXISTS `tb_feedback`;
CREATE TABLE `tb_feedback` (
  `fbk_id` int(11) NOT NULL AUTO_INCREMENT,
  `fbk_content` text,
  `user_id` int(11) DEFAULT NULL,
  `fbk_time` datetime DEFAULT NULL,
  `fbk_state` varchar(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fbk_id`),
  KEY `FK_Relationship_6` (`user_id`),
  CONSTRAINT `FK_Relationship_6` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_feedback
-- ----------------------------
INSERT INTO `tb_feedback` VALUES ('2', 'sdsds', '4', '2017-11-02 17:20:36', '0');

-- ----------------------------
-- Table structure for tb_good
-- ----------------------------
DROP TABLE IF EXISTS `tb_good`;
CREATE TABLE `tb_good` (
  `sh_id` int(11) NOT NULL AUTO_INCREMENT,
  `sh_name` varchar(50) DEFAULT NULL,
  `sh_price` double DEFAULT NULL,
  `sh_content` text,
  `sh_image` varchar(200) DEFAULT '',
  `sh_image_name` varchar(200) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  PRIMARY KEY (`sh_id`),
  KEY `sh_type` (`id`),
  CONSTRAINT `tb_good_ibfk_1` FOREIGN KEY (`id`) REFERENCES `tb_good_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_good
-- ----------------------------
INSERT INTO `tb_good` VALUES ('30', '牛肉味兰花豆110g/袋', '12', '<ul>\r\n	<li>品牌：&nbsp;良品铺子</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>商品名称：良品铺子 牛肉味兰花豆110g/袋 休闲零食兰花豆坚果干果炒货</li>\r\n	<li>商品编号：1124083700</li>\r\n	<li>店铺：&nbsp;良品铺子官方旗舰店</li>\r\n	<li>商品毛重：110.00g</li>\r\n	<li>货号：6932588552081</li>\r\n	<li>资质认证：其它</li>\r\n	<li>果冻形态：其它</li>\r\n	<li>国产/进口：国产</li>\r\n	<li>包装单位：袋装</li>\r\n	<li>是否含糖：含糖</li>\r\n	<li>果冻布丁分类：其它</li>\r\n	<li>特性：其他</li>\r\n	<li>口味：其他</li>\r\n	<li>膨化食品：其它</li>\r\n	<li>包装：其它</li>\r\n	<li>分类：其它</li>\r\n	<li>豆类制品：其它</li>\r\n</ul>\r\n', '839c7065-0b65-4995-bf84-1a3d5e4d6284', 'aaa.jpg', '4');
INSERT INTO `tb_good` VALUES ('31', '香辣卤藕168g', '18', '<ul>\r\n	<li>品牌：&nbsp;良品铺子</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>商品名称：良品铺子 香辣卤藕168g休闲零食藕片素食山珍特产零食</li>\r\n	<li>商品编号：1086584827</li>\r\n	<li>店铺：&nbsp;良品铺子官方旗舰店</li>\r\n	<li>商品毛重：168.00g</li>\r\n	<li>货号：6932588516304</li>\r\n	<li>资质认证：其它</li>\r\n	<li>果冻形态：其它</li>\r\n	<li>国产/进口：国产</li>\r\n	<li>包装单位：袋装</li>\r\n	<li>是否含糖：含糖</li>\r\n	<li>果冻布丁分类：其它</li>\r\n	<li>特性：其他</li>\r\n	<li>口味：香辣味</li>\r\n	<li>膨化食品：其它</li>\r\n	<li>包装：其它</li>\r\n	<li>分类：其它</li>\r\n	<li>豆类制品：其它</li>\r\n</ul>\r\n', 'c2b476a6-0073-4c3a-acc7-6b8b7c018230', '59f6f385N4c07695a.jpg', '4');
INSERT INTO `tb_good` VALUES ('32', '农夫山泉 饮用天然水1.5L 1*12瓶 整箱', '34', '<ul>\r\n	<li>品牌：&nbsp;农夫山泉</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>商品名称：农夫山泉饮用水</li>\r\n	<li>商品编号：848855</li>\r\n	<li>商品毛重：19.2kg</li>\r\n	<li>商品产地：浙江千岛湖 、吉林长白山、湖北丹江口、广东万绿湖、新疆玛纳斯</li>\r\n	<li>单件容量：1-2L</li>\r\n	<li>包装件数：7-12</li>\r\n	<li>包装：独立包装</li>\r\n	<li>使用场景：生活用水</li>\r\n	<li>分类：饮用水</li>\r\n	<li>进口/国产：国产</li>\r\n	<li>包装单位：箱装</li>\r\n</ul>\r\n', '75211d63-50e6-447a-ad3b-dead8d4f73c0', '59c8a347Nb6925f1a.jpg', '1');
INSERT INTO `tb_good` VALUES ('33', '海尔（Haier） 海尔指纹锁家用防盗门密码锁', '1799', '<ul>\r\n	<li>品牌：&nbsp;海尔（Haier）</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>商品名称：海尔（Haier） 海尔指纹锁家用防盗门密码锁智能锁电子门锁芯 左右开HL-30PF3 红古铜+免费安装+全国联保</li>\r\n	<li>商品编号：11117090994</li>\r\n	<li>店铺：&nbsp;海尔家装旗舰店</li>\r\n	<li>商品毛重：5.0kg</li>\r\n	<li>货号：HL-30PF3</li>\r\n	<li>开门方向：通用型</li>\r\n	<li>风格：简约现代</li>\r\n	<li>开锁方式：指纹，密码，钥匙</li>\r\n</ul>\r\n', '90fdca4c-1184-4543-aa94-13fd1034ab4e', '595dfefdN62db91ff.jpg', '2');
INSERT INTO `tb_good` VALUES ('34', '牛栏山 大二锅头 46度 500ml*12瓶 整箱装 （绿瓶）', '79', '<ul>\r\n	<li>品牌：&nbsp;牛栏山</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>商品名称：牛栏山白酒</li>\r\n	<li>商品编号：1129068</li>\r\n	<li>商品毛重：10.61kg</li>\r\n	<li>商品产地：北京或河北</li>\r\n	<li>香型：清香</li>\r\n	<li>包装：整箱</li>\r\n	<li>容量：375mL-500mL</li>\r\n	<li>度数：40-49度</li>\r\n	<li><img alt=\"\" src=\"/pm/show/0d3add0d-b125-4aee-afaa-00a5f3411738\" style=\"height:800px; width:800px\" /></li>\r\n</ul>\r\n', 'bb284350-cbc2-4bbc-804e-4d559ce73e9c', '596dd071N3b9f94f8.jpg', '3');
INSERT INTO `tb_good` VALUES ('35', '黄鹤楼', '18', '<p>湖北人的烟</p>\r\n', '0c491e32-503c-4d17-9f41-696f320047a7', '58452803N94a5a693.jpg', '3');
INSERT INTO `tb_good` VALUES ('36', '111', '111', '<p>11111</p>\r\n', '23ccb165-76e9-4c0f-bb5d-f32d6055fb10', '595dfefdN62db91ff.jpg', '2');

-- ----------------------------
-- Table structure for tb_good_type
-- ----------------------------
DROP TABLE IF EXISTS `tb_good_type`;
CREATE TABLE `tb_good_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_good_type
-- ----------------------------
INSERT INTO `tb_good_type` VALUES ('1', '饮用水');
INSERT INTO `tb_good_type` VALUES ('2', '电子锁');
INSERT INTO `tb_good_type` VALUES ('3', '烟酒');
INSERT INTO `tb_good_type` VALUES ('4', '零食');

-- ----------------------------
-- Table structure for tb_help
-- ----------------------------
DROP TABLE IF EXISTS `tb_help`;
CREATE TABLE `tb_help` (
  `help_id` int(11) NOT NULL AUTO_INCREMENT,
  `help_headline` varchar(50) DEFAULT NULL,
  `help_content` text,
  `help_time` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`help_id`),
  KEY `FK_Relationship_12` (`user_id`),
  CONSTRAINT `FK_Relationship_12` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_help
-- ----------------------------
INSERT INTO `tb_help` VALUES ('5', '动漫：火影忍者TV版2002', '简介：十多年前一只拥有巨大威力的妖兽“九尾妖狐”袭击了木叶忍者村，当时的第四代火影拼尽全力，以自己的生命为代价将“九尾妖狐”封印在了刚出生的鸣人身上。木叶村终于恢复了平静，但村民们却把鸣人当成像“九尾妖狐”那样的怪物看待，所有人都疏远他。 鸣人自小就孤苦无依，一晃十多年过去了，少年鸣人考入了木叶村的忍者学校，结识了好朋友佐助和小樱。佐助是宇智波家族的传人之一，当他还是小孩的时候他的哥哥——一个已经拥有高超忍术的忍者将他们家族的人都杀死了，然后投靠了一直想将木叶村毁灭的大蛇丸，佐助自小就发誓要超越哥哥，为家族报仇。 鸣人他们在忍者学校得到了教官卡卡西的精心指点，在他的帮助下去迎接成长中的一次又一次挑战！', '2017-10-28 14:14:44', '1');
INSERT INTO `tb_help` VALUES ('6', '海贼王TV版1999', '简介：有个男人他拥有世界上一切财富、名望和权势，他就是「海盗王」高路德•罗杰。在临死前说过这样一句话：让全世界的人都奔向大海「想要我的财宝吗？想要的话全就拿去吧……！你们去找吧！我把世界上的一切都放在那里了」。后来世界上的人们将这个宝藏称作“一个大秘宝”（One Piece），许多人为了争夺大秘宝One Piece，无数海盗扬起旗帜，互相斗争，后来就形成了「大海盗时代」。主角蒙奇•D•路飞在遥远的路途上找寻着志同道合的伙伴，携手共进「伟大航线」，目标当上「海盗王」。航海王是一个依着彼此坚毅的友情最终获得胜利，大伙一起朝着梦想扬帆努力的冒险故事。', '2017-10-30 11:53:29', '2');
INSERT INTO `tb_help` VALUES ('7', '死神', '简介：拥有超能力的日本高中生，因为一次偶然的机会在街头遇到了一个正在执行神秘任务的少女。在一系列的机缘巧合之下，同时也是为了维护人类和神界的和平，两位少年和他们的伙伴们踏上了漫长的征程。', '2017-10-30 12:15:18', '1');

-- ----------------------------
-- Table structure for tb_helppicture
-- ----------------------------
DROP TABLE IF EXISTS `tb_helppicture`;
CREATE TABLE `tb_helppicture` (
  `help_picture_id` int(11) NOT NULL AUTO_INCREMENT,
  `help_picture_name` varchar(255) DEFAULT NULL,
  `help_picture_attribute` varchar(255) DEFAULT NULL,
  `help_id` int(50) DEFAULT NULL,
  PRIMARY KEY (`help_picture_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_helppicture
-- ----------------------------
INSERT INTO `tb_helppicture` VALUES ('4', '04cb9a08543760d85fc61754edb18b42.jpg', '5c05e3ab-ccbc-467e-8882-df7aea7442c0', '5');
INSERT INTO `tb_helppicture` VALUES ('5', 'hai.jpg', 'f0065292-e349-45fe-84a3-bd4191589aec', '6');
INSERT INTO `tb_helppicture` VALUES ('6', 'si.jpg', '40b57558-4934-472c-ab73-76714a8cae43', '7');

-- ----------------------------
-- Table structure for tb_home
-- ----------------------------
DROP TABLE IF EXISTS `tb_home`;
CREATE TABLE `tb_home` (
  `home_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_id` int(11) DEFAULT NULL,
  `home_name` varchar(20) DEFAULT '',
  PRIMARY KEY (`home_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_home
-- ----------------------------
INSERT INTO `tb_home` VALUES ('1', '1', '4-20');
INSERT INTO `tb_home` VALUES ('2', '1', '4-21');
INSERT INTO `tb_home` VALUES ('3', '1', '4-22');
INSERT INTO `tb_home` VALUES ('4', '1', '1-01');
INSERT INTO `tb_home` VALUES ('5', '1', '1-02');
INSERT INTO `tb_home` VALUES ('6', '2', '1-02');
INSERT INTO `tb_home` VALUES ('7', '2', '1-03');
INSERT INTO `tb_home` VALUES ('8', '3', '1-04');
INSERT INTO `tb_home` VALUES ('9', '4', '1-05');
INSERT INTO `tb_home` VALUES ('10', '4', '1-06');

-- ----------------------------
-- Table structure for tb_hot_good
-- ----------------------------
DROP TABLE IF EXISTS `tb_hot_good`;
CREATE TABLE `tb_hot_good` (
  `hot_good_id` int(11) NOT NULL AUTO_INCREMENT,
  `hot_good_name` varchar(50) DEFAULT NULL,
  `hot_good_price` double DEFAULT NULL,
  `hot_good_content` text,
  `hot_good_image` varchar(200) DEFAULT NULL,
  `hot_good_image_name` varchar(200) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  PRIMARY KEY (`hot_good_id`),
  KEY `id` (`id`),
  CONSTRAINT `tb_hot_good_ibfk_1` FOREIGN KEY (`id`) REFERENCES `tb_good_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_hot_good
-- ----------------------------
INSERT INTO `tb_hot_good` VALUES ('1', '康平饮用水16.8升', '10', '', '839c7065-0b65-4995-bf84-1a3d5e4d6284', null, null);
INSERT INTO `tb_hot_good` VALUES ('2', '一品水源山泉水16.6升', '12', null, 'c2b476a6-0073-4c3a-acc7-6b8b7c018230', null, null);
INSERT INTO `tb_hot_good` VALUES ('3', '亚太天能T5指纹锁', '3880', null, '75211d63-50e6-447a-ad3b-dead8d4f73c0', null, null);

-- ----------------------------
-- Table structure for tb_pay
-- ----------------------------
DROP TABLE IF EXISTS `tb_pay`;
CREATE TABLE `tb_pay` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_id` int(11) NOT NULL,
  `pay_ele_time` date DEFAULT NULL,
  `pay_ele_count` int(11) DEFAULT NULL,
  `pay_water_time` date DEFAULT NULL,
  `pay_water_count` int(11) DEFAULT NULL,
  `pay_gas_time` date DEFAULT NULL,
  `pay_gas_count` int(11) DEFAULT NULL,
  `pay_user_id` int(11) DEFAULT NULL,
  `pay_wuye` int(11) DEFAULT NULL,
  `pay_wuye_time` date DEFAULT NULL,
  PRIMARY KEY (`pay_id`),
  KEY `FK_Relationship_22` (`user_id`),
  CONSTRAINT `FK_Relationship_22` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_pay
-- ----------------------------

-- ----------------------------
-- Table structure for tb_permission
-- ----------------------------
DROP TABLE IF EXISTS `tb_permission`;
CREATE TABLE `tb_permission` (
  `per_id` int(11) NOT NULL AUTO_INCREMENT,
  `per_name` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`per_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_permission
-- ----------------------------
INSERT INTO `tb_permission` VALUES ('1', 'list');
INSERT INTO `tb_permission` VALUES ('2', 'read');
INSERT INTO `tb_permission` VALUES ('3', 'update');

-- ----------------------------
-- Table structure for tb_picture
-- ----------------------------
DROP TABLE IF EXISTS `tb_picture`;
CREATE TABLE `tb_picture` (
  `picture_id` int(11) NOT NULL AUTO_INCREMENT,
  `picture_img` varchar(255) DEFAULT NULL,
  `picture_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`picture_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_picture
-- ----------------------------
INSERT INTO `tb_picture` VALUES ('16', 'f104f066-0a1a-4a58-9ca8-99b0a56867cc', 'wood.jpg');
INSERT INTO `tb_picture` VALUES ('17', '5a7bab9c-6af8-49ec-9afb-220d79e3de97', '05.jpg');
INSERT INTO `tb_picture` VALUES ('18', '308ca57d-5dd8-4eb9-a7ba-22e59a5983e3', '05.jpg');
INSERT INTO `tb_picture` VALUES ('19', 'a5973f67-e40d-49c8-9f0c-9523efcc6744', '01.jpg');
INSERT INTO `tb_picture` VALUES ('20', 'd21b41cc-b270-4da2-8a2d-7cfb3595e324', '01.jpg');
INSERT INTO `tb_picture` VALUES ('21', '6a4205dc-ee30-4718-b317-30f1956e2d8f', '01.jpg');
INSERT INTO `tb_picture` VALUES ('22', 'bfd97162-c1e5-4a42-89fb-b823fe6bf3cf', '01.jpg');
INSERT INTO `tb_picture` VALUES ('23', '0e6733c9-1b0a-4ab0-a948-5e53ed22372f', '02.jpg');
INSERT INTO `tb_picture` VALUES ('24', 'e5e48a20-8bfb-4568-a520-60fe890c0977', '02.jpg');
INSERT INTO `tb_picture` VALUES ('25', '436f37b8-5ff0-4122-8c49-2514f1a0ef53', '02.jpg');
INSERT INTO `tb_picture` VALUES ('26', '4c80e495-5922-46e2-9f06-3425124dffe4', '02.jpg');
INSERT INTO `tb_picture` VALUES ('27', 'cf04569e-5aba-4a46-b0c6-c5255796cf4f', '02.jpg');
INSERT INTO `tb_picture` VALUES ('28', 'abe32476-5250-49d8-87b0-d8dc9d3bf77e', '02.jpg');
INSERT INTO `tb_picture` VALUES ('29', 'd3bdfdb2-eb8a-4622-a95e-0e65bca07645', '02.jpg');
INSERT INTO `tb_picture` VALUES ('30', 'b6b09ff8-b5ae-4028-9682-837ccd67df60', '02.jpg');
INSERT INTO `tb_picture` VALUES ('31', '543971c7-1ca6-41e3-9c35-eb20e5cf2435', '02.jpg');
INSERT INTO `tb_picture` VALUES ('32', '1d68cdab-d82a-4def-843f-aad037819131', '02.jpg');
INSERT INTO `tb_picture` VALUES ('33', '4eb13e64-b9d7-4549-9175-cfb627127fc5', '02.jpg');
INSERT INTO `tb_picture` VALUES ('34', '8cc01e80-1529-4954-84c4-8ccbd20c627d', '02.jpg');
INSERT INTO `tb_picture` VALUES ('35', '4c389042-4b1b-476b-97eb-4a6929d8b87e', '02.jpg');
INSERT INTO `tb_picture` VALUES ('36', '823d3640-a6d5-4a8d-932f-11ed21c2e062', '02.jpg');
INSERT INTO `tb_picture` VALUES ('37', '5cb9a867-c4ac-428d-a8d1-6a8d586bfe8e', '02.jpg');
INSERT INTO `tb_picture` VALUES ('38', '94ba663d-0841-46c4-b54b-92628c2e6a34', '02.jpg');
INSERT INTO `tb_picture` VALUES ('39', 'bdb5760e-89be-4255-96d2-a9c52e82520c', '02.jpg');
INSERT INTO `tb_picture` VALUES ('40', 'ec28aa63-116d-4976-97dc-38eb8117ed0f', '02.jpg');
INSERT INTO `tb_picture` VALUES ('41', 'd83b0ccf-35d2-4bd6-9fc0-af61bd1002ab', '02.jpg');
INSERT INTO `tb_picture` VALUES ('42', 'fcb4e0e4-a687-4ec8-af66-891516104ab9', '01.jpg');
INSERT INTO `tb_picture` VALUES ('43', '476222dd-6097-4b88-9efd-c8c2ad3c3b5e', '02.jpg');
INSERT INTO `tb_picture` VALUES ('44', '0624961c-7426-434c-b2ce-b0ae8d80c16a', '03.jpg');
INSERT INTO `tb_picture` VALUES ('45', '07aaebfd-4b4a-4103-9805-771ef02c50d5', '04.jpg');
INSERT INTO `tb_picture` VALUES ('46', 'e9463af1-7638-4cfb-9cf0-7cf6f63a7384', '01.jpg');
INSERT INTO `tb_picture` VALUES ('47', '8c3ff611-9a1a-4aa5-a135-f6d68fdd1ead', '01.jpg');
INSERT INTO `tb_picture` VALUES ('48', '461a5ab1-193c-4c61-929b-7f8477660024', '01.jpg');
INSERT INTO `tb_picture` VALUES ('49', '6485b4b6-c17a-4835-a639-3ca781161e21', '01.jpg');
INSERT INTO `tb_picture` VALUES ('50', '86aed0fa-3343-4232-89bb-bff199ab88cd', '01.jpg');
INSERT INTO `tb_picture` VALUES ('51', '3ed04717-ad85-4c28-b886-cdcb209d714d', '01.jpg');
INSERT INTO `tb_picture` VALUES ('52', 'a939d804-f28d-4a40-8a9e-8532d3a37dd5', '01.jpg');
INSERT INTO `tb_picture` VALUES ('53', 'bd24df7b-7c50-4d2e-a2d7-92d93d155585', '01.jpg');
INSERT INTO `tb_picture` VALUES ('54', '7bdd3d45-4418-4914-9045-d17f5b82b80c', '01.jpg');
INSERT INTO `tb_picture` VALUES ('55', 'cbc30e56-eb13-404b-845d-8e63fc4deb46', '01.jpg');
INSERT INTO `tb_picture` VALUES ('56', '3fc5dae8-78cf-46fe-92c9-489826e0329b', '01.jpg');
INSERT INTO `tb_picture` VALUES ('57', '27cfe07b-a67e-4aeb-a0a5-473e504f42bb', '01.jpg');
INSERT INTO `tb_picture` VALUES ('58', '893f877b-9fb4-4720-9f54-167557485f11', '01.jpg');
INSERT INTO `tb_picture` VALUES ('59', '2c6df884-f6e6-4f35-a950-3f63481c36af', '01.jpg');
INSERT INTO `tb_picture` VALUES ('60', '30997a5d-3d05-4615-89b7-11b79a17bbee', '02.jpg');
INSERT INTO `tb_picture` VALUES ('61', '87d14d69-0a32-4d1e-ab72-28e0e26fd14f', '03.jpg');
INSERT INTO `tb_picture` VALUES ('62', 'd236ba62-c9c5-48cf-826a-b03265a1571e', '01.jpg');
INSERT INTO `tb_picture` VALUES ('63', '4e0167f5-fd2f-4633-b456-1bb662c4b95c', '01.jpg');
INSERT INTO `tb_picture` VALUES ('64', '578ea22b-4126-401c-a577-b67957698d0b', '01.jpg');
INSERT INTO `tb_picture` VALUES ('65', 'ac2a6c6e-af11-46e9-9d0e-2812ae8faa52', '02.jpg');
INSERT INTO `tb_picture` VALUES ('66', '13fc409c-db53-405d-90f1-1dadc4517856', '03.jpg');
INSERT INTO `tb_picture` VALUES ('67', '103c1825-54ca-46da-a34a-fedab66a5a3d', '02.jpg');
INSERT INTO `tb_picture` VALUES ('68', 'd1d8e872-1325-4b58-af2c-361d83d01871', '03.jpg');
INSERT INTO `tb_picture` VALUES ('69', '3d4c4ad4-43b2-48b2-93af-d5d79880a6ac', '59c8a347Nb6925f1a.jpg');
INSERT INTO `tb_picture` VALUES ('70', 'a2efb1dd-308a-48b0-89f2-5a77cea96424', '59f6f385N4c07695a.jpg');

-- ----------------------------
-- Table structure for tb_property_picture
-- ----------------------------
DROP TABLE IF EXISTS `tb_property_picture`;
CREATE TABLE `tb_property_picture` (
  `pp_id` int(11) NOT NULL AUTO_INCREMENT,
  `rep_id` int(11) DEFAULT NULL,
  `picture_id` int(11) DEFAULT NULL,
  `complain_id` int(11) DEFAULT NULL,
  `water_id` int(11) DEFAULT NULL,
  `fbk_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`pp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_property_picture
-- ----------------------------
INSERT INTO `tb_property_picture` VALUES ('4', '33', '16', null, null, null);
INSERT INTO `tb_property_picture` VALUES ('5', '34', '17', null, null, null);
INSERT INTO `tb_property_picture` VALUES ('6', '35', '18', null, null, null);
INSERT INTO `tb_property_picture` VALUES ('7', '36', '19', null, null, null);
INSERT INTO `tb_property_picture` VALUES ('8', '37', '20', null, null, null);
INSERT INTO `tb_property_picture` VALUES ('9', null, '22', '2', null, null);
INSERT INTO `tb_property_picture` VALUES ('10', null, '23', '3', null, null);
INSERT INTO `tb_property_picture` VALUES ('11', null, '24', '4', null, null);
INSERT INTO `tb_property_picture` VALUES ('12', null, '25', '5', null, null);
INSERT INTO `tb_property_picture` VALUES ('13', null, '26', '6', null, null);
INSERT INTO `tb_property_picture` VALUES ('14', null, '27', '7', null, null);
INSERT INTO `tb_property_picture` VALUES ('15', null, '28', '8', null, null);
INSERT INTO `tb_property_picture` VALUES ('16', null, '29', '9', null, null);
INSERT INTO `tb_property_picture` VALUES ('17', null, '30', '10', null, null);
INSERT INTO `tb_property_picture` VALUES ('18', null, '31', '11', null, null);
INSERT INTO `tb_property_picture` VALUES ('19', null, '32', '12', null, null);
INSERT INTO `tb_property_picture` VALUES ('20', null, '33', '13', null, null);
INSERT INTO `tb_property_picture` VALUES ('21', null, '34', '14', null, null);
INSERT INTO `tb_property_picture` VALUES ('22', null, '35', '15', null, null);
INSERT INTO `tb_property_picture` VALUES ('23', null, '36', '16', null, null);
INSERT INTO `tb_property_picture` VALUES ('24', null, '37', '17', null, null);
INSERT INTO `tb_property_picture` VALUES ('25', null, '38', '18', null, null);
INSERT INTO `tb_property_picture` VALUES ('26', null, '39', '19', null, null);
INSERT INTO `tb_property_picture` VALUES ('27', null, '40', '20', null, null);
INSERT INTO `tb_property_picture` VALUES ('28', null, '41', '21', null, null);
INSERT INTO `tb_property_picture` VALUES ('29', '38', '42', null, null, null);
INSERT INTO `tb_property_picture` VALUES ('30', '38', '43', null, null, null);
INSERT INTO `tb_property_picture` VALUES ('31', '38', '44', null, null, null);
INSERT INTO `tb_property_picture` VALUES ('32', '38', '45', null, null, null);
INSERT INTO `tb_property_picture` VALUES ('33', '39', '46', null, null, null);
INSERT INTO `tb_property_picture` VALUES ('34', '40', '47', null, null, null);
INSERT INTO `tb_property_picture` VALUES ('35', '41', '48', null, null, null);
INSERT INTO `tb_property_picture` VALUES ('36', '42', '49', null, null, null);
INSERT INTO `tb_property_picture` VALUES ('37', '43', '50', null, null, null);
INSERT INTO `tb_property_picture` VALUES ('38', '44', '51', null, null, null);
INSERT INTO `tb_property_picture` VALUES ('39', '45', '52', null, null, null);
INSERT INTO `tb_property_picture` VALUES ('40', '46', '53', null, null, null);
INSERT INTO `tb_property_picture` VALUES ('41', '47', '54', null, null, null);
INSERT INTO `tb_property_picture` VALUES ('42', '48', '55', null, null, null);
INSERT INTO `tb_property_picture` VALUES ('43', '49', '56', null, null, null);
INSERT INTO `tb_property_picture` VALUES ('44', '50', '57', null, null, null);
INSERT INTO `tb_property_picture` VALUES ('45', '51', '58', null, null, null);
INSERT INTO `tb_property_picture` VALUES ('46', null, '59', null, null, null);
INSERT INTO `tb_property_picture` VALUES ('47', null, '60', null, null, null);
INSERT INTO `tb_property_picture` VALUES ('48', null, '61', null, null, null);
INSERT INTO `tb_property_picture` VALUES ('49', null, '62', '22', null, null);
INSERT INTO `tb_property_picture` VALUES ('50', null, '63', '23', null, null);
INSERT INTO `tb_property_picture` VALUES ('51', null, '64', null, null, '2');
INSERT INTO `tb_property_picture` VALUES ('52', null, '65', null, null, '2');
INSERT INTO `tb_property_picture` VALUES ('53', null, '66', null, null, '2');
INSERT INTO `tb_property_picture` VALUES ('54', null, '67', '24', null, null);
INSERT INTO `tb_property_picture` VALUES ('55', null, '68', '24', null, null);
INSERT INTO `tb_property_picture` VALUES ('56', null, '69', '25', null, null);
INSERT INTO `tb_property_picture` VALUES ('57', null, '70', '25', null, null);

-- ----------------------------
-- Table structure for tb_rent_sale
-- ----------------------------
DROP TABLE IF EXISTS `tb_rent_sale`;
CREATE TABLE `tb_rent_sale` (
  `rs_id` int(11) NOT NULL AUTO_INCREMENT,
  `service` varchar(600) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`rs_id`),
  KEY `FK_Relationship_25` (`user_id`),
  CONSTRAINT `FK_Relationship_25` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_rent_sale
-- ----------------------------

-- ----------------------------
-- Table structure for tb_repairs
-- ----------------------------
DROP TABLE IF EXISTS `tb_repairs`;
CREATE TABLE `tb_repairs` (
  `rep_id` int(11) NOT NULL AUTO_INCREMENT,
  `rep_content` text,
  `user_id` int(11) DEFAULT NULL,
  `rep_man` varchar(20) DEFAULT NULL,
  `rep_createtime` datetime DEFAULT NULL,
  `rep_time` datetime DEFAULT NULL,
  `rep_finish_time` datetime DEFAULT NULL,
  `handle_situation` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rep_id`),
  KEY `FK_Relationship_5` (`user_id`),
  CONSTRAINT `FK_Relationship_5` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_repairs
-- ----------------------------
INSERT INTO `tb_repairs` VALUES ('49', 'dssads', null, null, '2017-11-02 12:44:11', '2017-11-03 00:00:00', null, '0');
INSERT INTO `tb_repairs` VALUES ('50', 'dssads', null, null, '2017-11-02 12:44:13', '2017-11-03 00:00:00', null, '0');
INSERT INTO `tb_repairs` VALUES ('51', 'dssads', null, null, '2017-11-02 12:44:16', '2017-11-03 00:00:00', null, '0');

-- ----------------------------
-- Table structure for tb_reply
-- ----------------------------
DROP TABLE IF EXISTS `tb_reply`;
CREATE TABLE `tb_reply` (
  `reply_id` int(11) NOT NULL AUTO_INCREMENT,
  `reply_content` text,
  `reply_time` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `reply_dianzan` int(11) DEFAULT NULL,
  `comment_id` int(255) DEFAULT NULL,
  PRIMARY KEY (`reply_id`),
  KEY `FK_Relationship_13` (`comment_id`),
  KEY `FK_Relationship_15` (`user_id`),
  CONSTRAINT `FK_Relationship_15` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_reply
-- ----------------------------
INSERT INTO `tb_reply` VALUES ('1', '呵呵哒', '2017-11-01 11:47:20', '2', null, '2');
INSERT INTO `tb_reply` VALUES ('2', '看看', '2017-11-01 14:16:48', '1', null, '12');
INSERT INTO `tb_reply` VALUES ('3', '嗯嗯呃', '2017-11-01 16:23:29', '2', null, '3');
INSERT INTO `tb_reply` VALUES ('13', 'aaaaa', '2017-11-01 23:31:24', '1', null, '9');
INSERT INTO `tb_reply` VALUES ('18', '555', '2017-11-02 18:09:59', '1', null, '8');
INSERT INTO `tb_reply` VALUES ('19', '哦哦哦', '2017-11-02 18:11:00', '1', null, '21');
INSERT INTO `tb_reply` VALUES ('20', '嘿嘿', '2017-11-02 18:13:57', '2', null, '9');
INSERT INTO `tb_reply` VALUES ('21', '66666', '2017-11-02 19:30:38', '1', null, '23');
INSERT INTO `tb_reply` VALUES ('22', '12316', '2017-11-02 19:44:11', '1', null, '20');
INSERT INTO `tb_reply` VALUES ('23', '666', '2017-11-02 22:22:58', '1', null, '8');
INSERT INTO `tb_reply` VALUES ('24', '444', '2017-11-03 09:29:57', '2', null, '10');
INSERT INTO `tb_reply` VALUES ('25', '非得的', '2017-11-03 10:21:33', '1', null, '26');
INSERT INTO `tb_reply` VALUES ('26', '他', '2017-11-03 10:24:17', '1', null, '18');
INSERT INTO `tb_reply` VALUES ('27', '666', '2017-11-03 10:25:02', '4', null, '8');

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES ('1', '家属');
INSERT INTO `tb_role` VALUES ('2', '家主');
INSERT INTO `tb_role` VALUES ('3', '管理员');
INSERT INTO `tb_role` VALUES ('4', '超级管理员');
INSERT INTO `tb_role` VALUES ('6', 'kokokok');

-- ----------------------------
-- Table structure for tb_sendwater
-- ----------------------------
DROP TABLE IF EXISTS `tb_sendwater`;
CREATE TABLE `tb_sendwater` (
  `user_id` int(11) DEFAULT NULL,
  `water_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_time` date DEFAULT NULL,
  `order_count` int(11) DEFAULT NULL,
  `order_band` varchar(50) DEFAULT NULL,
  `order_barrel` int(10) DEFAULT NULL,
  PRIMARY KEY (`water_id`),
  KEY `FK_Relationship_21` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_sendwater
-- ----------------------------
INSERT INTO `tb_sendwater` VALUES (null, '8', null, '1', '三元', '0');

-- ----------------------------
-- Table structure for tb_share
-- ----------------------------
DROP TABLE IF EXISTS `tb_share`;
CREATE TABLE `tb_share` (
  `share_id` int(11) NOT NULL AUTO_INCREMENT,
  `share_content` text,
  `share_time` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `share_headline` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`share_id`),
  KEY `FK_Relationship_8` (`user_id`),
  CONSTRAINT `FK_Relationship_8` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_share
-- ----------------------------
INSERT INTO `tb_share` VALUES ('16', 'lala', '2017-10-27 15:19:32', '1', 'haha');
INSERT INTO `tb_share` VALUES ('17', '试试看', '2017-10-30 10:30:49', '1', '测试');
INSERT INTO `tb_share` VALUES ('18', '三生三世', '2017-10-30 15:12:48', '2', '大大大');
INSERT INTO `tb_share` VALUES ('20', '方法是打发', '2017-10-30 20:08:47', '1', '范德萨');
INSERT INTO `tb_share` VALUES ('21', '飞飞儿飞飞', '2017-10-30 20:09:51', '1', '非得');
INSERT INTO `tb_share` VALUES ('22', '辅导费大沙发上', '2017-10-30 20:15:49', '2', '范德萨额');
INSERT INTO `tb_share` VALUES ('23', '957', '2017-10-30 20:23:48', '2', '456');

-- ----------------------------
-- Table structure for tb_sharepicture
-- ----------------------------
DROP TABLE IF EXISTS `tb_sharepicture`;
CREATE TABLE `tb_sharepicture` (
  `share_picture_id` int(11) NOT NULL AUTO_INCREMENT,
  `share_picture_name` varchar(130) DEFAULT NULL,
  `share_picture_attribute` varchar(255) DEFAULT NULL,
  `share_id` int(11) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`share_picture_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_sharepicture
-- ----------------------------
INSERT INTO `tb_sharepicture` VALUES ('11', 'wang.png', '1a4b2de0-3e8f-468b-a025-013042e14b81', '00000000016');
INSERT INTO `tb_sharepicture` VALUES ('12', 'mm9.jpg', '716cf7d2-8fc6-4cff-b60b-a53b42dfeee7', '00000000017');
INSERT INTO `tb_sharepicture` VALUES ('13', '3.jpg', '37649c7e-5ce9-4c9d-9214-47705829765d', '00000000018');
INSERT INTO `tb_sharepicture` VALUES ('14', '8.jpg', 'bc070b9f-420d-4a14-9dff-a96cc06a6f29', '00000000019');
INSERT INTO `tb_sharepicture` VALUES ('15', '5.jpg', 'eb11ca8c-a7c7-4475-9ceb-c50a7b607e69', '00000000020');
INSERT INTO `tb_sharepicture` VALUES ('16', 'landscape15.jpg', '8eeb64b0-f7ba-472e-bc51-0abc8cd68282', '00000000021');
INSERT INTO `tb_sharepicture` VALUES ('17', 'mm9.jpg', '30a51f6c-ee17-43d6-a3ce-ae46bb8380d7', '00000000022');
INSERT INTO `tb_sharepicture` VALUES ('18', 'landscape17.jpg', '460e97bc-da83-4baf-8a67-52ec2bdb3c67', '00000000023');

-- ----------------------------
-- Table structure for tb_shoppingcart
-- ----------------------------
DROP TABLE IF EXISTS `tb_shoppingcart`;
CREATE TABLE `tb_shoppingcart` (
  `ca_id` int(11) NOT NULL AUTO_INCREMENT,
  `ca_name` varchar(50) DEFAULT NULL,
  `ca_image` varchar(200) DEFAULT NULL,
  `ca_time` varchar(100) DEFAULT NULL,
  `ca_count` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ca_ordername` varchar(100) DEFAULT NULL,
  `ca_price` double DEFAULT NULL,
  PRIMARY KEY (`ca_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_shoppingcart
-- ----------------------------

-- ----------------------------
-- Table structure for tb_unit
-- ----------------------------
DROP TABLE IF EXISTS `tb_unit`;
CREATE TABLE `tb_unit` (
  `unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(20) DEFAULT '',
  `comm_id` int(10) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_unit
-- ----------------------------
INSERT INTO `tb_unit` VALUES ('1', '1单元', '0000000001');
INSERT INTO `tb_unit` VALUES ('2', '2单元', '0000000001');
INSERT INTO `tb_unit` VALUES ('3', '3单元', '0000000001');
INSERT INTO `tb_unit` VALUES ('4', '4单元', '0000000001');
INSERT INTO `tb_unit` VALUES ('5', '1单元', '0000000002');
INSERT INTO `tb_unit` VALUES ('6', '2单元', '0000000002');
INSERT INTO `tb_unit` VALUES ('7', '3单元', '0000000003');
INSERT INTO `tb_unit` VALUES ('8', '1单元', '0000000003');

-- ----------------------------
-- Table structure for tb_used_market
-- ----------------------------
DROP TABLE IF EXISTS `tb_used_market`;
CREATE TABLE `tb_used_market` (
  `good_id` int(11) NOT NULL AUTO_INCREMENT,
  `good_name` varchar(20) DEFAULT NULL,
  `good_detail` text,
  `good_price` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comm_address` varchar(40) DEFAULT NULL,
  `publish_time` datetime DEFAULT NULL,
  PRIMARY KEY (`good_id`),
  KEY `FK_Relationship_10` (`user_id`),
  CONSTRAINT `FK_Relationship_10` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_used_market
-- ----------------------------

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_truename` varchar(30) DEFAULT NULL,
  `user_password` varchar(50) DEFAULT NULL,
  `user_nickname` varchar(30) DEFAULT NULL,
  `user_phone` varchar(30) DEFAULT NULL,
  `user_email` varchar(30) DEFAULT NULL,
  `user_sex` varchar(2) DEFAULT NULL,
  `comm_id` int(11) DEFAULT NULL,
  `home_id` int(11) DEFAULT NULL,
  `role_id` int(10) unsigned zerofill DEFAULT NULL,
  `unit_id` int(10) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `FK_Relationship_2` (`comm_id`),
  KEY `FK_Relationship_3` (`home_id`),
  CONSTRAINT `FK_Relationship_2` FOREIGN KEY (`comm_id`) REFERENCES `tb_comm` (`comm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', '王诗文', '123456', '小王2', '13264895158', '978313318@qq.com', '男', '1', '1', '0000000001', '0000000001');
INSERT INTO `tb_user` VALUES ('2', '陈靖东2', '888888', '小陈2', '18014786587', '666666620@qq.com', '男', '1', '6', '0000000001', '0000000002');
INSERT INTO `tb_user` VALUES ('4', '田卓军', '456456', 'gay田', '13018027324', '115625823@qq.com', '男', '1', '8', '0000000001', '0000000003');
INSERT INTO `tb_user` VALUES ('9', null, '123456', null, '13317151721', null, null, null, null, null, null);
INSERT INTO `tb_user` VALUES ('10', 'rtwert', '123456', 'wertwert', '18071976684', 'wertwertwe', '男', null, null, '0000000003', null);

-- ----------------------------
-- Table structure for tb_visitor
-- ----------------------------
DROP TABLE IF EXISTS `tb_visitor`;
CREATE TABLE `tb_visitor` (
  `visitor_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `visitor_name` varchar(20) DEFAULT NULL,
  `visitor_sex` varchar(2) DEFAULT NULL,
  `code_name` varchar(60) DEFAULT NULL,
  `comm_id` int(11) NOT NULL,
  `code_createtime` date NOT NULL,
  PRIMARY KEY (`visitor_id`),
  KEY `FK_Relationship_4` (`user_id`),
  CONSTRAINT `FK_Relationship_4` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_visitor
-- ----------------------------
INSERT INTO `tb_visitor` VALUES ('1', '1', null, null, null, '0', '2017-10-26');
INSERT INTO `tb_visitor` VALUES ('2', '1', null, null, null, '0', '2017-10-26');
INSERT INTO `tb_visitor` VALUES ('3', '1', null, null, null, '0', '2017-10-26');
INSERT INTO `tb_visitor` VALUES ('4', '1', 'asdfasdf', '男', 'a1fdc8a2-e563-4b67-a58a-de8b75de6965', '0', '2017-10-26');
INSERT INTO `tb_visitor` VALUES ('5', '1', 'agsdgasdga', '男', '1895ee00-e422-4af5-b583-82a000337b48', '0', '2017-10-26');
INSERT INTO `tb_visitor` VALUES ('6', '1', '老铁', '男', '3d816cc4-8279-446d-858b-5134da88de8c', '0', '2017-10-26');
INSERT INTO `tb_visitor` VALUES ('7', '1', '哈哈', '女', 'f1c2e358-102c-41a4-b9b0-5359b6a6bc60', '0', '2017-10-27');
