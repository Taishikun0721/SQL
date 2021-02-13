-- create table shohin
-- (
-- 	shohin_id char(4) not null,
-- 	shohin_mei varchar(100),
-- 	shohin_bunrui varchar(32),
-- 	hanbai_tanka integer,
-- 	shiire_tanka integer,
-- 	torokubi date,
-- 	primary key (shohin_id)
-- );

-- alter table shohin add column shohin_mei_kana varchar(100)

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

