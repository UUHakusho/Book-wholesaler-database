/*ON DELETE WAS UNNECESSARY AS ITS ACTUALLY QUITE BAD IN CATEGORY*/
CREATE TABLE Category
(
	CategoryID		INTEGER NOT NULL,
	Name			VARCHAR(50) NOT NULL,
	CategoryType 	VARCHAR(20) NOT NULL,
	CONSTRAINT Category_pk    PRIMARY KEY (CategoryID),
	CONSTRAINT CHK_CategoryID CHECK (CategoryID > 0 AND CategoryID <= 5000) /*Category ID number must be less than 5001, to avoid absurdly long IDs*/ 
); 

CREATE TABLE SalesRep
(
	SalesRepID		INTEGER NOT NULL,
	Name			VARCHAR(50) NOT NULL,
	CONSTRAINT SalesRep_pk    PRIMARY KEY (SalesRepID),
	CONSTRAINT CHK_SalesRepID CHECK (SalesRepID > 0 AND SalesRepID <= 5000)
);

CREATE TABLE Shop 
(
	ShopID			INTEGER NOT NULL,
	Name			VARCHAR(50) NOT NULL,
	CONSTRAINT Shop_pk    PRIMARY KEY (ShopID),
	CONSTRAINT CHK_ShopID CHECK (ShopID > 0 AND ShopID <= 5000)	
);

CREATE TABLE Publisher
(
	PublisherID		INTEGER NOT NULL,
	Name			VARCHAR(50) NOT NULL,
	CONSTRAINT PublisherID_pk  PRIMARY KEY (PublisherID),
	CONSTRAINT CHK_PublisherID CHECK (PublisherID > 0 AND PublisherID <= 5000)
);

CREATE TABLE Book
(
	BookID			INTEGER NOT NULL,
	Title			VARCHAR(50) NOT NULL,
	Price			DECIMAL(10,2) NOT NULL,
	CategoryID		INTEGER NOT NULL,
	PublisherID		INTEGER NOT NULL,
	CONSTRAINT Book_pk        PRIMARY KEY (BookID),
	FOREIGN KEY (CategoryID)  REFERENCES Category,
	FOREIGN KEY (PublisherID) REFERENCES Publisher,
	CONSTRAINT CHK_BookID     CHECK (BookID > 0 AND BookID <= 5000)
);

CREATE TABLE ShopOrder
(
	ShopOrderID		INTEGER NOT NULL,
	OrderDate		DATE NOT NULL,
	ShopID			INTEGER NOT NULL,
	SalesRepID		INTEGER NOT NULL,
	CONSTRAINT ShopOrderID_pk  PRIMARY KEY (ShopOrderID),
	FOREIGN KEY (ShopID)       REFERENCES Shop,
	FOREIGN KEY (SalesRepID)   REFERENCES SalesRep,
	CONSTRAINT CHK_ShopOrderID CHECK (ShopOrderID > 0 AND ShopOrderID <= 5000 )
);

CREATE TABLE Orderline
(
	ShopOrderID		 INTEGER NOT NULL,
	BookID			 INTEGER NOT NULL,
	Quantity		 INTEGER NOT NULL DEFAULT 0, /* If there is no value for quantity, the record will be defaulted to zero */
	UnitSellingPrice DECIMAL (10,2) NOT NULL,
	PRIMARY KEY (ShopOrderID, BookID) /*Composite key*/ 
); 

/*Altered Category table so that CategoryType can ONLY be fiction or non-fiction */
ALTER TABLE Category
ADD CONSTRAINT CHK_CategoryType CHECK (CategoryType in ('Fiction', 'Non-fiction'));

/*Altered Orderline so that Quantity must be a positive integer or 0*/
ALTER TABLE Orderline
ADD CONSTRAINT CHK_Quantity CHECK (Quantity >= 0);

/*Need to reinforce referential integreity so I added ON DELETE AND ON UPDATE to my foreign keys*/
ALTER TABLE Book
DROP CONSTRAINT book_categoryid_fkey
DROP CONSTRAINT book_publisherid_fkey;

ALTER TABLE Book
ADD FOREIGN KEY (CategoryID)  REFERENCES Category  ON DELETE CASCADE ON UPDATE CASCADE,
ADD	FOREIGN KEY (PublisherID) REFERENCES Publisher ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE ShopOrder 
DROP CONSTRAINT shoporder_salesrepid_fkey
DROP CONSTRAINT shoporder_shopid_fkey;

ALTER TABLE ShopOrder
ADD FOREIGN KEY (ShopID)       REFERENCES Shop     ON DELETE CASCADE ON UPDATE CASCADE,
ADD FOREIGN KEY (SalesRepID)   REFERENCES SalesRep ON DELETE CASCADE ON UPDATE CASCADE;

/*Forgot to make ShopOrder and Book foreign keys as well as composite keys*/
ALTER TABLE Orderline
ADD FOREIGN KEY (ShopOrderID) REFERENCES ShopOrder ON DELETE CASCADE ON UPDATE CASCADE,
ADD FOREIGN KEY (BookID)      REFERENCES Book      ON DELETE CASCADE ON UPDATE CASCADE;


