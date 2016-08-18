-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Aug 10, 2016 at 02:30 PM
-- Server version: 5.5.42
-- PHP Version: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `simple`
--

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE `people` (
  `id` int(64) NOT NULL,
  `pic` varchar(128) COLLATE utf8_bin NOT NULL,
  `containerid` varchar(128) COLLATE utf8_bin NOT NULL,
  `uid` int(64) NOT NULL,
  `text` varchar(1024) COLLATE utf8_bin NOT NULL,
  `dianzan` int(64) NOT NULL,
  `pinglun` int(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `ppeople`
--

CREATE TABLE `ppeople` (
  `id` int(64) NOT NULL,
  `pic` varchar(128) COLLATE utf8_bin NOT NULL,
  `containerid` varchar(128) COLLATE utf8_bin NOT NULL,
  `uid` int(64) NOT NULL,
  `text` varchar(1024) COLLATE utf8_bin NOT NULL,
  `dianzan` int(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `qianzai`
--

CREATE TABLE `qianzai` (
  `id` int(64) NOT NULL,
  `uid` int(255) NOT NULL,
  `containerid` varchar(128) COLLATE utf8_bin NOT NULL,
  `pname` varchar(64) COLLATE utf8_bin NOT NULL,
  `rate` int(64) NOT NULL,
  `pic` varchar(128) COLLATE utf8_bin NOT NULL,
  `dianzan` int(64) NOT NULL,
  `pinglun` int(64) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `qianzai`
--

INSERT INTO `qianzai` (`id`, `uid`, `containerid`, `pname`, `rate`, `pic`, `dianzan`, `pinglun`) VALUES
(1, 310159522, '100808a17e580841b3fac5f0cd1c9d4682a425', '郭俊辰综艺谈吻戏', 15, 'http://tva1.sinaimg.cn/crop.0.0.640.640.180/b8de9659jw8erkpq68ad3j20hs0htt9h.jpg', 341, 67),
(2, 534216066, '100808a17e580841b3fac5f0cd1c9d4682a425', '殷大大兮', 21, 'http://tva4.sinaimg.cn/crop.0.0.996.996.180/005Pxa1Hjw8f14xofzsi6j30ro0rojt3.jpg', 3, 12),
(3, 393389638, '100808a17e580841b3fac5f0cd1c9d4682a425', '我的宝辰', 2, 'http://tva2.sinaimg.cn/crop.272.5.1066.1066.180/ea7a7ebejw8esitm0tdg6j21hc0u07hn.jpg', 534, 41),
(4, 250744210, '100808a17e580841b3fac5f0cd1c9d4682a425', 'Princess_323', 4, 'http://tva1.sinaimg.cn/crop.0.0.179.179.180/957487b5gw1f686ia5xalj2050050weg.jpg', 335, 22),
(5, 544244223, '100808a17e580841b3fac5f0cd1c9d4682a425', '鱼骨头Teen', 16, 'http://tva4.sinaimg.cn/crop.0.1.510.510.180/005WjVQojw8f19p77cflnj30e60e8gm5.jpg', 67, 4),
(6, 513021354, '100808a17e580841b3fac5f0cd1c9d4682a425', '我有一个小丸子213', 32, 'http://tva2.sinaimg.cn/crop.0.0.750.750.180/005BbQTHjw8f2g7ykvxwlj30ku0ku0ts.jpg', 744, 32),
(7, 285419801, '100808a17e580841b3fac5f0cd1c9d4682a425', '杨泽宇VAE', 42, 'http://tva3.sinaimg.cn/crop.0.0.640.640.180/7d32e293jw8e8vqyw2vtrj20hs0hswfn.jpg', 343, 12),
(8, 315900228, '100808c150492e76e9e27de806902c4993b565', '人走茶凉VEB', 32, 'http://tva1.sinaimg.cn/crop.0.0.640.640.180/bc4a8ca8jw8f688g691kxj20hs0hsaav.jpg', 2132, 412),
(9, 254109163, '100808c150492e76e9e27de806902c4993b565', '哎呦喂呦d', 9, 'http://tva4.sinaimg.cn/crop.0.0.100.100.180/9775fb33jw8f687p757ufj202s02sdfn.jpg', 312, 31),
(10, 245489582, '100808c150492e76e9e27de806902c4993b565', '译淇b', 2, 'http://tva1.sinaimg.cn/crop.0.0.864.864.180/9252bcd1jw8f687neljsgj20o00o00ve.jpg', 123, 12),
(11, 267651043, '100808c150492e76e9e27de806902c4993b565', '郭明红421633f', 13, 'http://tva3.sinaimg.cn/crop.0.0.2048.2048.180/9f884ee5jw8f687mjqwwrj21kw1kwn24.jpg', 58, 76),
(12, 330810621, '100808c150492e76e9e27de806902c4993b565', '雪妮_W', 5, 'http://tva3.sinaimg.cn/crop.0.0.750.750.180/c52db1e9jw8f687knmvuij20ku0kuq3y.jpg', 80, 67),
(13, 244178304, '100808c150492e76e9e27de806902c4993b565', '傅威咏傅2_5z2', 4, 'http://tva4.sinaimg.cn/crop.0.0.180.180.180/918aa703jw8f687oyw2axj20500503yn.jpg', 73, 1),
(14, 193888633, '100808c150492e76e9e27de806902c4993b565', '我有兔子牙k', 12, 'http://tva4.sinaimg.cn/crop.0.0.524.524.180/73910ebbjw8f687pdq1hsj20ek0el0t2.jpg', 567, 31),
(15, 562045234, '100808f1f691b58296230c33ff48acf388c384', '虞书欣Esther', 78, 'http://tva2.sinaimg.cn/crop.0.0.751.751.180/0068mQp7jw8f3vk6884k0j30kv0kvmy6.jpg', 268, 21),
(16, 170207308, '100808f1f691b58296230c33ff48acf388c384', '王族亲卫队队长团总裁', 8, 'http://tva1.sinaimg.cn/crop.0.0.540.540.180/657392ffjw8eus3tivyv2j20f00f0gma.jpg', 74, 9),
(17, 128713651, '100808f1f691b58296230c33ff48acf388c384', '于青斌', 7, 'http://tva4.sinaimg.cn/crop.1.0.510.510.180/4cb82502jw8f5zewivtb2j20e80e6aaj.jpg', 21, 1),
(18, 200569005, '100808f1f691b58296230c33ff48acf388c384', '认清灬人事1985', 4, 'http://tva2.sinaimg.cn/crop.0.0.864.864.180/778c66c9jw8f687q7w594j20o00o0acd.jpg', 5, 1),
(19, 354703983, '100808f1f691b58296230c33ff48acf388c384', '1点半技能全开清漪19944_PWK', 5, 'http://tva2.sinaimg.cn/crop.0.0.960.960.180/d36b885djw8f687pr7r2uj20qo0qpq47.jpg', 221, 24),
(20, 275205309, '100808f1f691b58296230c33ff48acf388c384', '法栋艳法弹买角光q_3', 2, 'http://tva2.sinaimg.cn/crop.0.0.640.640.180/a408ff69jw8f687uzr9jsj20hs0hsgm7.jpg', 7, 1),
(21, 194767181, '100808f1f691b58296230c33ff48acf388c384', '怪兽yoosd4', 31, 'http://tva1.sinaimg.cn/crop.0.0.864.864.180/74171d09jw8f687pb679wj20o00o0gmj.jpg', 12, 5),
(22, 325000675, '1008082fc168ea5436aee16f4b3ad1d502285b', '欣喜羞花取舍整v_1966', 24, 'http://tva1.sinaimg.cn/crop.0.0.852.852.180/c1b72adfjw8f6844ggcxyj20no0npwfk.jpg', 14, 21),
(23, 204573655, '1008082fc168ea5436aee16f4b3ad1d502285b', '大大大大大大花花gmq_1967', 34, 'http://tva4.sinaimg.cn/crop.0.0.576.576.180/79ef766bjw8f688gnt4rnj20g00g00t1.jpg', 94, 31),
(24, 597046964, '1008082fc168ea5436aee16f4b3ad1d502285b', 'Aoop小丫头', 62, 'http://tva1.sinaimg.cn/crop.0.0.1536.1536.180/006w3tTtjw8f57zbhq2u3j316o16oagd.jpg', 12, 3),
(25, 567946830, '1008082fc168ea5436aee16f4b3ad1d502285b', '涵曦瘦身神器LATOJA', 31, 'http://tva4.sinaimg.cn/crop.0.0.664.664.180/006cmt9zjw8eze887smf2j30ig0igwfb.jpg', 421, 23),
(26, 566232766, '1008082fc168ea5436aee16f4b3ad1d502285b', '我是黄家驹的粉丝', 5, 'http://tva2.sinaimg.cn/crop.0.0.664.664.180/006bcy5wjw8f58ico1fwij30ig0igmy8.jpg', 31, 2),
(27, 559648391, '1008082fc168ea5436aee16f4b3ad1d502285b', '蕾爷很帅', 26, 'http://tva2.sinaimg.cn/crop.0.0.740.740.180/0066Kh7Fjw8f5tjm0et76j30kk0kl751.jpg', 214, 34),
(28, 541217728, '1008082fc168ea5436aee16f4b3ad1d502285b', '苏晨ivae', 34, 'http://tva3.sinaimg.cn/crop.0.0.996.996.180/005UgWxWjw8f5ubo30vtej30ro0rp0ui.jpg', 51, 235),
(29, 162563621, '1008084a4559d4e8c7eaea677e8141e730a3f0', '刘志摩-', 21, 'http://tva3.sinaimg.cn/crop.1.0.509.509.180/60e53d77jw8f5iv5s4cnlj20e80e5mxk.jpg', 77, 236),
(30, 262112184, '1008084a4559d4e8c7eaea677e8141e730a3f0', '不愿意透露姓名的英国绅士', 5, 'http://tva2.sinaimg.cn/crop.0.0.664.664.180/9c3b2531jw8f4or9n60ndj20ig0ig3zx.jpg', 312, 251),
(31, 188272243, '1008084a4559d4e8c7eaea677e8141e730a3f0', '爱包子的美兰', 4, 'http://tva4.sinaimg.cn/crop.0.0.180.180.180/70381081jw1e8qgp5bmzyj2050050aa8.jpg', 4, 3),
(32, 273863624, '1008084a4559d4e8c7eaea677e8141e730a3f0', '倔强的执着LJ', 17, 'http://tva3.sinaimg.cn/crop.0.0.511.511.180/a33c45d0jw8eyouf4v0kbj20e70e8aap.jpg', 6, 1),
(33, 550955789, '1008084a4559d4e8c7eaea677e8141e730a3f0', '黄毛89807', 17, 'http://tva2.sinaimg.cn/crop.0.0.132.132.180/0060RxH2jw8eqjimkdl07j303o03o742.jpg', 56, 12),
(34, 515862189, '1008084a4559d4e8c7eaea677e8141e730a3f0', '睿家小娃儿', 17, 'http://tva1.sinaimg.cn/crop.0.0.480.480.180/005D73cYjw8egvb93aayqj30dc0dcq4g.jpg', 43, 3),
(35, 393648647, '1008084a4559d4e8c7eaea677e8141e730a3f0', '巍董LMW', 77, 'http://tva4.sinaimg.cn/crop.0.0.1328.1328.180/eaa2044djw8ezle4ey6xgj210w10wjx5.jpg', 126, 78),
(36, 531041141, '10080890eb9bdfb470c6291da3d979186c56b9', 'Airman_s', 5, 'http://tva2.sinaimg.cn/crop.0.12.750.750.180/005NnWAZjw8f689rn97qkj30ku0liaaf.jpg', 21, 3),
(37, 163411844, '10080890eb9bdfb470c6291da3d979186c56b9', '南京新浪乐居', 2, 'http://tva1.sinaimg.cn/crop.0.0.180.180.180/6166ab2djw1e8qgp5bmzyj2050050aa8.jpg', 5, 9),
(38, 560191887, '10080890eb9bdfb470c6291da3d979186c56b9', '庄子衣', 16, 'http://tva3.sinaimg.cn/crop.0.0.664.664.180/0067750ejw8f4z82710zjj30ig0igq42.jpg', 23, 1),
(39, 125163066, '10080890eb9bdfb470c6291da3d979186c56b9', '森淼淼v', 17, 'http://tva4.sinaimg.cn/crop.0.0.180.180.180/4a9a5e45jw1e8qgp5bmzyj2050050aa8.jpg', 41, 21),
(40, 597045338, '10080890eb9bdfb470c6291da3d979186c56b9', '邢雨薇vivy', 11, 'http://tva1.sinaimg.cn/crop.0.0.996.996.180/006w3pFijw8f5x7f4cx45j30ro0ro40e.jpg', 23, 5),
(41, 502781517, '10080890eb9bdfb470c6291da3d979186c56b9', '木兰公馆阳阳', 42, 'http://tva4.sinaimg.cn/crop.0.0.996.996.180/005ugcp6jw8f5ib0iuzqwj30ro0rpdj5.jpg', 3, 1),
(42, 594019862, '10080890eb9bdfb470c6291da3d979186c56b9', '这里是个迷妹', 19, 'http://tva4.sinaimg.cn/crop.0.0.1006.1006.180/006u0t1ijw8f4bc4eh2hsj30ry0rztb3.jpg', 8, 5),
(43, 539459277, '100808943c0bed581e5ed9b31f8c92fea6a6f6', '娱乐扒掌柜', 63, 'http://tva4.sinaimg.cn/crop.0.0.200.200.180/005T5a0Ujw8f58ngblrtrj305k05kdg1.jpg', 2141, 68),
(44, 351646726, '100808943c0bed581e5ed9b31f8c92fea6a6f6', '爱是马毓', 11, 'http://tva3.sinaimg.cn/crop.0.0.996.996.180/d199083djw8f5zmhinem6j20ro0rpgom.jpg', 23, 1),
(45, 179683499, '100808943c0bed581e5ed9b31f8c92fea6a6f6', '吃饭睡觉打二谦-', 3, 'http://tva1.sinaimg.cn/crop.0.1.509.509.180/6b1986aejw8f5yfmsk8tuj20e50e83z4.jpg', 214, 0),
(46, 568222707, '100808943c0bed581e5ed9b31f8c92fea6a6f6', '小孩的世界没有小事', 18, 'http://tva2.sinaimg.cn/crop.0.0.996.996.180/006cy2PNjw8f5xoaj7qg3j30ro0roq4l.jpg', 239, 19),
(47, 193598636, '100808943c0bed581e5ed9b31f8c92fea6a6f6', '老黄家的小媳妇', 9, 'http://tva2.sinaimg.cn/crop.0.0.480.480.180/7364cebajw8ewx0rk1606j20dc0dcmxt.jpg', 98, 2),
(48, 553970678, '100808943c0bed581e5ed9b31f8c92fea6a6f6', 'NNNAZAKAT-', 21, 'http://tva2.sinaimg.cn/crop.0.0.1242.1242.180/0062U2Nojw8f4361kgs95j30yi0yidka.jpg', 257, 16),
(49, 399445710, '100808943c0bed581e5ed9b31f8c92fea6a6f6', '饼饼瘦到100斤就去见薛之谦', 21, 'http://tva2.sinaimg.cn/crop.3.0.1236.1236.180/ee169410jw8f63tvv0b9pj20yi0yctan.jpg', 248, 75),
(50, 291739250, '10080874902d46ec681d4996ba76144d30e88c', '栋哥哥u', 12, 'http://tva3.sinaimg.cn/crop.0.0.864.864.180/ade3e075jw8f687o9xcwdj20o00o00um.jpg', 13, 4),
(51, 306090403, '10080874902d46ec681d4996ba76144d30e88c', 'Inke521725511998', 2, 'http://tva1.sinaimg.cn/crop.0.0.864.864.180/b671b061jw8f687nsviufj20o00o0abh.jpg', 14, 2),
(52, 281360130, '10080874902d46ec681d4996ba76144d30e88c', '遗忘不了的美丽j1978', 2, 'http://tva2.sinaimg.cn/crop.0.0.180.180.180/a7b42617jw8f687p94gwtj2050050dfq.jpg', 41, 1),
(53, 249540620, '10080874902d46ec681d4996ba76144d30e88c', 'elf赤那1N2_XQY', 14, 'http://tva1.sinaimg.cn/crop.0.0.720.720.180/94bce07fjw8f687pfjforj20k00k0dgd.jpg', 31, 2),
(54, 247793906, '10080874902d46ec681d4996ba76144d30e88c', 'love虫虫宝贝z9', 4, 'http://tva3.sinaimg.cn/crop.0.0.640.640.180/93b25975jw8f687peqx2sj20hs0hs0tr.jpg', 19, 8),
(55, 259669667, '10080874902d46ec681d4996ba76144d30e88c', '笔峰181mt', 17, 'http://tva3.sinaimg.cn/crop.0.0.2048.2048.180/9ac67261jw8f687pg4n9cj21kw1kwq86.jpg', 6, 8),
(56, 179251177, '10080874902d46ec681d4996ba76144d30e88c', '嘟嘟儿1962', 21, 'http://tva4.sinaimg.cn/crop.0.0.576.576.180/6ad78f1bjw8f687pw3y16j20g00g0q3p.jpg', 6, 8),
(57, 565544722, '10080866304631c217adbe8d3705158a5977ae', 'aaGaodOng', 42, 'http://tva1.sinaimg.cn/crop.0.0.664.664.180/006aJGaIjw8f5yak5yx2jj30ig0igq41.jpg', 720, 111),
(58, 508936670, '10080866304631c217adbe8d3705158a5977ae', '我们爱听陈奕迅', 68, 'http://tva4.sinaimg.cn/crop.0.0.1242.1242.180/005yqsLLjw8f0huu791m1j30yi0yi75n.jpg', 6888, 784),
(59, 519134624, '10080866304631c217adbe8d3705158a5977ae', 'Amigas_', 30, 'http://tva3.sinaimg.cn/crop.0.0.664.664.180/005Fkmj2jw8f1pdlzex6ej30ig0igwfh.jpg', 621, 27),
(60, 229162542, '10080866304631c217adbe8d3705158a5977ae', '赵迪迪楚楚', 12, 'http://tva2.sinaimg.cn/crop.1.0.747.747.180/88976dccjw8f3gvhpy3qaj20ku0kr74i.jpg', 1818, 58),
(61, 210015067, '10080866304631c217adbe8d3705158a5977ae', 'Eason张琪', 23, 'http://tva3.sinaimg.cn/crop.0.8.496.496.180/7d2dc18fjw8f4u1tf5x65j20ds0e8mxs.jpg', 1578, 71),
(62, 206816846, '10080866304631c217adbe8d3705158a5977ae', '吹神博士', 11, 'http://tva4.sinaimg.cn/crop.0.0.640.640.180/7b45bf0fjw8f5313ysk29j20hs0hswev.jpg', 854, 25),
(63, 195597128, '10080866304631c217adbe8d3705158a5977ae', 'Vampire_pakho', 29, 'http://tva4.sinaimg.cn/crop.0.0.750.750.180/7495c0d1jw8f380eo2mzcj20ku0kudhq.jpg', 3090, 215);

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE `topic` (
  `id` int(64) NOT NULL,
  `tname` varchar(64) COLLATE utf8_bin NOT NULL,
  `pic` varchar(128) COLLATE utf8_bin NOT NULL,
  `containerid` varchar(128) COLLATE utf8_bin NOT NULL,
  `text` varchar(1024) COLLATE utf8_bin NOT NULL,
  `dianzan` int(64) NOT NULL,
  `pinglun` int(64) NOT NULL,
  `qianzai` int(64) NOT NULL,
  `mingan` int(64) NOT NULL,
  `dianzanrate` int(64) NOT NULL,
  `pinglunrate` int(64) NOT NULL,
  `qianzairate` int(64) NOT NULL,
  `minganrate` int(64) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `topic`
--

INSERT INTO `topic` (`id`, `tname`, `pic`, `containerid`, `text`, `dianzan`, `pinglun`, `qianzai`, `mingan`, `dianzanrate`, `pinglunrate`, `qianzairate`, `minganrate`) VALUES
(1, '新边城浪子', 'http://ww3.sinaimg.cn/thumb180/005I6gWsgw1eveuk0lte3j30500500sq.jpg', '100808f1f691b58296230c33ff48acf388c384', '由东方飞云出品，改编自古龙的经典同名武侠小说，香港著名导演黄祖权执导、朱一龙、张馨予、于青斌、柴碧云、张峻宁、贡米、王艺曈、杨净如、焦恩俊、邱心志等主演的武侠巨作《#新边城浪子#》将于7月18日登陆北京卫视周播剧场。', 12, 9, 2, 5, 13, 14, 2, 6),
(2, '陈奕迅727生日粗卡', 'http://ww1.sinaimg.cn/thumb180/914137f4jw1f4y3y5mrkwj20go0l6taj.jpg', '10080866304631c217adbe8d3705158a5977ae', '陈奕迅，谢谢你，谢谢你温暖的那些岁月，陈奕迅生日快乐，感谢上帝赐予我这么一个你，陈奕迅，谢谢你，岁月不止，生命不息，流年已逝，青春渐远，谢谢你一直唱着最美的时光……', 2623, 122, 12, 19, 23, 45, 12, 5),
(3, '皮卡丘真正的脑洞', 'http://ww2.sinaimg.cn/thumb180/d562324ajw1f675m7akp6j2050050aa9.jpg', '100808c150492e76e9e27de806902c4993b565', '皮卡丘的城府也变深了，你怎么看？                                                                                                                                                                                                                                                  \n                                                                                                                                     ', 23, 1, 24, 12, 1, 2, 2, 12),
(4, '没想到你是这样的张开', 'http://ww1.sinaimg.cn/thumb180/9fb33b0bgw1f67k7vj4hbj2050050wey.jpg', '10080874902d46ec681d4996ba76144d30e88c', '承诺说变就变，爱情的巨轮说沉就沉，宁愿相信前世有鬼，也不能相信董春辉的这张厚嘴。', 23, 2, 3, 2, 23, 34, 31, 14),
(5, '寻找生活咖', 'http://ww3.sinaimg.cn/thumb180/5ba3e275jw1f689u8uv9zj205005074g.jpg', '10080890eb9bdfb470c6291da3d979186c56b9', '如果关掉所有社交软件可能会生活得更棒点。想朋友了就去找她聊聊天，喝喝下午茶，然后找一个觉得相处不累的人陪着，无论以后有何改变，都不要影响自己。好好的生活。', 245, 23, 32, 3, 36, 56, 24, 3),
(6, '明星人气排行榜', 'http://ww4.sinaimg.cn/thumb180/8dc6020fgw1f66gnuamkrj2050050dg2.jpg', '1008082fc168ea5436aee16f4b3ad1d502285b', '明星人气排行榜，快来为你的偶像投票，参与话题。', 27364, 10362, 744, 39, 5, 24, 52, 21),
(7, '郭俊辰综艺谈吻戏', 'http://ww3.sinaimg.cn/thumb180/e5cb8076jw1f683uhh6iyj2050050jro.jpg', '100808a17e580841b3fac5f0cd1c9d4682a425', '95后高智商小鲜肉郭俊辰现身脱口秀节目《奶奶说》，不拒犀利提问，大胆回应“吻戏”问题。', 2314, 1222, 232, 3, 4, 3, 2, 4),
(8, '薛之谦被亲', 'http://ww2.sinaimg.cn/thumb180/74f67c55jw9f65yf7q20aj2050050t95.jpg', '100808943c0bed581e5ed9b31f8c92fea6a6f6', '薛之谦被亲，薛之谦被亲是在火星情报局的发布会上被亲的，各位谦友们是不是又喜又恼呢？', 232133, 137421, 3453, 45, 34, 56, 22, 34),
(9, '审讯室内戴头盔死亡', 'http://ww1.sinaimg.cn/thumb180/005vnhZYgw1f685zoghfhj3050050jrh.jpg', '1008084a4559d4e8c7eaea677e8141e730a3f0', '3月3日，彭明镜独自从武汉前往大理旅游，18日死亡。其父母称，遗体有多处伤。大理政法委、检察院、公安局相关工作人员称，彭因砸别人的车、电脑被警方抓获，在派出所审讯时死亡，监控显示他“头戴摩托车头盔”。', 123, 31, 254, 76, 12, 11, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(64) NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `pswd` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `pswd`) VALUES
(1, 'Bonsen', '123456');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ppeople`
--
ALTER TABLE `ppeople`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qianzai`
--
ALTER TABLE `qianzai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `people`
--
ALTER TABLE `people`
  MODIFY `id` int(64) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ppeople`
--
ALTER TABLE `ppeople`
  MODIFY `id` int(64) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `qianzai`
--
ALTER TABLE `qianzai`
  MODIFY `id` int(64) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=64;
--
-- AUTO_INCREMENT for table `topic`
--
ALTER TABLE `topic`
  MODIFY `id` int(64) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(64) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;