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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

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


/*
INGRESO DE DATOS
*/

delete from especialidades;
DELIMITER ;
ALTER TABLE especialidades AUTO_INCREMENT = 1;
DELIMITER ;
INSERT INTO especialidades (nomEspecialidad) values ('Cardiología'), ('Dermatología'), ('Gastroenterología'),
('Ginecología');
DELIMITER ;
delete from medicos;
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

