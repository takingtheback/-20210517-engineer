// ���̺�

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

// ��� �� ������ �ѹ� ���� 
drop sequence SEQ_FIND_MEMBER;

// �ʱ� ������
insert into find_member values (1, '2021-08-13', '�ʺ� �������Դϴ�.', 'user01', '����� ������', 'Back-end(�鿣��)', null, '�ʺ� �������Դϴ�. ���� �ױ�� ������Ʈ �Ͻô� �� �����ؿ�.');
insert into find_member values (2, '2021-08-15', '���� �������Դϴ�.', 'user02', '����� ������', 'Server(����)', null, '�ǹ� ���� 4�� �ֽ��ϴ�. �ڼ��� ������ 02@work.com���� �����ּ���.');
insert into find_member values (3, '2021-08-15', 'UI/UX �����̳��Դϴ�.', 'user03', '����� �߱�', 'UI/UX', null, '��Ʈ������ ���Ͻô� ���� 03@work.com���� ���� �ּ���.');
insert into find_member values (4, '2021-08-15', '������Ʈ ���� �װ�;��!', 'user04', '����� ���۱�', 'Back-end(�鿣��)', null, '�����ּ���!');
insert into find_member values (5, '2021-08-16', '������ ������ ��', 'user05', '����� ������', '��ȹ', null, '�濵�а� ����, ��ǻ�Ͱ��а� �������߽��ϴ�. ��Ȯ ���� ������ ������� �ټ� �־��');
insert into find_member values (6, '2021-08-16', 'AOS ������Ʈ�� �����ϰ� �;��.', 'user06', '����� ������', 'AOS(�ȵ���̵�)', null, '����������Ʈ �Ͻô� �� �����Ǳ��.. �ָ����� ������ ������Ʈ ���� �����մϴ�!');
insert into find_member values (7, '2021-08-16', 'IOS ���� ���� ����־��.', 'user07', '����� ������', 'IOS(����)', null, '���� �İ��� 4�г��Դϴ�. ����������Ʈ�� ������û ������ ���� ���� �ֽ��ϴ�. �ڼ��� ������ user07@work.com���� ���� ��Ź�帳�ϴ�. ��Ʈ������ ���������.');

// �ٽ� ������ ���
CREATE SEQUENCE SEQ_FIND_MEMBER
start with 8
increment by 1
;

select * from find_member;

// Ŀ��
commit;