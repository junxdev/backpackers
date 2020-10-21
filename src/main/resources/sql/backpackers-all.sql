DROP TABLE IF EXISTS `cart`;
DROP TABLE IF EXISTS `order_item`;
DROP TABLE IF EXISTS `product_item`;
DROP TABLE IF EXISTS `product_image`;
DROP TABLE IF EXISTS `product`;
DROP TABLE IF EXISTS `orders`;
DROP TABLE IF EXISTS `order_status`;
DROP TABLE IF EXISTS `shop`;
DROP TABLE IF EXISTS `item`;
DROP TABLE IF EXISTS `option_table`;
DROP TABLE IF EXISTS `option_group`;
DROP TABLE IF EXISTS `sub_category`;
DROP TABLE IF EXISTS `main_category`;
DROP TABLE IF EXISTS `brand`;
DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `userId` varchar(50) NOT NULL,
  `userPw` varchar(100) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `userEmail` varchar(50) NOT NULL,
  `grade` int NOT NULL DEFAULT '0',
  `userJoinDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userLoginDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `postCode` int NOT NULL,
  `address` varchar(400) NOT NULL,
  `detailAddress` varchar(400) NOT NULL,
  `extraAddress` varchar(400) NOT NULL,
  `phoneNum` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userId`)
);

INSERT INTO `member` VALUES ('admin','admin','admin','admin@admin.com',1,'2020-10-06 05:05:50','2020-10-06 05:05:51',0,'','','',NULL);

CREATE TABLE `brand` (
  `brandId` int(11) NOT NULL AUTO_INCREMENT,
  `brandCode` varchar(45) NOT NULL,
  `brandName` varchar(60) NOT NULL,
  PRIMARY KEY (`brandId`),
  UNIQUE KEY `brandCode_UNIQUE` (`brandCode`)
) AUTO_INCREMENT=7;

INSERT INTO `brand` 
VALUES (1,'A01','ADIDAS'),
  (2,'N01','NIKE'),
  (3,'N02','NORTHFACE'),
  (4,'J01','JEEP'),
  (5,'I01','IKEA'),
  (6,'P01','PATAGONIA');
  

CREATE TABLE `main_category` (
  `mainCategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `mainCategoryCode` varchar(45) NOT NULL,
  `mainCategoryName` varchar(60) NOT NULL,
  PRIMARY KEY (`mainCategoryId`),
  UNIQUE KEY `mainCategoryCode_UNIQUE` (`mainCategoryCode`)
) AUTO_INCREMENT=5;

INSERT INTO `main_category` 
VALUES (1,'A','clothing'),
  (2,'B','food'),
  (3,'C','camping'),
  (4,'D','hiking');

CREATE TABLE `sub_category` (
  `subCategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `subCategoryCode` varchar(45) NOT NULL,
  `subCategoryName` varchar(60) NOT NULL,
  `mainCategoryCode` varchar(45) NOT NULL,
  PRIMARY KEY (`subCategoryId`),
  UNIQUE KEY `subCategoryCode_UNIQUE` (`subCategoryCode`),
  KEY `fk_sub_category_main_category_idx` (`mainCategoryCode`),
  CONSTRAINT `fk_sub_category_main_category` FOREIGN KEY (`mainCategoryCode`) REFERENCES `main_category` (`mainCategoryCode`) ON DELETE CASCADE ON UPDATE CASCADE
) AUTO_INCREMENT=13;

INSERT INTO `sub_category` 
  VALUES (1,'AA','tops','A'),
  (2,'AB','pants','A'),
  (3,'AC','hats','A'),
  (4,'AD','shoes','A'),
  (5,'BA','drink','B'),
  (6,'BB','snack','B'),
  (7,'BC','liquor','B'),
  (8,'CA','tent','C'),
  (9,'CB','barbeque','C'),
  (10,'DA','book','D'),
  (11,'DB','accessory','D'),
  (12,'DC','safety','D');

CREATE TABLE `option_group` (
  `optionGroupId` int(11) NOT NULL AUTO_INCREMENT,
  `optionGroupCode` varchar(45) NOT NULL,
  `optionGroupName` varchar(45) NOT NULL,
  PRIMARY KEY (`optionGroupId`),
  UNIQUE KEY `optionCategoryCode_UNIQUE` (`optionGroupCode`)
) AUTO_INCREMENT=6;

INSERT INTO `option_group` 
VALUES (1,'color','Color'),
  (2,'size-tops','Size'),
  (3,'size-roman','Size'),
  (4,'size-shoes','Size'),
  (5,'size-one','Size');

CREATE TABLE `option_table` (
  `optionId` int(11) NOT NULL AUTO_INCREMENT,
  `optionCode` varchar(45) NOT NULL,
  `optionName` varchar(45) NOT NULL,
  `optionGroupCode` varchar(45) NOT NULL,
  PRIMARY KEY (`optionId`),
  UNIQUE KEY `optionCode_UNIQUE` (`optionCode`),
  KEY `fk_option_option_group_idx` (`optionGroupCode`),
  CONSTRAINT `fk_option_option_group` FOREIGN KEY (`optionGroupCode`) REFERENCES `option_group` (`optionGroupCode`) ON DELETE CASCADE ON UPDATE CASCADE
) AUTO_INCREMENT=16;

INSERT INTO `option_table` 
VALUES (1,'color-blue','Blue','color'),
  (2,'color-white','White','color'),
  (3,'color-red','Red','color'),
  (4,'size-tops-90','90','size-tops'),
  (5,'size-tops-100','100','size-tops'),
  (6,'size-tops-110','110','size-tops'),
  (7,'size-roman-m','M','size-roman'),
  (8,'size-roman-l','L','size-roman'),
  (9,'size-roman-xl','XL','size-roman'),
  (10,'color-black','Black','color'),
  (11,'size-one','One Size','size-one'),
  (12,'size-roman-s','S','size-roman'),
  (13,'size-tops-95','95','size-tops'),
  (14,'size-tops-105','105','size-tops'),
  (15,'color-brown','Brown','color');

CREATE TABLE `item` (
  `itemId` int(11) NOT NULL AUTO_INCREMENT,
  `itemCode` varchar(60) NOT NULL,
  `itemName` varchar(100) NOT NULL,
  `itemPrice` int(11) NOT NULL,
  `mainCategoryCode` varchar(45) NOT NULL,
  `subCategoryCode` varchar(45) NOT NULL,
  `brandCode` varchar(45) NOT NULL,
  `firstOptionCode` varchar(45) DEFAULT NULL,
  `secondOptionCode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`itemId`),
  UNIQUE KEY `itemCode_UNIQUE` (`itemCode`),
  KEY `fk_item_main_category_idx` (`mainCategoryCode`),
  KEY `fk_item_sub_category_idx` (`subCategoryCode`),
  KEY `fk_item_brand_idx` (`brandCode`),
  KEY `fk_item_option_1_idx` (`firstOptionCode`),
  KEY `fk_item_option_2_idx` (`secondOptionCode`),
  CONSTRAINT `fk_item_brand` FOREIGN KEY (`brandCode`) REFERENCES `brand` (`brandCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_item_main_category` FOREIGN KEY (`mainCategoryCode`) REFERENCES `main_category` (`mainCategoryCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_item_option_1` FOREIGN KEY (`firstOptionCode`) REFERENCES `option_table` (`optionCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_item_option_2` FOREIGN KEY (`secondOptionCode`) REFERENCES `option_table` (`optionCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_item_sub_category` FOREIGN KEY (`subCategoryCode`) REFERENCES `sub_category` (`subCategoryCode`) ON DELETE CASCADE ON UPDATE CASCADE
) AUTO_INCREMENT=32 ;

INSERT INTO `item` 
VALUES (1,'item01','아디프린 윈드브레이커',97000,'A','AA','A01','color-blue','size-roman-m'),
  (2,'item02','아디프린 윈드브레이커',97000,'A','AA','A01','color-blue','size-roman-l'),
  (3,'item03','아디프린 윈드브레이커',97000,'A','AA','A01','color-blue','size-roman-xl'),
  (4,'item04','ZNE 봄버 자켓',169000,'A','AA','A01','color-white','size-roman-m'),
  (5,'item05','ZNE 봄버 자켓',169000,'A','AA','A01','color-white','size-roman-l'),
  (6,'item06','ZNE 봄버 자켓',169000,'A','AA','A01','color-red','size-roman-m'),
  (7,'item07','ZNE 봄버 자켓',169000,'A','AA','A01','color-red','size-roman-l'),
  (8,'item08','에플라뢰 / 클라센',129900,'C','CB','I01','color-white','size-one'),
  (9,'item09','코르푄',29900,'C','CB','I01','color-white','size-one'),
  (10,'item10','잠스탁 베이스볼 캡',39000,'A','AC','A01','color-blue','size-one'),
  (11,'item11','잠스탁 베이스볼 캡',39000,'A','AC','A01','color-white','size-one'),
  (12,'item12','잠스탁 베이스볼 캡',39000,'A','AC','A01','color-black','size-one'),
  (13,'item13','라이즈 365 롱슬리브 탑',69000,'A','AA','N01','color-blue','size-roman-m'),
  (14,'item14','라이즈 365 롱슬리브 탑',69000,'A','AA','N01','color-blue','size-roman-l'),
  (15,'item15','라이즈 365 롱슬리브 탑',69000,'A','AA','N01','color-black','size-roman-m'),
  (16,'item16','라이즈 365 롱슬리브 탑',69000,'A','AA','N01','color-black','size-roman-l'),
  (17,'item17','시티 컴포트 캐시미어 팬츠',269000,'A','AB','N02','color-black','size-tops-90'),
  (18,'item18','시티 컴포트 캐시미어 팬츠',269000,'A','AB','N02','color-blue','size-tops-100'),
  (19,'item19','시티 컴포트 캐시미어 팬츠',269000,'A','AB','N02','color-red','size-tops-90'),
  (20,'item20','시티 컴포트 캐시미어 팬츠',269000,'A','AB','N02','color-red','size-tops-100'),
  (21,'item21','시티 컴포트 캐시미어 팬츠',269000,'A','AB','N02','color-red','size-tops-110'),
  (22,'item22','멘즈 비비 다운 재킷',419000,'A','AA','P01','color-brown','size-tops-90'),
  (23,'item23','멘즈 토렌트쉘 3L 재킷',259000,'A','AA','P01','color-blue','size-tops-90'),
  (24,'item24','멘즈 오가닉 코튼 캔버스 재킷',279000,'A','AA','P01','color-brown','size-tops-90'),
  (25,'item25','멘즈 베터 스웨터 베스트',159000,'A','AA','P01','color-black','size-tops-90'),
  (26,'item26','멘즈 프로즌 레인지 파카',959000,'A','AA','P01','color-black','size-tops-90'),
  (27,'item27','멘즈 토렌트쉘 3L 풀오버',229000,'A','AA','P01','color-blue','size-tops-90'),
  (28,'item28','멘즈 인슐레이티드 토렌트쉘 재킷',399000,'A','AA','P01','color-red','size-tops-90'),
  (29,'item29','멘즈 R2 테크페이스 재킷',259000,'A','AA','P01','color-black','size-tops-90'),
  (30,'item30','멘즈 리버서블 비디 다운 베스트',289000,'A','AA','P01','color-brown','size-tops-90'),
  (31,'item31','멘즈 SST 재킷',649000,'A','AA','P01','color-black','size-tops-90');

CREATE TABLE `shop` (
  `shopId` int(11) NOT NULL AUTO_INCREMENT,
  `shopCode` varchar(45) NOT NULL,
  `shopTitle` varchar(45) NOT NULL,
  `mainCategoryCode` varchar(45) NOT NULL,
  `subCategoryCode` varchar(45) NOT NULL,
  `shopDate` timestamp NOT NULL,
  `shopContent` varchar(3000) NOT NULL,
  `shopPrice` int(11) NOT NULL,
  PRIMARY KEY (`shopId`),
  UNIQUE KEY `shopCode_UNIQUE` (`shopCode`),
  KEY `fk_shop_main_category_idx` (`mainCategoryCode`),
  KEY `fk_shop_sub_category_idx` (`subCategoryCode`),
  CONSTRAINT `fk_shop_main_category` FOREIGN KEY (`mainCategoryCode`) REFERENCES `main_category` (`mainCategoryCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_shop_sub_category` FOREIGN KEY (`subCategoryCode`) REFERENCES `sub_category` (`subCategoryCode`) ON DELETE CASCADE ON UPDATE CASCADE
) AUTO_INCREMENT=15 ;

INSERT INTO `shop` 
VALUES (1,'shop01','아디프린 윈드브레이커','A','AA','2020-09-30','과거를 사로잡은 가벼운 지지력과 청키한 실루엣. 혁신적인 기능과 스타일을 탄생시킨 아디프린+ 기술을 기념하는 윈드브레이커를 만나보세요. 바람을 막아주는 견고한 커버력과 스포티한 룩으로 언제 어디서나 편안하게 착용할 수 있습니다.',65000),
  (2,'shop02','ZNE 봄버 자켓','A','AA','2020-09-30','오피스와 트레일을 넘나드는 편안함. 레이어드에 용이한 여유 있는 드롭 숄더가 적용된 가벼운 다용도 재킷입니다. 포켓 채널에 이어폰을 연결하여 도시의 잡음을 차단하고 집중력을 유지할 수 있습니다.',129000),
  (3,'shop03','라이즈 365 롱슬리브 탑','A','AA','2020-09-15','라이즈 365 롱슬리브 탑',87000),
  (4,'shop04','시티 컴포트 캐시미어 팬츠','A','AB','2020-10-02','남성 조거 팬츠로 감촉이 매우 부드럽고, 보온성이 탁월한 캐시미어 100% 원사를 사용하였습니다.',269000),
  (5,'shop05','멘즈 비비 다운 재킷','A','AA','2020-10-02','보온성과 발수 기능이 뛰어난 다운 재킷으로 600 필파워 100% 리사이클 다운 (기존 제품에 사용했던 다운 재활용, 덕 다운과 구스 다운 혼합)을 보온재로 사용했습니다. 내구성, 기능성, 보온성이 조화를 이루고 있습니다.',419000),
  (6,'shop06','멘즈 토렌트쉘 3L 재킷','A','AA','2020-10-02','간단하면서 필요한 기능을 지니고 있는 토렌트쉘 3L 재킷은 3레이어 H2No® 퍼포먼스 스탠더드 기술을 적용하여 뛰어난 방수/투습 기능, 하루 종일 편안하고 오래 지속되는 성능을 보여 줍니다. 공정 무역(Fair Trade Certified™) 봉제 제품입니다.',259000),
  (7,'shop07','멘즈 오가닉 코튼 캔버스 재킷','A','AA','2020-10-02','간절기에 입기 좋은 유기농 순면 재킷입니다. 공정 무역(Fair Trade Certified™) 봉제 제품입니다.',279000),
  (8,'shop08','멘즈 베터 스웨터 베스트','A','AA','2020-10-02','따뜻하고 가볍고 부드러운 스웨터 니트 100% 리사이클 폴리에스터 플리스 원단으로 만든 재킷입니다.',159000),
  (9,'shop09','멘즈 프로즌 레인지 파카','A','AA','2020-10-02','보온성과 방수/투습 기능이 매우 뛰어난 다운 자켓으로 허벅지까지 내려오는 길이입니다. 보온재는 700 필파워 100% 리사이클 다운 (기존 제품에 사용했던 다운 재활용, 덕 다운과 구스 다운 혼합)입니다.',959000),
  (10,'shop10','멘즈 토렌트쉘 3L 풀오버','A','AA','2020-10-02','간단하면서 필요한 기능을 지니고 있는 토렌트쉘 3L 재킷은 3레이어 H2No® 퍼포먼스 스탠더드 기술을 적용하여 뛰어난 방수/투습 기능, 하루 종일 편안하고 오래 지속되는 성능을 보여 줍니다. 공정 무역(Fair Trade Certified™) 봉제 제품입니다.',229000),
  (11,'shop11','멘즈 인슐레이티드 토렌트쉘 재킷','A','AA','2020-10-02','눈이나 비가 내리는 추운 날 입기 좋은 방수 보온 재킷입니다. 2레이어 방수/투습 겉감에 리사이클 원단을 사용하고, 보온을 위해 친환경 소재인 써모그린(Thermogreen®) 보온재를 사용했습니다.',399000),
  (12,'shop12','멘즈 R2 테크페이스 재킷','A','AA','2020-10-02','R2 테크페이스 재킷은 추운 날씨에 완벽한 크로스레이어로 변화하는 산악 환경에서 필요한 다양한 활용성을 위한 내마모성과 보호기능뿐만 아니라 보온성과 통기성을 제공합니다.',259000),
  (13,'shop13','멘즈 리버서블 비디 다운 베스트','A','AA','2020-10-02','양면으로 입을 수 있으며, 발수 기능이 뛰어난 다운 베스트로 내구성, 기능성, 보온성이 조화를 이루고 있습니다.',289000),
  (14,'shop14','멘즈 SST 재킷','A','AA','2020-10-02','넉넉한 크기의 가슴 주머니와 뒷 주머니가 있는 방수 재킷입니다. 후드는 한 손으로 당겨 좋일 수 있으며 소매 끝 부분은 리버스 스트레치 코드 소재로 물이 들어오지 않게 막아 줍니다. 깊은 물에서 플라이 낚시를 할 때 입기 좋으며 어깨끈 벨트 고리끈이 있습니다. 공정 무역(Fair Trade Certified™) 봉제 제품입니다.',649000);
  
CREATE TABLE `order_status` (
  `orderStatusId` int(11) NOT NULL AUTO_INCREMENT,
  `orderStatus` varchar(45) NOT NULL,
  PRIMARY KEY (`orderStatusId`),
  KEY `idx_order_status` (`orderStatus`)
) AUTO_INCREMENT=7 ;

INSERT INTO `order_status` 
VALUES (1,'CHECKING'),
  (2,'ORDERED'),
  (3,'PAYED'),
  (4,'DELIVERING'),
  (5,'DELIVERED'),
  (6,'CANCELED');

CREATE TABLE `orders` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `orderCode` varchar(45) NOT NULL,
  `userId` varchar(50) DEFAULT NULL,
  `orderDate` date DEFAULT NULL,
  `orderStatus` varchar(45) DEFAULT NULL,
  `orderAmount` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  UNIQUE KEY `orderCode_UNIQUE` (`orderCode`),
  KEY `fk_order_order_status_idx` (`orderStatus`),
  CONSTRAINT `fk_orders_member` FOREIGN KEY (`userId`) REFERENCES `backpackers`.`member` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_order_order_status` FOREIGN KEY (`orderStatus`) REFERENCES `order_status` (`orderStatus`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `product` (
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  `shopCode` varchar(45) NOT NULL,
  `productCode` varchar(45) NOT NULL,
  `optionGroupCode` varchar(45) NOT NULL,
  `optionCode` varchar(45) NOT NULL,
  PRIMARY KEY (`productId`),
  UNIQUE KEY `productCode_UNIQUE` (`productCode`),
  KEY `fk_product_shop_idx` (`shopCode`),
  KEY `fk_product_option_group_idx` (`optionGroupCode`),
  KEY `fk_product_option_idx` (`optionCode`),
  CONSTRAINT `fk_product_option` FOREIGN KEY (`optionCode`) REFERENCES `option_table` (`optionCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_product_option_group` FOREIGN KEY (`optionGroupCode`) REFERENCES `option_group` (`optionGroupCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_product_shop` FOREIGN KEY (`shopCode`) REFERENCES `shop` (`shopCode`) ON DELETE CASCADE ON UPDATE CASCADE
) AUTO_INCREMENT=19 ;

INSERT INTO `product` 
VALUES (1,'shop01','product01','color','color-black'),
  (2,'shop02','product04','color','color-white'),
  (3,'shop02','product06','color','color-black'),
  (4,'shop03','product08','color','color-blue'),
  (5,'shop03','product10','color','color-red'),
  (6,'shop04','product12','color','color-black'),
  (7,'shop04','product15','color','color-blue'),
  (8,'shop04','product16','color','color-red'),
  (9,'shop05','product17','color','color-black'),  
  (10,'shop06','product18','color','color-black'),
  (11,'shop07','product19','color','color-black'),
  (12,'shop08','product20','color','color-black'),
  (13,'shop09','product21','color','color-black'),
  (14,'shop10','product22','color','color-black'),
  (15,'shop11','product23','color','color-black'),
  (16,'shop12','product24','color','color-black'),
  (17,'shop13','product25','color','color-black'),
  (18,'shop14','product26','color','color-black');

CREATE TABLE `product_image` (
  `productImageId` int(11) NOT NULL AUTO_INCREMENT,
  `productCode` varchar(45) NOT NULL,	
  `imageURL` varchar(100) DEFAULT NULL,
  `imageOrder` int(11) NOT NULL,
  PRIMARY KEY (`productImageId`),
  KEY `fk_product_image_product_idx` (`productCode`),
  CONSTRAINT `fk_product_image_product` FOREIGN KEY (`productCode`) REFERENCES `product` (`productCode`) ON DELETE CASCADE ON UPDATE CASCADE
) AUTO_INCREMENT=25 ;

INSERT INTO `product_image` 
VALUES (1,'product01','product01-0.jpg',0),
  (2,'product01','product01-1.jpg',1),
  (3,'product01','product01-2.jpg',2),
  (4,'product04','product04-0.jpg',0),
  (5,'product04','product04-1.jpg',1),
  (6,'product04','product04-2.jpg',2),
  (7,'product08','product08-0.jpg',0),
  (8,'product08','product08-1.jpg',1),
  (9,'product08','product08-2.jpg',2),
  (10,'product08','product08-3.jpg',3),
  (11,'product10','product10-0.jpg',0),
  (12,'product10','product10-1.jpg',1),
  (13,'product10','product10-2.jpg',2),
  (14,'product10','product10-3.jpg',3),
  (15,'product17','product17-0.jpg',0),  
  (16,'product18','product18-0.jpg',0),
  (17,'product19','product19-0.jpg',0),
  (18,'product20','product20-0.jpg',0),
  (19,'product21','product21-0.jpg',0),
  (20,'product22','product22-0.jpg',0),
  (21,'product23','product23-0.jpg',0),
  (22,'product24','product24-0.jpg',0),
  (23,'product25','product25-0.jpg',0),
  (24,'product26','product26-0.jpg',0);

CREATE TABLE `product_item` (
  `productItemId` int(11) NOT NULL AUTO_INCREMENT,
  `productCode` varchar(45) NOT NULL,
  `itemCode` varchar(45) NOT NULL,
  `optionGroupCode` varchar(45) NOT NULL,
  `optionCode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`productItemId`),
  KEY `fk_product_item_option_group_idx` (`optionGroupCode`),
  KEY `fk_product_item_option_idx` (`optionCode`),
  KEY `fk_product_item_item_idx` (`itemCode`),
  KEY `fk_product_item_product_idx` (`productCode`),
  CONSTRAINT `fk_product_item_item` FOREIGN KEY (`itemCode`) REFERENCES `item` (`itemCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_product_item_option` FOREIGN KEY (`optionCode`) REFERENCES `option_table` (`optionCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_product_item_option_group` FOREIGN KEY (`optionGroupCode`) REFERENCES `option_group` (`optionGroupCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_product_item_product` FOREIGN KEY (`productCode`) REFERENCES `product` (`productCode`) ON DELETE CASCADE ON UPDATE CASCADE
) AUTO_INCREMENT=24 ;

INSERT INTO `product_item` 
VALUES (1,'product01','item01','size-roman','size-roman-m'),
  (2,'product01','item02','size-roman','size-roman-l'),
  (3,'product01','item03','size-roman','size-roman-xl'),
  (4,'product04','item04','size-tops','size-tops-90'),
  (5,'product04','item05','size-tops','size-tops-100'),
  (6,'product06','item06','size-tops','size-tops-90'),
  (7,'product06','item07','size-tops','size-tops-100'),
  (8,'product08','item13','size-roman','size-roman-m'),
  (9,'product10','item15','size-roman','size-roman-m'),
  (10,'product10','item16','size-roman','size-roman-l'),
  (11,'product12','item10','size-one','size-one'),
  (12,'product15','item11','size-one','size-one'),
  (13,'product16','item12','size-one','size-one'),
  (14,'product17','item22','size-tops','size-tops-90'),  
  (15,'product18','item23','size-tops','size-tops-90'),
  (16,'product19','item24','size-tops','size-tops-90'),
  (17,'product20','item25','size-tops','size-tops-90'),
  (18,'product21','item26','size-tops','size-tops-90'),
  (19,'product22','item27','size-tops','size-tops-90'),
  (20,'product23','item28','size-tops','size-tops-90'),
  (21,'product24','item29','size-tops','size-tops-90'),
  (22,'product25','item30','size-tops','size-tops-90'),
  (23,'product26','item31','size-tops','size-tops-90');
  
CREATE TABLE `order_item` (
  `orderItemId` int(11) NOT NULL AUTO_INCREMENT,
  `orderCode` varchar(45) NOT NULL,
  `productCode` varchar(45) NOT NULL,
  `optionCode` varchar(45) NOT NULL,
  PRIMARY KEY (`orderItemId`),
  KEY `fk_order_item_order_idx` (`orderCode`),
  KEY `fk_order_product_idx` (`productCode`),
  KEY `fk_order_item_option_idx` (`optionCode`),
  CONSTRAINT `fk_order_item_option` FOREIGN KEY (`optionCode`) REFERENCES `option_table` (`optionCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_order_item_orders` FOREIGN KEY (`orderCode`) REFERENCES `orders` (`orderCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_order_item_product` FOREIGN KEY (`productCode`) REFERENCES `product` (`productCode`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `cart` (
  `cartId` int NOT NULL AUTO_INCREMENT,
  `productCode` varchar(45) NOT NULL,
  `userId` varchar(50) DEFAULT NULL,
  `cartDate` timestamp NOT NULL,
  `cartRemoved` tinyint(1) NOT NULL,
  `optionCode` varchar(45) NOT NULL,
  PRIMARY KEY (`cartId`),
  KEY `fk_cart_product_idx` (`productCode`),
  KEY `fk_cart_option_idx` (`optionCode`),
  KEY `fk_cart_member_idx` (`userId`),
  CONSTRAINT `fk_cart_option` FOREIGN KEY (`optionCode`) REFERENCES `option_table` (`optionCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cart_product` FOREIGN KEY (`productCode`) REFERENCES `product` (`productCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cart_member` FOREIGN KEY (`userId`) REFERENCES `member` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `board_reply`;

CREATE TABLE `board_reply` (
  `reply_no` int NOT NULL AUTO_INCREMENT,
  `reply_id` varchar(50) NOT NULL,
  `reply_depth` int NOT NULL,
  `reply_time` timestamp NOT NULL,
  `reply_content` varchar(45) NOT NULL,
  `reply_delete` int NOT NULL DEFAULT '1',
  `board_no` int NOT NULL,
  PRIMARY KEY (`reply_no`)
);

INSERT INTO `board_reply` VALUES (32,'kim',1,'2020-10-13 07:05:09','댓글수정123ㄴㅇㄴㅇ',1,2),(40,'kim',1,'2020-10-13 08:05:20','댓글수정123ㄴㅇㄴㅇ',1,3),(50,'admin',1,'2020-10-14 06:18:36','김대영11111',1,15),(51,'admin',1,'2020-10-14 06:18:40','김대영21',1,15),(55,'admin',1,'2020-10-14 07:09:27','sadsadsa',1,15);

DROP TABLE IF EXISTS `board`;

CREATE TABLE `board` (
  `board_no` int NOT NULL AUTO_INCREMENT,
  `board_subject` varchar(45) NOT NULL,
  `user_ID` varchar(20) DEFAULT NULL,
  `board_date` date NOT NULL,
  `board_content` varchar(200) DEFAULT NULL,
  `board_hits` int NOT NULL,
  `board_type` int NOT NULL,
  `board_delete` int NOT NULL,
  `board_maketime` time NOT NULL,
  `board_views` int NOT NULL,
  PRIMARY KEY (`board_no`)
);

INSERT INTO `board` VALUES (2,'학원에서 테스트 수정',NULL,'2020-10-13','학원에서 테스트 수정',0,1,1,'12:09:11',25),(3,'수정완료','kim','2020-10-13','수정입니다.',0,1,1,'12:21:48',829),(4,'비트캠프','kim','2020-10-13','',0,1,1,'17:12:51',1),(5,'수정완료','kim','2020-10-13','김대영',0,1,1,'17:13:13',38),(8,'sadsad','kim','2020-10-13','<p><font color=\"#000000\" style=\"background-color: rgb(255, 255, 0);\">dsfdsf</font></p>',0,1,1,'18:04:17',2),(9,'수정완료','kim','2020-10-13','<h2>ㅁㄴㅇㄴㅁㅇ</h2>',0,1,1,'18:13:01',19),(12,'머지한다음에 테스트',NULL,'2020-10-14','<p>테스트</p>',0,1,1,'13:33:44',6);

DROP TABLE IF EXISTS `gear`;

CREATE TABLE `gear` (
  `gearNo` int NOT NULL AUTO_INCREMENT,
  `gearTitle` varchar(300) NOT NULL,
  `gearContent` varchar(2000) NOT NULL,
  PRIMARY KEY (`gearNo`),
  UNIQUE KEY `gearTitle_UNIQUE` (`gearTitle`)
);
INSERT INTO `gear` VALUES (1,'백패킹이 처음이신가요?','<p><span style="color: rgb(34, 34, 34); font-family: Noto, sans-serif; font-size: 26px; font-weight: 600;">백패킹 초보라면? 이렇게 준비하세요</span></p><p><span style="color: rgb(34, 34, 34); font-family: Noto, sans-serif; font-size: 26px; font-weight: 600;"><br></span><span style="color: rgb(51, 51, 51); font-family: Noto, sans-serif; font-size: 0.9rem;">이렇게 백패킹을 떠나기 위해서는 야영생활에 필요한 준비물들을 챙겨야 합니다. 그렇다면 어떤 것들을 챙기고, 어떻게 짐을 꾸리는 것이 좋을까요?</span></p><p class="txt" style="box-sizing: inherit; margin-top: 0.5rem; margin-bottom: 0px; padding: 0px; display: inline-block; font-size: 0.9rem; color: rgb(85, 85, 85); line-height: 1.8; text-align: justify; font-family: Noto, sans-serif;">백패킹의 기본은 심플입니다. 도시에서 쥐고 있던 많은 것들을 내려놓고, 정말 필요한 짐들만 꾸려야만 해요. 그렇지 않으면 애초 생각했던 모든 짐의 반도 넣기 전에 이미 가득 찬 배낭을 마주하게 될 거에요. 즐거워야 할 여행인데, 출발부터 진이 빠져버리면 안되겠죠. 그렇기에 처음부터 간소한 짐을 꾸리는 것이 중요합니다. 집이 되어줄 텐트, 그리고 바닥의 냉기를 막아주는 에어매트와 침낭은 필수입니다. 겨울을 제외한 3계절엔 에어매트 말고도 가벼운 캠핑매트를 사용하기도 해요.</p><p><span style="color: rgb(34, 34, 34); font-family: Noto, sans-serif; font-size: 26px; font-weight: 600;"><br></span></p>'),
(2,'백패킹에 필요한 장비들','<p class="p1" style="margin-bottom: 0px; color: rgb(68, 68, 68); font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: &quot;Helvetica Neue&quot;;">백패킹은 1박 이상의 야영 생활에 필요한 장비를 갖추고 산과 바다, 들과 계곡 등을 자유롭게 떠돌아다니는 여행을 뜻합니다. 이러한 야영 활동은 장소나 환경, 이동수단 등 어디에도 구속 받지 않는 자유로운 여행 그 자체라고 할 수 있습니다. 집 나가면 고생이라는데, 매번 사서 고생을 하면서도 한번 빠지면 배낭 메고 집 나갈 궁리만 하게 되는 백패킹. 그 매력에 대해 지금부터 이야기해 보겠습니다.</p><p class="p1" style="margin-bottom: 0px; color: rgb(68, 68, 68); font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: &quot;Helvetica Neue&quot;;"><br></p><p class="p1" style="margin-bottom: 0px; color: rgb(68, 68, 68); font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: &quot;Helvetica Neue&quot;;">&lt; 배낭 하나 메고 떠나는 백패킹의 매력 &gt;</p><p class="p1" style="margin-bottom: 0px; color: rgb(68, 68, 68); font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: &quot;Helvetica Neue&quot;;">백패킹은 배낭 하나에 모든 짐을 짊어져야 하기 때문에 꼭 필요한 것들만 가지고 떠나야만 합니다. 도시의 편리함은 잠시 놓아두고, 조금 더 단순한 자연의 시간 속으로 뚜벅뚜벅 걸어 나가다보면 어느새 몸의 움직임도 정직해지는 걸 느낄 수 있습니다.</p>'),
(30,'백피킹을 떠나요','<p class="p1" style="margin-bottom: 0px; color: rgb(68, 68, 68); font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: &quot;Helvetica Neue&quot;;">백패킹은 1박 이상의 야영 생활에 필요한 장비를 갖추고 산과 바다, 들과 계곡 등을 자유롭게 떠돌아다니는 여행을 뜻합니다. 이러한 야영 활동은 장소나 환경, 이동수단 등 어디에도 구속 받지 않는 자유로운 여행 그 자체라고 할 수 있습니다. 집 나가면 고생이라는데, 매번 사서 고생을 하면서도 한번 빠지면 배낭 메고 집 나갈 궁리만 하게 되는 백패킹. 그 매력에 대해 지금부터 이야기해 보겠습니다.</p><p class="p1" style="margin-bottom: 0px; color: rgb(68, 68, 68); font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: &quot;Helvetica Neue&quot;;"><br></p><p class="p1" style="margin-bottom: 0px; color: rgb(68, 68, 68); font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: &quot;Helvetica Neue&quot;;">&lt; 배낭 하나 메고 떠나는 백패킹의 매력 &gt;</p><p class="p1" style="margin-bottom: 0px; color: rgb(68, 68, 68); font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: &quot;Helvetica Neue&quot;;">백패킹은 배낭 하나에 모든 짐을 짊어져야 하기 때문에 꼭 필요한 것들만 가지고 떠나야만 합니다. 도시의 편리함은 잠시 놓아두고, 조금 더 단순한 자연의 시간 속으로 뚜벅뚜벅 걸어 나가다보면 어느새 몸의 움직임도 정직해지는 걸 느낄 수 있습니다.</p>');

DROP TABLE IF EXISTS `sights`;

CREATE TABLE `sights` (
  `sightsNo` int NOT NULL AUTO_INCREMENT,
  `title` varchar(300) NOT NULL,
  `latlng` varchar(300) NOT NULL,
  `ellipsis` varchar(300) NOT NULL,
  `link` varchar(300) NOT NULL,
  `sightsContent` varchar(2000) NOT NULL,
  PRIMARY KEY (`sightsNo`),
  UNIQUE KEY `title_UNIQUE` (`title`)
) AUTO_INCREMENT=12;

INSERT INTO `sights` VALUES 
(1,'북한산','37.661749, 126.993376','경기 고양시 덕양구 대서문길 375','www.knps.or.kr/front','<p>북한산 국립공원으로 오세요~</p>'),
(2,'북악산','37.593203, 126.973331','서울 종로구 부암동','http://www.chf.or.kr/c1/sub5_4.jsp','<p>북악산으로 가볼까요? hi</p><p><br></p><p><img src=\"/backpackers/gear/image/34\" style=\"width: 50%;\"></p><p><br></p><p><img src=\"/backpackers/gear/image/35\" style=\"width: 50%;\"><br></p>'),
(3,'인왕산','37.585199, 126.959328','서울 종로구 무악동 산2-1','http://','<p>인왕산을 걸어요~</p><p><b style="color: rgb(32, 33, 34); font-family: sans-serif;"><br></b></p><p><b style="color: rgb(32, 33, 34); font-family: sans-serif;">인왕산</b><span style="color: rgb(32, 33, 34); font-family: sans-serif;">(仁王山)은&nbsp;</span><a href="https://ko.wikipedia.org/wiki/%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C" title="서울특별시" style="font-family: sans-serif; background: none rgb(255, 255, 255); color: rgb(11, 0, 128);">서울특별시</a><span style="color: rgb(32, 33, 34); font-family: sans-serif;">&nbsp;</span><a href="https://ko.wikipedia.org/wiki/%EC%A2%85%EB%A1%9C%EA%B5%AC" title="종로구" style="font-family: sans-serif; background: none rgb(255, 255, 255); color: rgb(11, 0, 128);">종로구</a><span style="color: rgb(32, 33, 34); font-family: sans-serif;">와&nbsp;</span><a href="https://ko.wikipedia.org/wiki/%EC%84%9C%EB%8C%80%EB%AC%B8%EA%B5%AC" title="서대문구" style="font-family: sans-serif; background: none rgb(255, 255, 255); color: rgb(11, 0, 128);">서대문구</a><span style="color: rgb(32, 33, 34); font-family: sans-serif;">에 걸쳐있는&nbsp;</span><a href="https://ko.wikipedia.org/wiki/%EC%82%B0" title="산" style="font-family: sans-serif; background: none rgb(255, 255, 255); color: rgb(11, 0, 128);">산</a><span style="color: rgb(32, 33, 34); font-family: sans-serif;">이며 전체 면적은 1,086,696.50m</span><sup style="color: rgb(32, 33, 34); font-family: sans-serif; line-height: 1em;">2</sup><span style="color: rgb(32, 33, 34); font-family: sans-serif;">이다.</span></p><p style="margin-top: 0.5em; margin-bottom: 0.5em; color: rgb(32, 33, 34); font-family: sans-serif;">바위산이기 때문에 조망도 좋고 기차바위·치마바위·매바위·범바위·이슬바위·모자바위·선바위·지렁이바위 등이 저마다 기이한 모습들을 뽐내고 있다</p>'),
(4,'낙산공원','37.580740, 127.007475','서울 종로구 낙산길 41','https://parks.seoul.go.kr/template/sub/naksan.do','낙산공원에서 야경을!'),
(5,'남산공원','37.551097, 126.990903','서울 중구 삼일대로 231','http://parks.seoul.go.kr/namsan','<p>남산공원에서 야경을!</p>');

DROP TABLE IF EXISTS `uploadfile`;

CREATE TABLE `uploadfile` (
  `id` bigint DEFAULT NULL,
  `filename` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `savefilename` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `filepath` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `contenttype` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `size` bigint DEFAULT NULL
) AUTO_INCREMENT=35;

INSERT INTO `uploadfile` VALUES (1,'스크린샷 2020-09-14 오후 3.18.13.png','9298d175-f985-403b-a1fb-fa822ce39b9d스크린샷 2020-09-14 오후 3.18.13.png','/Users/a/img/9298d175-f985-403b-a1fb-fa822ce39b9d스크린샷 2020-09-14 오후 3.18.13.png',NULL,710502),(2,'스크린샷.png','f562b0e4-c81f-4740-a281-36b404e9206f스크린샷.png','/Users/a/img/f562b0e4-c81f-4740-a281-36b404e9206f스크린샷.png',NULL,196164),(3,'스크린샷.png','eb1d739a-5cc5-46db-a8d2-1691767986f1스크린샷.png','/Users/a/img/eb1d739a-5cc5-46db-a8d2-1691767986f1스크린샷.png',NULL,196164),(4,'스크린샷 2020-09-25 오후 5.42.18.png','bfedd60a-2237-4ac9-8162-df164023a455스크린샷 2020-09-25 오후 5.42.18.png','/Users/a/img/bfedd60a-2237-4ac9-8162-df164023a455스크린샷 2020-09-25 오후 5.42.18.png',NULL,225494),(5,'스크린샷 2020-09-14 오후 3.18.13.png','94829745-cff9-480b-a686-86ac2fe50b49스크린샷 2020-09-14 오후 3.18.13.png','/Users/a/img/94829745-cff9-480b-a686-86ac2fe50b49스크린샷 2020-09-14 오후 3.18.13.png',NULL,710502),(6,'스크린샷 2020-09-25 오후 5.42.18.png','241303f7-e8c2-497e-89db-3379064c2319스크린샷 2020-09-25 오후 5.42.18.png','/Users/a/img/241303f7-e8c2-497e-89db-3379064c2319스크린샷 2020-09-25 오후 5.42.18.png',NULL,225494),(7,'스크린샷.png','fe0a69f5-8fe2-4712-ad29-90f2ff05ca33스크린샷.png','/Users/a/img/fe0a69f5-8fe2-4712-ad29-90f2ff05ca33스크린샷.png',NULL,196164),(8,'스크린샷 2020-09-14 오후 3.18.13.png','8d14118a-7f7f-4d7b-8d3f-f6fa44d51e9b스크린샷 2020-09-14 오후 3.18.13.png','/Users/a/img/8d14118a-7f7f-4d7b-8d3f-f6fa44d51e9b스크린샷 2020-09-14 오후 3.18.13.png',NULL,710502),(9,'스크린샷.png','14473d79-bdf7-45c1-ad14-1df679b853b1스크린샷.png','/Users/a/img/14473d79-bdf7-45c1-ad14-1df679b853b1스크린샷.png',NULL,196164),(10,'스크린샷.png','d1efbb81-3fa4-4216-bc24-d8a67f3e9420스크린샷.png','/Users/a/img/d1efbb81-3fa4-4216-bc24-d8a67f3e9420스크린샷.png',NULL,196164),(11,'스크린샷 2020-09-14 오후 3.18.13.png','1133ebb1-a5d7-44bc-a7df-0c1572d13f3f스크린샷 2020-09-14 오후 3.18.13.png','/Users/a/img/1133ebb1-a5d7-44bc-a7df-0c1572d13f3f스크린샷 2020-09-14 오후 3.18.13.png',NULL,710502),(12,'스크린샷.png','274cae64-049e-42fc-bc30-7b0bf0e5ca7d스크린샷.png','/Users/a/img/274cae64-049e-42fc-bc30-7b0bf0e5ca7d스크린샷.png',NULL,196164),(13,'스크린샷 2020-09-14 오후 3.18.13.png','7f13d223-afc5-40c5-b5f9-591a6b3ac352스크린샷 2020-09-14 오후 3.18.13.png','/Users/a/img/7f13d223-afc5-40c5-b5f9-591a6b3ac352스크린샷 2020-09-14 오후 3.18.13.png',NULL,710502),(14,'스크린샷.png','9406ca2e-8128-41a8-b7d5-db97b69fabca스크린샷.png','/Users/a/img/9406ca2e-8128-41a8-b7d5-db97b69fabca스크린샷.png',NULL,196164),(15,'스크린샷 2020-09-14 오후 3.18.13.png','ac2d233f-e1b2-4997-bde9-bb5888bc3fdf스크린샷 2020-09-14 오후 3.18.13.png','/Users/a/img/ac2d233f-e1b2-4997-bde9-bb5888bc3fdf스크린샷 2020-09-14 오후 3.18.13.png',NULL,710502),(16,'스크린샷 2020-09-21 오후 2.46.42.png','3f934277-9cc3-4ed1-854a-c53f6026a95a스크린샷 2020-09-21 오후 2.46.42.png','/Users/a/img/3f934277-9cc3-4ed1-854a-c53f6026a95a스크린샷 2020-09-21 오후 2.46.42.png',NULL,723376),(17,'스크린샷 2020-09-14 오후 3.18.13.png','ea003d2f-b93c-420d-979a-c0c7f1ad601a스크린샷 2020-09-14 오후 3.18.13.png','/Users/a/img/ea003d2f-b93c-420d-979a-c0c7f1ad601a스크린샷 2020-09-14 오후 3.18.13.png',NULL,710502),(18,'스크린샷.png','cd53ee53-2d6a-45da-bd88-976ac5c397b9스크린샷.png','/Users/a/img/cd53ee53-2d6a-45da-bd88-976ac5c397b9스크린샷.png',NULL,196164),(19,'스크린샷.png','f364de47-dc0e-4ec2-a1c1-52f3b3a0f3b1스크린샷.png','/Users/a/img/f364de47-dc0e-4ec2-a1c1-52f3b3a0f3b1스크린샷.png',NULL,196164),(20,'스크린샷 2020-10-07 오후 6.17.35.png','8d22c481-1fba-4cdb-b765-30791b659f16스크린샷 2020-10-07 오후 6.17.35.png','/Users/a/img/8d22c481-1fba-4cdb-b765-30791b659f16스크린샷 2020-10-07 오후 6.17.35.png',NULL,175379),(21,'스크린샷 2020-10-07 오후 6.17.24.png','2e9850ff-dd94-4aa8-91b0-4d767a1a45c4스크린샷 2020-10-07 오후 6.17.24.png','/Users/a/img/2e9850ff-dd94-4aa8-91b0-4d767a1a45c4스크린샷 2020-10-07 오후 6.17.24.png',NULL,209346),(22,'스크린샷.png','f8555ae5-35a9-4618-ba7c-847d4b359d7e스크린샷.png','/Users/a/img/f8555ae5-35a9-4618-ba7c-847d4b359d7e스크린샷.png',NULL,196164),(23,'스크린샷 2020-09-14 오후 3.18.13.png','1eca4c79-2d94-4bc4-b5a9-4d5436539f2f스크린샷 2020-09-14 오후 3.18.13.png','/Users/a/img/1eca4c79-2d94-4bc4-b5a9-4d5436539f2f스크린샷 2020-09-14 오후 3.18.13.png',NULL,710502),(24,'스크린샷 2020-09-25 오후 5.42.18.png','71177804-33bf-44fc-8e95-ac4ee50e5f16스크린샷 2020-09-25 오후 5.42.18.png','/Users/a/img/71177804-33bf-44fc-8e95-ac4ee50e5f16스크린샷 2020-09-25 오후 5.42.18.png',NULL,225494),(25,'스크린샷 2020-09-21 오후 2.46.42.png','27e44c5b-b9d0-4168-af65-37365ee5ce25스크린샷 2020-09-21 오후 2.46.42.png','/Users/a/img/27e44c5b-b9d0-4168-af65-37365ee5ce25스크린샷 2020-09-21 오후 2.46.42.png',NULL,723376),(26,'스크린샷 2020-09-14 오후 3.18.13.png','0a1eadd6-79da-489a-90bd-b75cf9687610스크린샷 2020-09-14 오후 3.18.13.png','/Users/a/img/0a1eadd6-79da-489a-90bd-b75cf9687610스크린샷 2020-09-14 오후 3.18.13.png',NULL,710502),(27,'스크린샷 2020-09-25 오후 5.42.18.png','1f8aa658-3cc6-421e-a704-7396e58b0344스크린샷 2020-09-25 오후 5.42.18.png','/Users/a/img/1f8aa658-3cc6-421e-a704-7396e58b0344스크린샷 2020-09-25 오후 5.42.18.png',NULL,225494),(28,'스크린샷 2020-10-07 오후 6.18.06.png','06a266e9-bd5a-4597-934a-040c64f46596스크린샷 2020-10-07 오후 6.18.06.png','/Users/a/img/06a266e9-bd5a-4597-934a-040c64f46596스크린샷 2020-10-07 오후 6.18.06.png',NULL,321678),(29,'스크린샷 2020-10-07 오후 6.17.24.png','ec050c5b-b69e-4733-b9ce-1d0b41153ac5스크린샷 2020-10-07 오후 6.17.24.png','/Users/a/img/ec050c5b-b69e-4733-b9ce-1d0b41153ac5스크린샷 2020-10-07 오후 6.17.24.png',NULL,209346),(30,'스크린샷 2020-10-07 오후 6.18.15.png','ba3c36f3-d2bf-49b8-9ab8-9ef109882f7d스크린샷 2020-10-07 오후 6.18.15.png','/Users/a/img/ba3c36f3-d2bf-49b8-9ab8-9ef109882f7d스크린샷 2020-10-07 오후 6.18.15.png',NULL,174958),(31,'스크린샷 2020-09-25 오후 5.42.18.png','07c46644-f812-4aba-b5f7-cdd3a81df80d스크린샷 2020-09-25 오후 5.42.18.png','/Users/a/img/07c46644-f812-4aba-b5f7-cdd3a81df80d스크린샷 2020-09-25 오후 5.42.18.png',NULL,225494),(32,'스크린샷 2020-10-07 오후 6.18.15.png','d8f0d482-78e9-49bb-84a0-a7016e8f7e56스크린샷 2020-10-07 오후 6.18.15.png','/Users/a/img/d8f0d482-78e9-49bb-84a0-a7016e8f7e56스크린샷 2020-10-07 오후 6.18.15.png',NULL,174958),(33,'스크린샷 2020-10-07 오후 6.17.35.png','8018bf99-5c76-4d93-a3fa-a9afd7bd2c16스크린샷 2020-10-07 오후 6.17.35.png','/Users/a/img/8018bf99-5c76-4d93-a3fa-a9afd7bd2c16스크린샷 2020-10-07 오후 6.17.35.png',NULL,175379),(34,'스크린샷 2020-10-07 오후 6.17.24.png','d0c46e07-444e-4f23-80ee-da9181088487스크린샷 2020-10-07 오후 6.17.24.png','/Users/a/img/d0c46e07-444e-4f23-80ee-da9181088487스크린샷 2020-10-07 오후 6.17.24.png',NULL,209346),(35,'스크린샷 2020-09-25 오후 5.42.18.png','98b2dce3-da40-452d-95e2-d0da072e4ab5스크린샷 2020-09-25 오후 5.42.18.png','/Users/a/img/98b2dce3-da40-452d-95e2-d0da072e4ab5스크린샷 2020-09-25 오후 5.42.18.png',NULL,225494),(36,'스크린샷 2020-10-07 오후 6.17.35.png','1a783e2b-256a-4c56-ac17-48fef6ac3a00스크린샷 2020-10-07 오후 6.17.35.png','/Users/a/img/1a783e2b-256a-4c56-ac17-48fef6ac3a00스크린샷 2020-10-07 오후 6.17.35.png',NULL,175379),(37,'스크린샷 2020-10-07 오후 6.18.15.png','739f3e0f-80b2-44c3-a5da-97d45c350509스크린샷 2020-10-07 오후 6.18.15.png','/Users/a/img/739f3e0f-80b2-44c3-a5da-97d45c350509스크린샷 2020-10-07 오후 6.18.15.png',NULL,174958),(38,'스크린샷 2020-10-07 오후 6.18.15.png','6167376f-5edc-4ea8-bbd9-c45f43258c52스크린샷 2020-10-07 오후 6.18.15.png','/Users/a/img/6167376f-5edc-4ea8-bbd9-c45f43258c52스크린샷 2020-10-07 오후 6.18.15.png',NULL,174958),(39,'스크린샷 2020-10-07 오후 6.17.24.png','a06c36aa-f978-4df1-ac1b-8ab8beceec37스크린샷 2020-10-07 오후 6.17.24.png','/Users/a/img/a06c36aa-f978-4df1-ac1b-8ab8beceec37스크린샷 2020-10-07 오후 6.17.24.png',NULL,209346),(40,'스크린샷 2020-10-07 오후 6.17.24.png','a33ad59e-8cc4-48f1-9dfc-b5df12967044스크린샷 2020-10-07 오후 6.17.24.png','/Users/a/img/a33ad59e-8cc4-48f1-9dfc-b5df12967044스크린샷 2020-10-07 오후 6.17.24.png',NULL,209346),(41,'스크린샷 2020-09-25 오후 5.42.18.png','5e64fc95-bb16-4a00-b5bf-5fb73da67e7e스크린샷 2020-09-25 오후 5.42.18.png','/Users/a/img/5e64fc95-bb16-4a00-b5bf-5fb73da67e7e스크린샷 2020-09-25 오후 5.42.18.png',NULL,225494),(42,'스크린샷 2020-10-07 오후 6.17.35.png','e8c34f8e-7e67-4373-bbac-fc6ad8507a48스크린샷 2020-10-07 오후 6.17.35.png','/Users/a/img/e8c34f8e-7e67-4373-bbac-fc6ad8507a48스크린샷 2020-10-07 오후 6.17.35.png',NULL,175379),(43,'스크린샷 2020-10-07 오후 6.18.06.png','2954612a-11c1-40db-9622-15df8d6e2889스크린샷 2020-10-07 오후 6.18.06.png','/Users/a/img/2954612a-11c1-40db-9622-15df8d6e2889스크린샷 2020-10-07 오후 6.18.06.png',NULL,321678);

DROP TABLE IF EXISTS `tbl_item_review`;

CREATE TABLE `tbl_item_review` (
  `reviewNo` int(11) NOT NULL AUTO_INCREMENT,
  `shopCode` varchar(45) NOT NULL,
  `userId` varchar(45) NOT NULL,
  `reviewContent` varchar(2000) NOT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`reviewNo`)
) AUTO_INCREMENT=4;

INSERT INTO `tbl_item_review` VALUES (1,'shop01','user1','리뷰내용','2020-10-18 10:47:49'),(2,'shop02','user2','리뷰내용2','2020-10-18 10:47:49'),(3,'shop03','user3','리뷰내용3','2020-10-18 10:47:49');

