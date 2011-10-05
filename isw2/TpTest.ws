"Armo padrones"
alumno1:= UsuarioAlumno newAlumnoConDNI:  123 libreta: 111 materias:  #(1 2 3 4) copy.
alumno2:= UsuarioAlumno newAlumnoConDNI:  456 libreta: 222 materias:  #(1 2) copy.
alumno3:= UsuarioAlumno newAlumnoConDNI:  789 libreta: 333 materias:  #(4) copy.
setAlumnos:= Set new. setAlumnos add: alumno1. setAlumnos add: alumno2. setAlumnos add: alumno3.
 

 
graduado1:= UsuarioGraduado newGraduadoConDni: 11111111  facultadEgreso: 'La Plata' mesesDocente: 30. 
graduado2:= UsuarioGraduado newGraduadoConDni: 22222222  facultadEgreso: 'FCEN' mesesDocente: 50.
graduado3:= UsuarioGraduado newGraduadoConDni: 33333333  facultadEgreso: 'UTN' mesesDocente: 2.
graduado4:= UsuarioGraduado newGraduadoConDni: 22222222  facultadEgreso: 'FCEN' mesesDocente: 1.
setGraduados:= Set new.  setGraduados add: graduado1. setGraduados add: graduado2. setGraduados add: graduado3.

profesor1:= UsuarioProfesor newProfesorConDni: 123123123  mesesDocente: 1.
profesor2:= UsuarioProfesor newProfesorConDni: 345454344 mesesDocente: 50.
profesor3:= UsuarioProfesor newProfesorConDni: 234234343 mesesDocente: 30.
profesor4:= UsuarioProfesor newProfesorConDni: 657657236 mesesDocente: 100.
setProfesores:= Set  new.  setProfesores add: profesor1. setProfesores add: profesor2. setProfesores add: profesor3.  setProfesores add: profesor4.

 

"Armo chequeadores ---------------------------------------------------------------------------------------------------------------------------------------------------------------------" 

chAlu := ChequeadorAlumno new.
chGr:= ChequeadorGraduados new.
chProf:= ChequeadorProfesores new.

dicChequeadores:= Dictionary new.
dicChequeadores at: 'Alumnos' put: chAlu.
dicChequeadores at: 'Graduados' put: chGr.
dicChequeadores at: 'Profesores' put: chProf.


"Sistema de login ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
eleccion2011:= Eleccion newEleccionPadronAlumno: setAlumnos padronGraduados: setGraduados padronProfesores: setProfesores chequeadorAlumnos: chAlu chequeadorGraduados: chGr chequeadorProfesores: chProf.


	"Iniciamos postulacion ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
	eleccion2011 iniciarPostulacion.
	
	"creamos LogueadorInterfaz para q los usaurios se puedan comunicar"
	interfazLogueador:= LogueadorInterfaz new:  (eleccion2011 logueador).

		"aca deben ir todos los eventos relacionados con la interaccion del sistema en el tiempo de postulacion"
	
			"se postula un alumno que se puede candidatear"
				soyAlumnoConDni123:=  	interfazLogueador login: 123 password: ''. 
				soyAlumnoConDni123 candidatearme.

			"se postula un alumno que no se puede candidatear"
				soyAlumnoConDni789:=   interfazUsuario login: 789 password: ''.
				soyAlumnoConDni789 candidatearme.



	"Iniciamos comicio----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
	eleccion2011  iniciarComicio.

		"aca deben ir todos los eventos relacionados con la interaccion del sistema en el tiempo que se puede votar	"

			"Un alumno vota"		
			soyAlumno456:=  interfazUsuario login: 456 password: ''.
			soyAlumno456 listaCandidatos

			soyAlumno456 votoA:  #(123) copy.  

			"prueba votar otra vez"
			soyAlumno456 votoA: #(123) copy. 




		
			




