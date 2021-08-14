
create table member (
	memberId varchar2(20),
	memberPw varchar2(20) not null,
	email varchar2(40) not null,
    grade varchar2(10) not null,
	name varchar2(20) not null,
	mobile varchar2(15) not null,
    entryDate varchar2(15) not null,
    restCount varchar2(5),
    reward varchar2(50),
    CONSTRAINT PK_member PRIMARY KEY (memberId)
    );
    
insert into member values('example1', 'example1', 'example1@ex.com', 'G', '예시1', '010-0000-0001', '2021-08-11', null, null); 
insert into member values('example2', 'example2', 'example2@ex.com', 'G', '예시2', '010-0000-0002', '2021-08-11', null, null); 

select * from member;

desc member;

commit;