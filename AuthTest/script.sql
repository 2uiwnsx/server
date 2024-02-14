CREATE TABLE tblUser(
    id VARCHAR2(30) PRIMARY KEY,
    pswd VARCHAR2(30) NOT NULL,
    name VARCHAR2(30) NOT NULL,
    lv NUMBER(1) NOT NULL
);

INSERT INTO tblUser VALUES ('hong', '1111', '홍길동', 1);
INSERT INTO tblUser VALUES ('test', '1111', '테스트', 1);
INSERT INTO tblUser VALUES ('admin', '1111', '관리자', 2);

SELECT * FROM tblUser;

DROP TABLE tblUser;

COMMIT;
