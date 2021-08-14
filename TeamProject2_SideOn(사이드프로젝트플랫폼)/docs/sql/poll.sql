-- 투표 저장 테이블
create table tblPollList(
 num int,
 question varchar(200) not null,
 sdate date,
 edate date,
 wdate date,
 type smallint default 1,
 active smallint default 1
);

-- 투표인원 확인 테이블
create table tblPollItem(
 listnum int not null,
 itemnum smallint default 0,
 item varchar(50) not null,
 count int
);

-- 트표 저장 
CREATE SEQUENCE tblpolllist_seq START WITH 1 INCREMENT BY 1 MAXVALUE 9999 CYCLE NOCACHE;

-- 기능 구현 예시 데이터 삽입
insert into TBLPOLLLIST values (22, '관심있는 프로그래밍 언어는?', sysdate, '21/09/01', 1, 1);
insert into TBLPOLLITEM values (22, 4, '자바', 0);
insert into TBLPOLLITEM values (22, 4, '파이썬', 0);
insert into TBLPOLLITEM values (22, 4, '자바스크립트', 0);
insert into TBLPOLLITEM values (22, 4, 'C언어', 0);
commit;
