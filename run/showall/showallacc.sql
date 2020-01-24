set serveroutput on;

declare
	id Account.aid%TYPE;
	name Account.aname%TYPE;
	nid Account.anid%TYPE;
	branch Account.abranch%TYPE;
	email Account.aemail%TYPE;
	phone Account.aphone%TYPE;		
	address Account.aaddress%TYPE;
	balance Account.abalance%TYPE;

	cursor account_cur is
	(select aid,aname,anid,abranch,aemail,aphone,aaddress,abalance from Account@site_dhaka) union 
	(select aid,aname,anid,abranch,aemail,aphone,aaddress,abalance from Account@site_sylhet);
	
begin
	open account_cur;
		DBMS_OUTPUT.PUT_LINE('ID '||' NAME '||' NID '||' BRANCH '||' EMAIL '||' PHONE '||' ADDRESS '||' BALANCE ');
		loop
			fetch account_cur into id,name,nid,branch,email,phone,address,balance;
			exit when account_cur%notfound;
			DBMS_OUTPUT.PUT_LINE(id||' '||name||' '||nid||' '||branch||' '||email||' '||phone||' '||address||' '||TO_CHAR(balance));
		end loop;
	close account_cur;
end;
/

