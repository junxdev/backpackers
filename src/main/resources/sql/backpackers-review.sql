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
