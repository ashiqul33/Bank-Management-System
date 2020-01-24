set serveroutput on;
set verify off;

declare
	name Account.aname@site_sylhet%TYPE;
	nid Account.anid@site_sylhet%TYPE;
	branch Account.abranch@site_sylhet%TYPE;
	email Account.aemail@site_sylhet%TYPE;
	phone Account.aphone@site_sylhet%TYPE;
	address Account.aaddress@site_sylhet%TYPE;
	balance Account.abalance@site_sylhet%TYPE;


BEGIN 

	name := '&name';
	nid := '&nid';
	branch := '&branch';
	email := '&email';
	phone := '&phone';
	address := '&address';
	balance := &balance;
	openAccountSylhet@site_sylhet(name, nid, branch, email, phone, address, balance);
	
	DBMS_OUTPUT.PUT_LINE('Account open successfully');
END; 
/

commit;