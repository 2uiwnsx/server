CREATE TABLE tblMemo (
    seq NUMBER PRIMARY KEY,
    name VARCHAR2(30) NOT NULL,
    pswd VARCHAR2(30) NOT NULL,
    memo VARCHAR2(2000) NOT NULL,
    regdate DATE DEFAULT SYSDATE NOT NULL
);

CREATE SEQUENCE memoSeq;

SELECT * FROM tblMemo;

DROP SEQUENCE memoSeq;

DROP TABLE tlbMemo;

COMMIT;
