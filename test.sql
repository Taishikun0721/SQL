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
order by hanbaitanka, shohin_id


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









