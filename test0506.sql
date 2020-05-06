-- 索引的相关操作
--（1）查看索引
show index from 表名;
--（2）创建索引
create index 索引名 on 表名(字段名)；
--（3）删除索引
drop index 索引名 on 表名;



-- 事务的相关操作
-- 开启事务
start transaction;
-- 阿里巴巴账户减少2000
update accout set money=money-2000 where name = '阿里巴巴';
-- 四十大盗账户增加2000
update accout set money=money+2000 where name = '四十大盗';
commit;