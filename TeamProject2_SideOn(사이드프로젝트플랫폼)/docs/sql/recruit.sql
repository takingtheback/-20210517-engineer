-- <Table : 회원 >
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

-- <Table : 파일>
CREATE TABLE MP_FILE
(
    FILE_NO NUMBER,                         --파일 번호
    recruit_num NUMBER NOT NULL,                    --게시판 번호
    ORG_FILE_NAME VARCHAR2(260) NOT NULL,   --원본 파일 이름
    STORED_FILE_NAME VARCHAR2(36) NOT NULL, --변경된 파일 이름
    FILE_SIZE NUMBER,                       --파일 크기
    REGDATE DATE DEFAULT SYSDATE NOT NULL,  --파일등록일
    DEL_GB VARCHAR2(1) DEFAULT 'N' NOT NULL,--삭제구분
    PRIMARY KEY(FILE_NO)                    --기본키 FILE_NO
);
COMMIT;

-- <SEQUENCE : 파일>
CREATE SEQUENCE SEQ_MP_FILE_NO
START WITH 1 
INCREMENT BY 1 
NOMAXVALUE NOCACHE;

COMMIT;

-- < Table & Sequence > 
CREATE TABLE Recruit
(
    Recruit_num      NUMBER            NOT NULL, 
    memberId         VARCHAR2(20)      NOT NULL, 
    hit              NUMBER            NULL, 
    start_date       VARCHAR2(20)      NOT NULL, 
    end_date         VARCHAR2(20)      NOT NULL, 
    title            VARCHAR2(60)      NOT NULL, 
    content          VARCHAR2(2000)    NOT NULL, 
    save_date        VARCHAR2(20)      NOT NULL, 
    pay_check        VARCHAR2(5)       NULL, 
    pay_amount       NUMBER            NULL, 
    visible_check    VARCHAR2(5)       NULL, 
    simple_info      VARCHAR2(100)     NOT NULL, 
    pj_content       VARCHAR2(2000)    NOT NULL, 
    project_name     VARCHAR2(60)      NOT NULL, 
    front            NUMBER            NULL, 
    back             NUMBER            NULL, 
    aos              NUMBER            NULL, 
    ios              NUMBER            NULL, 
    uxui             NUMBER            NULL, 
    plan             NUMBER            NULL, 
    pm               NUMBER            NULL, 
    server              NUMBER      NULL,
    CONSTRAINT PK_Recruit PRIMARY KEY (Recruit_num)
);

CREATE SEQUENCE Recruit_SEQ
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Recruit_AI_TRG
BEFORE INSERT ON Recruit 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT Recruit_SEQ.NEXTVAL
    INTO :NEW.Recruit_num
    FROM DUAL;
END;

DROP TRIGGER Recruit_AI_TRG;
DROP SEQUENCE Recruit_SEQ;
-- <Table & Sequence : 지원>
CREATE TABLE Apply
(
    apply_num       NUMBER          NOT NULL, 
    memberId        VARCHAR2(20)    NOT NULL, 
    part            VARCHAR2(30)    NOT NULL, 
    message         VARCHAR2(60)    NULL, 
    Recruit_num     NUMBER          NOT NULL, 
    join_yn         VARCHAR2(5)     NOT NULL, 
    payment_date    VARCHAR2(30)    NULL, 
    CONSTRAINT PK_Apply PRIMARY KEY (apply_num)
);

CREATE SEQUENCE Apply_SEQ
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Apply_AI_TRG
BEFORE INSERT ON Apply 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT Apply_SEQ.NEXTVAL
    INTO :NEW.apply_num
    FROM DUAL;
END;

--DROP TRIGGER Apply_AI_TRG;

--DROP SEQUENCE Apply_SEQ;

ALTER TABLE Apply
    ADD CONSTRAINT FK_Apply_Recruit_num_Recruit_R FOREIGN KEY (Recruit_num)
        REFERENCES Recruit (Recruit_num);

-- < Table & Sequence : 리워드 >
CREATE TABLE reward
(
    payment_id         VARCHAR2(20)    NOT NULL, 
    Recruit_num        NUMBER          NOT NULL, 
    apply_num          NUMBER          NOT NULL, 
    writer_memberId    VARCHAR2(20)    NOT NULL, 
    apply_memberId     VARCHAR2(20)    NOT NULL, 
    pay_amount         NUMBER          NULL, 
    payment_date       VARCHAR2(30)    NULL, 
    reward_yn          VARCHAR2(5)     NULL, 
    CONSTRAINT PK_mileage PRIMARY KEY (payment_id)
);

ALTER TABLE reward
    ADD CONSTRAINT FK_reward_Recruit_num_Recruit_ FOREIGN KEY (Recruit_num)
        REFERENCES Recruit (Recruit_num);

ALTER TABLE reward
    ADD CONSTRAINT FK_reward_apply_num_Apply_appl FOREIGN KEY (apply_num)
        REFERENCES Apply (apply_num);
--===================기초 테이블&시퀀스 생성 완료 =====================

--select * from recruit;
--select * from apply;
--select * from reward;

-- 모집 글 데이터 
INSERT INTO Recruit  VALUES (Recruit_SEQ.nextval,'memberId 01', 01, '2021-08-12', '2021-08-12', '6주 만에 포트폴리오 웹 프로젝트 만들기', '6주 만에 포트폴리오 웹 프로젝트 만들기', '2021-08-22', 'N', 01, 'N', '팀 단위로 프로젝트를 기획부터 설계, 개발, 배포, 포트폴리오 완성.', '* (전) Ground X(카카오계열사) 개발팀 SWE', '프로젝트 도장깨기', 01, 01, 01, 01, 01, 01, 01, 01);
INSERT INTO Recruit  VALUES (Recruit_SEQ.nextval,'memberId 02', 01, '2021-08-12', '2021-08-13', '4주 만에 포트폴리오 웹 프로젝트 만들기', '4주 만에 포트폴리오 웹 프로젝트 만들기', '2021-08-22', 'N', 01, 'N', '팀 단위로 프로젝트를 기획부터 설계, 개발, 배포, 포트폴리오 완성.', '* (전) Ground X(카카오계열사) 개발팀 SWE', '프로젝트 도장깨기', 01, 01, 01, 01, 01, 01, 01, 01);
INSERT INTO Recruit  VALUES (Recruit_SEQ.nextval,'memberId 03', 01, '2021-08-12', '2021-08-14', '3주 만에 포트폴리오 웹 프로젝트 만들기', '3주 만에 포트폴리오 웹 프로젝트 만들기', '2021-08-22', 'N', 01, 'N', '팀 단위로 프로젝트를 기획부터 설계, 개발, 배포, 포트폴리오 완성.', '* (전) Ground X(카카오계열사) 개발팀 SWE', '프로젝트 도장깨기', 01, 01, 01, 01, 01, 01, 01, 01);
INSERT INTO Recruit  VALUES (Recruit_SEQ.nextval,'memberId 04', 01, '2021-08-12', '2021-08-15', '2주 만에 포트폴리오 웹 프로젝트 만들기', '2주 만에 포트폴리오 웹 프로젝트 만들기', '2021-08-22', 'N', 01, 'N', '팀 단위로 프로젝트를 기획부터 설계, 개발, 배포, 포트폴리오 완성.', '* (전) Ground X(카카오계열사) 개발팀 SWE', '프로젝트 도장깨기', 01, 01, 01, 01, 01, 01, 01, 01);
INSERT INTO Recruit  VALUES (Recruit_SEQ.nextval,'memberId 05', 01, '2021-08-12', '2021-08-16', '7주 만에 포트폴리오 웹 프로젝트 만들기', '7주 만에 포트폴리오 웹 프로젝트 만들기', '2021-08-22', 'N', 01, 'N', '팀 단위로 프로젝트를 기획부터 설계, 개발, 배포, 포트폴리오 완성.', '* (전) Ground X(카카오계열사) 개발팀 SWE', '프로젝트 도장깨기', 01, 01, 01, 01, 01, 01, 01, 01);
INSERT INTO Recruit  VALUES (Recruit_SEQ.nextval,'memberId 06', 01, '2021-08-12', '2021-08-17', '8주 만에 포트폴리오 웹 프로젝트 만들기', '8주 만에 포트폴리오 웹 프로젝트 만들기', '2021-08-22', 'N', 01, 'N', '팀 단위로 프로젝트를 기획부터 설계, 개발, 배포, 포트폴리오 완성.', '* (전) Ground X(카카오계열사) 개발팀 SWE', '프로젝트 도장깨기', 01, 01, 01, 01, 01, 01, 01, 01);
INSERT INTO Recruit  VALUES (Recruit_SEQ.nextval,'memberId 07', 01, '2021-08-12', '2021-08-18', '9주 만에 포트폴리오 웹 프로젝트 만들기', '9주 만에 포트폴리오 웹 프로젝트 만들기', '2021-08-22', 'N', 01, 'N', '팀 단위로 프로젝트를 기획부터 설계, 개발, 배포, 포트폴리오 완성.', '* (전) Ground X(카카오계열사) 개발팀 SWE', '프로젝트 도장깨기', 01, 01, 01, 01, 01, 01, 01, 01);
INSERT INTO Recruit  VALUES (Recruit_SEQ.nextval,'memberId 08', 01, '2021-08-12', '2021-08-19', '1주 만에 포트폴리오 웹 프로젝트 만들기', '1주 만에 포트폴리오 웹 프로젝트 만들기', '2021-08-22', 'N', 01, 'N', '팀 단위로 프로젝트를 기획부터 설계, 개발, 배포, 포트폴리오 완성.', '* (전) Ground X(카카오계열사) 개발팀 SWE', '프로젝트 도장깨기', 01, 01, 01, 01, 01, 01, 01, 01);
INSERT INTO Recruit  VALUES (Recruit_SEQ.nextval,'memberId 09', 01, '2021-08-12', '2021-08-20', '10주 만에 포트폴리오 웹 프로젝트 만들기', '10주 만에 포트폴리오 웹 프로젝트 만들기', '2021-08-22', 'N', 01, 'N', '팀 단위로 프로젝트를 기획부터 설계, 개발, 배포, 포트폴리오 완성.', '* (전) Ground X(카카오계열사) 개발팀 SWE', '프로젝트 도장깨기', 01, 01, 01, 01, 01, 01, 01, 01);
INSERT INTO Recruit  VALUES (Recruit_SEQ.nextval,'memberId 09', 01, '2021-08-12', '2021-08-21', '11주 만에 포트폴리오 웹 프로젝트 만들기', '11주 만에 포트폴리오 웹 프로젝트 만들기', '2021-08-22', 'N', 01, 'N', '팀 단위로 프로젝트를 기획부터 설계, 개발, 배포, 포트폴리오 완성.', '* (전) Ground X(카카오계열사) 개발팀 SWE', '프로젝트 도장깨기', 01, 01, 01, 01, 01, 01, 01, 01);
