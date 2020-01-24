clear screen;
DROP TABLE Employee CASCADE CONSTRAINTS;
DROP TABLE id_gen CASCADE CONSTRAINTS;
DROP TABLE Account CASCADE CONSTRAINTS;

CREATE TABLE id_gen (
	geid number,
	gaid number,
	gtid number);

CREATE TABLE Employee (
	eid varchar2(7), 
	ename varchar2(20),
	eusername varchar2(10),
	epass varchar2(20),
	ebranch varchar2(10),
	eemail varchar2(20),
	ephone varchar2(15),
	eaddress varchar2(30),
    PRIMARY KEY(eid));
	
	
insert into id_gen values(1, 1, 1);


CREATE TABLE Account(
	aid varchar2(7), 
	aname varchar2(20),
	anid varchar2(30),
	abranch varchar2(10),
	aemail varchar2(20),
	aphone varchar2(15),
	aaddress varchar2(30),
	abalance number,
    PRIMARY KEY(aid));
	
CREATE TABLE TransactionLog(
	tid varchar2(7),
	tdate date,
	amount number,
	PRIMARY KEY(tid));

commit;