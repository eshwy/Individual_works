/*TABLE_CREATION*/

CREATE TABLE BOOK(
CUS_NAME VARCHAR(30) NOT NULL,
CUS_NUMBER NUMERIC(10,0) NOT NULL,
EMAIL VARCHAR(50) NOT NULL,
PACKAGE_WEIGHT NUMERIC(6) NOT NULL,
VEHICLE_TYPE VARCHAR(30) NOT NULL,
FROM_ADDRESS VARCHAR(50) NOT NULL,
FROM_CITY VARCHAR(10) NOT NULL,
TO_ADDRESS VARCHAR(50) NOT NULL,
TO_CITY VARCHAR(10) NOT NULL,
DATE_OF_SHIPMENT DATE NOT NULL,
VEHICLE_ID VARCHAR(MAX) NOT NULL,
BOOKING_ID VARCHAR(11) NOT NULL,
INSURANCE BIT NOT NULL,
STATUS_ID BIT NOT NULL,
ModifiedBy VARCHAR(20) NOT NULL,
ModifiedDate DATETIME NOT NULL,
RecordStatus BIT NOT NULL,
RowGUID VARCHAR(MAX));

-------------------------------------------------------------------------------------------------------
--------------------CREATE---------------------
CREATE PROCEDURE CREATE_BOOK
@C_NAME VARCHAR(30),
@C_NUMBER NUMERIC(10),
@C_EMAIL VARCHAR(50),
@P_WEIGHT NUMERIC(6),
@V_TYPE VARCHAR(30),
@F_ADDRESS VARCHAR(50),
@F_CITY VARCHAR(10),
@T_ADDRESS VARCHAR(50),
@T_CITY VARCHAR(10),
@D_OF_SHIPMENT DATE,
@V_ID VARCHAR(MAX),
@B_ID VARCHAR(11),
@INSURANCE_Y_N BIT
AS
BEGIN
INSERT INTO BOOK VALUES(@C_NAME,@C_NUMBER,@C_EMAIL,@P_WEIGHT, @V_TYPE,@F_ADDRESS,@F_CITY, @T_ADDRESS,@T_CITY,@D_OF_SHIPMENT,@V_ID,@B_ID,@INSURANCE_Y_N,CURRENT_USER, CURRENT_TIMESTAMP ,CURRENT_USER, CURRENT_TIMESTAMP, 1, NEWID());
END

 ----------------------------------------------------------------------------------------------------------
------------UPDATE---------------

CREATE PROCEDURE UPD_BOOK_DETAILS

@S_ID BIT,
@C_NAME VARCHAR(30)

AS
BEGIN

UPDATE BOOK SET STATUS_ID=@S_ID, ModifiedBy = CURRENT_USER, ModifiedDate = CURRENT_TIMESTAMP WHERE CUS_NAME=@C_NAME;
END

-----------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE LIST_BOOK

AS
BEGIN

SELECT * FROM BOOK;

END