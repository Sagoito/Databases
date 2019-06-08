--1
SELECT
    Id,
    Total
FROM
    Ord
WHERE
    Total = (
        SELECT
            MAX(Total)
        FROM
            Ord
    );
    
--2

SELECT
    Id,
    Date_Ordered,
    Date_Shipped,
    Total
FROM
    Ord
WHERE
    ( Payment_Type,
      Total ) = (
        SELECT
            'CASH',
            MIN(Total)
        FROM
            Ord
        WHERE
            Payment_Type = 'CASH'
    );
    
--3

SELECT
    Id,
    Date_Ordered,
    Date_Shipped,
    Total
FROM
    Ord
WHERE
    Total > (
        SELECT
            AVG(Total)
        FROM
            Ord
    );

--4

SELECT
    Name,
    Suggested_Whlsl_Price
FROM
    Product
WHERE
    Suggested_Whlsl_Price < (
        SELECT
            AVG(Suggested_Whlsl_Price)
        FROM
            Product
        WHERE
            Name LIKE 'Prostar%'
    );


--5

SELECT
    Warehouse_Id,
    Product_Id,
    Amount_In_Stock
FROM
    Inventory
WHERE
    ( Warehouse_Id,
      Amount_In_Stock ) IN (
        SELECT
            Warehouse_Id,
            MAX(Amount_In_Stock)
        FROM
            Inventory
        GROUP BY
            Warehouse_Id
    );
/* Dwa produkty maj¹ równ¹, najwiêksz¹ iloœæ w magazynie */

--6

SELECT
    Warehouse_Id,
    Product_Id,
    Amount_In_Stock
FROM
    Inventory I1
WHERE
    Amount_In_Stock IN (
        SELECT
            MAX(Amount_In_Stock)
        FROM
            Inventory I2
        WHERE
            I2.Warehouse_Id = I1.Warehouse_Id
    );
/* Drugie zapytanie posortowa³o wed³ug warehouse_id, poniewa¿ rekordy by³y przyrównywane do siebie pokolei, natomiast pierwsze tylko pogrupowa³o rekordy */

--7

SELECT
    Warehouse.City,
    Product.Name,
    Inventory.Amount_In_Stock
FROM
    Inventory,
    Warehouse,
    Product
WHERE
    Warehouse.Id = Inventory.Warehouse_Id
    AND Product.Id = Inventory.Product_Id
    AND Inventory.Amount_In_Stock IN (
        SELECT
            MAX(Inventory.Amount_In_Stock)
        FROM
            Inventory
        WHERE
            Inventory.Warehouse_Id = Warehouse.Id
    );
    
    
    
--8

SELECT
    Name
FROM
    Customer
WHERE
    NOT EXISTS (
        SELECT
            *
        FROM
            Ord
        WHERE
            Ord.Customer_Id = Customer.Id
    );
 
 --9

SELECT
    Customer.Id,
    Customer.Name,
    Ord.Id
FROM
    Customer,
    Ord
WHERE
    Customer.Id = Ord.Customer_Id
    AND EXISTS (
        SELECT
            *
        FROM
            Ord
        WHERE
            Ord.Customer_Id = Customer.Id
    );
 
 --10

SELECT
    Customer_Id,
    Id
FROM
    Ord
ORDER BY
    Customer_Id;
 
 --11

SELECT
    Emp.Last_Name
FROM
    Emp
WHERE
    Emp.Id IN (
        SELECT
            Sales_Rep_Id
        FROM
            Ord
        WHERE
            Id < 100
    );
 
 --12

SELECT DISTINCT
    Emp.Last_Name
FROM
    Emp,
    Ord
WHERE
    Emp.Id = Ord.Sales_Rep_Id
    AND Ord.Id < 100;
 
/* u¿yæ distinct po klauzuli select */
--13

SELECT
    ( First_Name
      || ' '
      || Last_Name )
FROM
    Emp
WHERE
    Emp.Id IN (
        SELECT
            Sales_Rep_Id
        FROM
            Ord
        GROUP BY
            Sales_Rep_Id
        HAVING
            COUNT(Id) >= 4
    );
            