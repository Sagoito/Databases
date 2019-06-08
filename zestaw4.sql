--1

SELECT
    Credit_Rating,
    COUNT(Id)
FROM
    Customer
GROUP BY
    Credit_Rating;

--2

SELECT
    Title,
    SUM(Salary)
FROM
    Emp
WHERE
    Title NOT LIKE '%VP%'
GROUP BY
    Title;

--3

SELECT
    Title,
    MAX(Salary)
FROM
    Emp
GROUP BY
    Title;

--4

SELECT
    Dept.Name,
    AVG(Emp.Salary)
FROM
    Dept,
    Emp
WHERE
    Dept.Id = Emp.Dept_Id
GROUP BY
    Dept.Name
HAVING
    AVG(Emp.Salary) >= 1499;
--5

SELECT
    Ord.Id,
    Customer.Name,
    Product.Name,
    Ord.Payment_Type,
    Ord.Date_Ordered,
    Item.Price,
    Item.Quantity_Shipped
FROM
    Customer,
    Ord,
    Item,
    Product
WHERE
    TO_CHAR(Date_Ordered, 'YYYY/MM/DD') BETWEEN '1992/09/01' AND '1992/09/30'
    AND Customer.Id = Ord.Customer_Id
    AND Ord.Id = Item.Ord_Id
    AND Product.Id = Item.Product_Id
    AND Lower(Payment_Type) LIKE 'cash'
ORDER BY
    Ord.Id,
    Product.Name;
    
--6

SELECT
    Customer.Name,
    Ord.Payment_Type,
    Ord.Date_Ordered,
    SUM(Item.Price * Item.Quantity_Shipped)
FROM
    Customer,
    Ord,
    Item
WHERE
    Customer.Id = Ord.Customer_Id
    AND Ord.Id = Item.Ord_Id
    AND TO_CHAR(Date_Ordered, 'YYYY/MM/DD') BETWEEN '1992/09/01' AND '1992/09/30'
    AND Lower(Payment_Type) LIKE 'cash'
GROUP BY
    Customer.Name,
    Ord.Payment_Type,
    Ord.Date_Ordered;
    
--7

SELECT
    Last_Name
FROM
    Emp
GROUP BY
    Last_Name
HAVING
    COUNT(Last_Name) >= 2;

--8

SELECT
    First_Name,
    Last_Name,
    Title,
    Manager_Id,
    Level
FROM
    Emp
CONNECT BY
    PRIOR Id = Manager_Id
START WITH Manager_Id IS NULL
ORDER BY
    Level;
    
--9

SELECT
    First_Name,
    Last_Name,
    Title,
    Manager_Id,
    Level
FROM
    Emp
CONNECT BY
    PRIOR Id = Manager_Id
START WITH Title = 'VP, Operations'
ORDER BY
    Level;
    
--10

SELECT
    Region_Id,
    Name
FROM
    Dept
UNION
SELECT
    Id,
    Name
FROM
    Region
ORDER BY
    Name;

--11

SELECT
    Name
FROM
    Dept
UNION
SELECT
    Name
FROM
    Region
ORDER BY
    Name;

--12

SELECT
    Name
FROM
    Dept
UNION ALL
SELECT
    Name
FROM
    Region;

--13

SELECT
    Dept_Id,
    Last_Name
FROM
    Emp
UNION
SELECT
    Id,
    Name
FROM
    Region
ORDER BY
    Last_Name;

--14

SELECT
    Id
FROM
    Customer
INTERSECT
SELECT
    Customer_Id
FROM
    Ord;

--15

SELECT
    Id
FROM
    Customer
MINUS
SELECT
    Customer_Id
FROM
    Ord;