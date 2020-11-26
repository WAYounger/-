--创建商品管理数据库
create database 商品管理数据库
on
(
	name='商品管理_m',
	filename='E:\商品销售管理系统\数据库\商品管理_m.mdf',
	size=6mb,
	maxsize=unlimited,
	filegrowth=1mb
)
log on
(
	name='商品管理_l',
	filename='E:\商品销售管理系统\数据库\商品管理_l.ldf',
	size=1mb,
	maxsize=3mb,
	filegrowth=10%
)

--创建学生选课数据库
create database 学生选课数据库
on
(
	name='学生选课_m',
	filename='E:\学生选课系统\数据库\学生选课_m.mdf',
	size=3mb,
	maxsize=10mb,
	filegrowth=20%
),
(
	name='学生选课_n',
	filename='E:\学生选课系统\数据库\学生选课_n.ndf',
	size=2mb,
	maxsize=5mb,
	filegrowth=1mb
)
log on
(
	name='学生选课_l',
	filename='E:\学生选课系统\数据库\学生选课_l.ldf',
	size=1mb,
	maxsize=unlimited,
	filegrowth=1mb
)

--创建客户信息表
use 商品管理数据库
go
create table 客户信息表
(
	客户编号	nchar(8)	 not null,
	客户姓名	nvarchar(5)  not null,
	联系电话	nvarchar(11) not null,
	地址		nvarchar(30) null,
	邮箱		nvarchar(20) null
)
go

--不存在该表时，报错：
--对象名 '客户信息表1' 无效。
use 商品管理数据库
go
select * from 客户信息表1


use 商品管理数据库
go
alter table 客户信息表
	alter column 邮箱 varchar(30) null
go


--创建商品类型表并添加主键约束
use 商品管理数据库
go
create table 商品类型表
(
	商品类型编号 nchar(6) primary key,
	商品类型名	nvarchar(10) not null
)

--为现有字段设置主键约束
use 商品管理数据库
go
alter table 客户信息表
add constraint pk_cusno
primary key(客户编号)
go


--为现有字段设置默认约束
use 商品管理数据库
go
alter table 商品类型表
add constraint df_comtypename
default '食品' for 商品类型名
go

--为现有字段设置唯一约束
use 商品管理数据库
go
alter table 客户信息表
	add constraint ix_email
	unique(邮箱)
go

--为现有表设置检查约束
use 商品管理数据库
go
alter table 客户信息表
	add constraint ck_email
	check(邮箱 like '_%@_%._%')
go

--创建外键
use 商品管理数据库
go
alter table 商品信息表
	add constraint fk_cominfo_comtype
	foreign key (商品类型编号)
	references 商品类型表(商品类型编号)
go