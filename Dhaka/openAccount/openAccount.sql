set serveroutput on;
set verify off;

declare
	name Account.aname@site_dhaka%TYPE;
	nid Account.anid@site_dhaka%TYPE;
	branch Account.abranch@site_dhaka%TYPE;
	email Account.aemail@site_dhaka%TYPE;
	phone Account.aphone@site_dhaka%TYPE;
	address Account.aaddress@site_dhaka%TYPE;
	balance Account.abalance@site_dhaka%TYPE;


BEGIN 

	name := '&name';
	nid := '&nid';
	branch := '&branch';
	email := '&email';
	phone := '&phone';
	address := '&address';
	balance := &balance;
	openAccountDhaka@site_dhaka(name, nid, branch, email, phone, address, balance);
	
	DBMS_OUTPUT.PUT_LINE('Account open successfully');
END; 
/

commit;