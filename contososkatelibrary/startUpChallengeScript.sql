��USE `ContosoSkateLibrary`;

CREATE TABLE [dbo].[BookReturnRecordDetails](
	[detail_ID] [int] NOT NULL,
	[return_ID] [int] NOT NULL,
	[book_ID] [int] NOT NULL,
	[detail_numberofcopies] [int] NOT NULL,
 CONSTRAINT [PK_BookReturnRecordDetails] PRIMARY KEY CLUSTERED 
(
	[detail_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookReturnRecords]    Script Date: 9/26/2022 11:51:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookReturnRecords](
	[return_ID] [int] NOT NULL,
	[borrowers_ID] [int] NOT NULL,
	[return_datereturned] [datetime] NULL,
 CONSTRAINT [PK_BookReturnRecords] PRIMARY KEY CLUSTERED 
(
	[return_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 9/26/2022 11:51:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[book_ID] [int] NOT NULL,
	[book_title] [nvarchar](50) NOT NULL,
	[book_edition] [nvarchar](50) NOT NULL,
	[book_author] [nvarchar](150) NOT NULL,
	[book_publisher] [nvarchar](150) NOT NULL,
	[book_copies] [int] NOT NULL,
	[book_costs] [decimal](18, 2) NULL,
	[book_remarks] [nvarchar](350) NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[book_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BorrowersRecordDetails]    Script Date: 9/26/2022 11:51:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BorrowersRecordDetails](
	[details_ID] [int] NOT NULL,
	[borrowers_ID] [int] NOT NULL,
	[book_ID] [int] NOT NULL,
	[detail_numberofcopies] [int] NOT NULL,
 CONSTRAINT [PK_BorrowersRecordDetails] PRIMARY KEY CLUSTERED 
(
	[details_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BorrowersRecords]    Script Date: 9/26/2022 11:51:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BorrowersRecords](
	[borrowers_ID] [int] NOT NULL,
	[member_ID] [int] NOT NULL,
	[staff_ID] [int] NOT NULL,
	[borrowers_dateborrowed] [datetime] NOT NULL,
	[borrowers_duereturndate] [datetime] NOT NULL,
 CONSTRAINT [PK_BorrowersRecords] PRIMARY KEY CLUSTERED 
(
	[borrowers_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LibraryStaff]    Script Date: 9/26/2022 11:51:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LibraryStaff](
	[staff_ID] [int] NOT NULL,
	[staff_firstname] [nvarchar](50) NOT NULL,
	[staff_lastname] [nvarchar](50) NOT NULL,
	[staff_mobilenumber] [nvarchar](50) NULL,
	[staff_email] [nvarchar](150) NULL,
	[staff_authsalt] [nvarchar](150) NOT NULL,
	[staff_password] [nvarchar](50) NOT NULL,
	[staff_category] [nvarchar](50) NULL,
 CONSTRAINT [PK_LibraryStaff] PRIMARY KEY CLUSTERED 
(
	[staff_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 9/26/2022 11:51:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[member_ID] [int] NOT NULL,
	[member_firstname] [nvarchar](50) NOT NULL,
	[member_lastname] [nvarchar](50) NOT NULL,
	[member_dateofbirth] [date] NOT NULL,
	[member_gender] [nvarchar](50) NOT NULL,
	[member_mobile] [nvarchar](50) NULL,
	[member_email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED 
(
	[member_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BookReturnRecordDetails]  WITH CHECK ADD  CONSTRAINT [FK_BookReturnRecordDetails_BookReturnRecords] FOREIGN KEY([return_ID])
REFERENCES [dbo].[BookReturnRecords] ([return_ID])
GO
ALTER TABLE [dbo].[BookReturnRecordDetails] CHECK CONSTRAINT [FK_BookReturnRecordDetails_BookReturnRecords]
GO
ALTER TABLE [dbo].[BookReturnRecordDetails]  WITH CHECK ADD  CONSTRAINT [FK_BookReturnRecordDetails_Books] FOREIGN KEY([book_ID])
REFERENCES [dbo].[Books] ([book_ID])
GO
ALTER TABLE [dbo].[BookReturnRecordDetails] CHECK CONSTRAINT [FK_BookReturnRecordDetails_Books]
GO
ALTER TABLE [dbo].[BookReturnRecords]  WITH CHECK ADD  CONSTRAINT [FK_BookReturnRecords_BorrowersRecords] FOREIGN KEY([borrowers_ID])
REFERENCES [dbo].[BorrowersRecords] ([borrowers_ID])
GO
ALTER TABLE [dbo].[BookReturnRecords] CHECK CONSTRAINT [FK_BookReturnRecords_BorrowersRecords]
GO
ALTER TABLE [dbo].[BorrowersRecordDetails]  WITH CHECK ADD  CONSTRAINT [FK_BorrowersRecordDetails_Books] FOREIGN KEY([book_ID])
REFERENCES [dbo].[Books] ([book_ID])
GO
ALTER TABLE [dbo].[BorrowersRecordDetails] CHECK CONSTRAINT [FK_BorrowersRecordDetails_Books]
GO
ALTER TABLE [dbo].[BorrowersRecordDetails]  WITH CHECK ADD  CONSTRAINT [FK_BorrowersRecordDetails_BorrowersRecords] FOREIGN KEY([borrowers_ID])
REFERENCES [dbo].[BorrowersRecords] ([borrowers_ID])
GO
ALTER TABLE [dbo].[BorrowersRecordDetails] CHECK CONSTRAINT [FK_BorrowersRecordDetails_BorrowersRecords]
GO
ALTER TABLE [dbo].[BorrowersRecords]  WITH CHECK ADD  CONSTRAINT [FK_BorrowersRecords_LibraryStaff] FOREIGN KEY([staff_ID])
REFERENCES [dbo].[LibraryStaff] ([staff_ID])
GO
ALTER TABLE [dbo].[BorrowersRecords] CHECK CONSTRAINT [FK_BorrowersRecords_LibraryStaff]
GO
ALTER TABLE [dbo].[BorrowersRecords]  WITH CHECK ADD  CONSTRAINT [FK_BorrowersRecords_Members] FOREIGN KEY([member_ID])
REFERENCES [dbo].[Members] ([member_ID])
GO
ALTER TABLE [dbo].[BorrowersRecords] CHECK CONSTRAINT [FK_BorrowersRecords_Members]
GO
