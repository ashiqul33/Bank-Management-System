set serveroutput on;
set verify off;

declare
	username Employee.eusername@site_sylhet%TYPE;
	pass Employee.epass@site_sylhet%TYPE;

BEGIN 
	username := '&username';
	pass := '&pass';
	ControlSylhet.loginSylhet@site_sylhet(username, pass); 

	DBMS_OUTPUT.PUT_LINE('Login successfully');
END; 
/

commit;