-- <Table : ȸ�� >
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
    
    

-- <Table : ����>
CREATE TABLE MP_FILE
(
    FILE_NO NUMBER,                         --���� ��ȣ
    recruit_num NUMBER NOT NULL,                    --�Խ��� ��ȣ
    ORG_FILE_NAME VARCHAR2(260) NOT NULL,   --���� ���� �̸�
    STORED_FILE_NAME VARCHAR2(36) NOT NULL, --����� ���� �̸�
    FILE_SIZE NUMBER,                       --���� ũ��
    REGDATE DATE DEFAULT SYSDATE NOT NULL,  --���ϵ����
    DEL_GB VARCHAR2(1) DEFAULT 'N' NOT NULL,--��������
    PRIMARY KEY(FILE_NO)                    --�⺻Ű FILE_NO
);
COMMIT;

-- <SEQUENCE : ����>
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


--DROP SEQUENCE Recruit_SEQ;
-- <Table & Sequence : ����>
CREATE TABLE Apply
(
    apply_num       NUMBER          NOT NULL, 
    memberId        VARCHAR2(20)    NOT NULL, 
    part            VARCHAR2(30)    NOT NULL, 
    message         VARCHAR2(60)    NULL, 
    Recruit_num     NUMBER          NOT NULL, 
    join_yn         VARCHAR2(5)     NOT NULL, 
    pay_check        VARCHAR2(5)       NULL, 
    payment_date    VARCHAR2(30)    NULL, 
    CONSTRAINT PK_Apply PRIMARY KEY (apply_num)
);

CREATE SEQUENCE Apply_SEQ
START WITH 1
INCREMENT BY 1;

--DROP TRIGGER Apply_AI_TRG;

--DROP SEQUENCE Apply_SEQ;

ALTER TABLE Apply
    ADD CONSTRAINT FK_Apply_Recruit_num_Recruit_R FOREIGN KEY (Recruit_num)
        REFERENCES Recruit (Recruit_num);

-- < Table & Sequence : ������ >
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


-- <Table & Sequence > ���� ī��Ʈ ���̺� 
CREATE TABLE CountCheck
(
    count_num      NUMBER    NOT NULL, 
    Recruit_num    NUMBER    NULL, 
    apply_num      NUMBER    NULL, 
    Front          NUMBER    NULL, 
    Back           NUMBER    NULL, 
    aos            NUMBER    NULL, 
    ios            NUMBER    NULL, 
    uxui           NUMBER    NULL, 
    plan           NUMBER    NULL, 
    pm             NUMBER    NULL, 
     PRIMARY KEY (count_num)
);

CREATE SEQUENCE CountCheck_SEQ
START WITH 1
INCREMENT BY 1

--DROP SEQUENCE CountCheck_SEQ;


ALTER TABLE CountCheck
    ADD CONSTRAINT FK_CountCheck_Recruit_num_Recr FOREIGN KEY (Recruit_num)
        REFERENCES Recruit (Recruit_num);

ALTER TABLE CountCheck
    ADD CONSTRAINT FK_CountCheck_apply_num_Apply_ FOREIGN KEY (apply_num)
        REFERENCES Apply (apply_num);
--===================���� ���̺�&������ ���� �Ϸ� =====================

--select * from recruit;
--select * from apply;
--select * from reward;

-- ���� �� ������ 
INSERT INTO Recruit  VALUES (Recruit_SEQ.nextval,'memberId 01', 01, '2021-08-12', '2021-08-12', '6�� ���� ��Ʈ������ �� ������Ʈ �����', '6�� ���� ��Ʈ������ �� ������Ʈ �����', '2021-08-22', 'N', 01, 'N', '�� ������ ������Ʈ�� ��ȹ���� ����, ����, ����, ��Ʈ������ �ϼ�.', '* (��) Ground X(īī���迭��) ������ SWE', '������Ʈ �������', 01, 01, 01, 01, 01, 01, 01, 01);
INSERT INTO Recruit  VALUES (Recruit_SEQ.nextval,'memberId 02', 01, '2021-08-12', '2021-08-13', '4�� ���� ��Ʈ������ �� ������Ʈ �����', '4�� ���� ��Ʈ������ �� ������Ʈ �����', '2021-08-22', 'N', 01, 'N', '�� ������ ������Ʈ�� ��ȹ���� ����, ����, ����, ��Ʈ������ �ϼ�.', '* (��) Ground X(īī���迭��) ������ SWE', '������Ʈ �������', 01, 01, 01, 01, 01, 01, 01, 01);
INSERT INTO Recruit  VALUES (Recruit_SEQ.nextval,'memberId 03', 01, '2021-08-12', '2021-08-14', '3�� ���� ��Ʈ������ �� ������Ʈ �����', '3�� ���� ��Ʈ������ �� ������Ʈ �����', '2021-08-22', 'N', 01, 'N', '�� ������ ������Ʈ�� ��ȹ���� ����, ����, ����, ��Ʈ������ �ϼ�.', '* (��) Ground X(īī���迭��) ������ SWE', '������Ʈ �������', 01, 01, 01, 01, 01, 01, 01, 01);
INSERT INTO Recruit  VALUES (Recruit_SEQ.nextval,'memberId 04', 01, '2021-08-12', '2021-08-15', '2�� ���� ��Ʈ������ �� ������Ʈ �����', '2�� ���� ��Ʈ������ �� ������Ʈ �����', '2021-08-22', 'N', 01, 'N', '�� ������ ������Ʈ�� ��ȹ���� ����, ����, ����, ��Ʈ������ �ϼ�.', '* (��) Ground X(īī���迭��) ������ SWE', '������Ʈ �������', 01, 01, 01, 01, 01, 01, 01, 01);
INSERT INTO Recruit  VALUES (Recruit_SEQ.nextval,'memberId 05', 01, '2021-08-12', '2021-08-16', '7�� ���� ��Ʈ������ �� ������Ʈ �����', '7�� ���� ��Ʈ������ �� ������Ʈ �����', '2021-08-22', 'N', 01, 'N', '�� ������ ������Ʈ�� ��ȹ���� ����, ����, ����, ��Ʈ������ �ϼ�.', '* (��) Ground X(īī���迭��) ������ SWE', '������Ʈ �������', 01, 01, 01, 01, 01, 01, 01, 01);
INSERT INTO Recruit  VALUES (Recruit_SEQ.nextval,'memberId 06', 01, '2021-08-12', '2021-08-17', '8�� ���� ��Ʈ������ �� ������Ʈ �����', '8�� ���� ��Ʈ������ �� ������Ʈ �����', '2021-08-22', 'N', 01, 'N', '�� ������ ������Ʈ�� ��ȹ���� ����, ����, ����, ��Ʈ������ �ϼ�.', '* (��) Ground X(īī���迭��) ������ SWE', '������Ʈ �������', 01, 01, 01, 01, 01, 01, 01, 01);
INSERT INTO Recruit  VALUES (Recruit_SEQ.nextval,'memberId 07', 01, '2021-08-12', '2021-08-18', '9�� ���� ��Ʈ������ �� ������Ʈ �����', '9�� ���� ��Ʈ������ �� ������Ʈ �����', '2021-08-22', 'N', 01, 'N', '�� ������ ������Ʈ�� ��ȹ���� ����, ����, ����, ��Ʈ������ �ϼ�.', '* (��) Ground X(īī���迭��) ������ SWE', '������Ʈ �������', 01, 01, 01, 01, 01, 01, 01, 01);
INSERT INTO Recruit  VALUES (Recruit_SEQ.nextval,'memberId 08', 01, '2021-08-12', '2021-08-19', '1�� ���� ��Ʈ������ �� ������Ʈ �����', '1�� ���� ��Ʈ������ �� ������Ʈ �����', '2021-08-22', 'N', 01, 'N', '�� ������ ������Ʈ�� ��ȹ���� ����, ����, ����, ��Ʈ������ �ϼ�.', '* (��) Ground X(īī���迭��) ������ SWE', '������Ʈ �������', 01, 01, 01, 01, 01, 01, 01, 01);
INSERT INTO Recruit  VALUES (Recruit_SEQ.nextval,'memberId 09', 01, '2021-08-12', '2021-08-20', '10�� ���� ��Ʈ������ �� ������Ʈ �����', '10�� ���� ��Ʈ������ �� ������Ʈ �����', '2021-08-22', 'N', 01, 'N', '�� ������ ������Ʈ�� ��ȹ���� ����, ����, ����, ��Ʈ������ �ϼ�.', '* (��) Ground X(īī���迭��) ������ SWE', '������Ʈ �������', 01, 01, 01, 01, 01, 01, 01, 01);
INSERT INTO Recruit  VALUES (Recruit_SEQ.nextval,'memberId 09', 01, '2021-08-12', '2021-08-21', '11�� ���� ��Ʈ������ �� ������Ʈ �����', '11�� ���� ��Ʈ������ �� ������Ʈ �����', '2021-08-22', 'N', 01, 'N', '�� ������ ������Ʈ�� ��ȹ���� ����, ����, ����, ��Ʈ������ �ϼ�.', '* (��) Ground X(īī���迭��) ������ SWE', '������Ʈ �������', 01, 01, 01, 01, 01, 01, 01, 01);
