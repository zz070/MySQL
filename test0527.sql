-- 查看索引
show index from 表名;

-- 示例：查看学生表已有索引
show index from student;

-- 创建索引
create index 索引名 on 表名(字段名);

-- 创建班级表中，name字段的索引
create index idx_classes_name on classes(name);

-- 删除索引
drop index 索引名 on 表名;

-- 示例：删除班级表中name字段的索引
drop index idx_classes_name on classes;
