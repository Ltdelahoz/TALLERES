CREATE DATABASE MiscelaneaLT; 
USE MiscelaneaLT;

CREATE TABLE Productos (
ID INT PRIMARY KEY,
Nombre VARCHAR (70) NOT NULL,
Precio DECIMAL (12,2) NOT NULL
);

CREATE TABLE Categorias (
ID INT PRIMARY KEY,
Nombre VARCHAR (70) NOT NULL
);


CREATE TABLE Productos_Categorias (
    Producto_ID INT,
    Categoria_ID INT,
    PRIMARY KEY (Producto_ID, Categoria_ID),
    FOREIGN KEY (Producto_ID) REFERENCES Productos(ID)
    ON DELETE CASCADE
	ON UPDATE CASCADE,
    FOREIGN KEY (Categoria_ID) REFERENCES Categorias(ID)
    ON DELETE CASCADE
	ON UPDATE CASCADE
    );
    
    
INSERT INTO Productos (ID, Nombre, Precio) VALUES
(1, 'Coca-cola', 7000.0),
(2, 'MrTea', 3200.00),
(3, 'Trululu', 2800.00);

INSERT INTO Categorias (ID, Nombre) VALUES
(101, 'Bebidas'),
(102, 'Dulces');

INSERT INTO Productos_Categorias (Producto_ID, Categoria_ID) VALUES 
(1, 101),
(2, 101),
(3, 102);



SELECT * FROM Productos_Categorias

--CONSULTAS--
#1. ¿Cuáles son todos los productos disponibles y sus precios?

SELECT Nombre, Precio
FROM Productos;

#2. ¿Qué productos cuestan más de $10?
SELECT Nombre, Precio
FROM Productos
WHERE Precio > 10;

#3. ¿Qué productos pertenecen a cada categoría?
SELECT 
    c.Nombre AS Categorias,
    p.Nombre AS Productos,
    p.Precio
FROM Productos p
JOIN Productos_Categorias pc ON p.ID = pc.Producto_ID
JOIN Categorias c ON c.ID = pc.Categoria_ID;

#4. Muestra todas las categorías, incluso si no tienen productos asignados. (LEFT JOIN)
SELECT 
    c.Nombre AS Categoria,
    p.Nombre AS Producto,
    p.Precio
FROM Categorías c
LEFT JOIN Productos_Categorías pc ON c.ID = pc.Categoria_ID
LEFT JOIN Productos p ON p.ID = pc.Producto_ID;

--PREGUNTAS CORTAS

#1.¿Para qué se usan las claves foráneas?
#Una clave foránea (foreign key) es un tipo de restricción que se establece en una base de datos relacional 
#para garantizar la integridad referencial entre dos tablas, es decir, una clave foránea es un campo en una 
#tabla que apunta a la clave primaria de otra tabla. Lo anterior establece una relación entre ambas tablas, 
#lo que ayuda a organizar los datos y mantenerlos consistentes.


#2¿Qué diferencia hay entre INNER JOIN y LEFT JOIN?

#INNER JOIN es el tipo de JOIN más común. Combina filas de dos tablas solo 
#cuando hay una coincidencia en ambas tablas. Si una fila de la tabla de la izquierda 
#no tiene una fila coincidente en la tabla de la derecha, esa fila no se incluirá en el resultado.
#Por el contrario, El LEFT JOIN devuelve todas las filas de la tabla izquierda (tabla principal), 
#y las filas de la tabla derecha que coinciden. Si no hay coincidencia en la tabla derecha, 
#se llenarán con NULL 



