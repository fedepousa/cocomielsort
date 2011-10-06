"Armo padrones"
alumno1:= UsuarioAlumno newAlumnoConDNI:  1 ConNombre: 'PepeA' libreta: 111 materias:  #(1 2 3 4) copy.
alumno2:= UsuarioAlumno newAlumnoConDNI:  2 ConNombre: 'JuanA' libreta: 222 materias:  #(1 2) copy.
alumno3:= UsuarioAlumno newAlumnoConDNI:  3 ConNombre: 'PedroA' libreta: 333 materias:  #(4) copy.
alumno4:= UsuarioAlumno newAlumnoConDNI:  4 ConNombre: 'Alice' libreta: 444 materias:  #(1 2 3 4 5 6 7 8) copy.
alumno5:= UsuarioAlumno newAlumnoConDNI:  5 ConNombre: 'Alice' libreta: 555 materias:  #(1 2 3 4 5 6 7 8) copy.
alumno6:= UsuarioAlumno newAlumnoConDNI:  6 ConNombre: 'Alice' libreta: 666 materias:  #(1 2 3 5 6 7 8) copy.
alumno7:= UsuarioAlumno newAlumnoConDNI:  7 ConNombre: 'Alice' libreta: 777 materias:  #(1 2 3 5 7 8) copy.
alumno8:= UsuarioAlumno newAlumnoConDNI:  8 ConNombre: 'Alice' libreta: 888 materias:  #(1 2 3 4 5 6 7 8) copy.
alumno9:= UsuarioAlumno newAlumnoConDNI:  9 ConNombre: 'Alice' libreta: 999 materias:  #(1 2 3 4 7 8) copy.
alumno10:= UsuarioAlumno newAlumnoConDNI:  10 ConNombre: 'Alice' libreta: 000 materias:  #(1 2 3 4 5 6 7 8) copy.
setAlumnos:= Set new. setAlumnos add: alumno1. setAlumnos add: alumno2. setAlumnos add: alumno3. setAlumnos add:alumno4. setAlumnos add:alumno5. setAlumnos add:alumno6. setAlumnos add:alumno7. setAlumnos add:alumno8. setAlumnos add:alumno9. setAlumnos add:alumno10.
 

graduado1:= UsuarioGraduado newGraduadoConDni: 101  ConNombre: 'PedronG'  facultadEgreso: 'La Plata' mesesDocente: 30. 
graduado2:= UsuarioGraduado newGraduadoConDni: 102 ConNombre: 'JuanG'  facultadEgreso: 'FCEN' mesesDocente: 50.
graduado3:= UsuarioGraduado newGraduadoConDni: 103 ConNombre: 'RobertoG'  facultadEgreso: 'UTN' mesesDocente: 2.
graduado4:= UsuarioGraduado newGraduadoConDni: 104 ConNombre: 'nombreG104'  facultadEgreso: 'FCEN' mesesDocente: 1.
graduado5:= UsuarioGraduado newGraduadoConDni: 105 ConNombre: 'nombreG105'  facultadEgreso: 'sdsd' mesesDocente: 1.
graduado6:= UsuarioGraduado newGraduadoConDni: 106 ConNombre: 'nombreG106'  facultadEgreso: 'FCEN' mesesDocente: 2.
graduado7:= UsuarioGraduado newGraduadoConDni: 107 ConNombre: 'nombreG107' facultadEgreso: '43kjf' mesesDocente: 35.
graduado8:= UsuarioGraduado newGraduadoConDni: 108 ConNombre: 'nombreG108'  facultadEgreso: 'fdfs' mesesDocente: 40.
graduado9:= UsuarioGraduado newGraduadoConDni: 109 ConNombre: 'nombreG109' facultadEgreso: 'FCEN' mesesDocente: 100.
graduado10:= UsuarioGraduado newGraduadoConDni: 110 ConNombre: 'nombreG110'  facultadEgreso: 'FCEN' mesesDocente: 100.

setGraduados:= Set new.  setGraduados add: graduado1. setGraduados add: graduado2. setGraduados add: graduado3. setGraduados add: graduado4. setGraduados add: graduado5. setGraduados add: graduado6. setGraduados add: graduado7. setGraduados add: graduado8. setGraduados add: graduado9. setGraduados add: graduado10.

profesor1:= UsuarioProfesor newProfesorConDni: 201  ConNombre: 'AlejandroP'  mesesDocente: 1.
profesor2:= UsuarioProfesor newProfesorConDni: 202 ConNombre: 'JuanP'  mesesDocente: 50.
profesor3:= UsuarioProfesor newProfesorConDni: 203 ConNombre: 'PedroP' mesesDocente: 30.
profesor4:= UsuarioProfesor newProfesorConDni: 204 ConNombre: 'PdeP' mesesDocente: 100.
profesor5:= UsuarioProfesor newProfesorConDni: 205 ConNombre: 'nombreP205'  mesesDocente: 50.
profesor6:= UsuarioProfesor newProfesorConDni: 206 ConNombre: 'nombreP206' mesesDocente: 30.
profesor7:= UsuarioProfesor newProfesorConDni: 207 ConNombre: 'nombreP207' mesesDocente: 100.
profesor8:= UsuarioProfesor newProfesorConDni: 208 ConNombre: 'nombreP208'  mesesDocente: 50.
profesor9:= UsuarioProfesor newProfesorConDni: 209 ConNombre: 'nombreP209' mesesDocente: 30.
profesor10:= UsuarioProfesor newProfesorConDni: 210 ConNombre: 'nombreP210' mesesDocente: 100.
setProfesores:= Set  new.  setProfesores add: profesor1. setProfesores add: profesor2. setProfesores add: profesor3.  setProfesores add: profesor4.  setProfesores add: profesor5.  setProfesores add: profesor6.  setProfesores add: profesor7.  setProfesores add: profesor8.  setProfesores add: profesor9.  setProfesores add: profesor10.

 

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
	interfazLogueador := LogueadorInterfaz new:  (eleccion2011 logueador).

		"aca deben ir todos los eventos relacionados con la interaccion del sistema en el tiempo de postulacion"
	
"Alumnos"			
(interfazLogueador login: 1 password: '   ') mostrarInterfaz.
(interfazLogueador login: 2 password: '   ') mostrarInterfaz.
(interfazLogueador login: 3 password: '   ') mostrarInterfaz.
(interfazLogueador login: 4 password: '   ') mostrarInterfaz.
(interfazLogueador login: 5 password: '   ') mostrarInterfaz.
(interfazLogueador login: 6 password: '   ') mostrarInterfaz.
(interfazLogueador login: 7 password: '   ') mostrarInterfaz.
(interfazLogueador login: 8 password: '   ') mostrarInterfaz.
(interfazLogueador login: 9 password: '   ') mostrarInterfaz.
(interfazLogueador login: 10 password: '   ') mostrarInterfaz.

"Graduados"
(interfazLogueador login: 101 password: '   ') mostrarInterfaz.
(interfazLogueador login: 102 password: '   ') mostrarInterfaz.
(interfazLogueador login: 103 password: '   ') mostrarInterfaz.
(interfazLogueador login: 104 password: '   ') mostrarInterfaz.
(interfazLogueador login: 105 password: '   ') mostrarInterfaz.
(interfazLogueador login: 106 password: '   ') mostrarInterfaz.
(interfazLogueador login: 107 password: '   ') mostrarInterfaz.
(interfazLogueador login: 108 password: '   ') mostrarInterfaz.
(interfazLogueador login: 109 password: '   ') mostrarInterfaz.
(interfazLogueador login: 110 password: '   ') mostrarInterfaz.

."profesores"
(interfazLogueador login: 201 password: '   ') mostrarInterfaz.  
(interfazLogueador login: 202 password: '   ') mostrarInterfaz.
(interfazLogueador login: 203 password: '   ') mostrarInterfaz.
(interfazLogueador login: 204 password: '   ') mostrarInterfaz.
(interfazLogueador login: 205 password: '   ') mostrarInterfaz.
(interfazLogueador login: 206 password: '   ') mostrarInterfaz.
(interfazLogueador login: 207 password: '   ') mostrarInterfaz.
(interfazLogueador login: 208 password: '   ') mostrarInterfaz.
(interfazLogueador login: 209 password: '   ') mostrarInterfaz.
(interfazLogueador login: 210 password: '   ') mostrarInterfaz.



	"cerramos postulacion------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
	eleccion2011 cerrarPostulacion.


 				(interfazLogueador login: 123 password: ' ' ) mostrarInterfaz.

	"Iniciamos comicio----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
	eleccion2011  iniciarComicio.

"Alumnos"			
(interfazLogueador login: 1 password: '   ') mostrarInterfaz.
(interfazLogueador login: 2 password: '   ') mostrarInterfaz.
(interfazLogueador login: 3 password: '   ') mostrarInterfaz.
(interfazLogueador login: 4 password: '   ') mostrarInterfaz.
(interfazLogueador login: 5 password: '   ') mostrarInterfaz.
(interfazLogueador login: 6 password: '   ') mostrarInterfaz.
(interfazLogueador login: 7 password: '   ') mostrarInterfaz.
(interfazLogueador login: 8 password: '   ') mostrarInterfaz.
(interfazLogueador login: 9 password: '   ') mostrarInterfaz.
(interfazLogueador login: 10 password: '   ') mostrarInterfaz.

"Graduados"
(interfazLogueador login: 101 password: '   ') mostrarInterfaz.
(interfazLogueador login: 102 password: '   ') mostrarInterfaz.
(interfazLogueador login: 103 password: '   ') mostrarInterfaz.
(interfazLogueador login: 104 password: '   ') mostrarInterfaz.
(interfazLogueador login: 105 password: '   ') mostrarInterfaz.
(interfazLogueador login: 106 password: '   ') mostrarInterfaz.
(interfazLogueador login: 107 password: '   ') mostrarInterfaz.
(interfazLogueador login: 108 password: '   ') mostrarInterfaz.
(interfazLogueador login: 109 password: '   ') mostrarInterfaz.
(interfazLogueador login: 110 password: '   ') mostrarInterfaz.


."profesores"
(interfazLogueador login: 201 password: '   ') mostrarInterfaz.  
(interfazLogueador login: 202 password: '   ') mostrarInterfaz.
(interfazLogueador login: 203 password: '   ') mostrarInterfaz.
(interfazLogueador login: 204 password: '   ') mostrarInterfaz.
(interfazLogueador login: 205 password: '   ') mostrarInterfaz.
(interfazLogueador login: 206 password: '   ') mostrarInterfaz.
(interfazLogueador login: 207 password: '   ') mostrarInterfaz.
(interfazLogueador login: 208 password: '   ') mostrarInterfaz.
(interfazLogueador login: 209 password: '   ') mostrarInterfaz.
(interfazLogueador login: 210 password: '   ') mostrarInterfaz.


			
		
eleccion2011 cerrarComicio.
