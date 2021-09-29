-- create member table
create table member (
    member_id varchar2(30) primary key,
    member_pw varchar2(20) not null,
    email varchar2(30) not null,
    grade varchar2(10) not null,
    name varchar2(20) not null,
    mobile varchar2(13) not null,
    entry_date varchar2(10) not null,
    rest_count varchar2(10),
    reward varchar2(20)
);

-- member 기초 데이터 추가 
insert into member values('user01', 'password01', 'user01@gmail.com', 'common','user01','01012341111','2021-11-12','0','0');
insert into member values('user02', 'password02', 'user02@gmail.com', 'common','user02','01012342222','2021-10-20','0','0');
insert into member values('user03', 'password03', 'user03@gmail.com', 'common','user03','01012343333','2021-04-18','0','0');
insert into member values('user04', 'password04', 'user04@gmail.com', 'common','user04','01012344444','2020-05-09','0','0');
insert into member values('user05', 'password05', 'user05@gmail.com', 'common','user05','01012345555','2021-02-27','0','0');
insert into member values('user06', 'password06', 'user06@gmail.com', 'common','user06','01012346666','2020-05-22','0','0');
insert into member values('user07', 'password07', 'user07@gmail.com', 'common','user07','01012347777','2020-12-17','0','0');
insert into member values('user08', 'password08', 'user08@gmail.com', 'common','user08','01012348888','2020-09-17','0','0');
insert into member values('user09', 'password09', 'user09@gmail.com', 'common','user09','01012349999','2020-06-17','0','0');
insert into member values('1', '1', 'admin@gmail.com', 'A','admin','01012340000','2020-05-17','0','0');
insert into member values('admin1', 'admin1', 'admin1@gmail.com', 'A','admin1','01012340001','2020-05-18','0','0');
