--1
DROP TABLE Patrons CASCADE CONSTRAINTS;

DROP TABLE Patrons CASCADE CONSTRAINTS;

DROP TABLE Customer CASCADE CONSTRAINTS;

DROP TABLE Dept CASCADE CONSTRAINTS;

DROP TABLE Emp CASCADE CONSTRAINTS;

DROP TABLE Image CASCADE CONSTRAINTS;

DROP TABLE Inventory CASCADE CONSTRAINTS;

DROP TABLE Item CASCADE CONSTRAINTS;

DROP TABLE Longtext CASCADE CONSTRAINTS;

DROP TABLE Ord CASCADE CONSTRAINTS;

DROP TABLE Product CASCADE CONSTRAINTS;

DROP TABLE Region CASCADE CONSTRAINTS;

DROP TABLE Title CASCADE CONSTRAINTS;

DROP TABLE Warehouse CASCADE CONSTRAINTS;

DROP TABLE Transactions CASCADE CONSTRAINTS;

DROP TABLE Books CASCADE CONSTRAINTS;

DROP TABLE Pozycja CASCADE CONSTRAINTS;

DROP TABLE Produkt CASCADE CONSTRAINTS;

DROP TABLE Zamowienia CASCADE CONSTRAINTS;

--2

CREATE TABLE Categories (
    Id        NUMBER(7) NOT NULL,
    Name      VARCHAR2(50) NOT NULL,
    User_Id   NUMBER(7) NOT NULL
)

Logging;

ALTER TABLE Categories ADD CONSTRAINT Categories_Pk PRIMARY KEY ( Id );

CREATE TABLE Posts (
    Id            NUMBER(7) NOT NULL,
    User_Id       NUMBER(7) NOT NULL,
    Description   VARCHAR2(255) NOT NULL,
    Answered_To   NUMBER(7) NOT NULL,
    Votes         NUMBER(7),
    "date"        DATE NOT NULL,
    Thread_Id     NUMBER(7) NOT NULL
)

Logging;

ALTER TABLE Posts ADD CONSTRAINT Posts_Pk PRIMARY KEY ( Id );

CREATE TABLE Thread (
    Id            NUMBER(7) NOT NULL,
    Name          VARCHAR2(50),
    Category_Id   NUMBER(7) NOT NULL,
    User_Id       NUMBER(7) NOT NULL
)

Logging;

ALTER TABLE Thread ADD CONSTRAINT Thread_Pk PRIMARY KEY ( Id );

CREATE TABLE "User" (
    Id           NUMBER(7) NOT NULL,
    Username     VARCHAR2(50) NOT NULL,
    Password     VARCHAR2(50) NOT NULL,
    First_Name   VARCHAR2(50),
    Last_Name    VARCHAR2(50),
    Posts        NUMBER(7),
    Last_Post    DATE,
    Country      VARCHAR2(50)
)

Logging;

ALTER TABLE "User" ADD CONSTRAINT User_Pk PRIMARY KEY ( Id );

ALTER TABLE Categories
    ADD CONSTRAINT Categories_User_Fk FOREIGN KEY ( User_Id )
        REFERENCES "User" ( Id )
    NOT DEFERRABLE;

ALTER TABLE Posts
    ADD CONSTRAINT Posts_Thread_Fk FOREIGN KEY ( Thread_Id )
        REFERENCES Thread ( Id )
    NOT DEFERRABLE;

ALTER TABLE Posts
    ADD CONSTRAINT Posts_User_Fk FOREIGN KEY ( User_Id )
        REFERENCES "User" ( Id )
    NOT DEFERRABLE;

ALTER TABLE Thread
    ADD CONSTRAINT Thread_Categories_Fk FOREIGN KEY ( Category_Id )
        REFERENCES Categories ( Id )
    NOT DEFERRABLE;

ALTER TABLE Thread
    ADD CONSTRAINT Thread_User_Fk FOREIGN KEY ( User_Id )
        REFERENCES "User" ( Id )
    NOT DEFERRABLE;
 
--3

SELECT
    Table_Name
FROM
    User_Tables;

--4

SELECT
    Table_Name    "TABLE_NAME",
    Column_Name   "COLUMN_NAME",
    Data_Type     "DATA_TYPE",
    Data_Length,
    Data_Precision,
    Nullable,
    Column_Id
FROM
    User_Tab_Columns;
 
 --5

SELECT
    Constraint_Name,
    Constraint_Type "CONSTRAINT_TYPE",
    Search_Condition
FROM
    User_Constraints;
  
--6

CREATE TABLE Reported_Posts (
    Id                   NUMBER(7) NOT NULL,
    Reason               VARCHAR2(255) NOT NULL,
    User_Id_Reporting    NUMBER(7) NOT NULL
        CONSTRAINT User_Id_Reporting_Fk
            REFERENCES "User" ( Id ),
    User_Id_Reported     NUMBER(7) NOT NULL,
    Post_Id_Reported     NUMBER(7) NOT NULL,
    Report_Description   VARCHAR2(255),
    CONSTRAINT User_Id_Reported_Fk2 FOREIGN KEY ( User_Id_Reported )
        REFERENCES "User" ( Id )
);

ALTER TABLE Reported_Posts
    ADD CONSTRAINT Post_Id_Reported_Fk FOREIGN KEY ( Post_Id_Reported )
        REFERENCES Posts ( Id );
--7

ALTER TABLE Posts
    ADD CONSTRAINT Posts_Fk_2 FOREIGN KEY ( Answered_To )
        REFERENCES Posts ( Id );
--8

INSERT INTO "User" (
    Id,
    Username,
    Password,
    First_Name,
    Last_Name,
    Posts,
    Last_Post,
    Country
) VALUES (
    1,
    'sskakunas0',
    'adL6R7',
    'Sallie',
    'Skakunas',
    1,
    TO_DATE('24/05/2019', 'dd/mm/yyyy'),
    'Serbia'
);

INSERT INTO "User" (
    Id,
    Username,
    Password,
    First_Name,
    Last_Name,
    Posts,
    Last_Post,
    Country
) VALUES (
    2,
    'cskitteral1',
    '3mTPWLoMYw',
    'Christye',
    'Skitteral',
    2,
    TO_DATE('06/02/2019', 'dd/mm/yyyy'),
    'Guatemala'
);

INSERT INTO "User" (
    Id,
    Username,
    Password,
    First_Name,
    Last_Name,
    Posts,
    Last_Post,
    Country
) VALUES (
    3,
    'dlowcock2',
    '8V7UbrZPMsL',
    'Dunn',
    'Lowcock',
    3,
    TO_DATE('13/04/2019', 'dd/mm/yyyy'),
    'Ireland'
);

INSERT INTO "User" (
    Id,
    Username,
    Password,
    First_Name,
    Last_Name,
    Posts,
    Last_Post,
    Country
) VALUES (
    4,
    'wreveland3',
    'VLDVMWuJgdqk',
    'Woodie',
    'Reveland',
    4,
    TO_DATE('13/06/2018', 'dd/mm/yyyy'),
    'Mexico'
);

INSERT INTO "User" (
    Id,
    Username,
    Password,
    First_Name,
    Last_Name,
    Posts,
    Last_Post,
    Country
) VALUES (
    5,
    'lmcorkill4',
    'uTuHOxDWqP',
    'Levi',
    'McOrkill',
    5,
    TO_DATE('03/05/2019', 'dd/mm/yyyy'),
    'Argentina'
);

INSERT INTO Categories (
    Id,
    Name,
    User_Id
) VALUES (
    1,
    'Obtuseleaf Fissidens Moss',
    1
);

INSERT INTO Categories (
    Id,
    Name,
    User_Id
) VALUES (
    2,
    'Bird''s-eye Gilia',
    5
);

INSERT INTO Categories (
    Id,
    Name,
    User_Id
) VALUES (
    3,
    'Queen Poppy',
    2
);

INSERT INTO Categories (
    Id,
    Name,
    User_Id
) VALUES (
    4,
    'Southern False Serviceberry',
    2
);

INSERT INTO Categories (
    Id,
    Name,
    User_Id
) VALUES (
    5,
    'Basindaisy',
    4
);

INSERT INTO Thread (
    Id,
    Name,
    Category_Id,
    User_Id
) VALUES (
    1,
    'Privet Honeysuckle',
    3,
    4
);

INSERT INTO Thread (
    Id,
    Name,
    Category_Id,
    User_Id
) VALUES (
    2,
    'Rupertia',
    3,
    2
);

INSERT INTO Thread (
    Id,
    Name,
    Category_Id,
    User_Id
) VALUES (
    3,
    'White Adder''s-mouth Orchid',
    2,
    3
);

INSERT INTO Thread (
    Id,
    Name,
    Category_Id,
    User_Id
) VALUES (
    4,
    'Tietongue',
    1,
    4
);

INSERT INTO Thread (
    Id,
    Name,
    Category_Id,
    User_Id
) VALUES (
    5,
    'Basin Wildrye',
    4,
    5
);

INSERT INTO Posts (
    Id,
    User_Id,
    Description,
    Answered_To,
    Votes,
    "date",
    Thread_Id
) VALUES (
    1,
    1,
    'Suspendisse potenti.',
    1,
    903,
    TO_DATE('24/05/2019', 'dd/mm/yyyy'),
    4
);

INSERT INTO Posts (
    Id,
    User_Id,
    Description,
    Answered_To,
    Votes,
    "date",
    Thread_Id
) VALUES (
    2,
    2,
    'Morbi ut odio.',
    2,
    265,
    TO_DATE('06/02/2019', 'dd/mm/yyyy'),
    5
);

INSERT INTO Posts (
    Id,
    User_Id,
    Description,
    Answered_To,
    Votes,
    "date",
    Thread_Id
) VALUES (
    3,
    3,
    'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae.',
    1,
    114,
    TO_DATE('13/04/2019', 'dd/mm/yyyy'),
    5
);

INSERT INTO Posts (
    Id,
    User_Id,
    Description,
    Answered_To,
    Votes,
    "date",
    Thread_Id
) VALUES (
    4,
    4,
    'In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl.',
    3,
    682,
    TO_DATE('13/06/2018', 'dd/mm/yyyy'),
    5
);

INSERT INTO Posts (
    Id,
    User_Id,
    Description,
    Answered_To,
    Votes,
    "date",
    Thread_Id
) VALUES (
    5,
    5,
    'Duis mattis egestas metus.',
    4,
    737,
    TO_DATE('03/05/2019', 'dd/mm/yyyy'),
    4
);

INSERT INTO Reported_Posts (
    Id,
    Reason,
    User_Id_Reporting,
    User_Id_Reported,
    Post_Id_Reported,
    Report_Description
) VALUES (
    1,
    'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.',
    2,
    1,
    3,
    'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.'
);

INSERT INTO Reported_Posts (
    Id,
    Reason,
    User_Id_Reporting,
    User_Id_Reported,
    Post_Id_Reported,
    Report_Description
) VALUES (
    2,
    'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.'
    ,
    1,
    5,
    2,
    'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.'
);

INSERT INTO Reported_Posts (
    Id,
    Reason,
    User_Id_Reporting,
    User_Id_Reported,
    Post_Id_Reported,
    Report_Description
) VALUES (
    3,
    'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.',
    1,
    4,
    3,
    'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.'
);

INSERT INTO Reported_Posts (
    Id,
    Reason,
    User_Id_Reporting,
    User_Id_Reported,
    Post_Id_Reported,
    Report_Description
) VALUES (
    4,
    'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.',
    2,
    1,
    3,
    'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.'
);

INSERT INTO Reported_Posts (
    Id,
    Reason,
    User_Id_Reporting,
    User_Id_Reported,
    Post_Id_Reported,
    Report_Description
) VALUES (
    5,
    'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.',
    4,
    5,
    2,
    'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.'
);

INSERT INTO Reported_Posts (
    Id,
    Reason,
    User_Id_Reporting,
    User_Id_Reported,
    Post_Id_Reported,
    Report_Description
) VALUES (
    6,
    'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.',
    4,
    5,
    2,
    'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.'
);

--9

SELECT
    *
FROM
    Posts;

--10

UPDATE "User"
SET
    Last_Name = 'Nowak'
WHERE
    Id = 2;

--11

SELECT
    *
FROM
    "User";

--12

CREATE TABLE Emp (
    Id           NUMBER(7),
    Userid       NUMBER(7)
        CONSTRAINT Userid_Fk
            REFERENCES "User" ( Id ),
    Start_Date   DATE,
    Title        VARCHAR2(25),
    Salary       NUMBER(11, 2)
)

ALTER TABLE Emp ADD CONSTRAINT Emp_Pk PRIMARY KEY ( Id );

INSERT INTO Emp VALUES (
    1,
    1,
    TO_DATE('03-03-1990 8:30', 'dd-mm-yyyy hh24:mi'),
    'President',
    2500
);

INSERT INTO Emp VALUES (
    2,
    2,
    TO_DATE('08-03-1990 8:30', 'dd-mm-yyyy hh24:mi'),
    'VP, Operations',
    1450
);

INSERT INTO Emp VALUES (
    3,
    3,
    TO_DATE('17-06-1991 8:30', 'dd-mm-yyyy hh24:mi'),
    'VP, Sales',
    1400
);

--13

INSERT INTO "User" VALUES (
    6,
    'jannowak',
    'ddaw5wnui3',
    'jan',
    'nowak',
    2,
    TO_DATE('03-03-1990', 'dd-mm-yyyy'),
    'France'
);

INSERT INTO "User" VALUES (
    7,
    'jankowalski',
    'gkv0kjy3',
    'jan',
    'kowalski',
    1,
    TO_DATE('08-03-1990', 'dd-mm-yyyy'),
    'Netherlands'
);

INSERT INTO "User" VALUES (
    8,
    'janbrzeczyk',
    'mgrejg443',
    'jan',
    'brzeczyk',
    4,
    TO_DATE('17-06-1991', 'dd-mm-yyyy'),
    'Germany'
);

--14

SELECT
    *
FROM
    "User";
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//ZADANIA ZESTAW 11
SET SERVEROUTPUT ON 
--1

DECLARE
    Num    NUMBER(7) := 2;
    Var    VARCHAR2(255) := 'To jest przykladowy tekst zmiennej';
    Data   CONSTANT DATE := TO_DATE('03-02-2019', 'dd-mm-yyyy');
BEGIN
    Dbms_Output.Put_Line(Num);
    Dbms_Output.Put_Line(Var);
    Dbms_Output.Put_Line(Data);
END;
--2

DECLARE
    Data     CONSTANT DATE := TO_DATE('1998/03/01', 'yyyy/mm/dd');
    Months   NUMBER(7) := Months_Between(SYSDATE, Data);
    Days     NUMBER(7) := Months * 31;
    Years    NUMBER(7) := Months / 12;
BEGIN
    Dbms_Output.Put_Line(Days);
    Dbms_Output.Put_Line(Months);
    Dbms_Output.Put_Line(Years);
END;

--3

DECLARE
    Name       VARCHAR2(255);
    Lastname   VARCHAR2(255);
    Salary     NUMBER(11, 2);
BEGIN
    SELECT
        First_Name,
        Last_Name,
        Salary
    INTO
        Name,
        Lastname,
        Salary
    FROM
        Emp
    WHERE
        Salary = (
            SELECT
                MAX(Salary)
            FROM
                Emp
        );

    Dbms_Output.Put_Line('imie: '
                         || Name
                         || ', nazwisko: '
                         || Lastname
                         || ', wynagrodzenie: '
                         || Salary);

    SELECT
        First_Name,
        Last_Name,
        Salary
    INTO
        Name,
        Lastname,
        Salary
    FROM
        Emp
    WHERE
        Salary = (
            SELECT
                MIN(Salary)
            FROM
                Emp
        );

    Dbms_Output.Put_Line('imie: '
                         || Name
                         || ', nazwisko: '
                         || Lastname
                         || ', wynagrodzenie: '
                         || Salary);

EXCEPTION
    WHEN Too_Many_Rows THEN
        Dbms_Output.Put_Line('wiecej niz jedna osoba zarabia najmniej lub najwiecej');
END;

--4a

DECLARE
    Firstname   VARCHAR2(255);
    Lastname    VARCHAR2(255);
    Salary      NUMBER(11, 2);
    CURSOR Curs IS
    SELECT
        First_Name,
        Last_Name,
        Salary
    FROM
        Emp;

BEGIN
    OPEN Curs;
    LOOP
        FETCH Curs INTO
            Firstname,
            Lastname,
            Salary;
        Dbms_Output.Put_Line('imie: '
                             || Firstname
                             || ', nazwisko: '
                             || Lastname
                             || ', wynagrodzenie: '
                             || Salary);

        EXIT WHEN Curs%Notfound;
    END LOOP;

    CLOSE Curs;
END;

--4b

DECLARE
    Firstname   VARCHAR2(255);
    Lastname    VARCHAR2(255);
    Salary      NUMBER(11, 2);
    N           NUMBER(7);
BEGIN
    SELECT
        MAX(Id)
    INTO N
    FROM
        Emp;

    FOR I IN 1..N LOOP
        SELECT
            First_Name,
            Last_Name,
            Salary
        INTO
            Firstname,
            Lastname,
            Salary
        FROM
            Emp
        WHERE
            Id = I;

        Dbms_Output.Put_Line('imie: '
                             || Firstname
                             || ', nazwisko: '
                             || Lastname
                             || ', wynagrodzenie: '
                             || Salary);

    END LOOP;

END;

--5

DECLARE
    CURSOR Curs (
        Date_Ord_From DATE,
        Date_Ord_To DATE
    ) IS
    SELECT
        *
    FROM
        Ord
    WHERE
        Date_Ordered > Date_Ord_From
        AND Date_Ordered < Date_Ord_To;

    Order_Ord   Curs%Rowtype;
    Firstname   VARCHAR2(255);
    Custname    VARCHAR2(255);
BEGIN
    OPEN Curs('31-aug-1991', '1-jan-1993');
    LOOP
        FETCH Curs INTO Order_Ord;
        SELECT
            First_Name
        INTO Firstname
        FROM
            Emp
        WHERE
            Id = Order_Ord.Sales_Rep_Id;

        SELECT
            Name
        INTO Custname
        FROM
            Customer
        WHERE
            Id = Order_Ord.Customer_Id;

        EXIT WHEN Curs%Notfound;
        Dbms_Output.Put_Line('date: '
                             || Order_Ord.Date_Ordered
                             || ' order id: '
                             || Order_Ord.Id
                             || ' customer id: '
                             || Order_Ord.Customer_Id
                             || ' emp id: '
                             || Order_Ord.Sales_Rep_Id);

        Dbms_Output.Put_Line('employee first name ' || Firstname);
        Dbms_Output.Put_Line('customer name ' || Custname);
    END LOOP;

    CLOSE Curs;
END;

SELECT
    *
FROM
    Customer;

--6a

CREATE TABLE Emp_New
    AS
        SELECT
            *
        FROM
            Emp;

DECLARE
    Average   NUMBER(9, 2);
    Ids       NUMBER(7);
    I         NUMBER := 1;
BEGIN
    SELECT
        AVG(Salary)
    INTO Average
    FROM
        Emp;

    SELECT
        COUNT(Id)
    INTO Ids
    FROM
        Emp
    WHERE
        Salary < Average;

    LOOP
        UPDATE Emp_New
        SET
            Salary = Salary * 1.2
        WHERE
            Salary < ( 0.5 * Average );

        I := I + 1;
        EXIT WHEN I = Ids;
    END LOOP;

END;

--6b

DECLARE
    Average   NUMBER(9, 2);
    Ids       NUMBER(7);
    I         NUMBER := 1;
BEGIN
    SELECT
        AVG(Salary)
    INTO Average
    FROM
        Emp;

    SELECT
        COUNT(Id)
    INTO Ids
    FROM
        Emp
    WHERE
        Salary < Average;

    LOOP
        UPDATE Emp_New
        SET
            Salary = Salary * 1.1
        WHERE
            Salary > ( 0.5 * Average )
            AND Salary < ( ( 5 / 6 ) * Average );

        I := I + 1;
        EXIT WHEN I = Ids;
    END LOOP;

END;

--6c

DECLARE
    Average   NUMBER(9, 2);
    Ids       NUMBER(7);
    I         NUMBER := 1;
BEGIN
    SELECT
        AVG(Salary)
    INTO Average
    FROM
        Emp;

    SELECT
        COUNT(Id)
    INTO Ids
    FROM
        Emp
    WHERE
        Salary < Average;

    LOOP
        UPDATE Emp_New
        SET
            Salary = Salary * 1.05
        WHERE
            Salary > ( ( 5 / 6 ) * Average );

        I := I + 1;
        EXIT WHEN I = Ids;
    END LOOP;

END;