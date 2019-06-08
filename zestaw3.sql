--1
SELECT
    Lower(First_Name),
    Lower(Last_Name),
    Initcap(Userid),
    Upper(Title)
FROM
    Emp
WHERE
    Title LIKE 'VP%';

--2

SELECT
    First_Name,
    Last_Name
FROM
    Emp
WHERE
    Last_Name LIKE Initcap('PATEL');

--3

SELECT
    Concat(Concat(Name, ' - '), Country) AS "NAZWA I PAÑSTWO"
FROM
    Customer
WHERE
    Credit_Rating LIKE 'GOOD';

--4

SELECT
    Name,
    Length(Name)
FROM
    Product
WHERE
    Substr(Name, 1, 3) LIKE 'Ace';

--5

SELECT
    Round(41.5843, 2),
    Round(41.5843),
    Round(41.5843, - 1)
FROM
    Dual;

--6

SELECT
    Trunc(41.5843, 2),
    Trunc(41.5843, 0),
    Trunc(41.5843, - 1)
FROM
    Dual;

--7

SELECT
    Last_Name,
    Mod(Salary, Commission_Pct)
FROM
    Emp;

--7a

SELECT
    Last_Name,
    Mod(Salary, Commission_Pct)
FROM
    Emp
WHERE
    Mod(Salary, Commission_Pct) IS NOT NULL;

--8

SELECT
    SYSDATE
FROM
    Dual;

--9 

SELECT
    Last_Name,
    Round(Months_Between(TO_CHAR(SYSDATE, 'YYYY-MM-DD'), TO_CHAR(Start_Date, 'YYYY-MM-DD')) * 31 / 7)
FROM
    Emp
WHERE
    Dept_Id = 43;

--10

SELECT
    Id,
    Round(Months_Between(TO_CHAR(SYSDATE, 'YYYY-MM-DD'), TO_CHAR(Start_Date, 'YYYY-MM-DD'))),
    Add_Months(TO_CHAR(Start_Date, 'YYYY-MM-DD'), 3)
FROM
    Emp
WHERE
    Months_Between(TO_CHAR(SYSDATE, 'YYYY-MM-DD'), TO_CHAR(Start_Date, 'YYYY-MM-DD')) < 332;

----11

SELECT
    Product_Id,
    Restock_Date,
    Next_Day(Restock_Date, 5),
    Trunc(Add_Months(Restock_Date, + 1), 'mm') - 1
FROM
    Inventory
WHERE
    Restock_Date IS NOT NULL
ORDER BY
    Restock_Date;

--12

SELECT
    Id,
    Start_Date,
    TO_CHAR(Start_Date, 'MM')
FROM
    Emp
WHERE
    TO_CHAR(Start_Date, 'YYYY-MM-DD') >= '1991-01-01';

--13

SELECT
    Id,
    TO_CHAR(Date_Ordered, 'MM/YY')
FROM
    Ord
WHERE
    Sales_Rep_Id = 11;

--14

SELECT
    Last_Name,
    TO_CHAR(Start_Date, 'DD/MONTH/YEAR')
FROM
    Emp
WHERE
    TO_CHAR(Start_Date, 'YYYY/MM/DD') >= '1991/01/01';