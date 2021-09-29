-- ��� ���̺� ����    
DROP TABLE MEMBER;    

-- ��� ���̺� ����    
 create table MEMBER (
    MEMBER_ID varchar2(30),
    MEMBER_PW varchar2(20) not null,
    NAME varchar2(20) not null,
    MOBILE varchar2(13) not null,
    EMAIL varchar2(30) not null,
    ENTRY_DATE varchar2(10) not null,
    GRADE varchar2(1) not null,
    MILEAGE number(6),
    MANAGER varchar2(20)
    );	

-- �����
alter table MEMBER
add constraint PK_memberid primary key(member_id);

alter table MEMBER
add constraint UNK_mobile unique(mobile);

alter table MEMBER
add constraint UNK_email unique(email);

-- �α��� ����â
alter table MEMBER add login number(9);
alter table member modify(login default 0);
    
-- ��� ���̺� ��ȸ    
    SELECT * FROM TAB;
    
-- ��� ���̺� ���� ��ȸ    
    DESC MEMBER;
    
-- ����� PK ����
alter table notice
drop constraint fk_memberid;

-- �Խ��� �߰�
create table NOTICE (
	NOTICE_NO number(9) ,
	NOTICE_TITLE varchar2(50) not null,
	NOTICE_CONTENTS varchar2(4000),
	MEMBER_ID varchar2(30),
	NOTICE_CREATIONDATE date not null,
	NOTICE_VIEWS number(9)
);

-- �Խ��� �����
alter table NOTICE
add constraint fk_memberid foreign key(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID) ON DELETE CASCADE;


-- ȸ�� ���ڵ带 �߰�
insert into member(member_id,member_pw, name, mobile, email, entry_date, grade, mileage)
values('user01', 'password01', 'ȫ�浿', '010-1234-1111', 'user01@work.com', '2017-05-05', 'G', 75000);

insert into member
values('user02', 'password02', '������',	'010-1234-1112', 'user02@work.com', '2017-05-06', 'G', 95000, null, 0);

insert into member
values('user03', 'password03', '�̼���', '010-1234-1113', 'user03@work.com', '2017-05-07','G', 3000, null, 0);

insert into member
values('user04', 'password04', '������', '010-1234-1114', 'user04@work.com', '2017-05-08', 'S', null, '���߱�', 0);

insert into member
values('user05', 'password05', '������',	'010-1234-1115', 'user05@work.com', '2017-05-09', 'A', null, null, 0);

-- �Խñ� ���ڵ带 �߰�
DELETE NOTICE;

CREATE SEQUENCE SEQ_NOTICE;
CREATE SEQUENCE SEQ_NOTICEVIEW;

INSERT INTO NOTICE
VALUES(SEQ_NOTICE.NEXTVAL, '�ָ�����','ȸ����������DB����', 'user05', '2020-11-11', 0);

INSERT INTO NOTICE
VALUES(SEQ_NOTICE.NEXTVAL, '�������', '������� �Ұ�', 'user04', '2020-12-25',	0);

INSERT INTO NOTICE
VALUES(SEQ_NOTICE.NEXTVAL, '�ָ�����', 'ȭ�����Ǽ�', 'user05',	'2021-02-14', 0);

INSERT INTO NOTICE
VALUES(SEQ_NOTICE.NEXTVAL, '��������', '�ð�����',	'user05', '2021-03-01', 0);

INSERT INTO NOTICE
VALUES(SEQ_NOTICE.NEXTVAL, 'WEB����', 'www.w3schools.com', 'user01',	'2021-05-26', 0);

INSERT INTO NOTICE
VALUES(SEQ_NOTICE.NEXTVAL, 'WEB����1', 'www.w3schools.com', 'user01', TO_CHAR(SYSDATE,'YYYY-MM-DD'), 0);

-- ���̺� ���� ����
delete member;
delete notice;

-- ��ü ȸ�� ���� ��ȸ
SELECT *
FROM MEMBER
;

-- ��ü �Խñ� ���� ��ȸ
SELECT *
FROM NOTICE
;

-- ������� ������ ��ųʸ��� ����
-- ��ȸ�׸� : ���̺��, ����Ÿ��, �����, �÷���
SELECT * FROM ALL_CONSTRAINTS
WHERE TABLE_NAME = 'MEMBER'
;
SELECT * FROM ALL_CONSTRAINTS
WHERE TABLE_NAME = 'NOTICE'
;

SELECT * FROM ALL_CONS_COLUMNS
WHERE TABLE_NAME = 'MEMBER'
;
SELECT * FROM ALL_CONS_COLUMNS
WHERE TABLE_NAME = 'NOTICE'
;

-- �α��� 1 ��α��� null
update member
set login = '0'
where member_id = 'user05'
;

-- �α׾ƿ��� �α��λ��� ���� ����
update member
set login = '0'
where login = '1'
;

-- login ���� ���̵� 
select member_Id
from member
where login = 1
;

--�ѹ�
rollback;

-- ���� ����
DELETE MEMBER 
WHERE MEMBER_ID = 'user01';

-- �Խù� �ۼ��� �˻�
select *
from notice
where member_id = 'user01'
;

-- �Խù� ��ȸ
select *
from notice
;
-- �Խù� �ۼ��ڷ� �˻�
select *
from notice
where member_id like('%0%')
or lower(notice.member_id) like lower('%SC%')
;
-- �Խù� Ÿ��Ʋ�� �˻�
select *
from notice
where notice_title like('%we%')
or lower(notice.notice_title) like lower('%we%')
;
-- �Խù� �������� �˻�
select *
from notice
where notice_contents like('%sc%')
or lower(notice.notice_contents) like lower('%SC%')
;

-- �Խù� ����+�������� �˻�
select *
from notice
where notice_contents like('%we%')
or lower(notice.notice_contents) like lower('%we%')
or notice_title like('%we%')
or lower(notice.notice_title) like lower('%we%')
;

-- �Խù� �˻�
select *
from notice
where notice_no =73
and member_Id = 'user01'
;


-- �Խù� ��ü ����
delete notice;

-- �Խñ� �߰�
INSERT INTO NOTICE
VALUES(SEQ_NOTICE.NEXTVAL, '�ָ�����2','ȸ����������DB����1', 'user05', TO_CHAR(SYSDATE,'YYYY-MM-DD'), 0)
;

-- �Խñ� ����
delete notice
where member_id = 'user01'
and notice_no = 69
;
