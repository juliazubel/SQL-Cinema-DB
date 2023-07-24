USE master
GO
CREATE DATABASE Cinema
GO

--CREATING TABLES

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(’[dbo].[Tickets]’) AND sysstat & 0xf = 3)
DROP TABLE [dbo].[Tickets]
GO
CREATE TABLE [dbo].[Tickets](
    [IdTicket] [int] NOT NULL,
    [IdPriceList] [nchar](10) NULL,
    [IdScreening] [int] NOT NULL,
    [IdCustomer] [int] NULL,
    [TicketPrice] [nchar](10) NULL,
    [IdPlace] [int] NOT NULL,
CONSTRAINT [PK_Tickets] PRIMARY KEY CLUSTERED
(
    [IdTicket] ASC
)
) ON [PRIMARY]
GRANT SELECT , INSERT , DELETE , UPDATE ON [dbo].[Tickets] TO "public"
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(’[dbo].[PriceList]’) AND sysstat & 0xf = 3)
DROP TABLE [dbo].[PriceList]
GO
CREATE TABLE [dbo].[PriceList](
    [IdPriceList] [nchar](10) NOT NULL,
    [TicketPrice] [money] NULL,
    [DescTicket] [nchar](10) NULL,
    [IdTypeOfTicket] [int] NULL,
CONSTRAINT [PK_PriceList] PRIMARY KEY CLUSTERED
(
    [IdPriceList] ASC
)
) ON [PRIMARY]
GRANT SELECT , INSERT , DELETE , UPDATE ON [dbo].[PriceList] TO "public"
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(’[dbo].[Film]’) AND sysstat & 0xf = 3)
DROP TABLE [dbo].[Film]
GO
CREATE TABLE [dbo].[Film](
    [IdFilm] [int] NOT NULL,
    [Title] [varchar](50) NOT NULL,
    [Director] [varchar](50) NOT NULL,
    [ProductionYear] [int] NOT NULL,
    [Duration] [int] NOT NULL,
    [Cast] [text] NOT NULL,
    [AgeRestriction] [int] NULL,
    [IdGenre] [int] NOT NULL,
    [Description] [text] NULL,
    [AvailableTo] [date] NOT NULL,
CONSTRAINT [PK_Film] PRIMARY KEY CLUSTERED
(
    [IdFilm] ASC
)
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GRANT SELECT , INSERT , DELETE , UPDATE ON [dbo].[Film] TO "public"
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(’[dbo].[Gastronomy]’) AND sysstat & 0xf = 3)
DROP TABLE [dbo].[Gastronomy]
GO
CREATE TABLE [dbo].[Gastronomy](
    [IdProduct] [int] NOT NULL,
    [NameProduct] [varchar](200) NULL,
    [PriceProduct] [money] NULL,
CONSTRAINT [PK_Gastronomy] PRIMARY KEY CLUSTERED
(
    [IdProduct] ASC
)
) ON [PRIMARY]
GRANT SELECT , INSERT , DELETE , UPDATE ON [dbo].[Gastronomy] TO "public"
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(’[dbo].[Genre]’) AND sysstat & 0xf = 3)
DROP TABLE [dbo].[Genre]
GO
CREATE TABLE [dbo].[Genre](
    [IdGenre] [int] NOT NULL,
    [Name] [nchar](40) NOT NULL,
CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED
(
    [IdGenre] ASC
)
) ON [PRIMARY]
GRANT SELECT , INSERT , DELETE , UPDATE ON [dbo].[Genre] TO "public"
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(’[dbo].[ShiftPlan]’) AND sysstat & 0xf = 3)
DROP TABLE [dbo].[ShiftPlan]
GO
CREATE TABLE [dbo].[ShiftPlan](
    [IdShiftPlan] [int] NOT NULL,
    [IdEmployees] [int] NOT NULL,
    [Data] [date] NOT NULL,
    [StartTime] [time](7) NOT NULL,
    [EndTime] [time](7) NOT NULL,
CONSTRAINT [PK_ShiftPlan] PRIMARY KEY CLUSTERED
(
    [IdShiftPlan] ASC
)
) ON [PRIMARY]
GRANT SELECT , INSERT , DELETE , UPDATE ON [dbo].[ShiftPlan] TO "public"
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(’[dbo].[Customer]’) AND sysstat & 0xf = 3)
DROP TABLE [dbo].[Customer]
GO
CREATE TABLE [dbo].[Customer](
    [IdCustomer] [int] NOT NULL,
    [FirstName] [varchar](50) NOT NULL,
    [LastName] [varchar](250) NOT NULL,
    [Email] [varchar](50) NULL,
    [OneTime] [bit](50) NOT NULL,
    [PhoneNumber] [int] NULL,
CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED
(
    [IdCustomer] ASC
)
) ON [PRIMARY]
GRANT SELECT , INSERT , DELETE , UPDATE ON [dbo].[Customer] TO "public"
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(’[dbo].[Place]’) AND sysstat & 0xf = 3)
DROP TABLE [dbo].[Place]
GO
CREATE TABLE [dbo].[Place](
    [IdPlace] [int] NOT NULL,
    [IdScreen] [int] NOT NULL,
    [Row] [int] NOT NULL,
    [Seat] [int] NOT NULL,
CONSTRAINT [PK_Place] PRIMARY KEY CLUSTERED
(
    [IdPlace] ASC
)
) ON [PRIMARY]
GRANT SELECT , INSERT , DELETE , UPDATE ON [dbo].[Place] TO "public"
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(’[dbo].[Employees]’) AND sysstat & 0xf = 3)
DROP TABLE [dbo].[Employees]
GO
CREATE TABLE [dbo].[Employees](
    [IdEmployees] [int] NOT NULL,
    [FirstName] [varchar](50) NULL,
    [LastName] [varchar](300) NULL,
    [Pesel] [varchar](20) NULL,
    [IdPositions] [int] NOT NULL,
CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED
(
    [IdEmployees] ASC
)
) ON [PRIMARY]
GRANT SELECT , INSERT , DELETE , UPDATE ON [dbo].[Employees] TO "public"
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(’[dbo].[Income]’) AND sysstat & 0xf = 3)
DROP TABLE [dbo].[Income]
GO
CREATE TABLE [dbo].[Income](
    [IdTransaction] [int] NOT NULL,
    [IdTickets] [int] NULL,
    [IdProduct] [int] NULL,
    [DateTransaction] [datetime] NOT NULL,
    [Price] [money] NOT NULL,
    [Count] [money] NOT NULL,
    [Value] [money] NULL,
    [IdCustomer] [int] NOT NULL,
    [IdLogin] [int] NOT NULL,
CONSTRAINT [PK_Income] PRIMARY KEY CLUSTERED
(
    [IdTransaction] ASC
)
) ON [PRIMARY]
GRANT SELECT , INSERT , DELETE , UPDATE ON [dbo].[Income] TO "public"
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(’[dbo].[TypeOfTicket]’) AND sysstat & 0xf = 3)
DROP TABLE [dbo].[TypeOfTicket]
GO
CREATE TABLE [dbo].[TypeOfTicket](
    [IdTypeOfTicket] [int] NOT NULL,
    [Type] [varchar](200) NOT NULL,
CONSTRAINT [PK_TypeOfTicket] PRIMARY KEY CLUSTERED
(
    [IdTypeOfTicket] ASC
)
) ON [PRIMARY]
GRANT SELECT , INSERT , DELETE , UPDATE ON [dbo].[TypeOfTicket] TO "public"
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(’[dbo].[Screen]’) AND sysstat & 0xf = 3)
DROP TABLE [dbo].[Screen]
GO
CREATE TABLE [dbo].[Screen](
    [IdScreen] [int] NOT NULL,
    [NameScreen] [varchar](50) NOT NULL,
    [NumberSeats] [decimal](4, 0) NOT NULL,
    [AC] [bit](1) NULL,
CONSTRAINT [PK_Screen] PRIMARY KEY CLUSTERED
(
    [IdScreen] ASC
)
) ON [PRIMARY]
GRANT SELECT , INSERT , DELETE , UPDATE ON [dbo].[Screen] TO "public"
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(’[dbo].[Screening]’) AND sysstat & 0xf = 3)
DROP TABLE [dbo].[Screening]
GO
CREATE TABLE [dbo].[Screening](
    [IdScreening] [int] NOT NULL,
    [IdFilm] [int] NOT NULL,
    [IdScreen] [int] NOT NULL,
    [IdDimention] [int] NULL,
    [DateTime] [datetime] NULL,
CONSTRAINT [PK_Screening] PRIMARY KEY CLUSTERED
(
    [IdScreening] ASC
)
) ON [PRIMARY]
GRANT SELECT , INSERT , DELETE , UPDATE ON [dbo].[Screening] TO "public"
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(’[dbo].[Positions]’) AND sysstat & 0xf = 3)
DROP TABLE [dbo].[Positions]
GO
CREATE TABLE [dbo].[Positions](
    [IdPositions] [int] NOT NULL,
    [DescPositions] [varchar](50) NOT NULL,
    [MinSalary] [money] NULL,
    [MaxSalary] [money] NULL,
CONSTRAINT [PK_Positions] PRIMARY KEY CLUSTERED
(
    [IdPositions] ASC
)
) ON [PRIMARY]
GRANT SELECT , INSERT , DELETE , UPDATE ON [dbo].[Positions] TO "public"
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(’[dbo].[Users]’) AND sysstat & 0xf = 3)
DROP TABLE [dbo].[Users]
GO
CREATE TABLE [dbo].[Users](
    [IdLogin] [int] NOT NULL,
    [Login] [varchar](50) NOT NULL,
    [Password] [varchar](50) NOT NULL,
    [IdEmployees] [int] NOT NULL,
    [Leader] [bit](1) NOT NULL,
CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED
(
    [IdLogin] ASC
)
) ON [PRIMARY]
GRANT SELECT , INSERT , DELETE , UPDATE ON [dbo].[Users] TO "public"
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(’[dbo].[Dimention]’) AND sysstat & 0xf = 3)
DROP TABLE [dbo].[Dimention]
GO
CREATE TABLE [dbo].[Dimention](
    [IdDimention] [int] NOT NULL,
    [ValueDimention] [varchar](10) NOT NULL,
CONSTRAINT [PK_Dimention] PRIMARY KEY CLUSTERED
(
    [IdDimention] ASC
)
) ON [PRIMARY]
GRANT SELECT , INSERT , DELETE , UPDATE ON [dbo].[Dimention] TO "public"
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(’[dbo].[WorkTeam]’) AND sysstat & 0xf = 3)
DROP TABLE [dbo].[WorkTeam]
GO
CREATE TABLE [dbo].[WorkTeam](
    [IdWorkTeam] [int] NOT NULL,
    [IdEmployees] [int] NULL,
    [NameWorkTeam] [nchar](50) NOT NULL,
CONSTRAINT [PK_WorkTeam] PRIMARY KEY CLUSTERED
(
    [IdWorkTeam] ASC
)
) ON [PRIMARY]
GRANT SELECT , INSERT , DELETE , UPDATE ON [dbo].[WorkTeam] TO "public"
GO

--FOREIGN KEYS, CONSTRAINTS AND CHECKS

ALTER TABLE [dbo].[Tickets] WITH CHECK ADD CONSTRAINT [FK_Tickets_PriceList] FOREIGN KEY([IdPriceList])
REFERENCES [dbo].[PriceList] ([IdPriceList])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_PriceList]
GO

ALTER TABLE [dbo].[Tickets] WITH CHECK ADD CONSTRAINT [FK_Tickets_Customer] FOREIGN KEY([IdCustomer])
REFERENCES [dbo].[Customer] ([IdCustomer])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Customer]
GO

ALTER TABLE [dbo].[Tickets] WITH CHECK ADD CONSTRAINT [FK_Tickets_Place] FOREIGN KEY([IdPlace])
REFERENCES [dbo].[Place] ([IdPlace])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Place]
GO

ALTER TABLE [dbo].[PriceList] WITH CHECK ADD CONSTRAINT [FK_PriceList_TypeOfTicket] FOREIGN KEY([IdTypeOfTicket])
REFERENCES [dbo].[TypeOfTicket] ([IdTypeOfTicket])
GO
ALTER TABLE [dbo].[PriceList] CHECK CONSTRAINT [FK_PriceList_TypeOfTicket]
GO

ALTER TABLE [dbo].[Film] WITH CHECK ADD CONSTRAINT [FK_Film_Genre] FOREIGN KEY([IdGenre])
REFERENCES [dbo].[Genre] ([IdGenre])
GO
ALTER TABLE [dbo].[Film] CHECK CONSTRAINT [FK_Film_Genre]
GO

ALTER TABLE [dbo].[ShiftPlan] WITH CHECK ADD CONSTRAINT [FK_ShiftPlan_Employees] FOREIGN KEY([IdEmployees])
REFERENCES [dbo].[Employees] ([IdEmployees])
GO
ALTER TABLE [dbo].[ShiftPlan] CHECK CONSTRAINT [FK_ShiftPlan_Employees]
GO

ALTER TABLE [dbo].[Place] WITH CHECK ADD CONSTRAINT [FK_Place_Screen] FOREIGN KEY([IdScreen])
REFERENCES [dbo].[Screen] ([IdScreen])
GO
ALTER TABLE [dbo].[Place] CHECK CONSTRAINT [FK_Place_Screen]
GO

ALTER TABLE [dbo].[Employees] WITH CHECK ADD CONSTRAINT [FK_Employees_Positions] FOREIGN KEY([IdPositions])
REFERENCES [dbo].[Positions] ([IdPositions])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Positions]
GO

ALTER TABLE [dbo].[Income] WITH CHECK ADD CONSTRAINT [FK_Income_Tickets] FOREIGN KEY([IdTickets])
REFERENCES [dbo].[Tickets] ([IdTicket])
GO
ALTER TABLE [dbo].[Income] CHECK CONSTRAINT [FK_Income_Tickets]
GO

ALTER TABLE [dbo].[Income] WITH CHECK ADD CONSTRAINT [FK_Income_Gastronomy] FOREIGN KEY([IdProduct])
REFERENCES [dbo].[Gastronomy] ([IdProduct])
GO
ALTER TABLE [dbo].[Income] CHECK CONSTRAINT [FK_Income_Gastronomy]
GO

ALTER TABLE [dbo].[Income] WITH CHECK ADD CONSTRAINT [FK_Income_Users] FOREIGN KEY([IdLogin])
REFERENCES [dbo].[Users] ([IdLogin])
GO
ALTER TABLE [dbo].[Income] CHECK CONSTRAINT [FK_Income_Users]
GO

ALTER TABLE [dbo].[Screening] WITH CHECK ADD CONSTRAINT [FK_Screening_Film] FOREIGN KEY([IdFilm])
REFERENCES [dbo].[Film] ([IdFilm])
GO
ALTER TABLE [dbo].[Screening] CHECK CONSTRAINT [FK_Screening_Film]
GO

ALTER TABLE [dbo].[Screening] WITH CHECK ADD CONSTRAINT [FK_Screening_Screen] FOREIGN KEY([IdScreen])
REFERENCES [dbo].[Screen] ([IdScreen])
GO
ALTER TABLE [dbo].[Screening] CHECK CONSTRAINT [FK_Screening_Screen]
GO

ALTER TABLE [dbo].[Screening] WITH CHECK ADD CONSTRAINT [FK_Screening_Dimention] FOREIGN KEY([IdDimention])
REFERENCES [dbo].[Dimention] ([IdDimention])
GO
ALTER TABLE [dbo].[Screening] CHECK CONSTRAINT [FK_Screening_Dimention]
GO

ALTER TABLE [dbo].[Users] WITH CHECK ADD CONSTRAINT [FK_Users_Employees] FOREIGN KEY([IdEmployees])
REFERENCES [dbo].[Employees] ([IdEmployees])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Employees]
GO

ALTER TABLE [dbo].[WorkTeam] WITH CHECK ADD CONSTRAINT [FK_WorkTeam_Employees] FOREIGN KEY([IdEmployees])
REFERENCES [dbo].[Employees] ([IdEmployees])
GO
ALTER TABLE [dbo].[WorkTeam] CHECK CONSTRAINT [FK_WorkTeam_Employees]
GO

ALTER TABLE [dbo].[Customer] ADD CHECK (FirstName ∼′ ˆ[A − Z] ∗ $′);
GO
ALTER TABLE [dbo].[Customer] ADD CHECK (LastName ∼′ ˆ[A − Z] ∗ $′);
GO
ALTER TABLE [dbo].[ShiftPlan] ADD CHECK (StartTime < EndTime);
GO
ALTER TABLE [dbo].[Gastronomy] ADD CHECK (PriceProduct > 0);
GO
ALTER TABLE [dbo].[Employees] ADD CHECK (pesel ′ˆ[0 − 9] ∗ $′);
GO
ALTER TABLE [dbo].[Dimention] ADD CHECK (ValueDimention=’2D’ OR ValueDimention=’3D’ OR ValueDimention=’4D’)
GO
ALTER TABLE [dbo].[PriceList] ADD CHECK (DescTicket=’NORMAL’ OR DescTicket=’DISCOUNT_FAMILY’ OR DescTicket=’DISCOUNT_STUDENT’ OR DescTicket=’DISCOUNT_KIDS’ OR DescTicket=’DISCOUNT_RETIRE’)
GO
ALTER TABLE [dbo].[Place] ADD CHECK (Row < 10 AND Seat < 20)
GO

--FUNCTIONS

CREATE OR ALTER FUNCTION dbo.fnCheckFilmAvailability (@id int)
    RETURNS int
AS
BEGIN
    DECLARE @t int;
    SELECT @t = CASE WHEN AvailableTo<getdate() THEN 0 ELSE 1 END FROM Film
    WHERE IdFilm=@id
    RETURN @t;
END;
GO

SELECT Film.*, dbo.fnCheckFilmAvailability(1), CASE WHEN dbo.fnCheckFilmAvailability(IdFilm)=1 THEN
’Available’ ELSE ’Not available’ END FROM Film

CREATE OR ALTER FUNCTION dbo.fnSeatForScreening (@IdScreening int)
    RETURNS int
AS
BEGIN
    DECLARE @t int;
    SET @t=0;
    IF (SELECT COUNT(*) FROM Place
    WHERE IdPlace NOT IN (SELECT IdPlace FROM Tickets WHERE IdScreening=@IdScreening) ) >0
    SET @t=1
    RETURN @t;
END;
GO

--VIEWS

CREATE OR ALTER VIEW [ScreeningsForAGivenDay] AS
SELECT IdScreening FROM Screening
WHERE DateTime = getdate(); SELECT Title,Dimention.ValueDimention, Duration,convert(date,DateTime)
’Data’ ,convert(time,DateTime)’Godzina’ FROM Screening
JOIN Film ON Screening.IdFilm=Film.IdFilm
JOIN Dimention ON Dimention.IdDimention=Screening.IdDimention
JOIN Screen ON Screen.IdScreen=Screening.IdScreen
WHERE DateTime>getdate()-30 AND DateTime<=getdate()+30
ORDER BY convert(date,DateTime),convert(time,DateTime)

CREATE OR ALTER VIEW [FilmsForKids] AS
SELECT Title
FROM Film
WHERE AgeRestriction < 18

CREATE OR ALTER VIEW [FilmsForAdults] AS
SELECT Title
FROM Film
WHERE AgeRestriction = 18

CREATE OR ALTER VIEW [Films2021] AS
SELECT Title, Director, Genre
FROM Film
WHERE ProductionYear = 2021;

CREATE OR ALTER VIEW [ScreensWithAC] AS
SELECT NameScreen
FROM Screen
WHERE AC = 1;

CREATE OR ALTER VIEW [AvailableSeats]
AS
SELECT Screening.IdScreening, Title, Dimention.ValueDimention, Duration, convert(date,DateTime) ’Data’,
convert(time,DateTime)’Godzina’, CASE WHEN dbo.fnSeatForScreening(IdScreening)=0 THEN ’Brak miejsc’ ELSE
’Sprzedaz dostepna’ END
’Status’,dbo.fnSeatForScreening(IdScreening) ’Kod’ FROM Screening
JOIN Film ON Screening.IdFilm=Film.IdFilm
JOIN Dimention ON Dimention.IdDimention=Screening.IdDimention
JOIN Screen ON Screen.IdScreen=Screening.IdScreen
GO

CREATE OF ALTER VIEW [OneTimeCustomer]
AS
SELECT IdCustomer, FirstName, LastName FROM Customer
WHERE OneTime=1
GO

CREATE OF ALTER VIEW [RegularCustomer]
AS
SELECT IdCustomer, FirstName, LastName FROM Customer
WHERE OneTime=0
GO

--PROCEDURES

CREATE OR ALTER PROCEDURE IncreaseTicketPrice
    @howmuch MONEY
AS
    SET nocount ON;
    UPDATE PriceList SET TicketPrice=TicketPrice+@howmuch
GO

CREATE OR ALTER PROCEDURE IncreaseTicketPriceForAGivenType
    @howmuch MONEY,
    @Type int=0
AS
    IF @Type=0
    UPDATE PriceList SET TicketPrice=TicketPrice+@howmuch
    ELSE
    UPDATE PriceList SET TicketPrice=TicketPrice+@howmuch WHERE IdTypeOfTicket=@Type;
GO

CREATE OR ALTER PROCEDURE CountNotAvailableFilms
AS
    SELECT COUNT(*) FROM Film WHERE AvailableTo<getdate() ;
GO

CREATE OR ALTER PROCEDURE IfLeader
    @id int
AS
    IF NOT EXISTS (SELECT 1 FROM Employees WHERE IdEmployees=@id)
    PRINT’Employee not found’
    ELSE
    SELECT DISTINCT CASE WHEN a.Leader=1 THEN ’LEADER’ ELSE ’NO’ END FROM Users A
    JOIN Employees B ON a.IdEmployees=b.IdEmployees
    WHERE a.IdEmployees=@id
GO

CREATE OR ALTER PROCEDURE CreateLogin
    @id int
AS
DECLARE @login char(20)
DECLARE @newid char(20)
    IF NOT EXISTS (SELECT 1 FROM Employees WHERE IdEmployees=@id)
    PRINT’Employee not found’
    ELSE
    IF NOT EXISTS (SELECT 1 FROM Users WHERE IdEmployees=@id)
    PRINT’Employee already has a login’
    ELSE
        BEGIN
        SELECT @login=upper(concat(left(FirstName,3),left(LastName,3))) FROM Employees
        WHERE IdEmployees=@id;
        SELECT @newid = max(idlogin)+1 FROM Users;
        INSERT INTO Users
        VALUES (@login , @newid ,’123’,@id,0);
        END
GO

--TRIGGERS

CREATE OR ALTER TRIGGER [dbo].Genre_Name
    ON Genre
    FOR INSERT,UPDATE
AS BEGIN
    IF EXISTS (SELECT 1 FROM INSERTED , Genre
    WHERE Genre.Name=INSERTED.Name and Genre.IdGenre <> INSERTED.IdGenre)
    BEGIN
    RAISERROR (’Name of a genre already exists’,16,1);
    ROLLBACK TRAN
    END
END

CREATE OR ALTER TRIGGER [dbo].Tickets_CheckIfFilmIsActive
    ON Tickets
    FOR INSERT
AS BEGIN
DECLARE @t int;
    IF (select dbo.fnCheckFilmAvailability(Screening.IdFilm) FROM INSERTED
    JOIN Screening ON inserted.IdScreening=Screening.IdScreening)=0
    BEGIN
        RAISERROR (’Screening not active’,16,1);
        ROLLBACK TRAN
    END
END

CREATE OR ALTER TRIGGER [dbo].AddLogin
    ON Employees
    AFTER INSERT
AS BEGIN
    DECLARE @id int;
    SELECT @id=Employees.IdEmployees FROM inserted,Employees WHERE Employees.IdEmployees=inserted.IdEmployees;
    EXEC CreateLogin @id
END

CREATE OR ALTER TRIGGER [dbo].AddLogin
    ON Employees
    FOR INSERT
AS BEGIN
    IF EXISTS (SELECT 1 FROM inserted,Employees WHERE Employees.Pesel=inserted.pesel AND Pracownicy.IdEmployees<>inserted.IdEmployees)
    BEGIN
        PRINT ’Employee already exists’;
        ROLLBACK TRAN
    END
END

CREATE OR ALTER TRIGGER [dbo].FreeSeatsForAScreening
    ON Screening
    FOR INSERT
AS BEGIN
    DECLARE @id int
    SELECT @id=(SELECT inserted.IdScreening FROM inserted)
    IF NOT EXISTS (SELECT 1 FROM AvailableSeats WHERE Kod=1 AND IdScreening=@id)
    BEGIN
        PRINT ’No free seats’;
        ROLLBACK TRAN
    END
END
GO

--EXAMPLE DATA

INSERT INTO [dbo].[Tickets]
VALUES
    (1, <IdPriceList, nchar(10)>, 1, 1, 10EUR, 1)
GO

INSERT INTO [dbo].[PriceList]
VALUES
    (<IdPriceList, nchar(10)>, 10, ’Normal Ticket’, 1)
GO

INSERT INTO [dbo].[Film]
    ([IdFilm]
VALUES
    (1, Avengers, Joss Whedon, 2012, 143, ’Robert Downey Jr., Chris Evans, Scarlett Johansson, Mark Ruffalo’, 1, 1, ’Earth's Mightiest Heroes stand as the planet's first line of defense against the most powerful threats in the universe. The Avengers began as a group of extraordinary individuals who were assembled to defeat Loki and his Chitauri army in New York City.’, ’2021-01-31’)
GO

INSERT INTO [dbo].[Gastronomy]
VALUES
    (1, Popcorn, 5)
GO

INSERT INTO [dbo].[Genre]
VALUES
    (1, Action)
GO

INSERT INTO [dbo].[ShiftPlan]
VALUES
    (<1, 1, ’2021-01-01’, ’08:00:00’, ’16:00:00’)
GO

INSERT INTO [dbo].[Customer]
VALUES
    (1, ’Jan’, ’Nowak’, ’jannowak@mail.com’, 1, 123456789)
GO

INSERT INTO [dbo].[Place]
VALUES
    (1, 1, 1, 1)
GO

INSERT INTO [dbo].[Employees]
VALUES
    (1, ’Piotr’, ’Kowalski’, ’99999999999’, 1)
GO

INSERT INTO [dbo].[Income]
VALUES
    (1, 1, 1, ’2021-01-01 10:00:00’, 15, 1, 15, 1, 1)
GO

INSERT INTO [dbo].[TypeOfTicket]
VALUES
    (1, ’Normal Ticket’)
GO

INSERT INTO [dbo].[Screen]
VALUES
    (1, ’Multifunctional’, 20, 1)
GO

INSERT INTO [dbo].[Screening]
VALUES
    (1, 1, 1, 1, ’2021-01-01 10:00:00’)
GO

INSERT INTO [dbo].[Positions]
VALUES
    (1, ’Ticket Taker’, 1000, 2000)
GO

INSERT INTO [dbo].[Users]
VALUES
    (1, ’login’, ’password’, 1, 1)
GO

INSERT INTO [dbo].[Dimention]
VALUES
    (1, ’3D’) 
GO

INSERT INTO [dbo].[WorkTeam]
VALUES
    (1, 1, ’Ticket Collectors’)
GO
