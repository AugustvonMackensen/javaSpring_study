DROP TABLE USERS CASCADE CONSTRAINTS;
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE NOTICE CASCADE CONSTRAINTS;
DROP TABLE BOARD CASCADE CONSTRAINTS;

CREATE TABLE MEMBER(
  USERID VARCHAR2(15) CONSTRAINT PK_MEMBER_UID PRIMARY KEY,
  USERPWD VARCHAR2(100) NOT NULL,
  USERNAME VARCHAR2(20) NOT NULL,
  GENDER CHAR(1)  NOT NULL,
  AGE NUMBER(3)   NOT NULL,
  PHONE VARCHAR2(13),
  EMAIL VARCHAR2(30),
  HOBBY VARCHAR2(100),
  ETC  VARCHAR2(1000),
  ENROLL_DATE DATE DEFAULT SYSDATE,
  LASTMODIFIED DATE DEFAULT SYSDATE  
);

CREATE TABLE USERS (
  USERID VARCHAR2(15) PRIMARY KEY,
  USERPWD VARCHAR2(100) NOT NULL,
  USERNAME VARCHAR2(20) NOT NULL
);

ALTER TABLE USERS
DROP PRIMARY KEY;

-- �������� �߰��� �� �������� �߰���
ALTER TABLE USERS
ADD CONSTRAINT FK_MEMBER_UID 
FOREIGN KEY(USERID) REFERENCES MEMBER ON DELETE CASCADE;

-- TRIGGER �ۼ� : �̸� - TRI_INSERT_USERS
-- MEMBER ���̺� �� ȸ�������� ��ϵǸ�, �ڵ����� USERS ���̺� ���̵�, ��ȣ, �̸���
-- INSERT �ǰ� ��
CREATE OR REPLACE TRIGGER TRI_INSERT_USERS
AFTER INSERT ON MEMBER
FOR EACH ROW
BEGIN
  INSERT INTO USERS
  VALUES (:NEW.USERID, :NEW.USERPWD, :NEW.USERNAME);
END;
/

CREATE OR REPLACE TRIGGER TRI_UPDATE_USERS
AFTER UPDATE ON MEMBER
FOR EACH ROW
BEGIN
  UPDATE USERS 
  SET USERPWD = :NEW.USERPWD
  WHERE USERID = :OLD.USERID;
END;
/

INSERT INTO MEMBER VALUES ('admin', 'admin', '������', 'M', 35, '010-1111-9999', 
'admin@ncs.kr', 'game,reading,music', '�������Դϴ�.', to_date('2016-06-25', 'RRRR-MM-DD'), 
sysdate);

INSERT INTO MEMBER
VALUES ('user01', 'pass01', 'ȫ�浿', 'M', 25, '010-1234-5678', 'hong1234@ncs.kr', 
        'climb,sport', '������ ��� �����̴� Ȱ���� �����մϴ�.', default, default);
        
INSERT INTO MEMBER
VALUES ('user02', 'pass02', '�Ż��Ӵ�', 'F', 45, '010-4545-9999', 'dano99@ncs.kr', 
        'reading,music', '������ ���̰�, �Ĳ��� �����Դϴ�.', default, default);
        

COMMIT;

-- notice ���̺�
DROP TABLE NOTICE;

CREATE TABLE NOTICE(
  NOTICENO NUMBER CONSTRAINT PK_NOTICENO PRIMARY KEY,
  NOTICETITLE VARCHAR2(50) NOT NULL,
  NOTICEDATE DATE DEFAULT SYSDATE,
  NOTICEWRITER VARCHAR2(15) NOT NULL,
  NOTICECONTENT VARCHAR2(2000),
  FILEPATH VARCHAR2(100),
  CONSTRAINT FK_NOTICEWRITER FOREIGN KEY (NOTICEWRITER) 
      REFERENCES MEMBER ON DELETE CASCADE
);

ALTER TABLE NOTICE
DROP COLUMN FILEPATH;

ALTER TABLE NOTICE
ADD (ORIGINAL_FILEPATH VARCHAR2(100));

ALTER TABLE NOTICE
ADD (RENAME_FILEPATH VARCHAR2(100));

COMMIT;

INSERT INTO NOTICE VALUES (1, '���� ���� ����', SYSDATE, 'user01', 
'���� ���񽺰� ���µǾ����ϴ�. ���� �̿��� �ּ���.', null, null);
INSERT INTO NOTICE VALUES ((select max(noticeno) + 1 from notice), 
'���� ���� ����2', SYSDATE, 'user01', 
'���� ���񽺰� ���µǾ����ϴ�. ���� �̿��� �ּ���.', null, null);
INSERT INTO NOTICE VALUES ((select max(noticeno) + 1 from notice), '���� ���� ����3', SYSDATE, 'user01', 
'���� ���񽺰� ���µǾ����ϴ�. ���� �̿��� �ּ���.', null, null);
INSERT INTO NOTICE VALUES ((select max(noticeno) + 1 from notice), '���� ���� ����4', SYSDATE, 'user01', 
'���� ���񽺰� ���µǾ����ϴ�. ���� �̿��� �ּ���.', null, null);
INSERT INTO NOTICE VALUES ((select max(noticeno) + 1 from notice), '���� ���� ����5', SYSDATE, 'user01', 
'���� ���񽺰� ���µǾ����ϴ�. ���� �̿��� �ּ���.', null, null);
INSERT INTO NOTICE VALUES ((select max(noticeno) + 1 from notice), '���� ���� ����6', SYSDATE, 'user01', 
'���� ���񽺰� ���µǾ����ϴ�. ���� �̿��� �ּ���.', null, null);
INSERT INTO NOTICE VALUES ((select max(noticeno) + 1 from notice), '���� ���� ����7', SYSDATE, 'user01', 
'���� ���񽺰� ���µǾ����ϴ�. ���� �̿��� �ּ���.', null, null);
INSERT INTO NOTICE VALUES ((select max(noticeno) + 1 from notice), '���� ���� ����8', SYSDATE, 'user01', 
'���� ���񽺰� ���µǾ����ϴ�. ���� �̿��� �ּ���.', null, null);
INSERT INTO NOTICE VALUES ((select max(noticeno) + 1 from notice), '���� ���� ����9', SYSDATE, 'user01', 
'���� ���񽺰� ���µǾ����ϴ�. ���� �̿��� �ּ���.', null, null);
INSERT INTO NOTICE VALUES ((select max(noticeno) + 1 from notice), '���� ���� ����10', SYSDATE, 'user01', 
'���� ���񽺰� ���µǾ����ϴ�. ���� �̿��� �ּ���.', null, null);
INSERT INTO NOTICE VALUES ((select max(noticeno) + 1 from notice), '���Ի�� ��������', 
TO_DATE('2016-07-15', 'RRRR-MM-DD'), 'user01', 
'���� ���񽺰� ���µǾ����ϴ�. ���� �̿��� �ּ���.', null, null);
INSERT INTO NOTICE VALUES ((select max(noticeno) + 1 from notice), '���Ի�� �������� ����', 
TO_DATE('2016-07-20', 'RRRR-MM-DD'), 'user01', 
'2016�� 7�� 20�� 18�ÿ� ���Ի�� ������ �����մϴ�.', null, null);

SELECT * FROM NOTICE;
 
commit;


-- BOARD TABLE SCRIPT FILE
DROP TABLE BOARD;

CREATE TABLE BOARD(
	BOARD_NUM	NUMBER,	
	BOARD_WRITER	 VARCHAR2(20) NOT NULL,
	BOARD_TITLE	VARCHAR2(50) NOT NULL,
	BOARD_CONTENT	VARCHAR2(2000) NOT NULL,
	BOARD_ORIGINAL_FILENAME	VARCHAR2(100),
    BOARD_RENAME_FILENAME VARCHAR2(100),
    BOARD_REF NUMBER,
	BOARD_REPLY_REF	NUMBER,
	BOARD_LEV	NUMBER DEFAULT 1,
	BOARD_REPLY_SEQ NUMBER DEFAULT 1,
	BOARD_READCOUNT	NUMBER DEFAULT 0,
	BOARD_DATE	DATE DEFAULT SYSDATE,
  CONSTRAINT PK_BOARD PRIMARY KEY (BOARD_NUM),
  CONSTRAINT FK_BOARD_WRITER FOREIGN KEY (BOARD_WRITER) REFERENCES MEMBER (USERID) ON DELETE CASCADE
);

COMMENT ON COLUMN BOARD.BOARD_NUM IS '�Խñ۹�ȣ';
COMMENT ON COLUMN BOARD.BOARD_WRITER IS '�ۼ��ھ��̵�';
COMMENT ON COLUMN BOARD.BOARD_TITLE IS '�Խñ�����';
COMMENT ON COLUMN BOARD.BOARD_CONTENT IS '�Խñ۳���';
COMMENT ON COLUMN BOARD.BOARD_DATE IS '�ۼ���¥';
COMMENT ON COLUMN BOARD.BOARD_ORIGINAL_FILENAME IS '����÷�����ϸ�';
COMMENT ON COLUMN BOARD.BOARD_RENAME_FILENAME IS '�ٲ�÷�����ϸ�';
COMMENT ON COLUMN BOARD.BOARD_REF IS '���۹�ȣ';  -- ���۹�ȣ : ���� - �ڱ��ȣ, ���/���� : ���۹�ȣ
COMMENT ON COLUMN BOARD.BOARD_REPLY_REF IS '������۹�ȣ';  -- ���� : null, ������ ��/��� : �ڱ��ȣ, ����� ��� : ������۹�ȣ
COMMENT ON COLUMN BOARD.BOARD_LEV IS '��۴ܰ�'; -- ���� : 1, ������ ��� : 2, ����� ��� : 3
COMMENT ON COLUMN BOARD.BOARD_REPLY_SEQ IS '��ۼ���'; -- ���� : 0, ���� ������ ����� �� : 1 ....... ����ó��

INSERT INTO BOARD 
VALUES (1, 'admin', '������ �Խñ�', '���� ����Ʈ�� �̿��� �ּż� �����մϴ�.', 
NULL, NULL, 1, null, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO BOARD 
VALUES (2, 'user01', 'MVC Model2', '�� ���ø����̼� ���� ��� �� MVC ������ ���� ��2 ����� �� �����Դϴ�.', 
NULL, NULL, 2, null, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO BOARD 
VALUES (3, 'user02', '������2', '������ 2��°�δ� First Controller �� ����ϴ� ����� �ֽ��ϴ�.', 
NULL, NULL, 3, null, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO BOARD 
VALUES (4, 'user01', '������3', '3��° ����� �׼��� �̿��ϴ� ����Դϴ�.', 
NULL, NULL, 4, null, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO BOARD 
VALUES (5, 'user01', 'MVC Model2', '�� ���ø����̼� ���� ��� �� MVC ������ ���� ��2 ����� �� �����Դϴ�.', 
NULL, NULL, 5, null, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO BOARD 
VALUES (6, 'user02', '������2', '������ 2��°�δ� First Controller �� ����ϴ� ����� �ֽ��ϴ�.', 
NULL, NULL, 6, null, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO BOARD 
VALUES (7, 'user01', '������3', '3��° ����� �׼��� �̿��ϴ� ����Դϴ�.', 
NULL, NULL, 7, null, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO BOARD 
VALUES (8, 'user01', 'MVC Model2', '�� ���ø����̼� ���� ��� �� MVC ������ ���� ��2 ����� �� �����Դϴ�.', 
NULL, NULL, 8, null, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO BOARD 
VALUES (9, 'user02', '������2', '������ 2��°�δ� First Controller �� ����ϴ� ����� �ֽ��ϴ�.', 
NULL, NULL, 9, null, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO BOARD 
VALUES (10, 'user01', '������3', '3��° ����� �׼��� �̿��ϴ� ����Դϴ�.', 
NULL, NULL, 10, null, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO BOARD 
VALUES (11, 'user01', 'MVC Model2', '�� ���ø����̼� ���� ��� �� MVC ������ ���� ��2 ����� �� �����Դϴ�.', 
NULL, NULL, 11, null, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO BOARD 
VALUES (12, 'user02', '������2', '������ 2��°�δ� First Controller �� ����ϴ� ����� �ֽ��ϴ�.', 
NULL, NULL, 12, null, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO BOARD 
VALUES (13, 'user01', '������3', '3��° ����� �׼��� �̿��ϴ� ����Դϴ�.', 
NULL, NULL, 13, null, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

SELECT * FROM BOARD;

COMMIT;

-- �÷� �߰� �� �������� �߰� : MEMBER ���̺�
-- �α��� ���ѿ��� ���� �÷� �߰�
ALTER TABLE MEMBER
ADD (LOGIN_OK CHAR(1) DEFAULT 'Y');

SELECT * FROM MEMBER;

ALTER TABLE MEMBER
ADD CONSTRAINT CHK_MEMB_LOK CHECK (LOGIN_OK IN ('Y', 'N'));

-- �����ڿ� ȸ�� ���п� �÷� �߰�
ALTER TABLE MEMBER
ADD (ADMIN CHAR(1) DEFAULT 'N');
-- 'Y' : ������, 'N' : ȸ��

SELECT * FROM MEMBER;

-- �������� 'admin' �� ���̵��� �÷��� ����
UPDATE MEMBER
SET ADMIN = 'Y'
WHERE USERID = 'admin';

commit;

select * from member;

-- notice �� ������ ����� �����ڸ� ���/������ �� �ְ� ó����
-- ������ ����� ���̵� ���� : user01 >> admin ���� ����
UPDATE NOTICE
SET NOTICEWRITER = 'admin';

commit;

select * from notice;
