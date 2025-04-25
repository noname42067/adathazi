CREATE TABLE Ugyfel
(
  [LOGIN] varchar(20) PRIMARY KEY,
  EMAIL varchar(100) MASKED WITH (function = 'email()'),
  NEV varchar(100) MASKED WITH (Function = 'partial(1,"XXX",1)'),
  SZULEV INT MASKED WITH (FUNCTION = 'random(1,5)'),
  NEM varchar(1),
  CIM varchar(200) MASKED WITH (Function = 'default()')
)

INSERT INTO Ugyfel
([LOGIN], EMAIL, NEV, SZULEV, NEM, CIM)
VALUES
('adam1', 'ádám.kiss@mail.hu', 'Kiss Ádám', 1991, 'F', '5630 Békés, Szolnoki út 8.'),
('adam3','adam3@gmail.com','Barkóci Ádám',1970,'F','3910 Tokaj, Dózsa György utca 37.'),
('adam4','ádám.bieniek@mail.hu','Bieniek Ádám',1976,'F','8630 Balatonboglár, Juhászföldi út 1.')

CREATE USER MaskUser WITHOUT Login;
GRANT SELECT ON Ugyfel TO MaskUser

EXECUTE AS User= 'MaskUser';
SELECT * FROM Ugyfel
REVERT