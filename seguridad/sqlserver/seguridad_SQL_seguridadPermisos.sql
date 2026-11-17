use empresaVentas;

SELECT 
SUSER_NAME() AS LoginActual,
USER_NAME() AS UsuarioActual,
DB_NAME() AS BaseActual

SELECT * FROM productos;
SELECT * FROM dbo.ventas;
SELECT * FROM dbo.clientes;
SELECT * FROM rh.nomina;

INSERT INTO dbo.ventas
VALUES (6,1,'2026-10-14', 2500.00)

INSERT INTO dbo.productos
VALUES (6, 'Tablet', 785.36, 34)


-- Operaciones no permitidas 

UPDATE dbo.Ventas
SET total = 30000.0
WHERE IdVenta = 6;

DELETE FROM dbo.Ventas
WHERE IdVenta = 6;

