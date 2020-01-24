create or replace package ControlDhaka as
	--Registration procedure
	procedure regDhaka(
		name in Employee.ename%TYPE,
		username in Employee.eusername%TYPE,
		pass in Employee.epass%TYPE,
		branch in Employee.ebranch%TYPE,
		email in Employee.eemail%TYPE,
		phone in Employee.ephone%TYPE,
		address in Employee.eaddress%TYPE
	);
	
	--Login procedure	
	procedure loginDhaka(
		username in Employee.eusername%TYPE,
		pass in Employee.epass%TYPE
	);
	
end ControlDhaka;
/

set serveroutput on;
create or replace package body ControlDhaka as
	
	--Registration procedure START
	procedure regDhaka(
		name in Employee.ename%TYPE,
		username in Employee.eusername%TYPE,
		pass in Employee.epass%TYPE,
		branch in Employee.ebranch%TYPE,
		email in Employee.eemail%TYPE,
		phone in Employee.ephone%TYPE,
		address in Employee.eaddress%TYPE
		)
		is
		n int;
		id number;
		gen_id varchar2(7);
		sameusername exception;
		
	begin
		select count(eid) into n from Employee where eusername = username;
		
		if n=0 then
			
			select geid into id from id_gen;
			gen_id := 'd'||TO_CHAR(id);
			
			--DBMS_OUTPUT.PUT_LINE(gen_id);
			
			insert into Employee values(gen_id, name, username, pass, branch, email, phone, address);
			
			id := id + 1;
			update id_gen set geid = id;
			
			--clear screen;
			DBMS_OUTPUT.PUT_LINE('\n');
			DBMS_OUTPUT.PUT_LINE('Registration SUCCESSFUL...');
			
		else
			raise sameusername;
		end if;
		
		
		exception
			when sameusername then
				DBMS_OUTPUT.PUT_LINE('User name already exists ...');
				
	end regDhaka;
	--Registration procedure END
	
	--Login procedure START
	procedure loginDhaka(
		username in Employee.eusername%TYPE,
		pass in Employee.epass%TYPE
		)
		is
		n int;
		
		noUser exception;
		wrongPass exception;
		begin
		
		select count(eid) into n from Employee where eusername = username AND epass = pass;
			
		if n=0 then
			select count(eid) into n from Employee where eusername = username;
			if n=0 then
				raise noUser;
			else
				raise wrongPass;
			end if;
		else
			DBMS_OUTPUT.NEW_LINE;
			DBMS_OUTPUT.PUT_LINE('Login successful');
		end if;
				
		exception
			when noUser then
				DBMS_OUTPUT.NEW_LINE;
				DBMS_OUTPUT.PUT_LINE('No user found');
			when wrongPass then
				DBMS_OUTPUT.NEW_LINE;
				DBMS_OUTPUT.PUT_LINE('Wrong PASSWORD');
	
	end loginDhaka;
	--Login procedure END
	
end ControlDhaka;
/

commit;

--insert into Employee values(1, 'Ashiqul', 'ashiq33', 'Dhaka', '12345', 'ashiq33@gmail.com', '01761173134', 'niketon, Dhaka');