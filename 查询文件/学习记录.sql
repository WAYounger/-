--������Ʒ�������ݿ�
create database ��Ʒ�������ݿ�
on
(
	name='��Ʒ����_m',
	filename='E:\��Ʒ���۹���ϵͳ\���ݿ�\��Ʒ����_m.mdf',
	size=6mb,
	maxsize=unlimited,
	filegrowth=1mb
)
log on
(
	name='��Ʒ����_l',
	filename='E:\��Ʒ���۹���ϵͳ\���ݿ�\��Ʒ����_l.ldf',
	size=1mb,
	maxsize=3mb,
	filegrowth=10%
)

--����ѧ��ѡ�����ݿ�
create database ѧ��ѡ�����ݿ�
on
(
	name='ѧ��ѡ��_m',
	filename='E:\ѧ��ѡ��ϵͳ\���ݿ�\ѧ��ѡ��_m.mdf',
	size=3mb,
	maxsize=10mb,
	filegrowth=20%
),
(
	name='ѧ��ѡ��_n',
	filename='E:\ѧ��ѡ��ϵͳ\���ݿ�\ѧ��ѡ��_n.ndf',
	size=2mb,
	maxsize=5mb,
	filegrowth=1mb
)
log on
(
	name='ѧ��ѡ��_l',
	filename='E:\ѧ��ѡ��ϵͳ\���ݿ�\ѧ��ѡ��_l.ldf',
	size=1mb,
	maxsize=unlimited,
	filegrowth=1mb
)

--�����ͻ���Ϣ��
use ��Ʒ�������ݿ�
go
create table �ͻ���Ϣ��
(
	�ͻ����	nchar(8)	 not null,
	�ͻ�����	nvarchar(5)  not null,
	��ϵ�绰	nvarchar(11) not null,
	��ַ		nvarchar(30) null,
	����		nvarchar(20) null
)
go

--�����ڸñ�ʱ������
--������ '�ͻ���Ϣ��1' ��Ч��
use ��Ʒ�������ݿ�
go
select * from �ͻ���Ϣ��1


use ��Ʒ�������ݿ�
go
alter table �ͻ���Ϣ��
	alter column ���� varchar(30) null
go


--������Ʒ���ͱ��������Լ��
use ��Ʒ�������ݿ�
go
create table ��Ʒ���ͱ�
(
	��Ʒ���ͱ�� nchar(6) primary key,
	��Ʒ������	nvarchar(10) not null
)

--Ϊ�����ֶ���������Լ��
use ��Ʒ�������ݿ�
go
alter table �ͻ���Ϣ��
add constraint pk_cusno
primary key(�ͻ����)
go


--Ϊ�����ֶ�����Ĭ��Լ��
use ��Ʒ�������ݿ�
go
alter table ��Ʒ���ͱ�
add constraint df_comtypename
default 'ʳƷ' for ��Ʒ������
go

--Ϊ�����ֶ�����ΨһԼ��
use ��Ʒ�������ݿ�
go
alter table �ͻ���Ϣ��
	add constraint ix_email
	unique(����)
go

--Ϊ���б����ü��Լ��
use ��Ʒ�������ݿ�
go
alter table �ͻ���Ϣ��
	add constraint ck_email
	check(���� like '_%@_%._%')
go

--�������
use ��Ʒ�������ݿ�
go
alter table ��Ʒ��Ϣ��
	add constraint fk_cominfo_comtype
	foreign key (��Ʒ���ͱ��)
	references ��Ʒ���ͱ�(��Ʒ���ͱ��)
go