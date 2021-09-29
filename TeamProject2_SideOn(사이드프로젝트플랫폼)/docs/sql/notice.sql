-- create notice table
create table notice (
    notice_no varchar2(10) primary key,
    notice_title varchar2(100) not null,
    notice_content varchar2(2000),
    member_id varchar2(20),
    notice_date varchar2(20),
    view_count varchar2(20),
    visible_check varchar2(5)
);

-- create seq notice
create SEQUENCE SEQ_NOTICE
start with 1
increment by 1
;

-- notice SEQ ªË¡¶
drop SEQUENCE SEQ_NOTICE;

-- create constraint notice (fk_member_id)
alter table notice
add constraint fk_member_id foreign key(member_id) REFERENCES MEMBER(member_id) ON DELETE CASCADE;