--1
CREATE TABLE Klient (
    Customerid    INTEGER PRIMARY KEY,
    Name          VARCHAR(25),
    Surname       VARCHAR(35),
    Addr_Street   VARCHAR(45),
    Addr_Zip      CHAR(5),
    Addr_City     VARCHAR(45),
    Login         VARCHAR(14) NOT NULL,
    Passwd        VARCHAR(12) NOT NULL
);

CREATE TABLE Zamowienia (
    Orderid      INTEGER PRIMARY KEY,
    Idcustomer   INTEGER NOT NULL,
    FOREIGN KEY ( Idcustomer )
        REFERENCES Klient ( Customerid ),
    Crdate       DATE
);

CREATE TABLE Produkt (
    Productid     INTEGER PRIMARY KEY,
    Name          VARCHAR(35),
    Price_Net     FLOAT NOT NULL,
    Price_Gross   FLOAT NOT NULL,
    Description   CLOB
);

CREATE TABLE Pozycja (
    Idproduct   INTEGER NOT NULL,
    FOREIGN KEY ( Idorder )
        REFERENCES Zamowienia ( Orderid ),
    Idorder     INTEGER NOT NULL,
    FOREIGN KEY ( Idproduct )
        REFERENCES Produkt ( Productid ),
    Quantity    INTEGER NOT NULL
);

--2.1

ALTER TABLE Klient ADD Email VARCHAR(255) NOT NULL;

--2.2

ALTER TABLE Klient RENAME COLUMN Addr_Zip TO Addr_Postalcode;

ALTER TABLE Klient MODIFY (
    Addr_Postalcode VARCHAR(7)
);

--2.3

ALTER TABLE Zamowienia ADD (
    Isrealized NUMBER(1) DEFAULT 0 NOT NULL
);

--2.4

ALTER SESSION SET Nls_Date_Format = 'dd/mm/yyyy hh24:mi:ss';

ALTER TABLE Zamowienia ADD Realizeddate DATE;

--2.5

ALTER TABLE Zamowienia RENAME COLUMN Isrealized TO Status;

ALTER TABLE Zamowienia MODIFY (
    Status VARCHAR(255)
);

ALTER TABLE Zamowienia
    ADD CONSTRAINT Text_Check CHECK ( Status IN (
        'Nowe zamowienie',
        'Realizowane',
        'Przesylka wyslana',
        'Realizacja zakonczona'
    ) );
---2.6

ALTER TABLE Produkt ADD (
    Vat INTEGER DEFAULT 0.23
);

ALTER TABLE Produkt DROP COLUMN Price_Gross;

ALTER TABLE Produkt Add Price_Gross
As(Vat * Price_Net + Price_Net);


--2.7

CREATE INDEX Userd ON
    Klient (
        Surname,
        Login,
        Email
    );
   
--2.8

CREATE UNIQUE INDEX Unique_Login ON
    Klient (
        Login
    );