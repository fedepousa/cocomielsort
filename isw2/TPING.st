<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.7.1 of 26 de julio de 2010 on 30 de septiembre de 2011 at 21:03:03</time-stamp>


<component-created>
<name>TPING</name> <type>package</type>
</component-created><!-- Package TPING* -->


<component-created>
<name>TPING</name> <type>package</type>
</component-created>

<class>
<name>ChequeadorReestricciones</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>TPING</package>
</attributes>
</class>

<class>
<name>ChequeadorProfesores</name>
<environment>Smalltalk</environment>
<super>ChequeadorReestricciones</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>TPING</package>
</attributes>
</class>

<class>
<name>ChequeadorGraduados</name>
<environment>Smalltalk</environment>
<super>ChequeadorReestricciones</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>TPING</package>
</attributes>
</class>

<class>
<name>Usuario</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>dni voto nombre mesaElectoral candidateador </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>TPING</package>
</attributes>
</class>

<class>
<name>UsuarioAlumno</name>
<environment>Smalltalk</environment>
<super>Usuario</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>LU materias </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>TPING</package>
</attributes>
</class>

<class>
<name>UsuarioProfesor</name>
<environment>Smalltalk</environment>
<super>Usuario</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>mesesDocente </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>TPING</package>
</attributes>
</class>

<class>
<name>UsuarioGraduado</name>
<environment>Smalltalk</environment>
<super>Usuario</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>facultadEgreso mesesDocente </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>TPING</package>
</attributes>
</class>

<class>
<name>ChequeadorAlumno</name>
<environment>Smalltalk</environment>
<super>ChequeadorReestricciones</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>TPING</package>
</attributes>
</class>

<class>
<name>MesaElectoral</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>votosValidos votosEnBlanco votosAnulados </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>TPING</package>
</attributes>
</class>

<class>
<name>Candidateador</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>listaCandidados chequeadorRestricciones </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>TPING</package>
</attributes>
</class>

<class>
<name>Eleccion</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>chequadorAlumnos chequeadorGraduados chequeadorProfesores padronAlumno padronGraduados padronProfesores candidateadorA candidateadorP candidateadorG mesaAlumnos mesaProfesores mesaGraduados </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>TPING</package>
</attributes>
</class>

<methods>
<class-id>ChequeadorReestricciones class</class-id> <category>instance creation</category>

<body package="TPING" selector="new">new	"Answer a newly created and initialized instance."	^super new initialize</body>
</methods>


<methods>
<class-id>ChequeadorReestricciones</class-id> <category>initialize-release</category>

<body package="TPING" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>
</methods>


<methods>
<class-id>Eleccion class</class-id> <category>As yet unclassified</category>

<body package="TPING" selector="newEleccionPadronAlumno:padronGraduados:padronProfesores:chequeadorAlumnos:chequeadorGraduados:chequeadorProfesores:">newEleccionPadronAlumno: pAlumno padronGraduados: pGraduados padronProfesores: pProfesores chequeadorAlumnos: cAlumnos chequeadorGraduados: cGraduados chequeadorProfesores: cProfesores| nuevo |	nuevo:= super new initialize.	nuevo padronAlumno: pAlumno.	nuevo padronGraduados: pGraduados.	nuevo padronProfesores: pProfesores.	nuevo chequadorAlumnos: cAlumnos.	nuevo chequeadorGraduados: cGraduados.	nuevo chequeadorProfesores: cProfesores.^nuevo.</body>
</methods>


<methods>
<class-id>Eleccion</class-id> <category>As yet unclassified</category>

<body package="TPING" selector="iniciarComicio">iniciarComiciomesaAlumnos := MesaElectoral new: (candidateadorA listaCandidatos).mesaProfesores := MesaElectoral new: (candidateadorP listaCandidatos).mesaGraduados := MesaElectoral new: (candidateadorG listaCandidatos).(self padronAlumno) do: [:alumno |  alumno mesaElectoral: mesaAlumnos ].(self padronGraduados) do: [:alumno |  alumno mesaElectoral: mesaGraduados ].(self padronProfesores) do: [:alumno |  alumno mesaElectoral: mesaProfesores].</body>

<body package="TPING" selector="iniciarPostulacion">iniciarPostulacion"seteamos los candidateadores"candidateadorA := (Candidateador newCandidateador: (self chequadorAlumnos)).candidateadorG := (Candidateador newCandidateador: (self chequeadorGraduados)).candidateadorP := (Candidateador newCandidateador: (self chequeadorProfesores)).(self padronAlumno) do: [:alumno |  alumno candidateador: candidateadorA  ].(self padronGraduados) do: [:alumno |  alumno candidateador: candidateadorG  ].(self padronProfesores) do: [:alumno |  alumno candidateador: candidateadorP].</body>
</methods>

<methods>
<class-id>Eleccion</class-id> <category>accessing</category>

<body package="TPING" selector="padronProfesores:">padronProfesores: anObject	padronProfesores := anObject</body>

<body package="TPING" selector="chequeadorGraduados:">chequeadorGraduados: anObject	chequeadorGraduados := anObject</body>

<body package="TPING" selector="chequeadorProfesores:">chequeadorProfesores: anObject	chequeadorProfesores := anObject</body>

<body package="TPING" selector="padronAlumno:">padronAlumno: anObject	padronAlumno := anObject</body>

<body package="TPING" selector="padronGraduados">padronGraduados	^padronGraduados</body>

<body package="TPING" selector="chequeadorProfesores">chequeadorProfesores	^chequeadorProfesores</body>

<body package="TPING" selector="chequadorAlumnos:">chequadorAlumnos: anObject	chequadorAlumnos := anObject</body>

<body package="TPING" selector="chequeadorGraduados">chequeadorGraduados	^chequeadorGraduados</body>

<body package="TPING" selector="chequadorAlumnos">chequadorAlumnos	^chequadorAlumnos</body>

<body package="TPING" selector="padronAlumno">padronAlumno	^padronAlumno</body>

<body package="TPING" selector="padronProfesores">padronProfesores	^padronProfesores</body>

<body package="TPING" selector="padronGraduados:">padronGraduados: anObject	padronGraduados := anObject</body>
</methods>

<methods>
<class-id>Eleccion</class-id> <category>initialize-release</category>

<body package="TPING" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Edit the following to properly initialize instance variables ***"	chequadorAlumnos := nil.	chequeadorGraduados := nil.	chequeadorProfesores := nil.	padronAlumno := nil.	padronGraduados := nil.	padronProfesores := nil.	" *** And replace this comment with additional initialization code *** "	^self</body>
</methods>


<methods>
<class-id>ChequeadorProfesores</class-id> <category>As yet unclassified</category>

<body package="TPING" selector="chequear:">chequear: unProf^ (unProf mesesDocente&gt;48)</body>
</methods>

<methods>
<class-id>ChequeadorProfesores</class-id> <category>initialize-release</category>

<body package="TPING" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>
</methods>


<methods>
<class-id>ChequeadorGraduados</class-id> <category>As yet unclassified</category>

<body package="TPING" selector="chequear:">chequear: unGraduado| unBoolean otroBoolean |	unBoolean := unGraduado mesesDocente &gt;8.	otroBoolean := (unGraduado facultadEgreso) == 'FCEN'.	^ (  unBoolean or: [otroBoolean] )</body>
</methods>

<methods>
<class-id>ChequeadorGraduados</class-id> <category>initialize-release</category>

<body package="TPING" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>
</methods>


<methods>
<class-id>Usuario class</class-id> <category>instance creation</category>

<body package="TPING" selector="new">new	"Answer a newly created and initialized instance."	^super new initialize</body>
</methods>


<methods>
<class-id>Usuario</class-id> <category>As yet unclassified</category>

<body package="TPING" selector="nombre">nombre</body>

<body package="TPING" selector="dni">dni^dni</body>
</methods>

<methods>
<class-id>Usuario</class-id> <category>votacion</category>

<body package="TPING" selector="yaVotaste">yaVotaste	 ^voto</body>

<body package="TPING" selector="registrarQueVoto">registrarQueVoto	voto:= True</body>
</methods>

<methods>
<class-id>Usuario</class-id> <category>setters</category>

<body package="TPING" selector="nombre:">nombre: unNombre	nombre:=unNombre</body>

<body package="TPING" selector="dni:">dni: unDni	dni:= unDni</body>

<body package="TPING" selector="candidateador">candidateador^candidateador.</body>

<body package="TPING" selector="candidateador:">candidateador: unCandidateadorcandidateador:= unCandidateador.</body>

<body package="TPING" selector="mesaElectoral">mesaElectoral	^mesaElectoral.</body>

<body package="TPING" selector="mesaElectoral:">mesaElectoral: mesamesaElectoral:= mesa.</body>
</methods>

<methods>
<class-id>Usuario</class-id> <category>initialize-release</category>

<body package="TPING" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>
</methods>


<methods>
<class-id>UsuarioAlumno class</class-id> <category>As yet unclassified</category>

<body package="TPING" selector="newAlumnoConDNI:libreta:materias:mesaElectoral:candidateador:">newAlumnoConDNI: aDni libreta: aLibreta materias: lasMaterias mesaElectoral: mesa candidateador: unCandidateador| nuevoAlumno |	 nuevoAlumno:= super new initialize.  	nuevoAlumno dni: aDni.	nuevoAlumno LU: aLibreta.	nuevoAlumno materias:  lasMaterias.	nuevoAlumno mesaElectoral: mesa.	nuevoAlumno candidateador: unCandidateador.^nuevoAlumno</body>
</methods>


<methods>
<class-id>UsuarioAlumno</class-id> <category>As yet unclassified</category>

<body package="TPING" selector="materias">materias^materias.</body>

<body package="TPING" selector="LU">LU^LU</body>

<body package="TPING" selector="materias:">materias: lasMateriasmaterias:=lasMaterias</body>
</methods>

<methods>
<class-id>UsuarioAlumno</class-id> <category>setters</category>

<body package="TPING" selector="LU:">LU: unaLULU:= unaLU</body>
</methods>

<methods>
<class-id>UsuarioAlumno</class-id> <category>initialize-release</category>

<body package="TPING" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Edit the following to properly initialize instance variables ***"	materias := nil.	" *** And replace this comment with additional initialization code *** "	^self</body>
</methods>


<methods>
<class-id>UsuarioProfesor class</class-id> <category>As yet unclassified</category>

<body package="TPING" selector="newProfesorConDni:mesesDocente:mesaElectoral:candidateador:">newProfesorConDni: aDni  mesesDocente: mesDoc mesaElectoral: mesa candidateador: unCandidateador| nuevo |	nuevo := super new initialize.nuevo dni: aDni.nuevo mesesDocente: mesDoc.nuevo mesaElectoral: mesa.nuevo candidateador: unCandidateador.</body>
</methods>


<methods>
<class-id>UsuarioProfesor</class-id> <category>As yet unclassified</category>

<body package="TPING" selector="mesesDocente:">mesesDocente: cantMesesmesesDocente :=  cantMeses</body>

<body package="TPING" selector="mesesDocente">mesesDocente^mesesDocente</body>
</methods>


<methods>
<class-id>UsuarioGraduado class</class-id> <category>As yet unclassified</category>

<body package="TPING" selector="newGraduadoConDni:facultadEgreso:mesesDocente:mesaElectoral:candidateador:">newGraduadoConDni: aDni  facultadEgreso: facEgre mesesDocente: mesDoc mesaElectoral: mesa candidateador: unCandidateador| nuevo |	nuevo := super new initialize.nuevo dni: aDni.nuevo facultadEgreso: facEgre.nuevo mesesDocente: mesDoc.nuevo mesaElectoral: mesa.nuevo candidateador: unCandidateador.</body>
</methods>


<methods>
<class-id>UsuarioGraduado</class-id> <category>accessing</category>

<body package="TPING" selector="facultadEgreso">facultadEgreso	^facultadEgreso</body>

<body package="TPING" selector="mesesDocente:">mesesDocente: anObject	mesesDocente := anObject</body>

<body package="TPING" selector="facultadEgreso:">facultadEgreso: anObject	facultadEgreso := anObject</body>

<body package="TPING" selector="mesesDocente">mesesDocente	^mesesDocente</body>
</methods>

<methods>
<class-id>UsuarioGraduado</class-id> <category>initialize-release</category>

<body package="TPING" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Edit the following to properly initialize instance variables ***"	facultadEgreso := nil.	mesesDocente := nil.	" *** And replace this comment with additional initialization code *** "	^self</body>
</methods>


<methods>
<class-id>ChequeadorAlumno class</class-id> <category>instance creation</category>

<body package="TPING" selector="new">new^super new initialize</body>
</methods>


<methods>
<class-id>ChequeadorAlumno</class-id> <category>As yet unclassified</category>

<body package="TPING" selector="chequear:">chequear: unAlumno^ (unAlumno materias size &gt;1)</body>
</methods>

<methods>
<class-id>ChequeadorAlumno</class-id> <category>initialize-release</category>

<body package="TPING" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>
</methods>


<methods>
<class-id>MesaElectoral class</class-id> <category>instance creation</category>

<body package="TPING" selector="new:">new: unListaCandidatos	| nuevo diccionarioEscrutinio |	nuevo:=super new initialize.	diccionarioEscrutinio := Dictionary new.	unListaCandidatos do: [:candidato  | diccionarioEscrutinio at: candidato put: 0].	 	nuevo votosValidos: diccionarioEscrutinio.	nuevo votosEnBlanco: 0.	nuevo votosAnulados: 0.		^nuevo</body>
</methods>


<methods>
<class-id>MesaElectoral</class-id> <category>As yet unclassified</category>

<body package="TPING" selector="votosValidos:">votosValidos: unDiccionario votosValidos:= unDiccionario</body>

<body package="TPING" selector="votosEnBlancoEncero">votosEnBlancoEncero votosEnBlanco:=0</body>
</methods>

<methods>
<class-id>MesaElectoral</class-id> <category>votacion</category>

<body package="TPING" selector="votosValidos">votosValidos^ votosValidos</body>

<body package="TPING" selector="yo:votoA:">yo: unVotante votoA: unCandidato | valorAntes |	valorAntes := votosValidos at: unCandidato. 	votosValidos at: unCandidato put: (valorAntes+1).	unVotante registrarQueVoto.</body>

<body package="TPING" selector="votosEnBlanco">votosEnBlanco^votosEnBlanco</body>

<body package="TPING" selector="votosAnulados">votosAnulados^votosAnulados</body>

<body package="TPING" selector="votosAnulados:">votosAnulados: votosvotosAnulados := votos.</body>

<body package="TPING" selector="votosEnBlanco:">votosEnBlanco: votosvotosEnBlanco := votos.</body>

<body package="TPING" selector="yoVotoAnulado:">yoVotoAnulado: unVotante		unVotante registrarQueVoto.		votosAnulados:=votosAnulados+1.</body>

<body package="TPING" selector="yoVotoEnBlanco:">yoVotoEnBlanco: unVotante	 unVotante registrarQueVoto.	 votosEnBlanco:=votosEnBlanco+1.</body>
</methods>

<methods>
<class-id>MesaElectoral</class-id> <category>initialize-release</category>

<body package="TPING" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>
</methods>


<methods>
<class-id>Candidateador class</class-id> <category>instance creation</category>

<body package="TPING" selector="newCandidateador:">newCandidateador: unChequeador| nuevo |	nuevo := super new initialize.	nuevo chequeadorRestricciones: unChequeador.	nuevo listaCandidatos: List new.	^nuevo.</body>
</methods>


<methods>
<class-id>Candidateador</class-id> <category>As yet unclassified</category>

<body package="TPING" selector="chequeadorRestricciones">chequeadorRestricciones^chequeadorRestricciones</body>

<body package="TPING" selector="chequeadorRestricciones:">chequeadorRestricciones: unChequeadorchequeadorRestricciones := unChequeador</body>

<body package="TPING" selector="candidatearme:">candidatearme: unUsuario	(self chequeadorRestricciones chequear: unUsuario) ifTrue: [ self listaCandidatos add: (unUsuario dni) ] ifFalse: [ Transcript print: 'error: no se puede votar TODO']</body>

<body package="TPING" selector="listaCandidatos">listaCandidatos^listaCandidados</body>

<body package="TPING" selector="listaCandidatos:">listaCandidatos: unaLista listaCandidados:= unaLista</body>
</methods>

<methods>
<class-id>Candidateador</class-id> <category>initialize-release</category>

<body package="TPING" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>
</methods>



</st-source>
