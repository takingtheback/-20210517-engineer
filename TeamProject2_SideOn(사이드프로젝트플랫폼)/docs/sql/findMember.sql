// 테이블

create table find_member (
    find_no int not null,
    find_date varchar2(15) not null,
    find_title varchar2(60) not null,  
    find_writer varchar2(20) not null,
    find_address varchar2(60) not null,
    find_position varchar2(100) not null, 
    find_imgpath varchar2(500),
    find_content varchar2(1500) not null,
    CONSTRAINT FK_find_member FOREIGN KEY (find_writer)
    REFERENCES member(member_id)
    ON DELETE CASCADE
    );

// 등록 전 시퀀스 한번 삭제 
drop sequence SEQ_FIND_MEMBER;

// 초기 데이터
insert into find_member values (1, '2021-08-13', '초보 개발자입니다.', 'user01', '서울시 강남구', 'Back-end(백엔드)', null, '초보 개발자입니다. 포폴 쌓기용 프로젝트 하시는 분 같이해요.');
insert into find_member values (2, '2021-08-15', '서버 개발자입니다.', 'user02', '서울시 마포구', 'Server(서버)', null, '실무 경험 4년 있습니다. 자세한 사항은 02@work.com으로 메일주세요.');
insert into find_member values (3, '2021-08-15', 'UI/UX 디자이너입니다.', 'user03', '서울시 중구', 'UI/UX', null, '포트폴리오 원하시는 분은 03@work.com으로 메일 주세요.');
insert into find_member values (4, '2021-08-15', '프로젝트 경험 쌓고싶어요!', 'user04', '서울시 동작구', 'Back-end(백엔드)', null, '연락주세요!');
insert into find_member values (5, '2021-08-16', '공모전 수상경력 多', 'user05', '서울시 강남구', '기획', null, '경영학과 전공, 컴퓨터공학과 부전공했습니다. 기확 관련 공모전 수상경험 다수 있어요');
insert into find_member values (6, '2021-08-16', 'AOS 프로젝트에 참여하고 싶어요.', 'user06', '서울시 강남구', 'AOS(안드로이드)', null, '졸업프로젝트 하시는 분 없으실까요.. 주말마다 만나서 프로젝트 진행 가능합니다!');
insert into find_member values (7, '2021-08-16', 'IOS 어플 개발 경력있어요.', 'user07', '서울시 강남구', 'IOS(애플)', null, '현재 컴공과 4학년입니다. 졸업프로젝트로 수강신청 어플을 만들어본 경험 있습니다. 자세한 사항은 user07@work.com으로 메일 부탁드립니다. 포트폴리오 보내드려요.');

// 다시 시퀀스 등록
CREATE SEQUENCE SEQ_FIND_MEMBER
start with 8
increment by 1
;

select * from find_member;

// 커밋
commit;