CREATE TABLE tblCat (
    seq NUMBER PRIMARY KEY,
    catId VARCHAR2(50) NOT NULL,
    x NUMBER NOT NULL,
    y NUMBER NOT NULL
);

INSERT INTO tblCat VALUES (1, 'cat1', 0, 0);
INSERT INTO tblCat VALUES (2, 'cat2', 0, 0);
INSERT INTO tblCat VALUES (3, 'cat3', 0, 0);
INSERT INTO tblCat VALUES (4, 'cat4', 0, 0);
INSERT INTO tblCat VALUES (5, 'cat5', 0, 0);

SELECT * FROM tblCat;

DROP TABLE tblCat;

COMMIT;
