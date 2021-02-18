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

