--1
select * from dept;

--2
select dept_id, last_name, manager_id from emp;

--3
select salary*12 as wyplata_roczna, last_name from emp;

--4
select first_name as Imiê, last_name as Nazwisko, salary as Zarobki_miesiêczne, salary*12+1000 as Roczne_z_premia from emp;

--5
select first_name as Imiê, last_name as Nazwisko, salary as Zarobki_miesiêczne, salary*12*1.08 as Zarobki_roczne from emp;

--6
select last_name, salary*12+0.05*salary as Roczny_dochód from emp;

--7
select concat(first_name, last_name) as Imiê_i_Nazwisko from emp;

--8
select (first_name||' '||last_name||' - '||title) from emp;

--9
select last_name, salary, title, salary*commission_pct from emp;

--10
select last_name, salary, title, nvl(salary*commission_pct, 0) from emp;

--11
select distinct name from dept;

--12
select last_name, dept_id, salary, start_date from emp order by dept_id, salary desc;

--13
select last_name, dept_id, start_date from emp order by start_date;

--14
select first_name, last_name, title from emp where last_name = 'Patel';

--15
select first_name, last_name, start_date from emp where start_date between '91/05/02' and '91/06/15';

--16
select id, name, region_id from dept where region_id = 1 or region_id = 3;

--17
select * from emp where last_name like 'M%';

--18
select * from emp where last_name not like '%a%';

--19
select last_name, start_date from emp where start_date >= '91/01/01' and start_date < '92/01/01';

--20
select last_name from emp where last_name like '_a%';

--21
select name from customer where name like '%s_o%';