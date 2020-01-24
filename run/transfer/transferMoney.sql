set serveroutput on;
set verify off;

declare
	tid varchar2(7);
	rid varchar2(7);
	balance number;
	ndt int;
	nst int;
	ndr int;
	nsr int;
	
	flag boolean;
	
	noUser exception;
	negAmount exception;
	sameaccount exception;

BEGIN 

	tid := '&transfer_account_no';
	rid := '&receive_account_no';
	balance := &amount;
	
	if balance<0 then
		raise negAmount;
		
	elsif tid = rid then
		raise sameaccount;
		
	else
	
		select count(aid) into ndt from Account@site_dhaka where aid = tid;
		select count(aid) into nst from Account@site_sylhet where aid = tid;
		
		select count(aid) into ndr from Account@site_dhaka where aid = rid;
		select count(aid) into nsr from Account@site_sylhet where aid = rid;
	
		if (ndt>0 and ndr>0) then
			withDraw@site_dhaka(tid, balance, flag);
			if flag then
				depositDhaka@site_dhaka(rid, balance);
				DBMS_OUTPUT.PUT_LINE('Taka Transfer successfully');
			else
				DBMS_OUTPUT.PUT_LINE('Insufficient Balance');
			end if;
			
		elsif (ndt>0 and nsr>0) then
			withDraw@site_dhaka(tid, balance, flag);
			if flag then
				depositSylhet@site_sylhet(rid, balance);
				DBMS_OUTPUT.PUT_LINE('Taka Transfer successfully');
			else
				DBMS_OUTPUT.PUT_LINE('Insufficient Balance');
			end if;
			
		elsif (nst>0 and nsr>0) then
			withDraw@site_sylhet(tid, balance, flag);
			if flag then
				depositSylhet@site_sylhet(rid, balance);
				DBMS_OUTPUT.PUT_LINE('Taka Transfer successfully');
			else
				DBMS_OUTPUT.PUT_LINE('Insufficient Balance');
			end if;
			
		elsif (nst>0 and ndr>0) then
			withDraw@site_sylhet(tid, balance, flag);
			if flag then
				depositDhaka@site_dhaka(rid, balance);
				DBMS_OUTPUT.PUT_LINE('Taka Transfer successfully');
			else
				DBMS_OUTPUT.PUT_LINE('Insufficient Balance');
			end if;
		
		else
			raise noUser;
		end if;
	end if;
	
	exception
		when noUser then
			DBMS_OUTPUT.PUT_LINE('Invalid username');
		when negAmount then
			DBMS_OUTPUT.PUT_LINE('Invalid amount');
		when sameaccount then
			DBMS_OUTPUT.PUT_LINE('Transfer and Receive same account');
END; 
/

commit;