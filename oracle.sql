-- 게시판용 테이블 생성(2021.05.20)
create table board2 (
	idx int primary key,
	name varchar(10),
	email varchar(50),
	homepage varchar(50),
	title varchar(50),
	content varchar(2000),
	pwd varchar(10),
	wdate date,
	hit int 
); 
-- 삭제할때 drop table board2;

-- sequence : 자동증가번호를 생성하는 객체
create sequence board2_idx_seq increment by 1 start with 1;
-- 삭제할때 drop sequence board2_idx_seq;
--------------------------------------------------------------------
-- select
select * from board2 order by idx;
-- desc board2; 이클립스에서는 안되는데 cli 로그인 상태에서는 가능
-- 테이블 목록 출력하기
select * from tab;
-- 시퀀스 목록 출력하기
select * from seq;

delete from board2 where idx=6;
