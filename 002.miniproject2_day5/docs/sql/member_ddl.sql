-- 멤버 테이블 삭제    
DROP TABLE MEMBER;    

-- 멤버 테이블 생성    
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

-- 제약식
alter table MEMBER
add constraint PK_memberid primary key(member_id);

alter table MEMBER
add constraint UNK_mobile unique(mobile);

alter table MEMBER
add constraint UNK_email unique(email);

-- 로그인 상태창
alter table MEMBER add login number(9);
alter table member modify(login default 0);
    
-- 멤버 테이블 조회    
    SELECT * FROM TAB;
    
-- 멤버 테이블 구조 조회    
    DESC MEMBER;
    
-- 제약식 PK 삭제
alter table notice
drop constraint fk_memberid;

-- 게시판 추가
create table NOTICE (
	NOTICE_NO number(9) ,
	NOTICE_TITLE varchar2(50) not null,
	NOTICE_CONTENTS varchar2(4000),
	MEMBER_ID varchar2(30),
	NOTICE_CREATIONDATE date not null,
	NOTICE_VIEWS number(9)
);

-- 게시판 제약식
alter table NOTICE
add constraint fk_memberid foreign key(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID) ON DELETE CASCADE;


-- 회원 레코드를 추가
insert into member(member_id,member_pw, name, mobile, email, entry_date, grade, mileage)
values('user01', 'password01', '홍길동', '010-1234-1111', 'user01@work.com', '2017-05-05', 'G', 75000);

insert into member
values('user02', 'password02', '강감찬',	'010-1234-1112', 'user02@work.com', '2017-05-06', 'G', 95000, null, 0);

insert into member
values('user03', 'password03', '이순신', '010-1234-1113', 'user03@work.com', '2017-05-07','G', 3000, null, 0);

insert into member
values('user04', 'password04', '김유신', '010-1234-1114', 'user04@work.com', '2017-05-08', 'S', null, '송중기', 0);

insert into member
values('user05', 'password05', '유관순',	'010-1234-1115', 'user05@work.com', '2017-05-09', 'A', null, null, 0);

-- 게시글 레코드를 추가
DELETE NOTICE;

CREATE SEQUENCE SEQ_NOTICE;
CREATE SEQUENCE SEQ_NOTICEVIEW;

INSERT INTO NOTICE
VALUES(SEQ_NOTICE.NEXTVAL, '주말과제','회원도서관리DB설계', 'user05', '2020-11-11', 0);

INSERT INTO NOTICE
VALUES(SEQ_NOTICE.NEXTVAL, '형상관리', '형상관리 소개', 'user04', '2020-12-25',	0);

INSERT INTO NOTICE
VALUES(SEQ_NOTICE.NEXTVAL, '주말과제', '화면정의서', 'user05',	'2021-02-14', 0);

INSERT INTO NOTICE
VALUES(SEQ_NOTICE.NEXTVAL, '과제제출', '시간엄수',	'user05', '2021-03-01', 0);

INSERT INTO NOTICE
VALUES(SEQ_NOTICE.NEXTVAL, 'WEB참고', 'www.w3schools.com', 'user01',	'2021-05-26', 0);

INSERT INTO NOTICE
VALUES(SEQ_NOTICE.NEXTVAL, 'WEB참고1', 'www.w3schools.com', 'user01', TO_CHAR(SYSDATE,'YYYY-MM-DD'), 0);

-- 테이블 내용 삭제
delete member;
delete notice;

-- 전체 회원 정보 조회
SELECT *
FROM MEMBER
;

-- 전체 게시글 정보 조회
SELECT *
FROM NOTICE
;

-- 제약관련 데이터 딕셔너리를 조인
-- 조회항목 : 테이블명, 제약타입, 제약명, 컬럼명
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

-- 로그인 1 비로그인 null
update member
set login = '0'
where member_id = 'user05'
;

-- 로그아웃시 로그인상태 전부 변경
update member
set login = '0'
where login = '1'
;

-- login 상태 아이디 
select member_Id
from member
where login = 1
;

--롤백
rollback;

-- 유저 삭제
DELETE MEMBER 
WHERE MEMBER_ID = 'user01';

-- 게시물 작성자 검색
select *
from notice
where member_id = 'user01'
;

-- 게시물 조회
select *
from notice
;
-- 게시물 작성자로 검색
select *
from notice
where member_id like('%0%')
or lower(notice.member_id) like lower('%SC%')
;
-- 게시물 타이틀로 검색
select *
from notice
where notice_title like('%we%')
or lower(notice.notice_title) like lower('%we%')
;
-- 게시물 내용으로 검색
select *
from notice
where notice_contents like('%sc%')
or lower(notice.notice_contents) like lower('%SC%')
;

-- 게시물 제목+내용으로 검색
select *
from notice
where notice_contents like('%we%')
or lower(notice.notice_contents) like lower('%we%')
or notice_title like('%we%')
or lower(notice.notice_title) like lower('%we%')
;

-- 게시물 검색
select *
from notice
where notice_no =73
and member_Id = 'user01'
;


-- 게시물 전체 삭제
delete notice;

-- 게시글 추가
INSERT INTO NOTICE
VALUES(SEQ_NOTICE.NEXTVAL, '주말과제2','회원도서관리DB설계1', 'user05', TO_CHAR(SYSDATE,'YYYY-MM-DD'), 0)
;

-- 게시글 삭제
delete notice
where member_id = 'user01'
and notice_no = 69
;
