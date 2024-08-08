create tablespace hairshop datafile 'C:\hairshop.dbf' size 50m;

create user yang identified by 6131 default tablespace hairshop;
create user yong identified by 4442 default tablespace hairshop;
create user jo identified by 0282 default tablespace hairshop;
create user a identified by 8422 default tablespace hairshop;

grant dba,connect to a;
