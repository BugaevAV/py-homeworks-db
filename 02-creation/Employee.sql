create table if not exists employee(
	id SERIAL primary key,
	name varchar(80) not null,
	dept_name varchar(80) not null,
	cheif_id integer references employee
);
