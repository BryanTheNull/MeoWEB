-- Crear base de datos --
CREATE DATABASE tiendaWEB;
USE tiendaWEB;

-- Crear tabla Usuarios --
CREATE TABLE Usuarios(
	ID_Usuario INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Contraseña VARCHAR(60) NOT NULL,
    Fecha_Registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Rango ENUM('Administrador', 'Usuario') DEFAULT 'Usuario'
);
INSERT INTO Usuarios (Nombre, Apellido, Email, Contraseña, Rango) 
VALUES ('Admin', 'Good', 'admin@gmail.com', 'admin123', 'Administrador');

-- Crear tabla Productos --
CREATE TABLE Productos(
    ID_Producto INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(255),
    Precio DECIMAL(13,3) NOT NULL,
    Stock INT NOT NULL,
    Fecha_Registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO Productos (Nombre, Descripcion, Precio, Stock) 
VALUES ('Camiseta', 'Camiseta de algodón con estampado', 9.990, 50);

-- Crear tabla Clientes --
CREATE TABLE Clientes(
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Telefono VARCHAR(20),
    Direccion VARCHAR(255),
    Fecha_Registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO Clientes (Nombre, Apellido, Email, Telefono, Direccion) 
VALUES ('María', 'López', 'maria@example.com', '+569 12345678', 'Calle Principal 123');

-- Crear tabla Ventas --
CREATE TABLE Ventas(
    ID_Venta INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT NOT NULL,
    Fecha_Venta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Total DECIMAL(13,3) NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente)
);
INSERT INTO Ventas (ID_Cliente, Total) 
VALUES (1, 19.980);

-- Crear tabla DetalleVentas --
CREATE TABLE DetalleVentas(
    ID_DetalleVenta INT AUTO_INCREMENT PRIMARY KEY,
    ID_Venta INT NOT NULL,
    ID_Producto INT NOT NULL,
    Cantidad INT NOT NULL,
    Precio_Unitario DECIMAL(13,3) NOT NULL,
    FOREIGN KEY (ID_Venta) REFERENCES Ventas(ID_Venta),
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto)
);
INSERT INTO DetalleVentas (ID_Venta, ID_Producto, Cantidad, Precio_Unitario) 
VALUES (1, 1, 2, 9.990);




-- Probar tablas --
SELECT * FROM Usuarios;
    DO SLEEP(5);
SELECT * FROM Productos;
    DO SLEEP(5);
SELECT * FROM Clientes;
    DO SLEEP(5);
SELECT * FROM Ventas;
    DO SLEEP(5);
SELECT * FROM DetalleVentas;

-- Mostrar precio en formato decimal xxx.xxx.xxx.xxx
SELECT ID_Producto, Nombre, Descripcion, FORMAT(Precio, 3, 'de_DE') AS Precio, Stock, Fecha_Registro FROM Productos;