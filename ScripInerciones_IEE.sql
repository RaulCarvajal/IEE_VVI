--Consulta
 
insert into clasificacion(Folio_Clas,Nom_Clas)
VALUES
("EY-01-","Mobiliario y equipo de oficina"),
("EY-02-","Equipo de cómputo"),
("EY-03-","Equipo de fotografía y video"),
("EY-04-","Aire acondicionado"),
("EY-05-","Equipo de comunicación"),
("EY-06-","Equipos y aparatos audiovisuales"),
("EY-07-","Equipo diverso"),
("EY-10-","Equipo de transporte"),
("EY-11-","Consumibles"),
("EY-12-","Papelería");

insert into estado(Nombre_Est) 
VALUES
("Baja – Pendiente"),
("Baja Definitivo"),
("ComoDato-Pendiente"), 
("Dato"),
("Donación - Pendiente"), 
("Donación"),
("Activo" ),
("Reparación"), 
("Bodega Informática" ),   
("Bodega Organización"),
("Bodega Administración"),
("Asignado" ),
("Resguardado"),
("Inactivo" );


insert INTO almacen(Nombre_Alm,Disponibilidad_Alm)
VALUES 
("Almacen Aministracion","S"),
("Almacen Informatica","S"),
("Almacen Organización","S");



insert INTO Car_Esp(Nombre_CarEsp)
VALUES 
("Ninguno"),
("Vehiculo"),
("Equipo de Computo"),
("Mueble oficina"),
("Consumible");


insert INTO Datos_Esp(Nombre_Dat,Car_Esp_idCar_Esp)
VALUES
("Fecha Servicio",2),
("Km Inicial",2),
("Km Final",2),
("Placas",2)
("Modelo",2)
("Compania",2);

("Null",1);

insert INTO Asignacion_Usr(Status_Asig)
VALUES 
("Asignado"),
("Sin Asignar"),
("Perdido"),
("Null");




insert INTO Tipo_Stock(Nombre_TipStock)
VALUES
("Cajas"),
("Unidades"),
("Botellas"),
("Kg"),
("Paquetes");

INSERT INTO fotos(FotoA_Fot) 
VALUES (null)

select COUNT(p.idProductos) as NumElemtsCat from productos as p 
inner join clasificacion as c on (p.Clasificacion_idClasificacion=c.idClasificacion ) 
where c.Nom_Clas LIKE 'Mobiliario y equipo de oficina'


select f.idFotos as IDFoto from fotos as f inner join productos as p on (p.FolioClas_Prod=f.FolioClas_Fot)