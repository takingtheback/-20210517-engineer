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

CREATE OR REPLACE TRIGGER Recruit_AI_TRG
BEFORE INSERT ON Recruit 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT Recruit_SEQ.NEXTVAL
    INTO :NEW.Recruit_num
    FROM DUAL;
END;

--DROP TRIGGER Recruit_AI_TRG;
--DROP SEQUENCE Recruit_SEQ;

COMMENT ON TABLE Recruit IS '���� ���̺�';
COMMENT ON COLUMN Recruit.Recruit_num IS '�� ��ȣ';
COMMENT ON COLUMN Recruit.memberId IS '�ۼ���';
COMMENT ON COLUMN Recruit.hit IS '��ȸ��';
COMMENT ON COLUMN Recruit.start_date IS '���� �Ⱓ(����)';
COMMENT ON COLUMN Recruit.end_date IS '���� �Ⱓ(��)';
COMMENT ON COLUMN Recruit.title IS '�� ����';
COMMENT ON COLUMN Recruit.content IS '���� �Ұ�';
COMMENT ON COLUMN Recruit.save_date IS '�ۼ���';
COMMENT ON COLUMN Recruit.pay_check IS '����/���� ����';
COMMENT ON COLUMN Recruit.pay_amount IS '���� ����';
COMMENT ON COLUMN Recruit.visible_check IS '�Խñ� ���� ����';
COMMENT ON COLUMN Recruit.simple_info IS '���� ����';
COMMENT ON COLUMN Recruit.pj_content IS '������Ʈ �Ұ�';
COMMENT ON COLUMN Recruit.project_name IS '������Ʈ �̸�';
COMMENT ON COLUMN Recruit.Front IS '����Ʈ����';
COMMENT ON COLUMN Recruit.Back IS '�鿣��';
COMMENT ON COLUMN Recruit.aos IS '�ȵ���̵�';
COMMENT ON COLUMN Recruit.ios IS 'ios';
COMMENT ON COLUMN Recruit.uxui IS 'UX/UI';
COMMENT ON COLUMN Recruit.plan IS '��ȹ';
COMMENT ON COLUMN Recruit.pm IS 'pm';

-- <Table & Sequence : ����>
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

COMMENT ON TABLE Apply IS '���� ���̺�';
COMMENT ON COLUMN Apply.apply_num IS '���� ��ȣ';
COMMENT ON COLUMN Apply.memberId IS '������';
COMMENT ON COLUMN Apply.part IS '���� �о�'
COMMENT ON COLUMN Apply.message IS '�޼���';
COMMENT ON COLUMN Apply.Recruit_num IS '�� ��ȣ';
COMMENT ON COLUMN Apply.join_yn IS '��������';
COMMENT ON COLUMN Apply.payment_date IS '������¥';

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
COMMENT ON TABLE reward IS '������ ����';
COMMENT ON COLUMN reward.payment_id IS '����ID';
COMMENT ON COLUMN reward.Recruit_num IS '�� ��ȣ';
COMMENT ON COLUMN reward.apply_num IS '���� ��ȣ';
COMMENT ON COLUMN reward.writer_memberId IS '�ۼ���';
COMMENT ON COLUMN reward.apply_memberId IS '������';
COMMENT ON COLUMN reward.pay_amount IS '���� ����';
COMMENT ON COLUMN reward.payment_date IS '������¥';
COMMENT ON COLUMN reward.reward_yn IS '������ ���� ����';

ALTER TABLE reward
    ADD CONSTRAINT FK_reward_Recruit_num_Recruit_ FOREIGN KEY (Recruit_num)
        REFERENCES Recruit (Recruit_num);

ALTER TABLE reward
    ADD CONSTRAINT FK_reward_apply_num_Apply_appl FOREIGN KEY (apply_num)
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
