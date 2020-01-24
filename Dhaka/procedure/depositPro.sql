set serveroutput on;
	--set verify off;
	
	create or replace procedure depositDhaka(
		id in Account.aid%TYPE,
		amount in Account.abalance%TYPE
		)
		is
		
		taka number;
		n int;
		negAmount exception;
		noUser exception;
		
	BEGIN
	
		select count(aid) into n from Account where aid = id;
		if amount<0 then
			raise negAmount;
		elsif n=0 then
			raise noUser;
		else
			select abalance into taka from Account where aid = id;
			taka := taka + amount;
			update Account set abalance = taka where aid = id;
		end if;
		
		
		exception
			when noUser then
				DBMS_OUTPUT.PUT_LINE('Invalid user name');
				
			when negAmount then
				DBMS_OUTPUT.PUT_LINE('Invalid amount');
		
	END depositDhaka;
	/