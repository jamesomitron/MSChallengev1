# MSChallenge
 
## MICROSOFT ADC CHALLENGE YOUR SKILL

CONTOSO SKATE LIBRARY CHALLENGE 

Duration: 120 mins 

Difficulty level: Beginner 

 
Prerequisite: Knowledge of an IDE with the web development workload.  

Prerequisite Knowledge: Any Programming Language, Any Web Framework API, Endpoint UI 

Thematic Area: Web Development 

 
 

Contoso Skate has libraries in over 20 states in Nigeria. They already have internal systems they use to manage their bookkeeping and some other internal processes. Contoso Skate is now looking at expanding their coverage by providing APIs for developers to connect with them. 

 

Your task, should you choose to accept it, is to build a Library Management system that exposes APIs to manage their bookstore, users can query their book database and see availability of books by making API calls. Administrators can create and update books, categories, and authors. 

 

The schema for the Contoso Library is found below. 

LibraryStaff | |
--- | --- 
staff_ID | Staff ID Number | 
staff_firstname | Staff First Name |
staff_lastname | Staff Last Name |
staff_mobilenumber | Staff Mobile Number
staff_email | Staff Email
staff_password | Staff Password 
staff_authsalt | Password Salt 
staff_category | Staff Category 

Books | |
--- | --- 
book_ID | Book ID Number 
book_title | Book Title 
book_edition | Book Edition 
book_author | Book Author 
book_publisher | Book Publisher 
book_copies | Number of Book Copies 
book_costs | Cost of Book 
book_remarks | Other Comments about the Book 

Members | |
--- | --- 
member_ID | ID of Member 
member_firstname | First Name of Member 
member_lastname | Last Name of Member 
member_dateofbirth | Date Of Birth of Member 
member_gender | Gender of Member 
member_mobile | Mobile Number of Member 
member_email | Email of Members 

BorrowersRecords | |
--- | --- 
borrowers_ID | Borrow ID 
member_ID | Library Member ID 
staff_ID | Library Staff ID 
borrowers_dateborrowed | Date Book was Borrowed 
borrowers_duereturndate | Due Return Date of Book 

BorrowersRecordDetails | |
--- | --- 
detail_ID | Borrower Details ID 
borrowers_ID | Borrow ID 
book_ID | Book Borrowed ID 
details_numberofcopies | Number Of Copies Borrowed 

BookReturnRecords | |
--- | --- 
return_ID | Return ID 
borrowers_ID | Borrow Book ID 
return_datereturned | Date Book Returned 

BookReturnRecordDetails | |
--- | --- 
detail_ID | Book Return Details ID 
return_ID | Return ID 
book_ID | Book Returned ID 
details_numberofcopies | Number Of Copies Returned 

Please note that each table has a Primary Key and may have one or more foreign Keys. 

Each table is already loaded with thousands of records dating back to the last 6 months and you will be required to build the following endpoints to perform the present the information below. 

The database tables and data will be created by running the provided startUpChallengeScript.sql for MS SQL Server and startUpChallengeScriptMySQL.sql for MySQL. The data for each table is also available and should be imported in the correct order depending on constraints. 


Books | |
--- | --- 
/Books/{ID} | GET, PUT, DELETE 
/Books | GET, POST 
/Books/ByAuthor | GET 
/Books/ByPublisher | GET 
/Books/Borrowed/Last30Days | GET 
/Books/Borrowed/{DateFrom}/{DateTo} | GET 
/Books/Borrowed/{UserID} | GET 
/Books/Borrowed/ApprovedBy/{UserID} | GET 
/Books/Borrowed/{BookID} | GET 

BooksBorrowed | |
--- | --- 
/Borrowed/{ID} | GET, PUT, DELETE 
/Borrowed/ | GET, POST 

BooksReturned | |
--- | --- 
/Returned/{ID} | GET, PUT, DELETE 
/Returned/ | GET, POST 

 
Developed by James Omitiran and Adedeji Adeloye. 

