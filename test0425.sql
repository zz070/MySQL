    -- 插入数据
     insert into exam values
     (5,'kai',86,45,78),
     (6,'lulu',99,56,76.7),
     (7,'aa',90,57,94),
     (8,'gi',45,67,87);

    -- in 和 or 的试用
    select name,math from exam where math in(98,90,99);
    select name,math from exam where math = 98 or math = 86 or math = 45;

    -- 使用like做模糊匹配
    -- _表示任意字符出现一次；%表示任意字符出现任意次
    select * from exam where name like '_i%';

    -- between and 的使用，前闭后闭区间
    select * from exam where chinese between 40 and 99;

    insert into exam values(9,'小明',90,98,78);
    select * from exam limit 4;

    -- 修改
     update exam set name = 'huhu'where id = 4;
     update exam set math = math +30 order by math+chinese+English limit 3;

     -- 删除操作,删除之后无法还原
    delete from exam where name = 'lili';

    -- not null
     create table student(
        id int not null,
        name varchar(20),
        email varchar(30)
    );

    -- unique
    create table student(
        id int unique,
        name varchar(20)
    );

    -- default
    create table student(
        id int unique,
        name varchar(20) default 'unknow'
    );

    -- primary key
    create table student(
        id int primary key,
        name varchar(20) default 'unknow'
    );
    -- foreign key ()reference()
    create table student(
        id int primary key,
        name varchar(20) default 'unknow'
    );
    create table class(
        id int primary key,
        s_id int,
        foreign key(s_id) references student(id)
        );