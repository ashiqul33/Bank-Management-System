set serveroutput on;
	--set verify off;
	
	create or replace procedure withDraw(
		id in Account.aid%TYPE,
		amount in Account.abalance%TYPE,
		flag out boolean
		)
		is
		
		taka number;
		n int;
		negAmount exception;
		noUser exception;
		insufficient exception;
		
	BEGIN
	
		select count(aid) into n from Account where aid = id;
		if amount<0 then
			raise negAmount;
		elsif n=0 then
			raise noUser;
		else
			select abalance into taka from Account where aid = id;
			taka := taka - amount;
			if taka>=500 then
				update Account set abalance = taka where aid = id;
				flag := True;
			else 
				raise insufficient;
				flag := False;
			end if;
		end if;
		
		
		exception
			when noUser then
				DBMS_OUTPUT.PUT_LINE('Invalid user name');
				
			when negAmount then
				DBMS_OUTPUT.PUT_LINE('Invalid amount');
				
			when insufficient then
				DBMS_OUTPUT.PUT_LINE('Insufficient Balance');
		
	END withDraw;
	/