show tables;
use `ContosoSkateLibrary`;
/* SQLINES DEMO *** le [dbo].[BookReturnRecordDetails]    Script Date: 9/26/2022 11:51:53 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `BookReturnRecordDetails`(
	`detail_ID` int NOT NULL,
	`return_ID` int NOT NULL,
	`book_ID` int NOT NULL,
	`detail_numberofcopies` int NOT NULL,
 CONSTRAINT `PK_BookReturnRecordDetails` PRIMARY KEY 
(
	`detail_ID` ASC
) 
);
/* SQLINES DEMO *** le [dbo].[BookReturnRecords]    Script Date: 9/26/2022 11:51:53 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `BookReturnRecords`(
	`return_ID` int NOT NULL,
	`borrowers_ID` int NOT NULL,
	`return_datereturned` datetime(3) NULL,
 CONSTRAINT `PK_BookReturnRecords` PRIMARY KEY 
(
	`return_ID` ASC
) 
);
/* SQLINES DEMO *** le [dbo].[Books]    Script Date: 9/26/2022 11:51:53 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `Books`(
	`book_ID` int NOT NULL,
	`book_title` nvarchar(50) NOT NULL,
	`book_edition` nvarchar(50) NOT NULL,
	`book_author` nvarchar(150) NOT NULL,
	`book_publisher` nvarchar(150) NOT NULL,
	`book_copies` int NOT NULL,
	`book_costs` decimal(18, 2) NULL,
	`book_remarks` nvarchar(350) NULL,
 CONSTRAINT `PK_Books` PRIMARY KEY 
(
	`book_ID` ASC
) 
);
/* SQLINES DEMO *** le [dbo].[BorrowersRecordDetails]    Script Date: 9/26/2022 11:51:53 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `BorrowersRecordDetails`(
	`details_ID` int NOT NULL,
	`borrowers_ID` int NOT NULL,
	`book_ID` int NOT NULL,
	`detail_numberofcopies` int NOT NULL,
 CONSTRAINT `PK_BorrowersRecordDetails` PRIMARY KEY 
(
	`details_ID` ASC
) 
);
/* SQLINES DEMO *** le [dbo].[BorrowersRecords]    Script Date: 9/26/2022 11:51:53 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `BorrowersRecords`(
	`borrowers_ID` int NOT NULL,
	`member_ID` int NOT NULL,
	`staff_ID` int NOT NULL,
	`borrowers_dateborrowed` datetime(3) NOT NULL,
	`borrowers_duereturndate` datetime(3) NOT NULL,
 CONSTRAINT `PK_BorrowersRecords` PRIMARY KEY 
(
	`borrowers_ID` ASC
) 
);
/* SQLINES DEMO *** le [dbo].[LibraryStaff]    Script Date: 9/26/2022 11:51:53 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `LibraryStaff`(
	`staff_ID` int NOT NULL,
	`staff_firstname` nvarchar(50) NOT NULL,
	`staff_lastname` nvarchar(50) NOT NULL,
	`staff_mobilenumber` nvarchar(50) NULL,
	`staff_email` nvarchar(150) NULL,
	`staff_authsalt` nvarchar(150) NOT NULL,
	`staff_password` nvarchar(50) NOT NULL,
	`staff_category` nvarchar(50) NULL,
 CONSTRAINT `PK_LibraryStaff` PRIMARY KEY 
(
	`staff_ID` ASC
) 
);
/* SQLINES DEMO *** le [dbo].[Members]    Script Date: 9/26/2022 11:51:53 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE `Members`(
	`member_ID` int NOT NULL,
	`member_firstname` nvarchar(50) NOT NULL,
	`member_lastname` nvarchar(50) NOT NULL,
	`member_dateofbirth` date NOT NULL,
	`member_gender` nvarchar(50) NOT NULL,
	`member_mobile` nvarchar(50) NULL,
	`member_email` nvarchar(50) NULL,
 CONSTRAINT `PK_Members` PRIMARY KEY 
(
	`member_ID` ASC
) 
);
ALTER TABLE `BookReturnRecordDetails`  ADD  CONSTRAINT `FK_BookReturnRecordDetails_BookReturnRecords` FOREIGN KEY(`return_ID`)
REFERENCES `BookReturnRecords` (`return_ID`);
 

ALTER TABLE `BookReturnRecordDetails`  ADD  CONSTRAINT `FK_BookReturnRecordDetails_Books` FOREIGN KEY(`book_ID`)
REFERENCES `Books` (`book_ID`);

ALTER TABLE `BookReturnRecords`  ADD  CONSTRAINT `FK_BookReturnRecords_BorrowersRecords` FOREIGN KEY(`borrowers_ID`)
REFERENCES `BorrowersRecords` (`borrowers_ID`);

ALTER TABLE `BorrowersRecordDetails`  ADD  CONSTRAINT `FK_BorrowersRecordDetails_Books` FOREIGN KEY(`book_ID`)
REFERENCES `Books` (`book_ID`);
 
ALTER TABLE `BorrowersRecordDetails`  ADD  CONSTRAINT `FK_BorrowersRecordDetails_BorrowersRecords` FOREIGN KEY(`borrowers_ID`)
REFERENCES `BorrowersRecords` (`borrowers_ID`);
 
ALTER TABLE `BorrowersRecords`  ADD  CONSTRAINT `FK_BorrowersRecords_LibraryStaff` FOREIGN KEY(`staff_ID`)
REFERENCES `LibraryStaff` (`staff_ID`);
 
ALTER TABLE `BorrowersRecords`  ADD  CONSTRAINT `FK_BorrowersRecords_Members` FOREIGN KEY(`member_ID`)
REFERENCES `Members` (`member_ID`);
 
