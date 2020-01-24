create or replace package loginControl as
	procedure loginAcc(
		uaccno in userTable_dhk.uaccno%TYPE,
		upass in userTable_dhk.upass%TYPE);
	
end loginCtrl;
/

create or replace package body loginCtrl as

	procedure loginAcc(
		uaccnum in userTable_dhk.uaccno%TYPE,
		uPassW in userTable_dhk.upass%TYPE)
		is
		n int;
		noUser exception;
		wrongPass exception;
	begin
		
		select count(unum) into n from userTable_dhk where uaccno = uaccnum AND upass = uPassW;
			
		if n=0 then
			select count(unum) into n from userTable_dhk where uaccno = uaccnum;
			if n=0 then
				raise noUser;
			else
				raise wrongPass;
			end if;
		else
			DBMS_OUTPUT.PUT_LINE('Login successful');
		end if;
				
	exception
		when noUser then
			DBMS_OUTPUT.PUT_LINE('No user found');
		when wrongPass then
			DBMS_OUTPUT.PUT_LINE('Wrong PASSWORD');
			
	end loginAcc;
	
end loginCtrl;
/