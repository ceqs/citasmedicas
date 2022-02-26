drop procedure if exists usp_s_rephis_cita;  
delimiter @@
create procedure usp_s_rephis_cita(fecI varchar(10), fecF varchar(10), idMed int,  idEsp int)
begin
-- declare cuenta int; 
-- TCM 
set idMed = if(idMed=0, null, idMed);
set idEsp = if(idEsp=0, null, idEsp); 

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
	and m.idEspecialidad = IFNULL(idEsp,  m.idEspecialidad) ; 

-- c.fecha between '2022-02-24' and '2022-02-24'  
-- set idMed = IFNULL(idMed, 99) ;
end@@
