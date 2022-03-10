/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  ceqs
 * Created: Feb 15, 2022
 */
drop database if exists citasmedicas;
create database citasmedicas;

use citasmedicas;

CREATE TABLE `especialidades` (
  `idEspecialidad` int NOT NULL AUTO_INCREMENT,
  `nomEspecialidad` varchar(45) NOT NULL,
  PRIMARY KEY (`idEspecialidad`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `medicos` (
  `idMedico` int NOT NULL AUTO_INCREMENT,
  `apellidos` varchar(45) DEFAULT NULL,
  `nombres` varchar(45) NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `fecNacimiento` date DEFAULT NULL,
  `dni` varchar(8) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `idEspecialidad` int NOT NULL,
  PRIMARY KEY (`idMedico`,`idEspecialidad`),
  KEY `fk_Medicos_Especialidades1_idx` (`idEspecialidad`),
  CONSTRAINT `fk_Medicos_Especialidades1` FOREIGN KEY (`idEspecialidad`) REFERENCES `especialidades` (`idEspecialidad`)
);

CREATE TABLE `roles` (
  `idRol` int NOT NULL AUTO_INCREMENT,
  `nomRol` varchar(45) NOT NULL,
  PRIMARY KEY (`idRol`)
);

CREATE TABLE `usuarios` (
  `usuario` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `idRol` int NOT NULL,
  `enabled` boolean DEFAULT TRUE,
  PRIMARY KEY (`usuario`),
  KEY `fk_usuario_rol_idx` (`idRol`),
  CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`)
);

CREATE TABLE `pacientes` (
  `idPaciente` int NOT NULL AUTO_INCREMENT,
  `tipoDoc` char(1) not null,
  `numDoc` char(50) not null,
  `apePaterno` varchar(50) DEFAULT NULL,
  `apeMaterno` varchar(50) DEFAULT NULL,
  `nombres` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `celular` varchar(50) NOT NULL,
  `email` varchar(60) NOT NULL,
  `fecNacimiento` date DEFAULT NULL,
  `sexo` varchar(1) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  PRIMARY KEY (`idPaciente`),
  KEY `fk_paciente_usuario_idx` (`usuario`),
  CONSTRAINT `fk_paciente_usuario` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`usuario`)
);

CREATE TABLE `horarios` (
  `idHorario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `idMedico` int NOT NULL,
  PRIMARY KEY (`idHorario`),
  CONSTRAINT `fk_horario_medico` FOREIGN KEY (`idMedico`) REFERENCES `medicos` (`idMedico`)
) ;

CREATE TABLE `citas` (
  `idCita` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `idPaciente` int NOT NULL,
  `idMedico` int NOT NULL,
  `idHorario` int NOT NULL,
  PRIMARY KEY ( `idCita`),
  CONSTRAINT `fk_cita_paciente` FOREIGN KEY (`idPaciente`) REFERENCES `pacientes` (`idPaciente`),
  CONSTRAINT `fk_cita_medico` FOREIGN KEY (`idMedico`) REFERENCES `medicos` (`idMedico`),
  CONSTRAINT `fk_cita_horario` FOREIGN KEY (`idHorario`) REFERENCES `horarios` (`idHorario`)
);

-- drop procedure usp_i_especialidad;
create procedure usp_i_especialidad (
_nombre varchar(45)
)
insert into especialidades(nomEspecialidad) values(_nombre);

create procedure usp_u_especialidad (
_id int,
_nombre varchar(45)
)
update especialidades set nomEspecialidad = _nombre where idEspecialidad = _id;

create procedure usp_d_especialidad (_id int)
delete from especialidades where idEspecialidad = _id; 

create procedure usp_s_especialidad (_id int)
select idEspecialidad, nomEspecialidad from especialidades where idEspecialidad = _id; 

create procedure usp_s_especialidad_lst ()
select idEspecialidad, nomEspecialidad from especialidades order by nomEspecialidad;

create procedure usp_i_medico (
_apellido varchar(45),
_nombre varchar(45),
_genero varchar(1),
_fecnac date,
_dni varchar(8),
_telefono varchar(20),
_email varchar(60),
_idespecialidad int
)
insert into medicos(apellidos,nombres,sexo,fecNacimiento,dni,telefono,email,idEspecialidad) 
values(_apellido,_nombre,_genero,_fecnac,_dni,_telefono,_email,_idespecialidad);

create procedure usp_u_medico (
_id int,
_apellido varchar(45),
_nombre varchar(45),
_genero varchar(1),
_fecnac date,
_dni varchar(8),
_telefono varchar(20),
_email varchar(60),
_idespecialidad int
)
update medicos set apellidos=_apellido, nombres=_nombre, sexo=_genero, 
fecNacimiento=_fecnac,dni=_dni, telefono=_telefono, email=_email, 
idEspecialidad=_idespecialidad
where idMedico = _id;

create procedure usp_d_medico(_id int)
delete from medicos where idMedico = _id; 

create procedure usp_s_medico (_id int)
select idMedico,apellidos,nombres,sexo,fecNacimiento,dni,telefono,email,
m.idEspecialidad, e.nomEspecialidad 
from medicos m inner join especialidades e on m.idEspecialidad=e.idEspecialidad 
where idMedico = _id; 

create procedure usp_s_medico_lst ()
select idMedico,apellidos,nombres,sexo,fecNacimiento,dni,telefono,email,
m.idEspecialidad, e.nomEspecialidad 
from medicos m inner join especialidades e on m.idEspecialidad=e.idEspecialidad 
order by apellidos, nombres;


drop procedure if exists usp_s_rephis_cita;  
delimiter @@
create procedure usp_s_rephis_cita(fecI varchar(10), fecF varchar(10), idMed int,  idEsp int, idPac int)
begin
-- declare cuenta int; 
-- TCM 
set idMed = if(idMed=0, null, idMed);
set idEsp = if(idEsp=0, null, idEsp); 
set idPac = if(idPac=0, null, idPac); 

select c.idCita, c.fecha, 
	(h.nombre) as horario, 
	concat(m.apellidos,' ', m.nombres) as medico, 
	(e.nomEspecialidad) as especialidad, 
	concat(p.apePaterno,' ',p.apeMaterno,' ',p.nombres) as paciente,
	c.idMedico, e.idEspecialidad, c.idPaciente, c.idHorario 
from citas c 
	inner join medicos m on c.idMedico=m.idMedico 
	inner join pacientes p on c.idPaciente=p.idPaciente 
	inner join horarios h on c.idHorario=h.idHorario 
	inner join especialidades e on m.idEspecialidad=e.idEspecialidad 
where c.fecha between fecI and fecF  
	and c.idMedico = IFNULL(idMed, c.idMedico) 
	and m.idEspecialidad = IFNULL(idEsp,  m.idEspecialidad) 
    and c.idPaciente = IFNULL(idPac, c.idPaciente)  ; 

-- c.fecha between '2022-02-24' and '2022-02-24'  
-- set idMed = IFNULL(idMed, 99) ;
end@@



/*
INGRESO DE DATOS
*/

delete from roles;
DELIMITER ;
ALTER TABLE roles AUTO_INCREMENT = 1;
DELIMITER ;
INSERT INTO roles (nomRol) values ('Paciente'), ('Empleado'), ('Admin');
DELIMITER ;

-- delete from usuarios;
DELIMITER ;
ALTER TABLE usuarios AUTO_INCREMENT = 1;
DELIMITER ;
INSERT INTO usuarios (usuario, password, idRol, enabled) values ('uno', '123', '1', '1'),
('dos', '123', '2', '1'), ('tres', '123', '3', '1');
DELIMITER ;

-- delete from especialidades;
DELIMITER ;
ALTER TABLE especialidades AUTO_INCREMENT = 1;
DELIMITER ;
INSERT INTO especialidades (nomEspecialidad) values ('Cardiología'), ('Dermatología'), ('Gastroenterología'),
('Ginecología');
DELIMITER ;

-- delete from medicos;
DELIMITER ;
ALTER TABLE medicos AUTO_INCREMENT = 1;
DELIMITER ;
INSERT INTO medicos (apellidos ,nombres ,sexo ,fecNacimiento ,dni ,telefono ,email, idEspecialidad) 
values ('Juan','Torres','M','1980/01/01','12345678','999888777','juan@gmail.com',1),
 ('Pedro','Calvo','M','1981/02/02','23456789','111222333','pedro@gmail.com',1),
 ('Rodolfo','Torres','M','1983/03/03','45678912','444555666','rodolfo@gmail.com',2),
 ('Moises','Bedoya','M','1984/04/04','67890123','777888999','moises@gmail.com',2),
 ('Eduardo','Ponce','M','1985/05/05','78901234','888999000','eduardo@gmail.com',3),
 ('Salvador','Herrera','M','1986/06/06','89012345','000111222','salvador@gmail.com',3),
 ('Ricardo','Meza','M','1987/07/07','90123456','888999000','ricardo@gmail.com',4),
 ('Melissa','Marina','F','1988/08/08','01234567','987654321','melissa@gmail.com',4);
DELIMITER ;

-- delete from pacientes;
DELIMITER ;
ALTER TABLE pacientes AUTO_INCREMENT = 1;
DELIMITER ;
INSERT INTO pacientes (tipoDoc, numDoc, apePaterno, apeMaterno, nombres, telefono, celular, email,
fecNacimiento, sexo, usuario) 
values ('1','1011','Diaz','Jimenes','Juan','33034','989796','juan@gmail.com','1980/01/01','M','uno'),
 ('1','1012','Perez','Zapata','Pedro','33035','123456','pedro@gmail.com','1981/01/01','M','dos') ;
DELIMITER ;

-- delete from horarios;
DELIMITER ;
ALTER TABLE horarios AUTO_INCREMENT = 1;
DELIMITER ;
INSERT INTO horarios (nombre, idMedico) 
values ('de 8:00am a 8:20am',1), ('de 8:20am a 8:40am',1), ('de 8:40am a 9:00am',1), 
('de 9:00am a 9:20am',1), ('de 9:20am a 9:40am',1), ('de 9:40am a 10:00am',1),  
('de 10:00am a 10:20am',1), ('de 10:20am a 10:40am',1), ('de 10:40am a 11:00am',1),
('de 11:00am a 11:20am',1), ('de 11:20am a 11:40am',1), ('de 11:40am a 12:00pm',1),
('de 12:00pm a 12:20pm',1), ('de 12:20pm a 12:40pm',1), ('de 12:40pm a 01:00pm',1),
('de 03:00pm a 03:20pm',1), ('de 03:20pm a 03:40pm',1), ('de 03:40pm a 04:00pm',1),
('de 04:00pm a 04:20pm',1), ('de 04:20pm a 04:40pm',1), ('de 04:40pm a 05:00pm',1),
('de 05:00pm a 05:20pm',1), ('de 05:20pm a 05:40pm',1), ('de 05:40pm a 06:00pm',1),
('de 8:00am a 8:20am',2), ('de 8:20am a 8:40am',2), ('de 8:40am a 9:00am',2), 
('de 9:00am a 9:20am',2), ('de 9:20am a 9:40am',2), ('de 9:40am a 10:00am',2),  
('de 10:00am a 10:20am',2), ('de 10:20am a 10:40am',2), ('de 10:40am a 11:00am',2),
('de 11:00am a 11:20am',2), ('de 11:20am a 11:40am',2), ('de 11:40am a 12:00pm',2),
('de 12:00pm a 12:20pm',2), ('de 12:20pm a 12:40pm',2), ('de 12:40pm a 01:00pm',2),
('de 03:00pm a 03:20pm',2), ('de 03:20pm a 03:40pm',2), ('de 03:40pm a 04:00pm',2),
('de 04:00pm a 04:20pm',2), ('de 04:20pm a 04:40pm',2), ('de 04:40pm a 05:00pm',2),
('de 05:00pm a 05:20pm',2), ('de 05:20pm a 05:40pm',2), ('de 05:40pm a 06:00pm',2),
('de 8:00am a 8:20am',3), ('de 8:20am a 8:40am',3), ('de 8:40am a 9:00am',3), 
('de 9:00am a 9:20am',3), ('de 9:20am a 9:40am',3), ('de 9:40am a 10:00am',3),  
('de 10:00am a 10:20am',3), ('de 10:20am a 10:40am',3), ('de 10:40am a 11:00am',3),
('de 11:00am a 11:20am',3), ('de 11:20am a 11:40am',3), ('de 11:40am a 12:00pm',3),
('de 12:00pm a 12:20pm',3), ('de 12:20pm a 12:40pm',3), ('de 12:40pm a 01:00pm',3),
('de 8:00am a 8:20am',4), ('de 8:20am a 8:40am',4), ('de 8:40am a 9:00am',4), 
('de 9:00am a 9:20am',4), ('de 9:20am a 9:40am',4), ('de 9:40am a 10:00am',4),  
('de 10:00am a 10:20am',4), ('de 10:20am a 10:40am',4), ('de 10:40am a 11:00am',4),
('de 11:00am a 11:20am',4), ('de 11:20am a 11:40am',4), ('de 11:40am a 12:00pm',4),
('de 12:00pm a 12:20pm',4), ('de 12:20pm a 12:40pm',4), ('de 12:40pm a 01:00pm',4),
('de 03:00pm a 03:20pm',5), ('de 03:20pm a 03:40pm',5), ('de 03:40pm a 04:00pm',5),
('de 04:00pm a 04:20pm',5), ('de 04:20pm a 04:40pm',5), ('de 04:40pm a 05:00pm',5),
('de 05:00pm a 05:20pm',5), ('de 05:20pm a 05:40pm',5), ('de 05:40pm a 06:00pm',5),
('de 03:00pm a 03:20pm',6), ('de 03:20pm a 03:40pm',6), ('de 03:40pm a 04:00pm',6),
('de 04:00pm a 04:20pm',6), ('de 04:20pm a 04:40pm',6), ('de 04:40pm a 05:00pm',6),
('de 05:00pm a 05:20pm',6), ('de 05:20pm a 05:40pm',6), ('de 05:40pm a 06:00pm',6),
('de 03:00pm a 03:20pm',7), ('de 03:20pm a 03:40pm',7), ('de 03:40pm a 04:00pm',7),
('de 04:00pm a 04:20pm',7), ('de 04:20pm a 04:40pm',7), ('de 04:40pm a 05:00pm',7),
('de 05:00pm a 05:20pm',7), ('de 05:20pm a 05:40pm',7), ('de 05:40pm a 06:00pm',7),
('de 03:00pm a 03:20pm',8), ('de 03:20pm a 03:40pm',8), ('de 03:40pm a 04:00pm',8),
('de 04:00pm a 04:20pm',8), ('de 04:20pm a 04:40pm',8), ('de 04:40pm a 05:00pm',8),
('de 05:00pm a 05:20pm',8), ('de 05:20pm a 05:40pm',8), ('de 05:40pm a 06:00pm',8);
DELIMITER ;

-- delete from citas;
DELIMITER ;
ALTER TABLE citas AUTO_INCREMENT = 1;
DELIMITER ;
INSERT INTO citas (fecha, idPaciente, idMedico, idHorario) 
values ('2022/02/24','1','1','1'), ('2022/02/24','2','1','2'), ('2022/02/24','3','1','3'),
  ('2022/02/25','1','2','44'), ('2022/02/25','2','2','45'), ('2022/02/25','3','2','3');
DELIMITER ;
