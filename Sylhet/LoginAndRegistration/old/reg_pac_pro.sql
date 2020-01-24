create or replace package regControlDhaka as
	procedure regDhaka(
		name in Employee.ename%TYPE,
		username in Employee.eusername%TYPE,
		branch in Employee.ebranch%TYPE,
		pass in Employee.epass%TYPE,
		email in Employee.eemail%TYPE,
		phone in Employee.ephone%TYPE,
		address in Employee.eaddress%TYPE);
	
end regControlDhaka;
/

set serveroutput on;
create or replace package body regControlDhaka as
	
	procedure regDhaka(
		name in Employee.ename%TYPE,
		username in Employee.eusername%TYPE,
		branch in Employee.ebranch%TYPE,
		pass in Employee.epass%TYPE,
		email in Employee.eemail%TYPE,
		phone in Employee.ephone%TYPE,
		address in Employee.eaddress%TYPE
		)
		is
		n int;
		id int;
		gen_id varchar2(20);
		sameusername exception;
		
	begin
		select count(eid) into n from Employee where eusername = username;
		
		if n=0 then
			
			select eid into id from id_gen;
			--gen_id := 'd_'||TO_CHAR(id);
			
			insert into Employee values(id, name, username, branch, pass, email, phone, address);
			
			id := id + 1;
			update Employee set eid = id;
			
			DBMS_OUTPUT.PUT_LINE('Registration SUCCESSFUL...');
			
		else
			raise sameusername;
		end if;
		
		
		exception
			when sameusername then
				DBMS_OUTPUT.PUT_LINE('User name already exists ...');
				
	end regDhaka;
	
end regControlDhaka;
/


--insert into Employee values(1, 'Ashiqul', 'ashiq33', 'Dhaka', '12345', 'ashiq33@gmail.com', '01761173134', 'niketon, Dhaka');