-- Ex03_Statement.java

CREATE TABLE tblAddress (
    seq NUMBER PRIMARY KEY,
    name VARCHAR2(30) NOT NULL,
    age NUMBER NOT NULL,
    gender CHAR(1) NOT NULL,
    address VARCHAR2(300) NOT NULL,
    regdate DATE DEFAULT SYSDATE NOT NULL
);

CREATE SEQUENCE addressSeq;

SELECT * FROM tblAddress;

DROP SEQUENCE addressSeq;

DROP TABLE tblAddress;

COMMIT;


-- Ex05_CallableStatement.java

CREATE OR REPLACE PROCEDURE procM1
IS
BEGIN
    UPDATE tblAddress SET age = (age + 1);
END procM1;
/

SELECT * FROM tblAddress;

CREATE OR REPLACE PROCEDURE procM2(
    pName tblAddress.name%TYPE,
    pAge tblAddress.age%TYPE,
    pGender tblAddress.gender%TYPE,
    pAddress tblAddress.address%TYPE
)
IS
BEGIN
    INSERT INTO tblAddress VALUES (addressSeq.NEXTVAL, pName, pAge, pGender, pAddress, DEFAULT);
END procM2;
/

SELECT * FROM tblAddress;

CREATE OR REPLACE PROCEDURE procM3(
    pCnt OUT NUMBER
)
IS
BEGIN
    SELECT COUNT(*) INTO pCnt FROM tblAddress;
END procM3;
/

CREATE OR REPLACE PROCEDURE procM4(
    pName OUT VARCHAR2,
    pAge OUT NUMBER,
    pAddress OUT VARCHAR2
)
IS
BEGIN
    SELECT name, age, address INTO pName, pAge, pAddress FROM tblAddress WHERE ROWNUM = 1;
END procM4;
/

CREATE OR REPLACE PROCEDURE procM5(
    pCursor OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN pCursor FOR
        SELECT * FROM tblAddress;
END procM5;
/
