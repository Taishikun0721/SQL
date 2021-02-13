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

alter table shohin add column shohin_mei_kana varchar(100)
