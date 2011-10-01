mat := List new.
mat add: 'Algo3'.
mat add: 'Algo2'.
mat add: 'MetNum'.

mat2 := List new.
mat2 add: 'Algo3'.



brian := UsuarioAlumno newAlumnoConDNI: 312 libreta:  1 materias: mat mesaElectoral: 4 candidateador: 5.

doc := UsuarioAlumno newAlumnoConDNI: 311 libreta:  1 materias: mat2 mesaElectoral: 4 candidateador: 5.

padron := List new.
padron add: brian.
padron add: doc.

cheqA := ChequeadorAlumno new.
cheqG := ChequeadorGraduados new.
cheqP := ChequeadorProfesores new.


elec := Eleccion newEleccionPadronAlumno: padron padronGraduados: (List new) padronProfesores: 
(List new) chequeadorAlumnos: cheqA chequeadorGraduados: cheqG chequeadorProfesores: cheqP

elec iniciarPostulacion

(brian candidateador) candidatearme: brian.

doc
(doc candidateador) candidatearme: doc.

elec iniciarComicio.

(doc mesaElectoral) yo: doc votoA: (brian dni).