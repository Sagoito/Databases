--1
SELECT
    *
FROM
    Emp
WHERE
    Salary < 1300
ORDER BY
    Last_Name;
-- znalaz³em pracowników, których pensja miesiêczna wynosi poni¿ej 1300 nastêpnie posortowa³em wed³ug nazwiska
--2

SELECT
    ( Date_Ordered
      || ' '
      || Total )
FROM
    Ord;
-- polaczylem kolumny oddzielajac je spacja, u¿ywaj¹c operatora ||
--3

SELECT
    First_Name,
    Last_Name
FROM
    Emp
WHERE
    Title LIKE 'Stock Clerk'
    AND Salary > (
        SELECT
            AVG(Salary)
        FROM
            Emp
        WHERE
            Title LIKE 'Warehouse Manager'
    );
--wyszukalem imiona oraz nazwiska pracownikow ktorzy pracuja na stanowisku Stock Clerk nastepnie znalazlem tych ktorzy zarabiaja powyzej sredniej dla stanowiska Warehouse Manager przy uzyciu podzapytania
--4

SELECT
    COUNT(Id)
FROM
    Emp
WHERE
    Salary < (
        SELECT
            AVG(Salary)
        FROM
            Emp
    );
--policzylem ilosc wystapien id dla pracownikow ktorych pensja jest mniejsza niz srednia pensja wszystkich pracownikow
--5

SELECT
    *
FROM
    Emp
WHERE
    Months_Between(TO_DATE(Start_Date, 'yyyy-mm-dd'), TO_DATE(SYSDATE, 'yyyy-mm-dd')) * 31 / 12 >= 28
ORDER BY
    Start_Date;
--uzylem funkcji months_between by policzyc ilosc miesiecy pomiedzy data zatrudnienia, a dniem dzisiejszym nastepnie pomnozylem przez ilosc dni w miesiacu oraz podzielilem przez ilosc miesiecy nastepnie sprawdzilem czy wartosc jest mniejsza lub rowna 28 lat
--6

SELECT
    Sales_Rep_Id,
    SUM(Total)
FROM
    Ord
GROUP BY
    Sales_Rep_Id;
-- obliczylem sume kwot zamowien obsluzonych przez poszczegolnych sprzedawcow handlowych
--7

SELECT
    E1
FROM
    (
        SELECT
            Emp.Id E1,
            SUM(Ord.Total)
        FROM
            Emp,
            Ord
        WHERE
            Emp.Id = Ord.Sales_Rep_Id
        GROUP BY
            Emp.Id
        ORDER BY
            SUM(Ord.Total) DESC
    )
WHERE
    ROWNUM = 1;
-- wyswietlilem identyfikator pracownika poprzez wyszukanie w podzapytaniu sum zamowien obsluzonych przez kazdego z pracownikow, nastepnie posortowalem malejaco i wyswietlilem pierwszy wiersz
--8

SELECT
    E2
FROM
    (
        SELECT
            Emp.Id,
            SUM(Ord.Total),
            Emp.Last_Name E2
        FROM
            Emp,
            Ord
        WHERE
            Emp.Id = Ord.Sales_Rep_Id
        GROUP BY
            Emp.Id,
            Emp.Last_Name
        ORDER BY
            SUM(Ord.Total) DESC
    )
WHERE
    ROWNUM = 1;
-- wyswietlilem nazwisko pracownika poprzez wyszukanie w podzapytaniu sum zamowien obsluzonych przez kazdego z pracownikow, nastepnie posortowalem malejaco i wyswietlilem pierwszy wiers

--9

SELECT
    Start_Date,
    COUNT(Id)
FROM
    Emp
GROUP BY
    Start_Date
ORDER BY
    Start_Date;
--policzylem ilosc wystapien identyfikatora dla kazdego z poszczegolnych dni
--10

SELECT
    Product.Name
FROM
    Product,
    Inventory
WHERE
    Product.Id = Inventory.Product_Id
    AND Inventory.Amount_In_Stock LIKE 0
    AND Inventory.Out_Of_Stock_Explanation IS NOT NULL;
--sprawdzilem ktorych przedmiotow nie ma oraz wyswietlilem te, ktore maja opis
--11

SELECT
    Product.Name
FROM
    Inventory,
    Product
WHERE
    Inventory.Product_Id = Product.Id
GROUP BY
    Product.Name
HAVING
    SUM(Inventory.Amount_In_Stock) < 500;
--wyswietlilem nazwê produktów w których suma ilosci produktow we wszystkich magazynow jest mniejsza od 500
--12

SELECT
    Product.Name
FROM
    Product
WHERE
    ( Length(Product.Name) - Length(Replace(Product.Name, ' ', '')) + 1 ) = 3;
-- wyswietlilem nazwy produktow, ktorych dlugosc nazwy jest dluzsza o 3 w porownaniu do jej dlugosci po usunieciu spacji