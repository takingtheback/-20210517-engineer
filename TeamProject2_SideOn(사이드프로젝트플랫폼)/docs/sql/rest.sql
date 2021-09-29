-- create rest table : notice_no -> recruit_no 
create table rest (
    rest_no varchar2(10) primary key,
    Recruit_num number,
    member_id varchar2(20) not null,
    reason varchar2(100) not null,
    rest_enroll varchar2(20),
    rest_confirm varchar2(20),
    rest_check varchar2(10) not null,
    rest_result varchar2(50)
);

-- create seq rest
create SEQUENCE SEQ_REST 
start with 1
increment by 1
;

-- REST SEQ 삭제
drop sequence SEQ_REST;

-- rest constraint 추가 (fk_notice_no) : notice_no -> recruit_no 
alter table Recruit
add constraint fk_Recruit_num foreign key(Recruit_num) REFERENCES Recruit(Recruit_num) ON DELETE CASCADE;
-- rest constraint 추가 (fk_rest_member_id)
alter table rest
add constraint fk_rest_member_id foreign key(member_id) REFERENCES MEMBER(member_id) ON DELETE CASCADE;