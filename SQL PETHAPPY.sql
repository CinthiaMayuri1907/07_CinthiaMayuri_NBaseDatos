CREATE DATABASE PETHAPPY
GO
USE PETHAPPY
GO
--CREAR TABLA CLIENTE--
CREATE TABLE CLIENTE
(
   IDCLI INT IDENTITY(1,1),
   NOMCLI VARCHAR(60),
   APECLI VARCHAR(80),
   DNICLI CHAR(8),
   CELCLI CHAR(9),
   EMACLI VARCHAR(40),
   DIRCLI VARCHAR(80),
   ESTCLI CHAR(1) DEFAULT 'A' --AGREGAR POR DEFAULT A(ACTIVO)
   CONSTRAINT IDCLI_PK PRIMARY KEY(IDCLI)
)
GO


--CREAR TABLA VENDEDOR--
CREATE TABLE VENDEDOR
(
   IDVEN INT IDENTITY(1,1),
   NOMVEN VARCHAR(60),
   APEVEN VARCHAR(80),
   DNIVEN CHAR(8),
   CELVEN CHAR(9),
   EMAVEN VARCHAR(40),
   DIRVEN VARCHAR(80),
   ESTVEN CHAR(1) DEFAULT 'A'--AGREGA POR DEFAULT EL ESTADO A(ACTIVO)
   CONSTRAINT IDVEN_PK PRIMARY KEY(IDVEN)
)
GO

GO
--CREAR TABLA PRODUCTO--
CREATE TABLE PRODUCTO
(
   CODPRO CHAR(4),
   NOMPRO VARCHAR(60),
   DESPRO VARCHAR(80),
   FECPRO DATETIME DEFAULT GETDATE(),
   MARPRO VARCHAR(50),
   PREPRO DECIMAL(8,3),
   CONSTRAINT CODPRO_PK PRIMARY KEY(CODPRO)
)
GO

SELECT*FROM PRODUCTO
GO

--CREAR TABLA VENTA--
CREATE TABLE VENTA
(
   IDVENT INT IDENTITY(1,1),
   FECVENT DATETIME DEFAULT GETDATE(),
   IDCLI INT,
   IDVEN INT
   CONSTRAINT IDVENT_PK PRIMARY KEY(IDVENT)
)
GO
ALTER TABLE VENTA
  DROP COLUMN FECVENT
GO

ALTER TABLE VENTA
  ADD FECVENT DATETIME DEFAULT GETDATE()
GO
--CREAR TABLA VENTADETALLE--
CREATE TABLE VENTADETALLE
(
    IDVENTDET INT IDENTITY(1,1),
	CODPRO CHAR(4),
	IDVENT INT,
	DESVENTDET VARCHAR (50),
	CANTVENTDET INT,
	PRETOTVENTDET DECIMAL(8,3)
   CONSTRAINT IDVENTDET_PK PRIMARY KEY(IDVENTDET)
)
GO

--RELACION DE TABLAS--
ALTER TABLE VENTA
    ADD CONSTRAINT CLIENTE_VENTA
	FOREIGN KEY (IDCLI)
	REFERENCES CLIENTE (IDCLI)


ALTER TABLE VENTA
    ADD CONSTRAINT VENDEDOR_VENTA
	FOREIGN KEY (IDVEN)
	REFERENCES VENDEDOR(IDVEN)


ALTER TABLE VENTADETALLE
	ADD CONSTRAINT VENTA_VENTADETALLE
	FOREIGN KEY (IDVENT)
	REFERENCES VENTA(IDVENT)

ALTER TABLE VENTADETALLE
	ADD CONSTRAINT PRODUCTO_REGISTRODETALLE
	FOREIGN KEY (CODPRO)
	REFERENCES PRODUCTO(CODPRO)

-- INSERTAR REGISTROS--
--TABLA CLIENTE--
INSERT INTO CLIENTE
(NOMCLI,APECLI,DNICLI,CELCLI,EMACLI,DIRCLI,ESTCLI) 
VALUES
('Juan','Campos Perez','40255133','986512478','juan.campos@vallegrande.edu.pe','Av.Miraflores','A'),
('Sofia','Solano Avila','64978531','974815258','sofia.solano@vallegrande.edu.pe','Jr.Huallaga','A'),
('Maria','Rosales Guerra','15925874','986512478','maria.rosales@vallegrande.edu.pe','Calle Girasoles','A'),
('Marcos','Alarcon Heromsa','48781512','948672548','marcos.alarcon@vallegrande.edu.pe','AV.Santa Rosa','A'),
('Martin','Saman Arata','84152631','952194167','martin.saman@vallegrande.edu.pe','Jr.La Union','A'),
('Jose','Quispe Luyo','48161937','978415321','jose.quispe@vallegrande.edu.pe','Calle Abancay','A'),
('Claudia','Barraza Carrasco','78452596','936707150','cbarraza@gmail.com','Jr.Las Gardenias','A'),
('Jhohana','Bendezu Anccasi','74321564','919597150','jbendezu@yahoo.com','Av.Miraflores','A'),
('Mario','Acosta Palomino','15326499','931764521','mario.acosta@outlook.com','Av.Miraflores','A')
GO
SELECT*FROM CLIENTE
GO

--INSERTAR REGISTRO TABLA vendedor--
INSERT INTO VENDEDOR
(NOMVEN,APEVEN,DNIVEN,CELVEN,EMAVEN,DIRVEN,ESTVEN)
VALUES
('Alberto','Corrales Lozada','15363798','952194167','alberto.corrales@yahoo.com','Calle Los Portales','A'),
('Juana','Sánchez Ortega','13256497','974815258','juana.sanchez@yahoo.com','Av.La Libertad','A'),
('Javier','Nakasone Villa','15953575','995236147','javier.nakasone@yahoo.com','Jr.San Martín','A'),
('Sonia','Huayta Medina','12657814','984552165','sonia.huayta@yahoo.com','Av.Las Gardenias','A'),
('Fabiano','Carrión Ávila','12233647','975412585','Fabiano.carrion@yahoo.com','Jr.Huancayo','A')
GO

SELECT*FROM VENDEDOR
GO

--INSERTAR REGISTRO TABLA PRODUCTO--
INSERT INTO PRODUCTO
(CODPRO,NOMPRO,DESPRO,FECPRO,MARPRO,PREPRO)
VALUES
('C001','Puppi maxi','Alimento para perro','2022/7/15','Royal Canin','15'),
('C002','Bunny mix','Alimento para conejo','2022/7/16','Happy Home','25'),
('C003','Pro plan kiten','Alimento para gato','2022/7/17','Purina','20'),
('C004','Pro plan active','Alimento para perro','2022/7/16','Purina','45'),
('C005','Brit rabbit','Alimento para conejo','2022/7/15','Cannae','30')
GO
SELECT*FROM PRODUCTO
GO

--INSERTAR REGISTRO TABLA VENTA--
INSERT INTO VENTA
(FECVENT,IDCLI,IDVEN)
VALUES
('2022/07/20','8','1'),
('2022/05/01','2','2'),
('2022/06/15','7','3'),
('2022/04/07','6','4'),
('2022/07/13','1','5')
GO

SELECT *FROM VENTA
GO

--INSERTAR REGISTRO TABLA VENTADETALLE--
INSERT INTO VENTADETALLE
(IDVENT,CODPRO,DESVENTDET,CANTVENTDET,PRETOTVENTDET)
VALUES
('1','C001','Alimento para conejo','2','50'),
('2','C002','Alimento para perro','3','135'),
('3','C003','Alimento para gato','3','60'),
('4','C004','Alimento para perro','2','30'),
('5','C005','Alimento para conejo','3','150')
GO

SELECT*FROM VENTADETALLE
GO
UPDATE CLIENTE
    SET NOMCLI = 'Alexander'
    WHERE IDCLI = '1'
GO
SELECT*FROM CLIENTE
GO

--Eliminar registros de tabla CLIENTE
DELETE FROM CLIENTE
    WHERE IDCLI = '2'

