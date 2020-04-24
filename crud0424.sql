-- 商品数据库
-- 商品
create table if not exists goods(
	ID int,
	name varchar(200),
	unitprice int,
	category varchar(20) comment '商品分类',
	provider varchar(30) comment '供应商名称'
);
-- 客户
create table customer(
	ID int,
	name varchar(20),
	address varchar(100),
	email varchar(30),
	sex varchar(5),
	card_ID varchar(20)
);
-- 购买
create table purchase(
	order_ID int,
	customer_ID int,
	goods_ID int,
	nums int comment '数量'
);

-- 在goods表中插入数据
insert into goods values(
	1,
	'apple',
	5,
	'food',
	'company'
	);
	
-- 查看goods表的所有数据
select * from goods;

insert into goods (ID,name,unitprice,category) values
	(2,'banana',9,'food');

insert into goods(ID,name,unitprice) values
	(3,'book',20),
	(4,'fish',15),
	(5,'bird',50);
	
-- 创建一个成绩表，并输入数据
create table exam(
	id int,
	name varchar(10),
	math decimal(3,1),
	chinese decimal(3,1),
	English decimal(3,1)
	);
insert into exam values
(1,'lili',98,90,78),
(2,'Mary',87,46,99),
(3,'Bob',22,45,87);
-- 重命名
select id,name,math+chinese+English as tatol from exam;
-- 去重
select distinct math from exam;
-- 排序
select name,math from exam order by math asc;
