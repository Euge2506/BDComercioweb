Create database BDcomercioWeb
go
use BDcomercioWeb
go

create table Categoria(
	Id_categoria int primary key not null identity(1,1),
	Nombre_categoria varchar(40) not null
)

create table Proveedor (
    id_proveedor int primary key not null identity(1,1),
    nombre varchar(100) not null,
    E_mail varchar(100) not null,
    telefono int,
    direccion varchar(150)
);

create table Producto (
    id_Producto int primary key not null identity(1,1),
    nombre_producto varchar(100) not null,
    descripcion varchar(255),
    precio_compra float not null,
    precio_venta float not null,
    stock int not null,
    fecha_vencimiento date,
    id_categoria int not null,
    id_proveedor int,

    foreign key (id_categoria) references Categoria(Id_categoria),
    foreign key (id_proveedor) references Proveedor(id_proveedor)
);

create table Roles (
    id_rol int primary key not null identity(1,1),
    nombre_rol varchar(100) not null
);

create table Usuario (
    DNI_usuario int primary key,
    nombre_usuario varchar(100) not null,
    apellido_usuario varchar(100) not null,
    email varchar(100) not null,
    telefono int not null,
    id_rol int not null,

    foreign key (id_rol) references Roles(id_rol)

);

create table Venta (
    id_venta int primary key not null identity(1,1),
    DNI_usuario int not null,
    fecha_hora datetime not null,
    importe_total float not null,
    metodo_pago varchar(50) not null,

    foreign key (DNI_usuario) references Usuario(DNI_usuario)
);

go
create table Detalles(
	id_venta int,
	id_producto int,
	cantidad int not null default 1,
	precio_venta float not null, 
	primary key (id_venta, id_producto),
	foreign key(id_venta) references Venta(id_venta),
	foreign key(id_producto) references Producto(id_Producto)
)
go
create table Registros(
	fecha date primary key not null,
	cantidad_compras int, 
	total_importe_mes float

)
