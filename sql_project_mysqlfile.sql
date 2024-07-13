

--Create database named db_Library_Management */
create database db_Library_Management
--Create table for publishers with columns: publisher_PublisherName (primary key), publisher_PublisherAddress, Publisher_publisherPhone */
create table tbl_publisher(
publisher_publisherName varchar(100) primary key,
publisher_PublisherAddress varchar(200),
Publisher_publisherPhone varchar(50)
);
 --Create table for books with columns: book_BookID (primary key), book_Title, book_PublisherName (foreign key referencing tbl_publisher) */
create table tbl_book(
book_BookID INT primary key,
book_Title varchar (100),
book_publisherName varchar(100) constraint fk_publisher_name foreign key  references tbl_publisher(Publisher_publisherName) ON UPDATE CASCADE ON DELETE CASCADE
);
--Create table for library branches with columns: library_branch_BranchID (primary key), library_branch_BranchName, library_branch_BranchAddress */
create table tbl_library_branch(
library_branch_BranchID INT primary key,
library_branch_BranchName varchar (100),
library_branch_BranchAddress varchar (200)  
);
--Create table for borrowers with columns: borrower_CardNo (primary key), borrower_BorrowerName, borrower_BorrowerAddress, borrower_BorrowerPhone */
create table tbl_borrower(
borrower_CardNo INT primary key,
borrower_BorrowerName varchar (100),
borrower_BorrowerAddress varchar (200),
borrower_BorrowerPhone varchar (50)
);
--create table for book loans 
create table tbl_book_loans(
book_loans_LoansID INT primary key,
book_loans_BookID INT constraint fk1_BookID foreign key  references tbl_Book(book_BookID)ON UPDATE CASCADE ON DELETE CASCADE,
book_loans_BranchID INT constraint fk2_BranchID foreign key references tbl_library_branch(library_branch_BranchID)ON UPDATE CASCADE ON DELETE CASCADE,
book_loans_CardNo  INT constraint fk3_CardNo foreign key references  tbl_borrower(borrower_CardNo)ON UPDATE CASCADE ON DELETE CASCADE,
book_loans_DateOut varchar (20),
book_loans_DueDate varchar (20)
);
--Create table for book copies
create table tbl_book_copies(
book_copies_CopiesID INT primary key,
book_copies_BookID INT constraint fk4_BookID foreign key  references tbl_Book(book_BookID)ON UPDATE CASCADE ON DELETE CASCADE,
book_copies_BranchID INT constraint fk5_BranchID foreign key references tbl_library_branch(library_branch_BranchID)ON UPDATE CASCADE ON DELETE CASCADE,
book_copies_No_Of_Copies INT
);
--Create table for book authors
create table tbl_book_authors(
book_authors_AuthorID INT primary key,
book_authors_BookID INT constraint fk6_BookID foreign key  references tbl_Book(book_BookID)ON UPDATE CASCADE ON DELETE CASCADE,
book_authors_AuthorName varchar (100)
);
--Insert data into tbl_publisher table */
INSERT INTO tbl_publisher
		(publisher_PublisherName, publisher_PublisherAddress, publisher_PublisherPhone)
		VALUES
		('DAW Books','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Viking','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Signet Books','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Chilton Books','Not Available','Not Available'),
		('George Allen & Unwin','83 Alexander Ln, Crows Nest NSW 2065, Australia','+61-2-8425-0100'),
		('Alfred A. Knopf','The Knopf Doubleday Group Domestic Rights, 1745 Broadway, New York, NY 10019','212-940-7390'),		
		('Bloomsbury','Bloomsbury Publishing Inc., 1385 Broadway, 5th Floor, New York, NY 10018','212-419-5300'),
		('Shinchosa','Oga Bldg. 8, 2-5-4 Sarugaku-cho, Chiyoda-ku, Tokyo 101-0064 Japan','+81-3-5577-6507'),
		('Harper and Row','HarperCollins Publishers, 195 Broadway, New York, NY 10007','212-207-7000'),
		('Pan Books','175 Fifth Avenue, New York, NY 10010','646-307-5745'),
		('Chalto & Windus','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Harcourt Brace Jovanovich','3 Park Ave, New York, NY 10016','212-420-5800'),
		('W.W. Norton',' W. W. Norton & Company, Inc., 500 Fifth Avenue, New York, New York 10110','212-354-5500'),
		('Scholastic','557 Broadway, New York, NY 10012','800-724-6527'),
		('Bantam','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Picador USA','175 Fifth Avenue, New York, NY 10010','646-307-5745');
		
		SELECT * FROM tbl_publisher

--insert data into tbl_book table */
	INSERT INTO tbl_book
		(book_BookID, book_Title, book_PublisherName)
		VALUES 
		('1','The Name of the Wind', 'DAW Books'),
		('2','It', 'Viking'),
		('3','The Green Mile', 'Signet Books'),
		('4','Dune', 'Chilton Books'),
		('5','The Hobbit', 'George Allen & Unwin'),
		('6','Eragon', 'Alfred A. Knopf'),
		('7','A Wise Mans Fear', 'DAW Books'),
		('8','Harry Potter and the Philosophers Stone', 'Bloomsbury'),
		('9','Hard Boiled Wonderland and The End of the World', 'Shinchosa'),
		('10','The Giving Tree', 'Harper and Row'),
		('11','The Hitchhikers Guide to the Galaxy', 'Pan Books'),
		('12','Brave New World', 'Chalto & Windus'),
		('13','The Princess Bride', 'Harcourt Brace Jovanovich'),
		('14','Fight Club', 'W.W. Norton'),
		('15','Holes', 'Scholastic'),
		('16','Harry Potter and the Chamber of Secrets', 'Bloomsbury'),
		('17','Harry Potter and the Prisoner of Azkaban', 'Bloomsbury'),
		('18','The Fellowship of the Ring', 'George Allen & Unwin'),
		('19','A Game of Thrones', 'Bantam'),
		('20','The Lost Tribe', 'Picador USA');

	SELECT * FROM tbl_book WHERE book_PublisherName = 'George Allen & Unwin'
	--Insert data into tbl_book_authors table */
	INSERT INTO tbl_book_authors
		(book_authors_AuthorID,book_authors_BookID,book_authors_AuthorName)
		VALUES
		('001','1','Patrick Rothfuss'),
		('002','2','Stephen King'),
		('003','3','Stephen King'),
		('004','4','Frank Herbert'),
		('005','5','J.R.R. Tolkien'),
		('006','6','Christopher Paolini'),
		('007','6','Patrick Rothfuss'),
		('008','8','J.K. Rowling'),
		('009','9','Haruki Murakami'),
		('010','10','Shel Silverstein'),
		('011','11','Douglas Adams'),
		('012','12','Aldous Huxley'),
		('013','13','William Goldman'),
		('014','14','Chuck Palahniuk'),
		('015','15','Louis Sachar'),
		('016','16','J.K. Rowling'),
		('017','17','J.K. Rowling'),
		('018','18','J.R.R. Tolkien'),
		('019','19','George R.R. Martin'),
		('020','20','Mark Lee');

	SELECT * FROM tbl_book_authors
	--Insert data into tbl_borrower table */
	INSERT INTO tbl_borrower
		(borrower_CardNo,borrower_BorrowerName, borrower_BorrowerAddress, borrower_BorrowerPhone)
		VALUES
		('100','Joe Smith','1321 4th Street, New York, NY 10014','212-312-1234'),
		('101','Jane Smith','1321 4th Street, New York, NY 10014','212-931-4124'),
		('102','Tom Li','981 Main Street, Ann Arbor, MI 48104','734-902-7455'),
		('103','Angela Thompson','2212 Green Avenue, Ann Arbor, MI 48104','313-591-2122'),
		('104','Harry Emnace','121 Park Drive, Ann Arbor, MI 48104','412-512-5522'),
		('105','Tom Haverford','23 75th Street, New York, NY 10014','212-631-3418'),
		('106','Haley Jackson','231 52nd Avenue New York, NY 10014','212-419-9935'),
		('107','Michael Horford','653 Glen Avenue, Ann Arbor, MI 48104','734-998-1513');
	
	SELECT * FROM tbl_borrower

	--Insert data into tbl_library_branch table 
	INSERT INTO tbl_library_branch
		(library_branch_BranchID, library_branch_BranchName, library_branch_BranchAddress)
		VALUES
		('1','Sharpstown','32 Corner Road, New York, NY 10012'),
		('2','Central','491 3rd Street, New York, NY 10014'),
		('3','Saline','40 State Street, Saline, MI 48176'),
		('4','Ann Arbor','101 South University, Ann Arbor, MI 48104');

     SELECT * FROM tbl_library_branch

--Insert data into tbl_book_loans table */
	INSERT INTO tbl_book_loans
		(book_loans_LoansID,book_loans_BookID, book_loans_BranchID, book_loans_CardNo, book_loans_DateOut, book_loans_DueDate)
		VALUES
		('151','1','1','100','1/1/18','2/2/18'),
		('152','2','1','100','1/1/18','2/2/18'),
		('153','3','1','100','1/1/18','2/2/18'),
		('154','4','1','100','1/1/18','2/2/18'),
		('155','5','1','102','1/3/18','2/3/18'),
		('156','6','1','102','1/3/18','2/3/18'),
		('157','7','1','102','1/3/18','2/3/18'),
		('158','8','1','102','1/3/18','2/3/18'),
		('159','9','1','102','1/3/18','2/3/18'),
		('160','11','1','102','1/3/18','2/3/18'),
		('161','12','2','105','12/12/17','1/12/18'),
		('162','10','2','105','12/12/17','1/12/17'),
		('163','20','2','105','2/3/18','3/3/18'),
		('164','18','2','105','1/5/18','2/5/18'),
		('165','19','2','105','1/5/18','2/5/18'),
		('166','19','2','100','1/3/18','2/3/18'),
		('167','11','2','106','1/7/18','2/7/18'),
		('168','1','2','106','1/7/18','2/7/18'),
		('169','2','2','100','1/7/18','2/7/18'),
		('170','3','2','100','1/7/18','2/7/18'),
		('171','5','2','105','12/12/17','1/12/18'),
		('172','4','3','103','1/9/18','2/9/18'),
		('173','7','3','102','1/3/18','2/3/18'),
		('174','17','3','102','1/3/18','2/3/18'),
		('175','16','3','104','1/3/18','2/3/18'),
		('176','15','3','104','1/3/18','2/3/18'),
		('177','15','3','107','1/3/18','2/3/18'),
		('178','14','3','104','1/3/18','2/3/18'),
		('179','13','3','107','1/3/18','2/3/18'),
		('180','13','3','102','1/3/18','2/3/18'),
		('181','19','3','102','12/12/17','1/12/18'),
		('182','20','4','103','1/3/18','2/3/18'),
		('183','1','4','102','1/12/18','2/12/18'),
		('184','3','4','107','1/3/18','2/3/18'),
		('185','18','4','107','1/3/18','2/3/18'),
		('186','12','4','102','1/4/18','2/4/18'),
		('187','11','4','103','1/15/18','2/15/18'),
		('188','9','4','103','1/15/18','2/15/18'),
		('189','7','4','107','1/1/18','2/2/18'),
		('190','4','4','103','1/1/18','2/2/18'),
		('191','1','4','103','2/2/17','3/2/18'),
		('192','20','4','103','1/3/18','2/3/18'),
		('193','1','4','102','1/12/18','2/12/18'),
		('194','3','4','107','1/13/18','2/13/18'),
		('195','18','4','107','1/13/18','2/13/18'),
		('196','12','4','102','1/14/18','2/14/18'),
		('197','11','4','103','1/15/18','2/15/18'),
		('198','9','4','103','1/15/18','2/15/18'),
		('199','7','4','107','1/19/18','2/19/18'),
		('200','4','4','103','1/19/18','2/19/18'),
		('201','1','4','103','1/22/18','2/22/18');

		
	SELECT * FROM tbl_book_loans

	--Insert data into tbl_book_copies table */
	
		INSERT INTO tbl_book_copies
		(book_copies_CopiesID, book_copies_BookID, book_copies_BranchID, book_copies_No_Of_Copies)
		VALUES
		('1000','1','1','5'),
		('1001','2','1','8'),
		('1002','3','1','3'),
		('1003','4','1','6'),
		('1004','5','1','7'),
		('1005','6','1','2'),
		('1006','7','1','4'),
		('1007','8','1','1'),
		('1008','9','1','10'),
		('1009','10','1','5'),
		('1010','11','1','5'),
		('1011','12','1','5'),
		('1012','13','1','5'),
		('1013','14','1','5'),
		('1014','15','1','5'),
		('1015','16','1','5'),
		('1016','17','1','5'),
		('1017','18','1','5'),
		('1018','19','1','5'),
		('1019','20','1','5'),
		('1020','1','2','5'),
		('1021','2','2','5'),
		('1022','3','2','5'),
		('1023','4','2','5'),
		('1024','5','2','5'),
		('1025','6','2','5'),
		('1026','7','2','5'),
		('1027','8','2','5'),
		('1028','9','2','5'),
		('1029','10','2','5'),
		('1030','11','2','5'),
		('1031','12','2','5'),
		('1032','13','2','5'),
		('1033','14','2','5'),
		('1034','15','2','5'),
		('1035','16','2','5'),
		('1036','17','2','5'),
		('1037','18','2','5'),
		('1038','19','2','5'),
		('1039','20','2','5'),
		('1040','1','3','5'),
		('1041','2','3','5'),
		('1042','3','3','5'),
		('1043','4','3','5'),
		('1044','5','3','5'),
		('1045','6','3','5'),
		('1046','7','3','5'),
		('1047','8','3','5'),
		('1048','9','3','5'),
		('1049','10','3','5'),
		('1050','11','3','5'),
		('1051','12','3','5'),
		('1052','13','3','5'),
		('1053','14','3','5'),
		('1054','15','3','5'),
		('1055','16','3','5'),
		('1056','17','3','5'),
		('1057','18','3','5'),
		('1058','19','3','5'),
		('1059','20','3','5'),
		('1060','1','4','5'),
		('1061','2','4','5'),
		('1062','3','4','5'),
		('1063','4','4','5'),
		('1064','5','4','5'),
		('1065','6','4','5'),
		('1066','7','4','5'),
		('1067','8','4','5'),
		('1068','9','4','5'),
		('1069','10','4','5'),
		('1070','11','4','5'),
		('1071','12','4','5'),
		('1072','13','4','5'),
		('1073','14','4','5'),
		('1074','15','4','5'),
		('1075','16','4','5'),
		('1076','17','4','5'),
		('1077','18','4','5'),
		('1078','19','4','5'),
		('1079','20','4','5');

	SELECT * FROM tbl_book_copies

	/*---------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	USE db_Library_Management



	/*Q1:1.	Find the titles of all books published by "Bloomsbury."
	  Use the SELECT statement to retrieve data from the "book_Title" column //Specify the table name as "tbl_book" where the books are stored //
	  Use the WHERE clause to filter the results based on the condition that the "book_PublisherName" is 'Bloomsbury' //
	 End the statement with a semicolon to complete the SQL query*/

	    SELECT book_Title FROM tbl_book
	    WHERE book_PublisherName='Bloomsbury'

	/*2.List the names of borrowers whose phone numbers start with the area code "212."*/
	/* Select the borrower_BorrowerName column from the tbl_borrower table. Use the WHERE clause to filter the results based on the borrower_BorrowerPhone column 
. Use the LIKE operator with the pattern '212%' to match phone numbers that start with the area code "212" */
	   
	   SELECT borrower_BorrowerName FROM tbl_borrower
	   WHERE borrower_BorrowerPhone like '212%'


	/*3.	Retrieve the titles of books with more than 10 copies available.
	This query selects the book titles from the tbl_book table and joins it with the tbl_book_copies table on the book_BookID column. 
	It then filters the result to only include books where the number of copies available is greater than 10.*/

	        SELECT book_Title FROM tbl_book
	        INNER JOIN tbl_book_copies ON tbl_book.book_BookID=tbl_book_copies.book_copies_BookID 
	        WHERE book_copies_No_Of_Copies<10; 

	/*4.Display the names of borrowers who have borrowed books from the "Central" branch.
	    Join the tbl_borrower and tbl_book_loans tables on the CardNo column to get the borrowers who have borrowed books.
		Join the result from step 1 with tbl_library_branch on BranchID to get the borrowers who have borrowed books from the "Central" branch.
	    select the BorrowerName from the final result*/

	    SELECT borrower_BorrowerName FROM tbl_borrower
     	INNER JOIN tbl_book_loans ON tbl_borrower.borrower_CardNo=tbl_book_loans.book_loans_CardNo
	    INNER JOIN tbl_library_branch ON tbl_book_loans.book_loans_BranchID=tbl_library_branch.library_branch_BranchID
	    WHERE library_branch_BranchName='Central';


   /*5.	List the titles of books borrowed by borrower "Joe Smith."
   Use INNER JOIN to connect the tables tbl_book_loans, tbl_book, and tbl_borrower based on the respective IDs.
   Add a WHERE clause to filter the results based on the borrower's name "Joe Smith."
   The final SQL query to list the titles of books borrowed by borrower "Joe Smith" would be:*/

    SELECT DISTINCT tbl_book.book_Title FROM tbl_book_loans
	join tbl_book ON tbl_book_loans.book_loans_BookID=tbl_book.book_BookID
	join tbl_borrower ON tbl_book_loans.book_loans_CardNo=tbl_borrower.borrower_CardNo
	WHERE tbl_borrower.borrower_BorrowerName='Joe Smith';

	/* 6.	Find the names of publishers for the books authored by "J.K. Rowling."
	// This query selects the publisher names from the tbl_publisher table // It joins the tbl_publisher table with the tbl_book table on the publisher name // 
	It then joins the tbl_book table with the tbl_book_authors table on the book ID // It filters the results to only include books authored by "J.K. Rowling"*/
	   
	    SELECT DISTINCT publisher_PublisherName FROM tbl_publisher
	    INNER JOIN tbl_book ON tbl_publisher.publisher_publisherName=tbl_book.book_publisherName
	    INNER JOIN tbl_book_authors ON tbl_book.book_BookID= tbl_book_authors.book_authors_BookID
	    WHERE tbl_book_authors.book_authors_AuthorName ='J.K. Rowling';

	/*7.Count the total number of books available in the library.
	It will give total number of books available in the library by summing up the number of copies of each book in the tbl_book_copies table.*/
	
	   SELECT SUM(book_copies_No_Of_Copies) AS total_books
	   FROM tbl_book_copies;




 /* 8.Calculate the average number of copies available per book across all branches.
	  Query retrieves the average number of book copies at each library branch by joining the tbl_book_copies table with the tbl_library_branch table on the branch ID.
	 It then groups the results by the branch name and calculates the average number of book copies for each branch..*/
	
	SELECT library_branch_BranchName, avg(book_copies_BookID) AS average_copies
	FROM tbl_book_copies
	JOIN tbl_library_branch ON tbl_book_copies.book_copies_BranchID=tbl_library_branch.library_branch_BranchID
	GROUP BY library_branch_BranchName;

	
	/*9.Find the branch with the highest number of books loaned out.*/
	/* This query retrieves information about the library branch with the highest number of books loaned out. It selects the top 1 branch based on the total number of books loaned out
	from the tbl_library_branch and tbl_book_loans tables. It joins the two tables on the library_branch_BranchID and book_loans_BranchID columns. 
	It then groups the results by library_branch_BranchName and library_branch_BranchID, counting the total number of books loaned for each branch and orders the results in descending order based on the total number of books loaned. */
       
	   SELECT TOP 1 library_branch_BranchID, library_branch_BranchName, COUNT(book_loans_LoansID) AS total_books_loaned 
	   FROM tbl_library_branch 
	   JOIN tbl_book_loans ON tbl_library_branch.library_branch_BranchID=tbl_book_loans.book_loans_BranchID
	   GROUP BY library_branch_BranchName,library_branch_BranchID
	   ORDER BY total_books_loaned DESC;
   

   /* 10.	Insert a new book titled "The Catcher in the Rye" by "J.D. Salinger" into the database*/
        
        INSERT INTO tbl_book(book_BookID, book_Title, book_PublisherName) VALUES ('21', 'The Catcher in the Rye', 'Little, Brown and Company')
		INSERT INTO tbl_book_authors (book_authors_AuthorID, book_authors_BookID, book_authors_AuthorName) VALUES ('021', '21', 'J.D. Salinger');
		

		/*check the tables after adding new values*/
		SELECT * FROM tbl_book
		SELECT * FROM tbl_book_authors
		


  /* 11.Update the address of the "Sharpstown" library branch to "45 West Side Avenue, New York, NY 10012."*/
      UPDATE tbl_library_branch
	  SET library_branch_BranchAddress = '45 West Side Avenue, New York, NY 10012'
	  WHERE library_branch_BranchName = 'Sharpstown';

	  /*check the table after updating address*/
	  SELECT * FROM tbl_library_branch

  /* 12.Remove all books published by "Pan Books" from the database.
  This query deletes books published bt pan books from publisher table*/
   
       DELETE FROM tbl_publisher
	   WHERE publisher_publisherName='pan books';

	  
	   /*check table for changes*/
	   SELECT * FROM tbl_book
	   WHERE book_publisherName='pan books';
	       /*OR*/
	   SELECT * FROM tbl_publisher

  /*13.	Retrieve the names of borrowers who have borrowed the same book more than once
  /This query retrieves the names of borrowers who have borrowed the same book more than once by using an inner join between the tbl_borrower and tbl_book_loans tables 
  on the borrower card number. It then groups the results by borrower name and book ID, and filters the results to only include borrowers who have borrowed the same book more than once using the HAVING clause with a COUNT function.*/
     SELECT borrower_borrowername FROM tbl_borrower
	 INNER JOIN tbl_book_loans ON tbl_borrower.borrower_CardNo=tbl_book_loans.book_loans_CardNo
	 GROUP BY borrower_BorrowerName
	 HAVING COUNT(book_loans_LoansID)>1;
	 	 	 	  
  /*14.	Find the title of the book with the earliest due date.
  This query retrieves the book title and due date of the book with the earliest due date from the tbl_book_loans table, after joining it with the tbl_book table. 
  The results are ordered by due date in ascending order.*/
        
       SELECT TOP 1 book_Title, book_loans_DueDate
       FROM tbl_book_loans
       INNER JOIN tbl_book ON tbl_book_loans.book_loans_bookID = tbl_book.book_BookID
       ORDER BY book_loans_DueDate;
	   		 	   
       
	   		 
  /*15.	List the names of borrowers who have borrowed books authored by both "Stephen King" and "J.K. Rowling
   Query retrieves the distinct borrower names who have borrowed books authored by Stephen King then join the borrower, book loans, book, and book authors tables. 
   The condition is specified to only include books authored by Stephen King.Next find the borrower card numbers who have borrowed books authored by J.K. Rowling. This involves joining the same tables and specifying the condition for J.K. Rowling as the author.
   The borrower names who have borrowed books from both Stephen King and J.K. Rowling are selected by using the borrower card numbers obtained from the previous step. This ensures that only borrowers who have borrowed books from both authors are included in the final result.*/
       
	   SELECT DISTINCT b.borrower_BorrowerName FROM tbl_borrower b JOIN tbl_book_loans bl ON b.borrower_CardNo = bl.book_loans_CardNo JOIN tbl_book tb 
		ON bl.book_loans_BookID = tb.book_BookID JOIN tbl_book_authors ba ON tb.book_BookID = ba.book_authors_BookID WHERE ba.book_authors_AuthorName = 'Stephen King' 
		AND b.borrower_CardNo IN ( SELECT b.borrower_CardNo FROM tbl_borrower b JOIN tbl_book_loans bl ON b.borrower_CardNo = bl.book_loans_CardNo JOIN tbl_book tb 
		ON bl.book_loans_BookID = tb.book_BookID JOIN tbl_book_authors ba ON tb.book_BookID = ba.book_authors_BookID WHERE ba.book_authors_AuthorName = 'J.K. Rowling' )


  /*16.	Find the names of borrowers who have borrowed books published by "Bloomsbury.
  The query selects distinct borrower names and the publisher name 'Bloomsbury' from the tbl_borrower table. It starts by joining tbl_borrower with tbl_book_loans on borrower_CardNo and book_loans_CardNo
  further joins tbl_book_loans with tbl_book on book_loans_BookID and book_BookID then joins tbl_book with tbl_publisher on book_publisherName and publisher_publisherName Finally, a conditional clause is included to filter the results where the book_publisherName is 'Bloomsbury'*/
        
		SELECT DISTINCT borrower_borrowername,book_publisherName FROM tbl_borrower
		JOIN tbl_book_loans ON tbl_borrower.borrower_CardNo=tbl_book_loans.book_loans_CardNo
		JOIN tbl_book ON tbl_book_loans.book_loans_BookID=tbl_book.book_BookID
		JOIN tbl_publisher ON tbl_book.book_publisherName = tbl_publisher.publisher_publisherName 
		WHERE book_publisherName= 'Bloomsbury';


  /*17.	Retrieve the titles of books borrowed by borrowers located in New York.
  This SQL query selects distinct book titles from the tbl_book_loans table by joining it with the tbl_book and tbl_borrower tables -- The join conditions are based on the BookID and CardNo fields -- It then filters the results to only include borrowers with addresses containing 'New York' in their BorrowerAddress field -- 
  The DISTINCT keyword ensures that only unique book titles are returned in the result set*/
        
		SELECT DISTINCT book_title FROM tbl_book_loans
		JOIN tbl_book ON tbl_book_loans.book_loans_BookID =tbl_book.book_BookID
		JOIN tbl_borrower ON tbl_book_loans.book_loans_CardNo=tbl_borrower.borrower_CardNo
		WHERE borrower_BorrowerAddress like  '%New York%'
				
		
  /*18.	Calculate the average number of books borrowed per borrower.
  Join the tbl_borrower and tbl_book_loans tables on the borrower_CardNo and book_loans_CardNo columns to get the borrower name and the number of books borrowed by each borrower.
  Count the number of books borrowed by each borrower and group the results by borrower name.Calculate the average number of books borrowed per borrower by taking the average of the books_borrowed column.Group the results by borrower name to get the average number of books borrowed for each borrower*/
    
	SELECT borrower_BorrowerName, AVG(books_borrowed) AS avg_books_borrowed
    FROM (SELECT borrower_BorrowerName, COUNT(book_loans_BookID) AS books_borrowed
	FROM tbl_borrower
	LEFT JOIN tbl_book_loans ON tbl_borrower.borrower_CardNo = tbl_book_loans.book_loans_CardNo
	GROUP BY borrower_BorrowerName) AS subquery
    GROUP BY borrower_BorrowerName;



  /*19.	Find the branch with the highest average number of books borrowed per borrower.
   select the borrower name, library branch name, and count of book loans from the tables tbl_book_loans, tbl_borrower, and tbl_library_branch, join the 
   tbl_book_loans table with tbl_borrower on the CardNo key to link borrowers with their book loans, and join the tbl_book_loans table with tbl_library_branch 
   on the BranchID key to link library branches with book loans.then group the results by library branch name and borrower name to get the count of books borrowed
   per borrower at each branch. order the results in descending order based on the count of borrowed books to find the branch with the highest average number of 
   books borrowed per borrower*/
        
		SELECT TOP 1  (borrower_borrowername),library_branch_branchname, COUNT(book_loans_BookID) AS borrowed_books FROM tbl_book_loans
		join tbl_borrower ON tbl_book_loans.book_loans_CardNo=tbl_borrower.borrower_CardNo
		join tbl_library_branch ON tbl_book_loans.book_loans_BranchID=tbl_library_branch.library_branch_BranchID
		GROUP BY library_branch_BranchName, borrower_BorrowerName
		ORDER BY borrowed_books DESC;
			
		

  /*20.	Rank library branches based on the total number of books borrowed, without grouping*/
    --join the tbl_book_loans and tbl_library_branch tables on their common BranchID. Then use a subquery to calculate the total number of books borrowed for each library branch using the COUNT function. 
	--Next use the DENSE_RANK() function to assign a rank to each library branch based on the total_books_borrowed in descending order then select the library_branch_BranchName, library_ranking, and total_books_borrowed from the subquery to display the ranking of library branches based on the total number of books borrowed.
	
	SELECT library_branch_BranchName, ROW_NUMBER() OVER (ORDER BY total_books_borrowed DESC) AS library_ranking, total_books_borrowed 
	FROM ( SELECT library_branch_BranchName, COUNT(book_loans_loansid) AS total_books_borrowed 
	FROM tbl_book_loans JOIN tbl_library_branch ON tbl_book_loans.book_loans_BranchID = tbl_library_branch.library_branch_BranchID GROUP BY library_branch_BranchName ) AS subquery;


 /*21.	Calculate the percentage of books borrowed from each branch relative to the total number of books borrowed across all branches.
  calculate the percentage of books borrowed from each branch relative to the total number of books borrowed across all branches.Join the tbl_book_loans table with tbl_library_branch table based on the branch ID to get the branch name.
  count the number of book loans for each branch and multiply by 100 to get the percentage.Divide the total number of book loans by the total number of books borrowed across all branches.Group the results by branch ID and branch name to display them individually. */
       
	   SELECT library_branch_BranchID, library_branch_BranchName, COUNT(book_loans_BookID) * 100 / (SELECT COUNT(*) FROM tbl_book_loans) AS percentage FROM tbl_book_loans
       INNER JOIN tbl_library_branch ON tbl_book_loans.book_loans_BranchID = tbl_library_branch.library_branch_BranchID
       GROUP BY library_branch_BranchID, library_branch_BranchName;
	   
	   
	 

  /*22.	Find the names of borrowers who have borrowed books authored by "Stephen King" and "J.K. Rowling" from the same library branch.*/
     --select borrowers name and brancha id and join tbl borrower with tbl book on card number then join book loans and book authors table on book id and filter results and include 
	 --authors name and group results on borrowers name and branch id
   
   SELECT borrower_BorrowerName, book_loans_BranchID
    FROM tbl_borrower
    JOIN tbl_book_loans ON tbl_borrower.borrower_CardNo = tbl_book_loans.book_loans_CardNo
    JOIN tbl_book_authors ON tbl_book_loans.book_loans_BookID = tbl_book_authors.book_authors_BookID
    WHERE tbl_book_authors.book_authors_AuthorName = 'Stephen King' AND tbl_book_authors.book_authors_AuthorName = 'J.K. Rowling'
    GROUP BY borrower_BorrowerName, book_loans_BranchID;


	
  /*23.	Retrieve the names of borrowers who have borrowed books from branches located in New York and have more than 5 books checked out.*/
--   retrieve the distinct borrower names from the borrower table.
--Join the borrower table with the book loans table on the borrower's card number.
--Join the book loans table with the library branch table on the branch ID.
--Specify the condition that the branch address must be in New York.
--Use a subquery to count the number of books checked out by each borrower and filter for those with more than 5 books checked out.
  
  SELECT DISTINCT borrower_BorrowerName 
  FROM tbl_borrower
  JOIN tbl_book_loans ON tbl_borrower.borrower_CardNo = tbl_book_loans.book_loans_CardNo
  JOIN tbl_library_branch ON tbl_book_loans.book_loans_BranchID = tbl_library_branch.library_branch_BranchID
  WHERE tbl_library_branch.library_branch_BranchAddress LIKE '%New York%'
  AND (SELECT COUNT(*) FROM tbl_book_loans WHERE book_loans_CardNo = borrower_CardNo) > 5;


  
  /*24.	How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?*/
  --retrieve number of copies of 'the lost tribe' book owned by library branch.
    --join tbl_book_copies table with the tbl_book table  then join tbl_book_copies table with the tbl_library_branch and filter the results to only include the book and show number of copies of the book
  
    SELECT library_branch_BranchName, book_copies_No_Of_Copies
	FROM tbl_book_copies
    JOIN tbl_book ON tbl_book_copies.book_copies_BookID = tbl_book.book_BookID
    JOIN tbl_library_branch ON tbl_book_copies.book_copies_BranchID = tbl_library_branch.library_branch_BranchID
    WHERE tbl_book.book_Title = 'The Lost Tribe' AND tbl_library_branch.library_branch_BranchName = 'Sharpstown'
	
	

  /*25.	How many copies of the book titled "The Lost Tribe" are owned by each library branch?*/
  --retrieves the total number of copies of the book titled "The Lost Tribe" owned by each library branch. It joins the tables tbl_book_copies, tbl_book, and tbl_library_branch 
  --to gather the necessary information on book copies, book titles, and library branches. The result is grouped by library branch name to display the total number of copies per branch.
    
	SELECT library_branch_BranchName, sum(book_copies_No_Of_Copies) as total_copies
    FROM tbl_book_copies
    JOIN tbl_book ON tbl_book_copies.book_copies_BookID = tbl_book.book_BookID
    JOIN tbl_library_branch ON tbl_book_copies.book_copies_BranchID = tbl_library_branch.library_branch_BranchID
	WHERE tbl_book.book_Title = 'The Lost Tribe'
    GROUP BY library_branch_BranchName
 
 
  /*26.	Retrieve the names of all borrowers who do not have any books checked out.
  --query retrieves the names of all borrowers who do not have any books checked out by using left join between the tbl_borrower and tbl_book_loans tables on the borrower_CardNo and 
  --book_loans_CardNo then filter out any results where the book_loans_CardNo is null, indicating that the borrower does not have any books checked out */
  
  SELECT DISTINCT borrower_borrowername
  FROM tbl_borrower
  LEFT JOIN tbl_book_loans ON tbl_borrower.borrower_CardNo=tbl_book_loans.book_loans_CardNo
  WHERE tbl_book_loans.book_loans_CardNo is null

  
  /*27.	For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address. *
  retrieve the book title, borrower's name, and borrower's address for each book loaned out from the "Sharpstown" branch with a DueDate of today.Join the tbl_book_loans table with the tbl_book table then
  Join the tbl_borrower table on the borrower's card number to get the borrower's name and address.Join the tbl_library_branch table on the branch ID to filter for loans from the "Sharpstown" branch with a condition to only select loans with a DueDate of '2/2/18'.*/
  
    SELECT tbl_book.book_Title, tbl_borrower.borrower_BorrowerName, tbl_borrower.borrower_BorrowerAddress FROM tbl_book_loans
	JOIN tbl_book ON tbl_book_loans.book_loans_BookID=tbl_book.book_BookID
	JOIN tbl_borrower ON tbl_book_loans.book_loans_CardNo=tbl_borrower.borrower_CardNo
	JOIN tbl_library_branch ON tbl_book_loans.book_loans_BranchID=tbl_library_branch.library_branch_BranchID
	WHERE tbl_library_branch.library_branch_BranchName='Sharpstown' and tbl_book_loans.book_loans_DueDate='2/2/18'
	

  /*28.	For each library branch, retrieve the branch name and the total number of books loaned out from that branch.
  query retrieves the branch name and the total number of books loaned out from each branch by joining the tbl_library_branch and tbl_book_loans tables, grouping the results by branch name, 
  and ordering them in descending order based on the total number of books loaned out*/
 
 SELECT library_branch_branchname, COUNT(book_loans_LoansID) AS total_books_loaned
 FROM tbl_library_branch
 INNER JOIN tbl_book_loans ON tbl_library_branch.library_branch_BranchID=tbl_book_loans.book_loans_BranchID
 GROUP BY library_branch_BranchName
 ORDER BY total_books_loaned;








