create table member(
MNO		NUMBER constraint mno_PK primary key, --유저 번호(sequence)
MID		NVARCHAR2(10) CONSTRAINT MID_NN_U NOT NULL UNIQUE, --유저 아이디
MPW		NVARCHAR2(10) CONSTRAINT MPW_NN NOT NULL, --비밀번호+
MNAME	NVARCHAR2(4) CONSTRAINT MNAME_NN NOT NULL, --이름
MPHONE	NVARCHAR2(11) CONSTRAINT MPHONE_NN NOT NULL, --전화번호
MGRADE NUMBER	constraint mgarde_nn not null default 3, --등급(1 매니저,2 디자이너,3 일반회원,4 블랙리스트)
MSSNO NUMBER(13) constraint mssno_nn not null,			--주민번호/사업자번호 13자리
mdate date	default sysdate	constraint	mdate_nn not null -- 가입일(자동으로 입력)
);

create table cut(
Cno			number 		constraint cno_pk primary key, 		  --커트 번호(sequnce)
csno		number		constraint csno_nn not null, 		  --매장번호
csname 		NVARCHAR2(10) constraint csname_NN NOT NULL,      --매장이름
ccutname	nvarchar2(10) constraint ccutname_nn not null,    --커트 이름
CPRICE 		NUMBER 	constraint CPRICE_NN NOT NULL, 			  --커트 가격
CCONTENTS 	NVARCHAR2(2000) constraint cCONTENTS_NN NOT NULL, --커트 내용설명
OFILE		VARCHAR2(50) NOT NULL,							  --커트 이미지파일 이름 변경 전
SFILE		VARCHAR2(50) NOT NULL						      --커트 이미지파일 이름 변경 후 
);


CREATE TABLE REVIEW(
RNO		NUMBER CONSTRAINT rno_PK primary key, --리뷰번호(sequence)
rdate	date DEFAULT SYSDATE constraint rdate_NN not null, --리뷰작성일(자동으로 입력)
rwriter nvarchar2(20) constraint rwriter_NN not null, --리뷰 작성자
rcontents nvarchar2(2000) constraint rcontents_NN not null, --리뷰내용
rdno number constraint rdno_nn not null, --리뷰할 디자이너 번호
rsno number constraint rsno_nn not null,	--리뷰할 매장 번호
rofile nvarchar2(100),				--리뷰 이미지파일 이름 변경 전
rsfile nvarchar2(100)				--리뷰 이미지파일 이름 변경 후
);

create table book(
bno 	number constraint bno_PK primary key, --예약번호(sequence)
bsname	nvarchar2(10) constraint bsname_nn not null, --매장이름
bdate varchar2(100) constraint bdate_nn not null, --예약 날짜(yy/MM/dd hh:mm)
bdno number constraint bdno_nn not null, --디자이너 번호
bdname nvarchar2(10) constraint bid_nn not null, --디자이너 명
bcut nvarchar2(10) constraint bcut_nn not null, --커트 명
buno number constraint bun_nn not null --예약한 사용자 번호
);


create table book_done as select * from book where 1 <> 1;
create table deleted_member as select * from member where 1<>1;


create table shop(
SNO		NUMBER		  constraint sno_pk primary key, --매장번호(sequence)
smno	number			constraint smno_nn not null, --매장 관리자 번호
SNAME 	NVARCHAR2(20) constraint SNAME_NN NOT NULL, --매장이름
SLOCATION NVARCHAR2(100) constraint SLOCATION_NN NOT NULL, --매장 위치
sopen NVARCHAR2(10) constraint Sopen_NN NOT NULL, --매장 오픈시간
sclose NVARCHAR2(10) constraint Sclose_NN NOT NULL --매장 클로징시간
);


create table designer(
dno 	number	constraint dno_pk	primary key, --디자이너 번호(sequence)
dname	nvarchar2(20)	constraint dname_nn not null unique, --디자이너 이름
dsno	number	constraint dsno_nn not null, --매장 번호
dopen	nvarchar2(20)	default '10:00' constraint dopen_nn not null, --출근 시간
dclose 	nvarchar2(20)	default	'22:00' constraint dclose_nn 	not null --퇴근 시간
DOFILE		VARCHAR2(50) default '없음',						  --디자이너 프로필사진 파일 이름 변경 전
DSFILE		VARCHAR2(50) default '없음'					      --디자이너 프로필사진 파일 이름 변경 후 
);

insert into designer(dno,dname,dsno) values (dno_seq.nextval,'q8',4)

create table users(
umno	number	constraint	umno_pk	primary key, --유저번호(mno)
umname	nvarchar2(20)	constraint	umname_nn not null, --유저이름(mname)
ugrade	number	default	1 constraint ugrade_nn not null, --유저 등급
ucount	number	default	0	constraint	ucount_nn not null, --유저의 예약 보이콧 횟수(5회시 벤)
umoney	number	default	0	constraint	umnoney_nn not null -- 사용한 금액
);



--mgrade가 3인 일반회원이 가입될때 users 테이블에 정보 추가하기
create trigger register_user_trigger
after insert on member for each row
when (new.mgrade=3)
begin
insert into users (umno,umname) values (:new.mno,:new.mname);
end;

--member 회원탈퇴 시 member데이터 저장
create or replace trigger delete_member_trigger
after delete on member for each row
begin
insert into deleted_member (mno,mid,mpw,mname,mphone,mssno,mgrade,mdate)
values (:old.mno,:old.mid,:old.mpw,:old.mname,:old.mphone,:old.mssno,:old.mgrade,sysdate);
end;

--유저가 5회 이상시 예약을 하고 예약시간을 안지키면 로그인 막기
create trigger ban_users_trigger
after update on users for each row
when(new.ucount=5) 
begin
update member set mgrade=4 where mno=:new.umno;
end;




create sequence ccode_seq
increment by 1
start with 1
nocache;


select * from member;
select * from book;
select * from CUT;
select * from MEMBER;
select * from REVIEW;
select * from shop;
select * from designer;
select * from deleted_member;
select * from users;
insert into review(rno,rwriter,rcontents,rdno,rsno) values(rno_seq.nextval,'q5','테스트합시다',8,4)

SELECT DISTINCT r.*,b.bdname,b.bsname FROM review r join book b on b.bdno=r.rdno where rwriter='q5';

select d.* from shop s join designer d on s.sno = d.dsno where sname='차홍아르더'
SELECT * FROM all_sequences where sequence_owner='ANN'; --모든 시퀀스 조회


