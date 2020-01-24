--Account open procedure START

	set serveroutput on;
	--set verify off;
	
	create or replace procedure openAccountDhaka(
		name in Account.aname%TYPE,
		nid in Account.anid%TYPE,
		branch in Account.abranch%TYPE,
		email in Account.aemail%TYPE,
		phone in Account.aphone%TYPE,
		address in Account.aaddress%TYPE,
		balance in Account.abalance%TYPE
		)
		is
	
		id number;
		gen_id varchar2(7);
		--balance number := 1000;
		
		errorAmount exception;
		negAmount exception;
		
	BEGIN
			
			if balance<0 then
				raise negAmount;
			elsif balance<500 then
				raise errorAmount;
			else
				select gaid into id from id_gen;
				gen_id := 'da'||TO_CHAR(id);
			
				insert into Account values(gen_id, name, nid, branch, email, phone, address, balance);
				DBMS_OUTPUT.PUT_LINE('Account openned successfully');
			
				id := id + 1;
				update id_gen set gaid = id;
			end if;
			
			exception
				when errorAmount then
					DBMS_OUTPUT.PUT_LINE('Amount too low');
				when negAmount then
					DBMS_OUTPUT.PUT_LINE('Invalid Amount');
		
	END openAccountDhaka;
	/
	--Account open procedure END