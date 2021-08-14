create table find_member (
    find_date varchar2(15) not null,
    find_title varchar2(60) not null,  
    find_writer varchar2(20) not null,
    find_address varchar2(60) not null,
    find_position varchar2(20) not null, 
    find_imgpath varchar2(500),
    find_content varchar2(1500) not null,
    CONSTRAINT FK_find_member FOREIGN KEY (find_writer)
    REFERENCES member(memberId)
    ON DELETE CASCADE
    );


insert into find_member values('2021-08-11','�ȳ��ϼ���.','example1','����� ������','�鿣��', null, '�ȳ�ȳ�');

select * from find_member;

desc member;

commit;