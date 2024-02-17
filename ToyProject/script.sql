-- 게시판

CREATE TABLE tblVisitor (
    id VARCHAR2(50) PRIMARY KEY,
    pswd VARCHAR2(50) NOT NULL,
    name VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) NOT NULL,
    pic VARCHAR2(100) DEFAULT 'pic.png' NOT NULL,
    intro VARCHAR2(500) NOT NULL,
    lv CHAR(1) NOT NULL,
    ing CHAR(1) DEFAULT 'y' NOT NULL
);

INSERT INTO tblVisitor (id, pswd, name, email, lv, pic, intro, ing) VALUES ('hong', '1111', '홍길동', 'hong@gmail.com', '1', DEFAULT, 'Java를 공부하는 학생입니다.', DEFAULT);
INSERT INTO tblVisitor (id, pswd, name, email, lv, pic, intro, ing) VALUES ('test', '1111', '테스트', 'test@naver.com', '1', DEFAULT, 'Oracle을 공부하는 학생입니다.', DEFAULT);
INSERT INTO tblVisitor (id, pswd, name, email, lv, pic, intro, ing) VALUES ('admin', '1111', '관리자', 'admin@gmail.com', '2', DEFAULT, '관리자입니다.', DEFAULT);

SELECT * FROM tblVisitor;

DROP TABLE tblVisitor;

CREATE TABLE tblBoard (
    seq NUMBER PRIMARY KEY,
    id VARCHAR2(50) NOT NULL REFERENCES tblVisitor(id),
    subject VARCHAR2(300) NOT NULL,
    content VARCHAR2(4000) NOT NULL,
    regdate DATE DEFAULT SYSDATE NOT NULL,
    readCount NUMBER DEFAULT 0 NOT NULL
);

CREATE SEQUENCE boardSeq;

SELECT * FROM tblBoard;

DROP SEQUENCE boardSeq;

DROP TABLE tblBoard;

CREATE TABLE tblComment (
    seq NUMBER PRIMARY KEY,
    boardSeq NUMBER NOT NULL REFERENCES tblBoard(seq),
    id VARCHAR2(50) NOT NULL REFERENCES tblVisitor(id),
    content VARCHAR2(1000) NOT NULL,
    regdate DATE DEFAULT SYSDATE NOT NULL
);

CREATE SEQUENCE commentSeq;

SELECT * FROM tblComment;

DROP SEQUENCE commentSeq;

DROP TABLE tblComment;

CREATE OR REPLACE VIEW vwBoard AS (
    SELECT
        seq,
        id,
        (SELECT name FROM tblVisitor WHERE id = tblBoard.id) AS name,
        subject,
        content,
        CASE
            WHEN TO_CHAR(regdate, 'YYYY-MM-DD') = TO_CHAR(SYSDATE, 'YYYY-MM-DD') THEN TO_CHAR(regdate, 'HH24:MI:SS')
            ELSE TO_CHAR(regdate, 'YYYY-MM-DD')
        END AS regdate,
        CASE
            WHEN (SYSDATE - regdate) < (30 / 24 / 60) THEN 1
            ELSE 0
        END AS isNew,
        readCount,
        (SELECT COUNT(*) FROM tblComment WHERE boardSeq = tblBoard.seq) AS cmtCount
    FROM
        tblBoard
);

SELECT * FROM vwBoard;

DROP VIEW vwBoard;

COMMIT;


-- 지도

CREATE TABLE tblMarker (
    seq NUMBER PRIMARY KEY,
    lat NUMBER NOT NULL,
    lng NUMBER NOT NULL
);

CREATE SEQUENCE markerSeq;

SELECT * FROM tblMarker;

DROP SEQUENCE markerSeq;

DROP TABLE tblMarker;

CREATE TABLE tblPlace (
    seq NUMBER PRIMARY KEY,
    category VARCHAR2(100) DEFAULT 'default' NOT NULL,
    name VARCHAR2(100) NOT NULL,
    lat NUMBER NOT NULL,
    lng NUMBER NOT NULL
);

CREATE SEQUENCE placeSeq;

SELECT * FROM tblPlace;

DROP SEQUENCE placeSeq;

DROP TABLE tblPlace;
