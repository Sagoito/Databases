--1
/*
COMMIT - zatwierdza zmiany wprowadzone za pomoca polecen
ROLLBACK - wycofuje wprowadzone zmiany za pomoca polecen
SAVEPOINT - reczne ustawianie punktow kontrolnych, ktore moga byc wykorzystywane do bardziej precyzyjnego wycofywania zmian
*/

--2
SET AUTOCOMMIT OFF;

--3

INSERT INTO Emp VALUES (
    100,
    'Czarnecki',
    'Malik',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
);

COMMIT;

--4

INSERT INTO Emp VALUES (
    101,
    'Ksiazek',
    'Damian',
    NULL,
    TO_DATE('10/05/2019', 'dd/mm/yyyy'),
    NULL,
    NULL,
    NULL,
    NULL,
    10000,
    NULL
);

SELECT
    *
FROM
    Emp;

ROLLBACK;

--5

INSERT INTO Emp VALUES (
    101,
    'Ksiazek',
    'Damian',
    NULL,
    TO_DATE('10/05/2019', 'dd/mm/yyyy'),
    NULL,
    NULL,
    NULL,
    NULL,
    10000,
    NULL
);

COMMIT;

--6

SELECT
    *
FROM
    Item;

--a

UPDATE Item
SET
    Price = Price * 1.15;

--b

SAVEPOINT S1;

--c

SELECT
    SUM(Price)
FROM
    Item;

--d

UPDATE Item
SET
    Price = Price * 1.1;

--e

SAVEPOINT S2;
--f

SELECT
    SUM(Price)
FROM
    Item;

--g

UPDATE Item
SET
    Price = Price * 1.6;
--h

SELECT
    SUM(Price)
FROM
    Item;
--i

ROLLBACK TO S2;
--j

SELECT
    SUM(Price)
FROM
    Item;
--k

ROLLBACK TO S1;
--l

SELECT
    SUM(Price)
FROM
    Item;
--m

COMMIT;

--7

SET AUTOCOMMIT ON;

--8

CREATE TABLE Region_Kopia (
    Id     NUMBER(7),
    Name   VARCHAR2(50)
);

INSERT INTO Region_Kopia (
    Id,
    Name
)
    SELECT
        Id,
        Name
    FROM
        Region;

--9

INSERT INTO Dept (
    Id,
    Name,
    Region_Id
)
    SELECT
        Id * 1000,
        Substr(Name, 0, 4),
        Region_Id
    FROM
        Dept;

--10

INSERT INTO Region_Kopia (
    Id,
    Name
)
    SELECT DISTINCT
        Customer.Id,
        Customer.Name
    FROM
        Customer,
        Ord
    WHERE
        Ord.Customer_Id = Customer.Id
        AND Total > 1000;

--11

UPDATE Emp
SET
    Salary = Salary * 3,
    Start_Date = TO_DATE('2001-12-31', 'YY/MM/DD')
WHERE
    Last_Name LIKE 'Ksiazek';

--12
--a)

UPDATE Product
SET
    Suggested_Whlsl_Price = Suggested_Whlsl_Price * 0.9
WHERE
    Id IN (
        SELECT
            Product_Id
        FROM
            Item
        WHERE
            Quantity_Shipped < 30
    );
    
--b)

UPDATE Product
SET
    Suggested_Whlsl_Price = Suggested_Whlsl_Price * 1.08
WHERE
    Id IN (
        SELECT
            Product_Id
        FROM
            (
                SELECT
                    Product_Id,
                    SUM(Quantity_Shipped)
                FROM
                    Item
                GROUP BY
                    Product_Id
                ORDER BY
                    SUM(Quantity_Shipped) DESC
            )
        WHERE
            ROWNUM <= 5
    );

--13

UPDATE Emp
SET
    Salary = Salary * 1.3
WHERE
    Title LIKE 'VP%';
--14

DELETE FROM Emp
WHERE
    Last_Name LIKE 'Ksiazek'
    OR Last_Name LIKE 'Czarnecki';

--15

DROP TABLE Region_Kopia;