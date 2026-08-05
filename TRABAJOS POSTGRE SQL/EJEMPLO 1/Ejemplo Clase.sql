--Creamos el esquema para la base de datos

CREATE SCHEMA IF NOT EXISTS virtualstore;

--Eliminamos el esquema public

--Tenemos en cuenta los constraints que derivan de nuestro diseño

--Se definen los dominios para las llaves primarias de ser necesarios

--Creamos las tablas para las entidades fuertes

CREATE TABLE IF NOT EXISTS virtualstore.clientes(
Id_cliente INT UNIQUE NOT NULL primary key,
Nombre_cliente VARCHAR(30)NOT NULL,
Apellido_cliente VARCHAR(30)NOT NULL,
Telefono CHAR(10)
);


CREATE TABLE IF NOT EXISTS virtualstore.proveedores(
Id_proveedor INT UNIQUE NOT NULL primary key,
Nombre_proveedor VARCHAR(80)NOT NULL,
Telefono_proveedor CHAR(10),
E_mail VARCHAR(90) NOT NULL 
);

--Creamos las tablas para las entidades débiles

CREATE TABLE IF NOT EXISTS virtualstore.productos(
Id_producto INT UNIQUE NOT NULL primary key,
Nombre_producto VARCHAR(80)NOT NULL,
Marca VARCHAR(80)NOT NULL,
Precio DECIMAL,
Stock INT NOT NULL,
Id_proveedor INT NOT NULL,

CONSTRAINT fk_proveedor FOREIGN KEY(Id_proveedor) REFERENCES virtualstore.proveedores(Id_proveedor)
);

CREATE TABLE IF NOT EXISTS virtualstore.ventas(
Id_venta INT UNIQUE NOT NULL primary key,
Fecha DATE NOT NULL,
Valortotal DECIMAL(10,2) NOT NULL,
Id_cliente INT NOT NULL,
Id_producto INT NOT NULL,

CONSTRAINT fk_cliente FOREIGN KEY (Id_cliente) REFERENCES virtualstore.clientes(Id_cliente),
CONSTRAINT fk_producto FOREIGN KEY (Id_producto) REFERENCES virtualstore.productos(Id_producto)
);



