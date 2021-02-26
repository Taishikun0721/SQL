create table shohin
(
	shohin_id char(4) not null,
	shohin_mei varchar(100),
	shohin_bunrui varchar(32),
	hanbai_tanka integer,
	shiire_tanka integer,
	torokubi date,
	primary key (shohin_id)
);

alter table shohin add column shohin_mei_kana varchar(100)

begin transaction;

insert into shohin values
('0001', 'Tシャツ', '衣服', 1000, 500, '2009-09-20');
insert into shohin values
('0002', '穴あけパンチ', '事務用品', 500, 320, '2009-09-11');
insert into shohin values
('0003', 'カッターシャツ', '衣服', 4000, 2800, null);
insert into shohin values
('0004', '包丁', 'キッチン用品', 3000, 2800, '2009-09-20');
insert into shohin values
('0005', '圧力鍋', 'キッチン用品', 6800, 5000, '2009-01-15');
insert into shohin values
('0006', 'フォーク', 'キッチン用品', 500, null, '2009-09-20');
insert into shohin values
('0007', 'おろしがね', 'キッチン用品', 800, 790, '2008-04-28');
insert into shohin values
('0008', 'ボールペン', '事務用品', 100, null, '2009-11-11');

commit;

create table jyushoroku (
	toroku_bango integer not null,
	name varchar(128) not null,
	jyusho varchar(256) not null,
	tel_no char(10),
	mail_adress char(20),
	primary key(toroku_bango)
);

alter table jyushoroku add column yubin_bango char(8) not null;

drop table jyushoroku;

select shohin_id, shohin_mei, shiire_tanka from shohin;

select distinct shohin_bunrui from shohin;

select shohin_mei, shohin_bunrui from shohin where shohin_bunrui = '事務用品';

select shohin_mei, hanbai_tanka, hanbai_tanka * 2 as "hanbai_tanka * 2" from shohin;

select shohin_mei, shohin_bunrui from shohin where hanbai_tanka <> 500;


-- charsテーブル作成

create table chars (
	chr char(3) not null,
	primary key (chr)
);


insert into chars values('1');
insert into chars values('2');
insert into chars values('3');
insert into chars values('10');
insert into chars values('22');
insert into chars values('222');


select chr from chars where chr. > 2;

select shohin_mei, shohin_bunrui, hanbai_tanka from shohin where hanbai_tanka >= 1000;

select shohin_mei, hanbai_tanka from shohin where hanbai_tanka is null;

select shohin_mei, shiire_tanka from shohin
where shohin_bunrui = 'キッチン用品'
and hanbai_tanka >= 300
and shiire_tanka is not null;

select shohin_mei, shiire_tanka from shohin
where shohin_bunrui = 'キッチン用品'
or hanbai_tanka >= 300;


select * from chars
where chr > '2';


select * from shohin
where not hanbai_tanka > 1000;

select count(*) from shohin;


select sum(hanbai_tanka), sum(shiire_tanka) from shohin;

select avg(hanbai_tanka) from shohin;


select max(shiire_tanka) from shohin;

select count(shohin_bunrui), count(distinct shohin_bunrui) from shohin;

select shohin_bunrui, count(*) from shohin group by shohin_bunrui;

select shiire_tanka, count(*) from shohin group by shiire_tanka;

select shiire_tanka from shohin where shohin_bunrui = '衣服' group by shiire_tanka;

select shohin_bunrui, count(*)
from shohin
group by shohin_bunrui
having count(*) = 2;

select shohin_bunrui, avg(hanbai_tanka)
from shohin
group by shohin_bunrui
having avg(hanbai_tanka) >= 2500;


select shohin_bunrui, count(*)
from shohin
where shohin_bunrui = '衣服'
group by shohin_bunrui;

select shohin_id, shohin_mei, hanbai_tanka, shiire_tanka
from shohin
order by hanbai_tanka;

select shohin_id, shohin_mei, hanbai_tanka, shiire_tanka
from shohin
order by hanbaitanka, shohin_id;


select shohin_id as id, shohin_mei, hanbai_tanka as tanka, shiire_tanka
from shohin
order by tanka, id;


select shohin_bunrui, sum(hanbai_tanka), sum(shiire_tanka)
from shohin
group by shohin_bunrui
having sum(hanbai_tanka) > sum(shiire_tanka) * 1.5;

select *
from shohin
order by torokubi desc, hanbai_tanka;


create table shohinIns
(
	shohin_id char(4) not null,
	shohin_mei varchar(100) not null,
	shohin_bunrui varchar(32) not null,
	hanbai_tanka integer default 0,
	shiire_tanka integer,
	torokubi date,
	primary key (shohin_id)
);


insert into shohinIns (shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi)
values
('0001', 'Tシャツ', '衣服', 1000, 500, '2009-09-20');

begin transaction;

insert into shohinIns
values
('0002', 'ズボン', '衣服', 1000, 500, '2009-09-20');
insert into shohinIns
values
('0003', '包丁', 'キッチン用品', 3000, 2800, '2009-09-20')

commit;

insert into shohinIns
values
('0004', 'おろし金', 'キッチン用品', default, 790, '2020-04-28');

create table shohinCopy
(
	shohin_id char(4) not null,
	shohin_mei varchar(100),
	shohin_bunrui varchar(32),
	hanbai_tanka integer,
	shiire_tanka integer,
	torokubi date,
	primary key (shohin_id)
);

insert into shohinCopy
(shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi)
select shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi
from shohin;




delete from shohin
where hanbai_tanka >= 4000;

delete from shohin
where shiire_tanka is null;

drop table shohin;

update shohin
set torokubi = '2020-10-01';

update shohin
set shohin_bunrui = 'キッチン用品';
where shohin_bunrui = '衣服';

update shohin
set shohin_bunrui = null;

update shohin
set hanbai_tanka = hanbai_tanka * 10,
	shiire_tanka = shiire_tanka / 2
where shohin_bunrui = null;



begin transaction;

	update shohin
	set hanbai_tanka = hanbai_tanka - 1000
	where shohin_mei = 'カッターシャツ';

	update shohin
	set hanbai_tanka = hanbai_tanka + 1000
	where shohin_mei =  'Tシャツ';

commit;

begin transaction;

	delete from shohin
	where shohin_mei = 'カッターシャツ';

	delete from shohin
	where hanbai_tanka > 1000;

commit;


create table shohinSaeki
(
	shohin_id char(4) not null,
	shohin_mei varchar(100) not null,
	hanbai_tanka integer,
	shiire_tanka integer,
	saeki integer,
	primary key (shohin_id)
);

insert into shohinSaeki(shohin_id, shohin_mei, hanbai_tanka, shiire_tanka, saeki)
select shohin_id, shohin_mei, hanbai_tanka, shiire_tanka, hanbai_tanka - shiire_tanka
from shohin;
values
('0001', 'Tシャツ', 1000, 500, hanbai_tanka - shiire_tanka);

begin transaction;

	update shohinSaeki
	set hanbai_tanka = 1000
	where shohin_mei = 'おろしがね';

	update shohinSaeki
	set saeki = hanbai_tanka - shiire_tanka;

commit;

create view shohinSum
(shohin_bunrui, cnt_chohin)
as
select shohin_bunrui, count(*)
from shohin
group by shohin_bunrui;


create view shohincloth
(shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka)
as
select shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka
from shohin
where shohin_bunrui = '衣服';

insert into shohincloth
values ('0010', 'ワンピース', '衣服', 5000, 3000);

drop view shohincloth;

select shohin_bunrui, cnt_shohin
from
	(
		select shohin_bunrui, count(*) as cnt_shohin
		from shohin
		group by shohin_bunrui
	) as shohinBunrui;

select shohin_bunrui, sum_shiire
from
	(
		select shohin_bunrui, sum(shiire_tanka) as sum_shiire
		from shohin
		group by shohin_bunrui
	) as shohinSum;

select shohin_mei, hanbai_tanka
from shohin
where hanbai_tanka >
(
	select avg(hanbai_tanka)
	from shohin
);

select shohin_id, shohin_mei, hanbai_tanka, (select avg(hanbai_tanka) from shohin)
from shohin;

select shohin_bunrui, avg(hanbai_tanka)
from shohin
group by shohin_bunrui;

select shohin_bunrui, shohin_mei, hanbai_tanka
from shohin as S1
where hanbai_tanka >
(
	select avg(hanbai_tanka)
	from shohin as S2
	where S1.shohin_bunrui = S2.shohin_bunrui
	group by shohin_bunrui
);

create table samplemath
(
	m numeric (10,3),
	n integer,
	p integer
);


begin transaction;

insert into samplemath(m, n, p) values (500, 0, null);
insert into samplemath(m, n, p) values (-180, 0, null);
insert into samplemath(m, n, p) values (null, null, null);
insert into samplemath(m, n, p) values (null, 0, null);
insert into samplemath(m, n, p) values (null, 7,    3);
insert into samplemath(m, n, p) values (null, 5,    2);
insert into samplemath(m, n, p) values (null, 4,    null);
insert into samplemath(m, n, p) values (8,      null, 3);
insert into samplemath(m, n, p) values (2.27, 1,    null);
insert into samplemath(m, n, p) values (5.555, 2,   null);
insert into samplemath(m, n, p) values (null, 1,    null);
insert into samplemath(m, n, p) values (8.76, null, null);

commit;

select m, abs(m) as abs_col
from samplemath;


select n, p, mod(n, p) as mod_col
from samplemath;


select n, p, mod(n, p) as mod_col
from samplemath
where not n is null;

select m, round(m) as round_col
from samplemath;

select m, round(m, 2) as round_col
from samplemath;

CREATE TABLE SampleStr
(str1  VARCHAR(40),
 str2  VARCHAR(40),
 str3  VARCHAR(40));

BEGIN TRANSACTION;

INSERT INTO SampleStr (str1, str2, str3) VALUES ('あいう',	'えお'	,	NULL);
INSERT INTO SampleStr (str1, str2, str3) VALUES ('abc'	,	'def'	,	NULL);
INSERT INTO SampleStr (str1, str2, str3) VALUES ('山田'	,	'太郎'  ,	'です');
INSERT INTO SampleStr (str1, str2, str3) VALUES ('aaa'	,	NULL    ,	NULL);
INSERT INTO SampleStr (str1, str2, str3) VALUES (NULL	,	'あああ',	NULL);
INSERT INTO SampleStr (str1, str2, str3) VALUES ('@!#$%',	NULL	,	NULL);
INSERT INTO SampleStr (str1, str2, str3) VALUES ('ABC'	,	NULL	,	NULL);
INSERT INTO SampleStr (str1, str2, str3) VALUES ('aBC'	,	NULL	,	NULL);
INSERT INTO SampleStr (str1, str2, str3) VALUES ('abc太郎',	'abc'	,	'ABC');
INSERT INTO SampleStr (str1, str2, str3) VALUES ('abcdefabc','abc'	,	'ABC');
INSERT INTO SampleStr (str1, str2, str3) VALUES ('ミックマック',	'っ', 'ツ');

COMMIT;

select str1, str2, str1 || str2 as str_concat
from SampleStr;

select str1, length(str1)
from SampleStr;

select str1, lower(str1)
from SampleStr;

select str2, substring(str2, 2)
from SampleStrl;

select str1, str2, upper(str1) || upper(str2)
from SampleStr
where str2 is not null
and
str1 is not null;

select current_date;

select current_time;

select str1, coalesce(str1, '井之口')
from SampleStr;

select *
from SampleLike
where strcol like 'ddd%';

select *
from SampleStr
where str1 like '%a%';

select *
from SampleStr
where strcol like '%ddd';

select *
from SampleStr
where strcol like '%ddd%';

select *
from SampleLike
where strcol like 'abc___';

select shohin_mei, hanbai_tanka
from shohin
where hanbai_tanka between 3500 and 7000;

select shohin_mei, shiire_tanka
from shohin
where shiire_tanka = 320
or shiire_tanka = 500
or shiire_tanka = 5000;


select shohin_mei, shiire_tanka
from shohin
where shiire_tanka in (320, 500, 5000);

create table tenposhohin
(
	tenpo_id char(4) not null,
	tenpo_mei varchar(200) not null,
	shohin_id char(4) not null,
	suryo integer not null,
	primary key (tenpo_id, shohin_id)
);


select shohin_id, shohin_mei, hanbai_tanka
from shohin
where shohin_id in (select shohin_id from tenposhohin where tenpo_id = '000C');

select shohin_id, shohin_mei, hanbai_tanka
from shohin
where shohin_id not in (select shohin_id from tenposhohin where tenpo_id = '000A');


select shohin_mei,
case when shohin_bunrui = '衣服'
	then 'A:' || shohin_bunrui
	when shohin_bunrui = '事務用品'
	then 'B:' || shohin_bunrui
	when shohin_bunrui = 'キッチン用品'
	then 'C:' || shohin_bunrui
end
from shohin;

select
sum(case when shohin_bunrui = '衣服' then hanbai_tanka else 0 end) as sum_tanka_ihuku,
sum(case when shohin_bunrui = '事務用品' then hanbai_tanka else 0 end) as sum_tanka_jim,
sum(case when shohin_bunrui = 'キッチン用品' then hanbai_tanka else 0 end) as sum_kitchen_tanka
from shohin;

select shohin_mei, shiire_tanka
from shohin
where shiire_tanka not in (500, 2800, 5000);


select shohin_mei, shiire_tanka
from shohin
where shiire_tanka not in (500, 2800, 5000, null);

select
	count(case when hanbai_tanka <= 1000 then hanbai_tanka end) as low_price,
	count(case when hanbai_tanka >= 1001 and hanbai_tanka <= 3000 then hanbai_tanka end) as mid_price,
	count(case when hanbai_tanka >= 3001 then hanbai_tanka end) as high_price
from shohin;

select shohin_id, shohin_mei
from shohin
union
select shohin_id, shohin_mei
from shohin2;

select shohin_mei, shohin_id
from shohin
union
select shohin_bunrui, shohin_id
from shohin2;

select shohin_id, shohin_mei
from shohin
intersect
select shohin_id, shohin_mei
from shohin2;

select shohin_id, shohin_mei
from shohin;

select shohin_id, shohin_mei
from shohin2;

select shohin_id, shohin_mei
from shohin
except
select shohin_id, shohin_mei
from shohin2;

select ts.tenpo_id, ts.tenpo_mei, ts.shohin_id, s.shohin_mei, s.hanbai_tanka
from tenposhohin as ts
inner join shohin as s
on ts.shohin_id = s.shohin_id;

select ts.tenpo_id, ts.tenpo_mei, ts.shohin_id, s.shohin_mei, s.hanbai_tanka
from tenposhohin as ts
inner join shohin as s
on ts.shohin_id = s.shohin_id
where ts.tenpo_id = '000A';

select ts.tenpo_id, ts.tenpo_mei, ts.shohin_id, s.shohin_mei, s.hanbai_tanka
from tenposhohin as ts
inner join shohin as s
on ts.shohin_id = s.shohin_id
where s.hanbai_tanka < 1000;


select ts.tenpo_id, ts.tenpo_mei, ts.shohin_id, s.shohin_mei, s.hanbai_tanka
from tenposhohin as ts
right join shohin as s
on ts.shohin_id = s.shohin_id;

select ts.tenpo_id, ts.tenpo_mei, ts.shohin_id, s.shohin_mei, s.hanbai_tanka, zs.zaiko_suryo
from tenposhohin as ts
inner join shohin as s
on ts.shohin_id = s.shohin_id
	inner join ZaikoShohin as zs
	on ts.shohin_id = zs.shohin_id
where zs.souko_id = 'S001';

select ts.tenpo_mei, s.shohin_mei, sum(zs.zaiko_suryo)
from tenposhohin as ts
	inner join shohin as s
		on ts.shohin_id = s.shohin_id
		inner join ZaikoShohin as zs
			on ts.shohin_id = zs.shohin_id
where ts.tenpo_id = '000A'
group by ts.tenpo_mei, s.shohin_mei;

select ts.shohin_id, ts.tenpo_mei, ts.shohin_id, s.shohin_mei
from tenposhohin as ts
cross join shohin as s;

select count(*) from tenposhohin cross join shohin;

select * from shohin
union
select * from shohin
intersect
select * from shohin;

select coalesce(ts.tenpo_id, '不明'), coalesce(ts.tenpo_mei, '不明'), coalesce(ts.shohin_id, '不明'), s.shohin_mei, s.hanbai_tanka
from tenposhohin as ts
right outer join shohin as s
on ts.shohin_id = s.shohin_id;

select shohin_mei, shohin_bunrui, hanbai_tanka,
rank () over (partition by shohin_bunrui order by hanbai_tanka) as ranking
from shohin
order by shohin_bunrui;

select distinct departments.dept_name, employees.first_name
from departments
inner join dept_emp on departments.dept_no = dept_emp.dept_no
inner join employees on dept_emp.emp_no = employees.emp_no
where departments.dept_no = 'd001'
limit 100
order by employees.first_name;


select departments.dept_name
from departments
where dept_no = 'd001';

select * from current_dept_emp
limit 10;

select cde.emp_no, e.first_name, cde.to_date from current_dept_emp as cde
inner join employees as e
on cde.emp_no = e.emp_no
where cde.to_date < curdate()
limit 10;

select distinct d.dept_name, dm.emp_no, e.first_namee
from departments as d
inner join dept_manager as dm
on d.dept_no = dm.dept_no
inner join employees as e
on dm.emp_no = e.emp_no
limit 10;



alter table current_dept_emp add column test char(8) not null;

+----------------------+-------------+---------------+-------------+------------+----------------+-------+
| TABLE_NAME           | COLUMN_NAME | COLUMN_TYPE   | IS_NULLABLE | COLUMN_KEY | COLUMN_DEFAULT | EXTRA |
+----------------------+-------------+---------------+-------------+------------+----------------+-------+
| current_dept_emp     | emp_no      | int(11)       | NO          |            | NULL           |       |
| current_dept_emp     | dept_no     | char(4)       | NO          |            | NULL           |       |
| current_dept_emp     | from_date   | date          | YES         |            | NULL           |       |
| current_dept_emp     | to_date     | date          | YES         |            | NULL           |       |

| departments          | dept_no     | char(4)       | NO          | PRI        | NULL           |       |
| departments          | dept_name   | varchar(40)   | NO          | UNI        | NULL           |       |

| dept_emp             | emp_no      | int(11)       | NO          | PRI        | NULL           |       |
| dept_emp             | dept_no     | char(4)       | NO          | PRI        | NULL           |       |
| dept_emp             | from_date   | date          | NO          |            | NULL           |       |
| dept_emp             | to_date     | date          | NO          |            | NULL           |       |

| dept_emp_latest_date | emp_no      | int(11)       | NO          |            | NULL           |       |
| dept_emp_latest_date | from_date   | date          | YES         |            | NULL           |       |
| dept_emp_latest_date | to_date     | date          | YES         |            | NULL           |       |

| dept_manager         | emp_no      | int(11)       | NO          | PRI        | NULL           |       |
| dept_manager         | dept_no     | char(4)       | NO          | PRI        | NULL           |       |
| dept_manager         | from_date   | date          | NO          |            | NULL           |       |
| dept_manager         | to_date     | date          | NO          |            | NULL           |       |

| employees            | emp_no      | int(11)       | NO          | PRI        | NULL           |       |
| employees            | birth_date  | date          | NO          |            | NULL           |       |
| employees            | first_name  | varchar(14)   | NO          |            | NULL           |       |
| employees            | last_name   | varchar(16)   | NO          |            | NULL           |       |
| employees            | gender      | enum('M','F') | NO          |            | NULL           |       |
| employees            | hire_date   | date          | NO          |            | NULL           |       |

| salaries             | emp_no      | int(11)       | NO          | PRI        | NULL           |       |
| salaries             | salary      | int(11)       | NO          |            | NULL           |       |
| salaries             | from_date   | date          | NO          | PRI        | NULL           |       |
| salaries             | to_date     | date          | NO          |            | NULL           |       |

| titles               | emp_no      | int(11)       | NO          | PRI        | NULL           |       |
| titles               | title       | varchar(50)   | NO          | PRI        | NULL           |       |
| titles               | from_date   | date          | NO          | PRI        | NULL           |       |
| titles               | to_date     | date          | YES         |            | NULL           |       |

| v_full_departments   | dept_no     | char(4)       | NO          |            | NULL           |       |
| v_full_departments   | dept_name   | varchar(40)   | NO          |            | NULL           |       |
| v_full_departments   | manager     | varchar(32)   | YES         |            | NULL           |       |

| v_full_employees     | emp_no      | int(11)       | NO          |            | NULL           |       |
| v_full_employees     | first_name  | varchar(14)   | NO          |            | NULL           |       |
| v_full_employees     | last_name   | varchar(16)   | NO          |            | NULL           |       |
| v_full_employees     | birth_date  | date          | NO          |            | NULL           |       |
| v_full_employees     | gender      | enum('M','F') | NO          |            | NULL           |       |
| v_full_employees     | hire_date   | date          | NO          |            | NULL           |       |
| v_full_employees     | department  | varchar(40)   | YES         |            | NULL           |       |
+----------------------+-------------+---------------+-------------+------------+----------------+-------+


select
    case when id = 1 or id = 2 or id = 3
    then upper(nickname)
    else nickname
    end
from users;

select c.name, f.id, f.description
from categories as c
inner join foods as f
on c.id = f.category_id
inner join users as u
on f.user_id = u.id
where u.id = 3;

select u.id as user_id, u.nickname, count(f.*)
from foods as f
inner join users as u
on f.user_id = u.id
group by u.id, u.nickname
order by u.id;

select c.name, count(f.*)
from categories as c
inner join foods as f
on c.id = f.category_id
group  by c.name;

select  case pref_name
	when '徳島' then '四国'
	when '香川' then '四国'
	when '愛媛' then '四国'
	when '高知' then '四国'
	when '福岡' then '九州'
	when '佐賀' then '九州'
	when '長崎' then '九州'
	else 'その他'
end as district, sum(population)
from PopTbl
group by district;


select case
	when population < 100 then '01'
	when population >= 100 and population < 200 then '02'
	when population >= 200 and population < 300 then '03'
	when population >= 300 then '04'
	else null end as pop_class,
	count(population)
from PopTbl
group by pop_class
order by pop_class;

select pref_name, sum(case when sex = '1' then population else 0 end) as cnt_m,
sum(case when sex = '2' then population else 0 end) as cnt_f
from PopTbl2
group by pref_name;


create table testsal
	sex chr(1),
	salary integer,
	constraint check_salary check
	(
		case when sex = '2'
		then case when salary <= 200000
		then 1 else 0 end
	)

-- 普通のインサートとバルクインサートを試して見た。

-- 普通のインサート
-- require 'benchmark'
-- ActiveRecord::Base.transaction do
--   result = Benchmark.realtime do
--     1000.times do
--       current_user = User.find(User.all.map(&:id).sample(1))
--       Food.create!(description: Faker::Movies::StarWars.wookie_sentence, category_id: Category.all.map(&:id).sample(1).first, user_id: current_user.first.id)
--     end
--   end
--   puts "処理時間: #{result}秒"
-- end


-- バルクインサート

-- require 'benchmark'
-- ActiveRecord::Base.transaction do
--   result = Benchmark.realtime do
--     foods = []
--     1000.times do
--       current_user = User.find(User.all.map(&:id).sample(1))
--       foods << Food.new(description: Faker::Movies::StarWars.wookie_sentence, category_id: Category.all.map(&:id).sample(1).first, user_id: current_user.first.id)
--     end
--     Food.import(foods)
--   end
--   puts "処理時間: #{result}秒"
-- end

select pref_name , population
from PopTbl
where sex = '2';

create table Personnel
(name varchar(30) primary key,
salary integer not null);


begin transaction;

insert into Personnel
values ('相田', 300000);
insert into Personnel
values ('神崎', 270000);
insert into Personnel
values ('木村', 220000);
insert into Personnel
values ('斎藤', 290000);

commit;

update Personnel
set salary = salary * 0.9
where salary >= 300000;

update Personnel
set salary = salary * 1.1
where name = '相田';

update Personnel
set salary = case when salary >= 300000
			then salary * 0.9
			when salary >= 250000 and salary < 280000
			then salary * 1.2
			else salary end;

