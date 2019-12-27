-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: doanwebck
-- ------------------------------------------------------
-- Server version	5.7.22-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `idSach` int(11) NOT NULL AUTO_INCREMENT,
  `ngayNhapHang` date DEFAULT NULL,
  `luotMua` int(11) DEFAULT NULL,
  `luotXem` int(11) DEFAULT NULL,
  `idNhaSX` int(11) DEFAULT NULL,
  `hinhAnh` varchar(100) DEFAULT NULL,
  `moTa` varchar(500) DEFAULT NULL,
  `idLoai` int(11) DEFAULT NULL,
  `giaBan` int(11) DEFAULT NULL,
  `ten_sach` varchar(200) DEFAULT NULL,
  `tac_gia` varchar(100) DEFAULT NULL,
  `soLuong` int(11) DEFAULT NULL,
  PRIMARY KEY (`idSach`),
  KEY `L_idx` (`idLoai`),
  KEY `NSX_idx` (`idNhaSX`),
  CONSTRAINT `L` FOREIGN KEY (`idLoai`) REFERENCES `loai` (`idLoai`),
  CONSTRAINT `NSX` FOREIGN KEY (`idNhaSX`) REFERENCES `nhasx` (`idNhaSX`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (3,'2018-04-04',667,134,3,'img/book/neu_toi_biet_duoc_khi_con_20.jpg','Đôi khi cứ để cuộc đời quẳng gạch vào đầu bạn',1,64000,'Nếu tôi biết được khi còn 20','Tina Seelig',523),(4,'2018-02-13',767677,4436,1,'img/book/nhumuadongroixuong-200x280.jpg','có thể sẽ biến mất mãi mãi. Hoặc nếu chúng có ngủ quên cũng sẽ chỉ được đánh thức bằng một điều gợi nhớ.',2,71000,'Như Mùa Đông Rơi Xuống','Fuyu',230),(5,'2017-02-23',53454,333,2,'img/book/lac_loi_giua_co_don_1-200x280.jpg','Cuốn sách này được viết trong những đêm dài… một mình…mất ngủ và đầy khói thuốc.',3,68000,'Lạc Lối Giữa Cô Đơn','Minh Nhật',232),(6,'2017-12-23',443,46657,3,'img/book/Truoc_khi_chet_phai_biet_yeu_la_gi-200x280.jpg','Tiểu thuyết \"Trước khi chết phải biết tình yêu là gì\" của tác giả Nguyễn À Nguyễn là sự băn khoăn về tình yêu của cuộc đời Khải. ',4,85500,'Trước Khi Chết Phải Biết Tình Yêu Là Gì','Nguyễn À Nguyễn',321),(7,'2017-10-23',344,656,4,'img/book/yeunguoingongnui-200x280.jpg','Vẫn dễ dàng nhận ra một giọng văn tinh tế, đậm chất Nam bộ',5,40500,'Yêu Người Ngóng Núi (Tản Văn – Tái Bản 2014)','Nguyễn Ngọc Tư',22),(8,'2017-06-23',6656,3332,5,'img/book/airoicungkhac-200x280.gif','Ai rồi cũng khác với những thông điệp sống ý nghĩa là hành trình trải nghiệm của hai tác giả trẻ.',6,62000,'Ai Rồi Cũng Khác','Hamlet Trương - Iris Cao',553),(9,'2017-11-01',44453,32332,6,'img/book/gao-nuoc-mam-rau-muong-200x280.jpg','Những câu chuyện bên lề, những liên tưởng độc đáo, những ca dao, tục ngữ được được đặt đúng chỗ trong các diễn giải, không những giúp làm rõ hơn ý hướng của người viết mà còn đem lại cho ý hướng ấy sự thấm thía, thuần nhã, gần gặn',7,90000,'Gạo, Nước Mắm, Rau Muống… Câu Chuyện Ẩm Thực Việt','Hoàng Trọng Dũng',665),(10,'2016-04-24',6665,33344,1,'img/book/du-con-song-the-nao-me-cung-luon-ung-ho-200x280.jpg','Đều đặn vào mỗi thứ Ba, Uy Nyung, cô bé đang bâng khuâng trước bậc thềm thanh xuân lại nhận được một lá thư.',8,61000,'Dù Con Sống Thế Nào, Mẹ Cũng Luôn Ủng Hộ','Gong Ji Young',34),(11,'2017-07-24',3453,34555,2,'img/book/thucdaytrenmainha-200x280.gif','Có  một thế giới nhỏ, buồn như mảnh diều chao nghiêng trên nền trời xanh nhạt trong một chiều ít gió.',9,59500,'Thức Dậy Trên Mái Nhà','Minh Mẫn',231),(12,'2018-01-12',34665,5899,3,'img/book/benkiadoi-200x280.jpg','\"Bên kia đồi\" là cuốn tiểu thuyết của tác giả Võ Mỹ Linh kể về cuộc đời bi đát của nhân vật Nụ với những lời độc thoại nội tâm đầy xót xa.',10,53000,'Bên Kia Đồi','Võ Mỹ Linh',332),(13,'2018-03-11',4689,965756,4,'img/book/taoxanh-200x280.gif','\"Thật khó để một người con trai yêu một người con trai khác phải không?\" - Câu nói trích từ một truyện ngắn trong tuyển tập đã hiển hiện trong tâm trí tôi mãi khi đọc các tác phẩm ngắn này.',1,76500,'Táo Xanh – Hãy Để Anh Thương Em','Nhiều tác giả',342),(14,'2018-05-30',90086,3470,5,'img/book/quatredechet-200x280.gif','Quá trẻ để chết: Hành trình nước Mỹ là hành trình đơn độc của tác giả - một cô gái Việt trẻ đi xuyên nước Mỹ từ Bờ Đông sang bờ Tây.',2,58500,'Quá Trẻ Để Chết: Hành Trình Nước Mỹ','Đinh Hằng',53),(15,'2018-06-01',13424,2134,6,'img/book/bamuonnuoiconbangsuame-200x280.gif','Cuốn tự truyện “Ba muốn nuôi con bằng sữa mẹ” của Trình Tuấn có thể lay động hàng triệu trái tim vì sự chân thực, cảm động và khả năng truyền cảm hứng của nó...',3,61000,'Ba Muốn Nuôi Con Bằng Sữa Mẹ','Trình Tuấn',764),(16,'2018-06-15',7674337,355,1,'img/book/bao-200x280.gif','TÁC PHẨM “BÃO” CỦA JEAN-MARIE GUSTAVE LE CLÉZIO',4,63000,'Bão','Le Clezio',215),(17,'2018-03-23',6442,4565,2,'img/book/chuyen_iphone_va_ga_chanh-200x280.jpg','Một câu chuyện xoay quanh “Bộ tứ cá ngựa” tại Đà Lạt. iPhone - cô gái xinh đẹp \"cuồng\" Apple. Gã Chảnh 49 bảnh trai, giàu có và thích chơi ngông. Người phụ nữ bình thường tuổi băm - Tóc Tém. Và cô chị Thuốc Lá dạn dày sương gió.',5,57500,'Chuyện Iphone Và Gã Chảnh Mang Mật Danh 49','Thu Dương',5654),(18,'2018-01-12',907677,3437,3,'img/book/vuan-200x280.gif','Franz Kafka  là một nhà văn lỗi lạc gốc Do Thái, người đã đi tiên phong và tạo nên sự “đột biến ” trong văn xuôi đầu thế kỷ XX',6,61000,'Vụ Án','Franz Kafka',33),(19,'2018-05-12',2345,665559,4,'img/book/nhungnuhondienanh-200x280.gif','Những Nụ Hôn Điện Ảnh (Éric Fottorino, Nhã Nam phát hành)....',7,52000,'Những Nụ Hôn Điện Ảnh','Eric Fottorino',325),(20,'2018-01-30',5455453,347,5,'img/book/tinhyeukhongphailatatca-200x280.gif','Đó là câu hỏi không xa lạ gì với tất cả chúng ta, và có lẽ cũng không hề dễ trả lời. Nhưng với cuốn sách nhỏ này, chắc chắn bạn sẽ có lời đáp cho riêng mình.',8,67500,'Tình Yêu Không Phải Là Tất Cả','Nhiều tác giả',87),(21,'2017-12-05',3444346,241,6,'img/book/nhungconchimanminhchochet-200x280.gif','“Những con chim ẩn mình chờ chết” là câu chuyện mang tính chất sử thi của một gia đình thuộc dòng họ Cleary suốt chiều dài thời gian hơn nữa thế kỷ trên đất Úc châu từ năm 1915 đến 1969.',9,130500,'Những Con Chim Ẩn Mình Chờ Chết','Colleen Mccullough',875),(22,'2016-12-04',8776,23344,1,'img/book/taybuongtaytimthoinho-200x280.gif','Cuốn sách Tay buông tay và tim thôi nhớ đã thể hiện tất cả những lần ly biệt dù có mang theo tình yêu hay nỗi thù hận, cũng đều là một sự chia cắt đau khổ.',10,80000,'Tay Buông Tay Và Tim Thôi Nhớ','Trương Tiểu Nhàn',456),(23,'2017-09-13',65464,343,2,'img/book/gianaocungyeu-200x280.gif','Tiểu thuyết Giá nào cũng yêu lấy bối cảnh xã hội phong kiến thế kỷ 19. Cách kể lôi cuốn và con mắt miêu tả tinh tế của nữ nhà văn 51 tuổi khiến người đọc chìm vào nội dung có tiết tấu vừa hồi hộp, vừa dí dỏm, nồng nàn.',1,82500,'Giá Nào Cũng Yêu','Lisa Kleypas',656),(24,'2017-08-23',656,343,3,'img/book/chientranhgiuacacthegioi-200x280.gif','Được xuất bản lần đầu tiên vào năm 1898, “Chiến tranh giữa các thế giới” (tên gốc: “War of the Worlds”) là một lời dự báo u buồn cho tương lai của nhân loại.',2,55500,'Chiến Tranh Giữa Các Thế Giới','H. G. Wells',765),(25,'2017-02-01',7676,535,4,'img/book/hoatuylipden-200x280.gif','Nội dung sách xoay quanh câu chuyện tình cảm xảy ra ở thành phố La Haye, Hà Lan cuối thế kỷ XVII. Cornélius van Baerle giàu có có một niềm đam mê bất tận với hoa tulip.',3,49500,'Hoa Tuylip Đen','Alexander Dumas',557),(26,'2018-05-02',454545,2343,5,'img/book/cuongphong-200x280.gif','Phản ánh chân thực lịch sử cuối thế kỷ 20 nhiều biến cố của đất nước, cuốn tiểu thuyết của Nguyễn Phan Hách vừa được tái bản đầu tháng 4.',4,115000,'Cuồng Phong (Tái Bản 2015)','Nguyễn Phan Hách',765),(27,'2018-03-24',43243432,435,6,'img/book/ngayayviaimadoithay-200x280.gif','Em không thể. Vì ngay từ lần đầu tiên yêu anh, trái tim em đã yêu anh quá nhiều. Nhiều đến nỗi không thể cảm nhận được nữa. Làm sao, có thể yêu anh lần thứ hai?',5,68000,'Ngày Ây Vì Ai Mà Đổi Thay','Cẩm Thương',675),(28,'2017-09-23',4343,32321,1,'img/book/lacnhaugiuanganha-200x280.gif','“Câu chuyện giữa Bạch Dương và Song Tử - có cái nóng sực đến bỏng tay của cung Lửa, có cái mát lạnh đi cùng những ngọn gió mùa đông của cung Khí.\"',6,63000,'Lạc Nhau Giữa Ngân Hà','Nhóm bút Lovedia',453),(29,'2018-05-23',6565,43246,2,'img/book/chungtaodocontinhyeuthikhong-200x280.gif','“Chúng ta ở đó, còn tình yêu thì không” là chuỗi những ngày tôi thấy mình giống hệt như nhiều cô gái khác. ',7,54000,'Chúng Ta Ở Đó, Còn Tình Yêu Thì Không','Hạc Xanh',575),(30,'2018-02-22',686,766688,3,'img/book/dunghonohoian-200x280.gif',' Mượn câu thơ của Chế Lan Viên, Đinh Lê Vũ dặn người đọc như vậy. Lời dặn nghe có vẻ riêng tư đến kỳ cục. Đến Hội An có đủ thứ, đâu chỉ phải để hôn? Hôn ở đâu mà chẳng được?',8,67500,'Đừng Hôn Ở Hội An','Đinh Lê Vũ',56),(31,'2018-05-02',435,11221,4,'img/book/Bia-sach-Tieng-Viet-123-200x280.jpg','Hiện nay trên thị trường có nhiều sách dạy tiếng Việt cho người nước ngoài, giáo trình phục vụ việc dạy – học tiếng Việt cho người nước ngoài. Nhìn chung, các tài liệu này đều đáp ứng được mong muốn của người nước ngoài ở các trình độ khác nhau. ',9,273000,'Tiếng Việt 123 (Tiếng Việt Dành Cho Người Nước Ngoài)','Tập Thể Giáo Viên 123Vietnamese',54),(32,'2018-03-11',645,2132,5,'img/book/Bia-sach_Tieng-Viet-cho-nguoi-Nhat-200x280.jpg','Trên thị trường ở cả Hà Nội và TP. Hồ Chí Minh hiện nay không có nhiều tài liệu, giáo trình học Tiếng Việt viết riêng cho người Nhật. Hiểu được điều đó, trung tâm 123VIETNAMESE đã rất nỗ lực để cho ra mắt cuốn giáo trình 123ベトナム語 này. ',10,245500,'Tiếng Việt 123 (Tiếng Việt Dành Cho Người Nhật)','Tập Thể Giáo Viên 123Vietnamese',5465),(33,'2017-09-23',75763,32,6,'img/book/Bìa-sách-bài-tập-200x280.jpg','Sách Bài Tập Tiếng Việt 123 (Tiếng Việt Dành Cho Người Nước Ngoài). Ngoài) là sách học Tiếng Việt dành cho người nước ngoài.. Ngoài) gồm 16 bài học:. ',1,126000,'Sách Bài Tập Tiếng Việt 123','Tập Thể Giáo Viên 123Vietnamese',768),(34,'2016-08-13',342,232,1,'img/book/Bia-sach_Tieng-Viet-cho-nguoi-Han-200x280.jpg','Hàn Quốc (501) Tiếng Triều Tiên (66) Giảng Dạy (7) Người Việt (5)',2,245000,'Tiếng Việt 123 (Tiếng Việt Dành Cho Người Hàn Quốc)','Tập Thể Giáo Viên 123Vietnamese',5),(35,'2018-03-17',432432,42,2,'img/book/IMG_0841-200x280.jpg','Cách Học Ngoại Ngữ Nhanh Và Không Bao Giờ Quên. Fluent Forever là cách dạy bất cứ ngoại ngữ nào bạn muốn một cách nhanh nhất, hiệu quả nhất. ',3,98000,'Fluent forever – Cách học ngoại ngữ nhanh và không bao giờ quên','Gabriel Wyner',4),(36,'2017-12-23',54546,434456,3,'img/book/img166_14-200x280.jpg','Một cuốn sách thú vị đưa ra một cách',4,56000,'Chiến Lược IELTS 7.0','Võ Trung Kiên',65),(37,'2017-01-30',765,56,4,'img/book/danba30-200x280.gif','Những năm tháng phải lòng, yêu đương, cuồng nhiệt đã trôi qua sau lưng lúc nào không nhận ra. Đàn bà ba mươi có hai cuộc sống. Một là gia đình, một là khao khát.',5,71000,'Đàn Bà 30 (Tái Bản 2015)','Trang Hạ',4),(38,'2018-06-24',654,54,5,'img/book/tinh-nhan-khong-bao-gio-cuoi-200x280.jpg','Tình nhân không bao giờ đòi cưới là cuốn sách mới nhất của Trang Hạ về tình yêu và sự chờ đợi tình yêu trong vô vọng. Trong cô đơn, chúng ta vẫn không ngừng bị giày vò bởi những khao khát tìm kiếm và mong ước mình được thuộc về một ai đó. ',6,59500,'Tình Nhân Không Bao Giờ Đòi Cưới','Trang Hạ',6),(39,'2017-07-07',45,43,6,'img/book/chipheovafacebook-200x280.gif','Ruộng dưa chuột nhà tôi năm nay được mùa, quả nào quả nấy đều dài, to, cong, đầu nhẵn mọng, cấu nhẹ phát là nhựa trắng chảy ra rin rỉn. Thế nhưng đành vứt ngoài ruộng cho mấy con bò cái nó ngậm, chả thèm thu hoạch',7,64500,'Chí Phèo Và Facebook','Võ Tòng Đánh Mèo',8),(40,'2017-05-11',43,32,1,'img/book/macnhien-200x280.gif','\"Mặc Nhiên\" là cuốn sách của tác giả Elvis Nguyễn viết về nỗi trống trải, cô đơn và tâm tình u uẩn của con người, dù yêu hay không yêu.',8,52000,'Mặc Nhiên','Elvis Nguyễn',4),(41,'2018-03-22',6,32,2,'img/book/dat-toi-ve-phia-mat-troi-200x280.jpg','Cuốn sách thấm đẫm hương vị của Đà Lạt – những rừng thông rực lên trong nắng sớm, mặt hồ óng ả như dát vàng, pha lẫn cả trong đó chút hương vị của những ngày mưa ủ ê của một chớm xuân Hà Nội…',9,58500,'Dắt Tôi Về Phía Mặt Trời','Ploy - Mèo Mốc',66),(42,'2018-06-29',87,54,3,'img/book/ivanhoe-200x280.jpg','Ivanhoe là một cuốn tiểu thuyết hư cấu lịch sử của nhà văn Walter Scott xuất bản vào năm 1820, cốt chuyện được xây dựng lấy bối cảnh của nước Anh thế kỷ 12.',10,96000,'Ivanhoe','Walter Scott',43),(43,'2017-05-30',87698,76,4,'img/book/doinaykhongdoithay-200x280.jpg','Anh vốn là kẻ ngông cuồng tự đại, khi còn nhỏ vì bị bức ép mà phải dồn cô bạn thanh mai trúc mã của mình vào biển lửa, từ đó về sau anh hao tâm tổn sức làm biết bao chuyện nhằm bù đắp cho cô, ngày cầu hôn cũng là ngày cô quay lưng phản bội anh. Tình nghĩa nhiều năm hóa ra cũng chỉ là lời nói dối.',1,54000,'Đời Này Không Đổi Thay',' Huyền Mặc',5),(44,'2018-01-28',45,87,5,'img/book/hkda_tran_nhan_tong-200x280.gif','Cuốn sách có 3 phần: Thời đại nhà Trần và Vua Trần, Nhân Tông; Vua Trần Nhân Tông – Anh hùng dân tộc trong sự nghiệp xây dựng và bảo vệ Tổ quốc; Di sản tư tưởng và văn hóa của thời đại nhà Trần của Vua Trần Nhân Tông.',2,78000,'Trần Nhân Tông','TS Nguyễn Quốc Tuấn',12),(45,'2018-02-12',3,5,6,'img/book/hoc-vien-quai-vat-200x280.jpeg','Cuốn sách thuộc bộ sách Disney đặc biệt dành cho «big fan» của những nàng công chúa Disney, những Quái nhí và anh hùng, bạn bè đồ chơi đại gia đình Disney.',3,123000,'Học Viện Quái Vật','Disney.',13),(46,'2017-06-11',323,43,1,'img/book/Huyen_Tran_cong_chua-200x280.gif','Việc nàng thuận theo ý phụ vương là thái thượng hoàng Trần Nhân Tông về làm phi của vua Chế Mân nước Chiêm Thành đã góp phần thắt chặt tình bang giao giữa hai nước',4,76000,'Huyền Trân Công Chúa','Trần Khắc Chung',34),(47,'2017-09-30',434,43,2,'img/book/p14.jpg','Tuổi Trẻ là cơ quan ngôn luận của Đoàn Thanh niên cộng sản Hồ Chí Minh Thành phố Hồ Chí Minh và đã phát triển thành một tổ hợp truyền thông đa phương tiện, gồm các ấn bản: nhật báo Tuổi Trẻ, tuần báo Tuổi Trẻ Cuối Tuần, bán nguyệt san Tuổi Trẻ Cười, báo điện tử Tuổi Trẻ Online và báo điện tử tiếng Anh Tuoi Tre News.',5,29000,'Báo Tuổi Trẻ','Báo Tuổi Trẻ',54),(48,'2017-02-11',54,43,3,'img/book/p13.jpg','Người Lao động là nhật báo thuộc Liên đoàn Lao động Thành phố Hồ Chí Minh, được thành lập ngày 25 tháng 7 năm 1975. Ngoài nhật báo, Người Lao động còn có phụ trương Thế giới @ chuyên về công nghệ thông tin phát hành Thứ Năm hàng tuần. Tuy nhiên phụ trương Thế giới @ đã bị ngưng xuất bản từ ngày 25 tháng 7 năm 2015. Hiện tại báo Người Lao Động hoạt động theo mô hình toà soạn hội tụ. Cùng lúc thực hiện thể loại báo in, truyền hình và điện tử.',6,98000,'Báo Người Lao Động','Báo Người Lao Động',6),(49,'2017-04-25',65,32,4,'img/book/mongmongchucho-200x280.gif','Mong Mong tuy chỉ là một chú cún thôi',7,78000,'Mong Mong Chú Cún Ham Đọc Sách','Choi Eun-Ok',7),(50,'2018-02-11',455,43,5,'img/book/taybuongtaytimthoinho-200x280.gif','Cuốn sách Tay buông tay và tim thôi nhớ đã thể hiện tất cả những lần ly biệt dù có mang theo tình yêu hay nỗi thù hận, cũng đều là một sự chia cắt đau khổ.',8,56000,'TAY BUÔNG TAY VÀ TIM THÔI NHỚ','Trương Tiểu Nhàn',4354),(51,'2018-02-15',5454,4324,6,'img/book/p11.jpg','Các doanh nhân xuất hiện trên các phương tiện truyền thông đều là những con người đã thành đạt trong sự nghiệp của mình, điều này tạo ra một hiệu ứng tâm lý rằng: cứ được gọi là doanh nhân có nghĩa là người đó là người có nhiều tiền.',6,34000,'Nữ Doanh Nhân','Báo Phụ Nữ',4545),(52,'2017-09-23',434,546,1,'img/book/p15.jpg','Hành trang du lịch của phái đẹp trong mùa hè sẽ gọn gàng và thêm đa dạng với những gợi ý thời trang sau đây.',7,23000,'Phong Cách Mới Của Phái Đẹp','Báo Phụ Nữ',654),(53,'2017-07-23',768,876,2,'img/book/p16.png','Bốn Chàng Trai Cùng Nhau Đi Du Lịch. Mashima – một anh chàng thật thà và thụ động.. Shigeta – một nhà nghiên cứu thường thường bậc trung, đã có một đời vợ.. Nakasugi – một anh chàng luôn bị cô bạn gái kiểm soát, có ưu điểm là dễ gây thiện cảm cho người đối diện.. Và Saiki – một anh chàng cực kì đẹp trai nhưng tính khí lạ đời.',7,34000,'Bốn Chàng Trai Cùng Nhau Đi Du Lịch','Hải Đăng',765546),(54,'2017-09-12',657,645,3,'img/book/p1.jpg','Margaret Thatcher là nhân vật chính trị quyền lực nhất Vương quốc Anh vào cuối thế kỷ 20. Khó có vị thủ tướng nào trong thời hiện đại tìm cách thay đổi đất nước và vị thế của nó trên trường quốc tế một cách triệt để như bà từng làm',6,56000,'Hồi Ký Bà Đầm Thép','Maraget',455),(55,'2017-10-12',878,655,4,'img/book/img135.u2487.d20160919.t113013.40163.jpg','Không phải ngẫu nhiên mà Hàn Quốc được gọi là “trung tâm thời trang của Châu Á”. Chỉ cần nhìn Seoul Fashion Week thu hút giới mộ điệu cũng đủ nói lên địa vị của xứ sở kim chi trên bản đồ làng mốt thế giới. Thậm chí có thể nói bất kì phong cách đường phố nào cũng có thể nhanh chóng trở thành trào lưu rầm rộ nhất ở Seoul.',7,12000,'Catalogue Thời Trang Hàn Quốc - Nice (Tập 2)','Nhà Thiết Kế',54),(56,'2017-12-21',5454,5675,5,'img/book/bd0d9fa9ed5805bb53906849516a158c.jpg','Đây là dịp để các cơ quan quản lý báo chí, cơ quan báo chí, nhà báo, phóng viên, cơ sở đào tạo báo chí, sinh viên có thể gặp gỡ, trao đổi, hiểu hơn về những tác động của cuộc Cách mạng 4.0 đến báo chí nước ta. Đồng thời, tạo mối quan hệ gắn kết giữa các cơ quan báo chí với các cơ sở đào tạo báo chí nhằm cung cấp nguồn nhân lực đáp ứng sự thay đổi của báo chí nước ta',6,21000,'Tạp chí Cách Mạng Công Nghệ 4.0','blockchain',65),(57,'2018-02-11',545,5768,6,'img/book/img005.u5131.d20170503.t162039.618886.jpg','[Tạp chí Phái đẹp ELLE – số tháng 6/2018] Hãy cùng tạp chí phái đẹp thực hiện những hành động, dù nhỏ nhặt nhất nhưng góp phần bảo vệ môi trường sống của chúng ta.',7,23000,'Tạp Chí Solitaire (Số 88)','Xuất bản trẻ',5435),(58,'2017-09-29',45,45,1,'img/book/img008.u547.d20170112.t090631.818566.jpg','Đây là dịp để các cơ quan quản lý báo chí, cơ quan báo chí, nhà báo, phóng viên, cơ sở đào tạo báo chí, sinh viên có thể gặp gỡ, trao đổi, hiểu hơn về những tác động của cuộc Cách mạng 4.0 đến báo chí nước ta. Đồng thời, tạo mối quan hệ gắn kết giữa các cơ quan báo chí với các cơ sở đào tạo báo chí nhằm cung cấp nguồn nhân lực đáp ứng sự thay đổi của báo chí nước ta',6,24000,'Tạp Chí Thế Giới Tri Thức','Chính Trị',546),(59,'2018-03-30',7676,324,2,'img/book/photo_2017-07-06_11-03-37.u5430.d20170711.t092122.768028.jpg','[Tạp chí Phái đẹp ELLE – số tháng 6/2018] Hãy cùng tạp chí phái đẹp thực hiện những hành động, dù nhỏ nhặt nhất nhưng góp phần bảo vệ môi trường sống của chúng ta.',8,11000,'Tạp Chí Solitaire (Số 89)','Thời Trang trẻ',900),(60,'2018-07-22',344,23,3,'img/book/large_08_2010_12826700142502660.gif','Tuyển tập Tạp chí Phát triển Nhân lực bao gồm các công trình nghiên cứu, các bài báo khoa học của các nhà lãnh đạo, các nhà khoa học và quản lý đã được tuyển chọn và đăng trên Tạp chí Phát triển Nhân lực từ năm 2007 đến nay.',9,28000,'Tuyển Tập Tạp Chí Phát Triển Nhân Lực','Kinh Tế',899);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `VanHoc` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `KinhTe` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `TT-DS` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `SachNgoaiVan` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `SachThieuNhi` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `BaoChi` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `TapChi` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Hài hước - Truyện cười','Doanh nhân','Kỹ năng sống','Từ điển','Kiến thức khoa học','Người lao động','Phụ nữ'),(2,'Huyền bí - Giả tưởng','Khởi nghiệp','Nghệ thuật sống đẹp','Văn học','Manga - Comic','Tiên phong','Thời trang'),(3,'Phê bình văn học','Kinh tế học','Chăm sóc sức khỏe','Kinh tế','Truyện tranh','Pháp luật','Văn hoá'),(4,'Phóng sự - Ký sự','Kỹ năng làm việc','Làm vườn - Vật nuôi','','Văn học','Tài chính','Ngày nay'),(5,'Tác phẩm kinh điển','Marketing - Bán hàng','Nấu ăn','',NULL,'Công an',NULL),(6,'Thơ','Quản trị - Lãnh đạo','Nuôi dạy con','',NULL,'Chứng khoán',NULL),(7,'Tiểu sử - Hồi ký','Tài chính - Kế toán','Chăm sóc gia đình',NULL,NULL,'Làm đẹp',NULL),(8,'Tiểu thuyết tình cảm',NULL,'Phong thủy - Nhà cửa',NULL,NULL,NULL,NULL),(9,'Truyện kiếm hiệp',NULL,'Tâm lý - Giới tính',NULL,NULL,NULL,NULL),(10,'Truyện ngắn - Tản văn',NULL,'Trò chơi - Giải trí',NULL,NULL,NULL,NULL),(11,'Truyện ngôn tình',NULL,NULL,NULL,NULL,NULL,NULL),(12,'Truyện trinh thám',NULL,NULL,NULL,NULL,NULL,NULL),(13,'Đam mỹ',NULL,NULL,NULL,NULL,NULL,NULL),(14,'Phiêu lưu',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datsp`
--

DROP TABLE IF EXISTS `datsp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datsp` (
  `idDatSP` int(11) NOT NULL AUTO_INCREMENT,
  `idMaSP` int(11) DEFAULT NULL,
  `sl` int(11) DEFAULT NULL,
  `idGioHang` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDatSP`),
  KEY `MSP_idx` (`idMaSP`),
  KEY `IDGH_idx` (`idGioHang`),
  CONSTRAINT `IDGH` FOREIGN KEY (`idGioHang`) REFERENCES `giohang` (`idGioHang`),
  CONSTRAINT `MSP` FOREIGN KEY (`idMaSP`) REFERENCES `book` (`idSach`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datsp`
--

LOCK TABLES `datsp` WRITE;
/*!40000 ALTER TABLE `datsp` DISABLE KEYS */;
INSERT INTO `datsp` VALUES (3,26,1,2),(4,20,2,2),(5,21,1,4),(6,6,3,5),(7,14,2,6),(8,19,1,7),(9,19,1,8),(10,15,1,21),(11,14,1,22),(12,18,1,23),(13,21,1,24);
/*!40000 ALTER TABLE `datsp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giohang`
--

DROP TABLE IF EXISTS `giohang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `giohang` (
  `idGioHang` int(11) NOT NULL AUTO_INCREMENT,
  `tongGia` int(11) DEFAULT NULL,
  PRIMARY KEY (`idGioHang`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giohang`
--

LOCK TABLES `giohang` WRITE;
/*!40000 ALTER TABLE `giohang` DISABLE KEYS */;
INSERT INTO `giohang` VALUES (2,250000),(3,0),(4,130500),(5,256500),(6,117000),(7,52000),(8,52000),(9,324000),(10,189000),(11,63000),(12,58500),(13,71000),(14,71000),(15,71000),(16,71000),(17,71000),(18,71000),(19,134000),(20,54000),(21,61000),(22,58500),(23,61000),(24,130500);
/*!40000 ALTER TABLE `giohang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `khachhang` (
  `idKhachHang` int(11) NOT NULL AUTO_INCREMENT,
  `hoTen` varchar(200) DEFAULT NULL,
  `diaChi` varchar(450) DEFAULT NULL,
  `soDT` varchar(11) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idKhachHang`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhang`
--

LOCK TABLES `khachhang` WRITE;
/*!40000 ALTER TABLE `khachhang` DISABLE KEYS */;
INSERT INTO `khachhang` VALUES (1,'Nguyen Van A','Nguyen Van Cu, quan 5','0123456789',NULL),(17,'nguyen huu than','18 Tran Van Thanh','1657409117',NULL),(18,'nguyen huu than','18 Tran Van Thanh','1657409117',NULL),(19,'trinh','123','123',NULL),(20,'Nguyễn hữu Thân','Đại an đông 1','1657409117',NULL),(21,'Hoàng Thương','123','0987654321',NULL),(22,'Hod','fdf','21431345',NULL),(23,'j','k','435',NULL),(24,'hjhg','jh','866',NULL),(25,'dsa','sa','23',NULL),(26,'hjhg','23','0987654',NULL),(27,'uuu','yyt','9876',NULL);
/*!40000 ALTER TABLE `khachhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loai`
--

DROP TABLE IF EXISTS `loai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loai` (
  `idLoai` int(11) NOT NULL AUTO_INCREMENT,
  `tenLoai` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idLoai`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loai`
--

LOCK TABLES `loai` WRITE;
/*!40000 ALTER TABLE `loai` DISABLE KEYS */;
INSERT INTO `loai` VALUES (1,'Văn học .  '),(2,'Kinh tế'),(3,'Thường thức - đời sống '),(4,'Sách ngoại văn'),(5,'Sách thiếu nhi'),(6,'Báo chí'),(7,'Tạp chí'),(8,'Kinh dị'),(9,'Nghệ thuật'),(10,'Chính trị');
/*!40000 ALTER TABLE `loai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nguoidung`
--

DROP TABLE IF EXISTS `nguoidung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nguoidung` (
  `userName` varchar(45) NOT NULL,
  `pass` varchar(200) DEFAULT NULL,
  `loaiNguoiDung` int(11) DEFAULT NULL,
  `idNguoiSuDung` int(11) DEFAULT NULL,
  PRIMARY KEY (`userName`),
  KEY `QL_idx` (`idNguoiSuDung`),
  CONSTRAINT `KH1` FOREIGN KEY (`idNguoiSuDung`) REFERENCES `khachhang` (`idKhachHang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoidung`
--

LOCK TABLES `nguoidung` WRITE;
/*!40000 ALTER TABLE `nguoidung` DISABLE KEYS */;
INSERT INTO `nguoidung` VALUES ('1512529','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f',1,20),('1512561','8356c920e58c197c3fcea76b9209aa789103b88ed84bdc7e58fb34bf24bc8552',0,17),('1512601','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',0,19),('hoaithuong','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f',0,21);
/*!40000 ALTER TABLE `nguoidung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhasx`
--

DROP TABLE IF EXISTS `nhasx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nhasx` (
  `idNhaSX` int(11) NOT NULL AUTO_INCREMENT,
  `tenNhaSX` varchar(200) DEFAULT NULL,
  `soLuongSP` int(11) DEFAULT NULL,
  PRIMARY KEY (`idNhaSX`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhasx`
--

LOCK TABLES `nhasx` WRITE;
/*!40000 ALTER TABLE `nhasx` DISABLE KEYS */;
INSERT INTO `nhasx` VALUES (1,'Văn học',1200),(2,'Tổng hợp TPHCM',3000),(3,'Xuất bản trẻ',2000),(4,'Chính trị Quốc gia - Sự thật',1000),(5,'Nhà xuất bản Lao động',500),(6,'Thanh niên',900);
/*!40000 ALTER TABLE `nhasx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quanly`
--

DROP TABLE IF EXISTS `quanly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quanly` (
  `idQuanLy` int(11) NOT NULL AUTO_INCREMENT,
  `hoTenQL` varchar(100) DEFAULT NULL,
  `capQL` int(11) DEFAULT NULL,
  PRIMARY KEY (`idQuanLy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quanly`
--

LOCK TABLES `quanly` WRITE;
/*!40000 ALTER TABLE `quanly` DISABLE KEYS */;
/*!40000 ALTER TABLE `quanly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('H4FfFA7ikoyGvMfMZWZ3u8EpSYwMRsPU',1530203718,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":true,\"cart\":[],\"user\":{\"userName\":\"1512561\",\"pass\":\"8356c920e58c197c3fcea76b9209aa789103b88ed84bdc7e58fb34bf24bc8552\",\"loaiNguoiDung\":0,\"idNguoiSuDung\":17},\"Authorized\":0}'),('bF2HzKVK-tImotFBpPV60l7_47k7BgSk',1530250851,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":true,\"cart\":[],\"user\":{\"userName\":\"1512561\",\"pass\":\"8356c920e58c197c3fcea76b9209aa789103b88ed84bdc7e58fb34bf24bc8552\",\"loaiNguoiDung\":0,\"idNguoiSuDung\":17},\"Authorized\":0}'),('wNMRpyBzhOBYdDPD2GbTt_Y9aUiHf8Nk',1530194478,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":true,\"cart\":[{\"idSach\":\"20\",\"ten_sach\":\"Tình Yêu Không Phải Là Tất Cả\",\"giaBan\":67500,\"hinh\":\"img/book/tinhyeukhongphailatatca-200x280.gif\",\"sl\":1,\"amount\":67500}],\"user\":{\"userName\":\"1512561\",\"pass\":\"8356c920e58c197c3fcea76b9209aa789103b88ed84bdc7e58fb34bf24bc8552\",\"loaiNguoiDung\":0,\"idNguoiSuDung\":17},\"Authorized\":0}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thanhtoan`
--

DROP TABLE IF EXISTS `thanhtoan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thanhtoan` (
  `idThanhToan` int(11) NOT NULL AUTO_INCREMENT,
  `idGioHang` int(11) DEFAULT NULL,
  `idKhachHang` int(11) DEFAULT NULL,
  `diaChiThanhToan` varchar(450) DEFAULT NULL,
  `ngayDatHang` datetime(6) DEFAULT NULL,
  `sdtNhanHang` varchar(11) DEFAULT NULL,
  `trangThai` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idThanhToan`),
  KEY `GH_idx` (`idGioHang`),
  KEY `KH_idx` (`idKhachHang`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thanhtoan`
--

LOCK TABLES `thanhtoan` WRITE;
/*!40000 ALTER TABLE `thanhtoan` DISABLE KEYS */;
INSERT INTO `thanhtoan` VALUES (2,2,20,'Đại an đông 1','2018-06-22 00:00:00.000000','1657409117',0),(3,4,20,'Đại an đông 1','2018-06-23 00:00:00.000000','1657409117',0),(4,5,20,'Đại an đông 1','2018-06-23 00:00:00.000000','1657409117',1),(5,8,20,'Đại an đông 1','2018-06-26 00:00:00.000000','1657409117',0),(6,9,17,'18 Tran Van Thanh','2018-06-26 00:00:00.000000','1657409117',0),(7,10,17,'18 Tran Van Thanh','2018-06-26 00:00:00.000000','1657409117',1),(8,11,17,'18 Tran Van Thanh','2018-06-26 00:00:00.000000','1657409117',0),(9,12,17,'18 Tran Van Thanh','2018-06-26 00:00:00.000000','1657409117',0),(10,19,17,'18 Tran Van Thanh','2018-06-26 00:00:00.000000','1657409117',0),(11,20,17,'18 Tran Van Thanh','2018-06-26 00:00:00.000000','1657409117',0),(12,21,17,'18 Tran Van Thanh','2018-06-26 00:00:00.000000','1657409117',0),(13,22,17,'18 Tran Van Thanh','2018-06-28 06:18:39.000000','1657409117',0),(14,23,17,'18 Tran Van Thanh','2018-06-27 23:32:46.000000','1657409117',1),(15,24,17,'18 Tran Van Thanh','2018-06-28 12:33:32.000000','1657409117',0);
/*!40000 ALTER TABLE `thanhtoan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'doanwebck'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-29 13:15:04
