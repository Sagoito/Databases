--1

SELECT
    Emp.Last_Name,
    Emp.First_Name,
    Emp.Dept_Id,
    Dept.Name
FROM
    Emp,
    Dept
WHERE
    Emp.Dept_Id = Dept.Id;

--2

SELECT
    Dept.Id,
    Dept.Region_Id,
    Region.Name
FROM
    Dept,
    Region
WHERE
    Dept.Region_Id = Region.Id;

--3

SELECT
    Emp.Last_Name,
    Emp.First_Name,
    Emp.Dept_Id,
    Dept.Name
FROM
    Emp,
    Dept
WHERE
    Emp.Dept_Id = Dept.Id
    AND Emp.Last_Name = 'Menchu';

--4

SELECT
    Emp.Last_Name,
    Region.Name,
    Emp.Commission_Pct
FROM
    Emp,
    Region,
    Dept
WHERE
    Emp.Dept_Id = Dept.Id
    AND Dept.Region_Id = Region.Id
    AND Emp.Commission_Pct IS NOT NULL;

--5

SELECT
    Nvl(Emp.Last_Name, '-') Nazwisko,
    Nvl(TO_CHAR(Emp.Id), '-'),
    Customer.Name
FROM
    Emp,
    Customer
WHERE
    Emp.Id (+) = Customer.Sales_Rep_Id;

--6
SELECT
    ( E1.Last_Name
      || ' pracuje dla '
      || E2.Last_Name )
FROM
    Emp   E1,
    Emp   E2
WHERE
    E1.Manager_Id = E2.Id;
    
--7

SELECT
    Customer.Name,
    Emp.Last_Name,
    Ord.Date_Ordered,
    Item.Quantity_Shipped,
    Product.Name
FROM
    Customer,
    Emp,
    Ord,
    Item,
    Product
WHERE
    Emp.Id = Ord.Sales_Rep_Id
    AND Customer.Id = Ord.Customer_Id
    AND Ord.Id = Item.Ord_Id
    AND Item.Product_Id = Product.Id
    AND Ord.Id = 101;
    
--8

SELECT
    Customer.Id,
    Customer.Name,
    Nvl(TO_CHAR(Ord.Id), '-')
FROM
    Customer,
    Ord
WHERE
    Customer.Id = Ord.Customer_Id (+);

--9

SELECT
    MAX(Salary),
    MIN(Salary),
    AVG(Salary),
    SUM(Salary),
    COUNT(Id)
FROM
    Emp;

--10

SELECT
    MIN(Last_Name),
    MAX(Last_Name)
FROM
    Emp;

--11

SELECT
    COUNT(Id)
FROM
    Emp
WHERE
    Dept_Id LIKE 31
    AND Commission_Pct IS NOT NULL;