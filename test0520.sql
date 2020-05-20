
-- 创建一个表用于测试
create table money(
    id int primary key,
    name varchar(20),
    money decimal(13,2)
);

-- 输入数据
insert into money values(1,'财务处','1000');
insert into money values(2,'肖明','8000');

-- 进行测试
-- 如果肖明要向财务处缴费3000元，要进行的操作是，肖明的账户减少3000元，财务处的账户增加3000元
update money set money=money-3000 where name = '肖明';
update money set money=money+3000 where name = '财务处';

-- 但是在执行到第一条SQL语句时，出现网络错误或者数据库挂了，那么就会导致肖明的账户减少3000元，而财务处的账户并不会增加3000元
-- 解决方法：使用事务来控制，保证以上两句SQL要么全部执行成功，要么全部执行失败


-- 如果肖明要向财务处缴费3000元，要进行的操作是，肖明的账户减少3000元，财务处的账户增加3000元
start transaction;
update money set money=money-3000 where name = '肖明';
update money set money=money+3000 where name = '财务处';
commit

