create table emp1(
    id int primary key,
    Ename varchar(20),
    salary int
);
create table emp2(
    id int primary key,
    Ename varchar(20),
    salary int
);
-- Insert into emp1
INSERT INTO emp1 (id, Ename, salary) VALUES
(1, 'Alice', 50000),
(2, 'Bob', 60000),
(3, 'Charlie', 55000),
(4, 'David', 70000),
(5, 'Eva', 65000);

-- Insert into emp2
INSERT INTO emp2 (id, Ename, salary) VALUES
(2, 'Bob', 62000),        -- Same ID & Name as emp1, salary different
(3, 'Charlie', 58000),    -- Same ID & Name, salary different
(5, 'Eva', 66000),        -- Same ID & Name, salary different
(6, 'Frank', 72000),
(7, 'Grace', 68000);

select id,Ename,min(salary) as salary
from
(
select * from emp1
union all
select* from emp2 
) as INTERMEDIATE_RESULT
group by id,Ename;