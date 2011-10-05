<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.7.1 of 26 de julio de 2010 on 5 de octubre de 2011 at 15:58:43</time-stamp>


<component-created>
<name>TPING2</name> <type>package</type>
</component-created><!-- Package TPING2* -->


<component-property>
<name>TPING2</name> <type>package</type>
<property>disregardedPrerequisites</property> <value>#()</value>
</component-property>

<component-property>
<name>TPING2</name> <type>package</type>
<property>packageName</property> <value>'TPING2'</value>
</component-property>

<class>
<name>UrnaElectoral</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>validos blanco anulados </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>TPING2</package>
</attributes>
</class>

<class>
<name>Candidateador</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>listaCandidatos chequeadorRestricciones </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>TPING2</package>
</attributes>
</class>

<class>
<name>Eleccion</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>chequadorAlumnos chequeadorGraduados chequeadorProfesores padronAlumnos padronGraduados padronProfesores candidateadorA candidateadorP candidateadorG urnaAlumnos urnaProfesores urnaGraduados chequeadorAlumnos logueador urnaA urnaP urnaG </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>TPING2</package>
</attributes>
</class>

<class>
<name>InterfazUsuario</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>usuario </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>TPING2</package>
</attributes>
</class>

<class>
<name>InterfazParaPostulacion</name>
<environment>Smalltalk</environment>
<super>InterfazUsuario</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>candidateador </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>TPING2</package>
</attributes>
</class>

<class>
<name>InterfazParaVotacion</name>
<environment>Smalltalk</environment>
<super>InterfazUsuario</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>urna lista </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>TPING2</package>
</attributes>
</class>

<class>
<name>InterfazParaEleccionCerrada</name>
<environment>Smalltalk</environment>
<super>InterfazUsuario</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>TPING2</package>
</attributes>
</class>

<class>
<name>Logueador</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>mapUsuarioPassEleccion </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>TPING2</package>
</attributes>
</class>

<class>
<name>Creador</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>TPING2</package>
</attributes>
</class>

<class>
<name>CreadorPostulacion</name>
<environment>Smalltalk</environment>
<super>Creador</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>TPING2</package>
</attributes>
</class>

<class>
<name>CreadorVotacion</name>
<environment>Smalltalk</environment>
<super>Creador</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>TPING2</package>
</attributes>
</class>

<class>
<name>CreadorEleccionCerrada</name>
<environment>Smalltalk</environment>
<super>Creador</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>TPING2</package>
</attributes>
</class>

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
<package>TPING2</package>
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
<package>TPING2</package>
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
<package>TPING2</package>
</attributes>
</class>

<class>
<name>Usuario</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>dni voto </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>TPING2</package>
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
<package>TPING2</package>
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
<package>TPING2</package>
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
<package>TPING2</package>
</attributes>
</class>

<class>
<name>InterfazParaPostulacionCerrada</name>
<environment>Smalltalk</environment>
<super>InterfazUsuario</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>listaCandidatos </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>TPING2</package>
</attributes>
</class>

<class>
<name>InterfazParaComicioCerrado</name>
<environment>Smalltalk</environment>
<super>InterfazUsuario</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>TPING2</package>
</attributes>
</class>

<class>
<name>LogueadorInterfaz</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>logueador </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>TPING2</package>
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
<package>TPING2</package>
</attributes>
</class>

<methods>
<class-id>Creador class</class-id> <category>instance creation</category>

<body package="TPING2" selector="new">new	"Answer a newly created and initialized instance."	^super new initialize</body>
</methods>


<methods>
<class-id>Creador</class-id> <category>initialize-release</category>

<body package="TPING2" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>
</methods>


<methods>
<class-id>CreadorVotacion</class-id> <category>initialize-release</category>

<body package="TPING2" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>
</methods>


<methods>
<class-id>CreadorEleccionCerrada</class-id> <category>initialize-release</category>

<body package="TPING2" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>
</methods>


<methods>
<class-id>ChequeadorReestricciones class</class-id> <category>instance creation</category>

<body package="TPING2" selector="new">new	"Answer a newly created and initialized instance."	^super new initialize</body>
</methods>


<methods>
<class-id>ChequeadorReestricciones</class-id> <category>initialize-release</category>

<body package="TPING2" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>
</methods>


<methods>
<class-id>ChequeadorProfesores</class-id> <category>As yet unclassified</category>

<body package="TPING2" selector="chequear:">chequear: unProf^ (unProf mesesDocente&gt;48)</body>
</methods>

<methods>
<class-id>ChequeadorProfesores</class-id> <category>initialize-release</category>

<body package="TPING2" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>
</methods>


<methods>
<class-id>ChequeadorGraduados</class-id> <category>As yet unclassified</category>

<body package="TPING2" selector="chequear:">chequear: unGraduado| unBoolean otroBoolean |	unBoolean := unGraduado mesesDocente &gt;8.	otroBoolean := (unGraduado facultadEgreso) == 'FCEN'.	^ (  unBoolean or: [otroBoolean] )</body>
</methods>

<methods>
<class-id>ChequeadorGraduados</class-id> <category>initialize-release</category>

<body package="TPING2" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>
</methods>


<methods>
<class-id>Usuario class</class-id> <category>instance creation</category>

<body package="TPING2" selector="new">new	"Answer a newly created and initialized instance."	^super new initialize</body>
</methods>


<methods>
<class-id>Usuario</class-id> <category>As yet unclassified</category>

<body package="TPING2" selector="nombre">nombre</body>

<body package="TPING2" selector="dni">dni^dni</body>
</methods>

<methods>
<class-id>Usuario</class-id> <category>votacion</category>

<body package="TPING2" selector="yaVotaste">yaVotaste	 ^voto</body>

<body package="TPING2" selector="registrarQueVoto">registrarQueVoto	voto:= true.</body>
</methods>

<methods>
<class-id>Usuario</class-id> <category>setters</category>

<body package="TPING2" selector="dni:">dni: unDni	dni:= unDni</body>
</methods>

<methods>
<class-id>Usuario</class-id> <category>initialize-release</category>

<body package="TPING2" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>
</methods>


<methods>
<class-id>UsuarioAlumno class</class-id> <category>As yet unclassified</category>

<body package="TPING2" selector="newAlumnoConDNI:libreta:materias:">newAlumnoConDNI: aDni libreta: aLibreta materias: lasMaterias | nuevoAlumno |	 nuevoAlumno:= super new initializeAlumnoConDNI: aDni libreta: aLibreta materias: lasMaterias.  ^nuevoAlumno</body>
</methods>


<methods>
<class-id>UsuarioAlumno</class-id> <category>As yet unclassified</category>

<body package="TPING2" selector="materias">materias^materias.</body>

<body package="TPING2" selector="cantidadMaximaDeVotos">cantidadMaximaDeVotos^1.</body>

<body package="TPING2" selector="LU">LU^LU</body>
</methods>

<methods>
<class-id>UsuarioAlumno</class-id> <category>initialize-release</category>

<body package="TPING2" selector="initializeAlumnoConDNI:libreta:materias:">initializeAlumnoConDNI: aDni libreta: aLibreta materias: lasMaterias 	materias:= lasMaterias.	dni:= aDni.	LU:= aLibreta.	voto:=false.		^self</body>
</methods>


<methods>
<class-id>UsuarioProfesor class</class-id> <category>As yet unclassified</category>

<body package="TPING2" selector="newProfesorConDni:mesesDocente:">newProfesorConDni: aDni  mesesDocente: mesDoc | nuevo |	nuevo := super new  initializeDni: aDni mesesDoc: mesDoc .	^nuevo.</body>

<body package="TPING2" selector="newProfesorConDni:mesesDocente:mesaElectoral:candidateador:">newProfesorConDni: aDni  mesesDocente: mesDoc mesaElectoral: mesa candidateador: unCandidateador| nuevo |	nuevo := super new  initializeDni: aDni mesesDoc: mesDoc mesElec: mesa candidateador: unCandidateador.	^nuevo.</body>
</methods>


<methods>
<class-id>UsuarioProfesor</class-id> <category>As yet unclassified</category>

<body package="TPING2" selector="mesesDocente">mesesDocente^mesesDocente</body>

<body package="TPING2" selector="mesesDocente:">mesesDocente: cantMesesmesesDocente :=  cantMeses</body>

<body package="TPING2" selector="cantidadMaximaDeVotos">cantidadMaximaDeVotos^2.</body>
</methods>

<methods>
<class-id>UsuarioProfesor</class-id> <category>initialize-release</category>

<body package="TPING2" selector="initializeDni:mesesDoc:">initializeDni: aDni mesesDoc: mesDoc dni:= aDni.mesesDocente:= mesDoc.voto:=false.^self.</body>
</methods>


<methods>
<class-id>UsuarioGraduado class</class-id> <category>As yet unclassified</category>

<body package="TPING2" selector="newGraduadoConDni:facultadEgreso:mesesDocente:">newGraduadoConDni: aDni  facultadEgreso: facEgre mesesDocente: mesDoc | nuevo |	nuevo := super new initializeGraduadoConDni: aDni  facultadEgreso: facEgre mesesDocente: mesDoc.	^nuevo.</body>
</methods>


<methods>
<class-id>UsuarioGraduado</class-id> <category>As yet unclassified</category>

<body package="TPING2" selector="cantidadMaximaDeVotos">cantidadMaximaDeVotos^1.</body>
</methods>

<methods>
<class-id>UsuarioGraduado</class-id> <category>accessing</category>

<body package="TPING2" selector="mesesDocente">mesesDocente	^mesesDocente</body>

<body package="TPING2" selector="facultadEgreso">facultadEgreso	^facultadEgreso</body>
</methods>

<methods>
<class-id>UsuarioGraduado</class-id> <category>initialize-release</category>

<body package="TPING2" selector="initializeGraduadoConDni:facultadEgreso:mesesDocente:">initializeGraduadoConDni: aDni  facultadEgreso: facEgre mesesDocente: mesDocdni:= aDni.facultadEgreso:= facEgre.mesesDocente:=mesDoc.	voto:=false.^self</body>
</methods>


<methods>
<class-id>InterfazUsuario class</class-id> <category>instance creation</category>

<body package="TPING2" selector="new">new	"Answer a newly created and initialized instance."	^super new initialize</body>
</methods>


<methods>
<class-id>InterfazUsuario</class-id> <category>initialize-release</category>

<body package="TPING2" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>
</methods>


<methods>
<class-id>InterfazParaPostulacionCerrada class</class-id> <category>As yet unclassified</category>

<body package="TPING2" selector="newConUsuario:conListaCandidatos:">newConUsuario: usr conListaCandidatos: lista| nuevo |	nuevo:=super new.nuevo usuario: usr.nuevo listaCandidatos: lista.</body>
</methods>


<methods>
<class-id>InterfazParaPostulacionCerrada</class-id> <category>initialize-release</category>

<body package="TPING2" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Edit the following to properly initialize instance variables ***"	listaCandidatos := nil.	" *** And replace this comment with additional initialization code *** "	^self</body>
</methods>

<methods>
<class-id>InterfazParaPostulacionCerrada</class-id> <category>As yet unclassified</category>

<body package="TPING2" selector="listaCandidatos:">listaCandidatos: unalistalistaCandidatos:= unalista.</body>
</methods>


<methods>
<class-id>InterfazParaComicioCerrado</class-id> <category>initialize-release</category>

<body package="TPING2" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>
</methods>


<methods>
<class-id>LogueadorInterfaz class</class-id> <category>instance creation</category>

<body package="TPING2" selector="new:">new: unLogueador	^(super new) logueador: unLogueador.</body>
</methods>


<methods>
<class-id>LogueadorInterfaz</class-id> <category>As yet unclassified</category>

<body package="TPING2" selector="logueador:">logueador: unLogueador		logueador:= unLogueador.</body>

<body package="TPING2" selector="login:password:">login: unDNI password: unPassword^ (logueador login: unDNI password: unPassword).</body>
</methods>


<methods>
<class-id>ChequeadorAlumno class</class-id> <category>instance creation</category>

<body package="TPING2" selector="new">new^super new initialize</body>
</methods>


<methods>
<class-id>ChequeadorAlumno</class-id> <category>As yet unclassified</category>

<body package="TPING2" selector="chequear:">chequear: unAlumno^ (unAlumno materias size &gt;1)</body>
</methods>

<methods>
<class-id>ChequeadorAlumno</class-id> <category>initialize-release</category>

<body package="TPING2" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>
</methods>


<methods>
<class-id>UrnaElectoral class</class-id> <category>instance creation</category>

<body package="TPING2" selector="new">new	| nuevo |	nuevo:=super new initialize.		^nuevo</body>
</methods>


<methods>
<class-id>UrnaElectoral</class-id> <category>initialize-release</category>

<body package="TPING2" selector="initialize">initialize 	validos:= Bag new.	blanco:= 0.	anulados:= 0.	^self</body>
</methods>

<methods>
<class-id>UrnaElectoral</class-id> <category>ver votos</category>

<body package="TPING2" selector="votosAnulados">votosAnulados^anulados</body>

<body package="TPING2" selector="votosEnBlanco">votosEnBlanco^blanco</body>

<body package="TPING2" selector="votosValidos">votosValidos^ validos</body>
</methods>

<methods>
<class-id>UrnaElectoral</class-id> <category>registrar</category>

<body package="TPING2" selector="registrarVotoDe:A:">registrarVotoDe: unUsuario A: unConjuntoDeDnisCandidato	"chequeo si ya voto"		(unUsuario yaVotaste) ifFalse: [						"chequeo si puede votar a tantos candidatos como quiso	"																		( (unConjuntoDeDnisCandidato size) &lt;= (unUsuario cantidadMaximaDeVotos)) ifTrue:[									"puede votar a todos los candidatos, registro los votos estos"									unConjuntoDeDnisCandidato do: [:unDni |  validos add: unDni].						]							].		"registro que ya voto"	unUsuario registrarQueVoto.</body>

<body package="TPING2" selector="registrarVotoAnuladoDe:">registrarVotoAnuladoDe: unUsuario	"registro el voto"	(unUsuario yaVotaste) ifFalse: [ 										anulados:=anulados+1.].	"registro que ya voto"	unUsuario registrarQueVoto.</body>

<body package="TPING2" selector="registrarVotoEnBlancoDe:">registrarVotoEnBlancoDe: unUsuario	(unUsuario yaVotaste) ifFalse: [									"registro el voto"									blanco:=	blanco+1.								].	"registro que ya voto"	unUsuario registrarQueVoto.</body>
</methods>


<methods>
<class-id>Candidateador class</class-id> <category>instance creation</category>

<body package="TPING2" selector="newCandidateador:">newCandidateador: unChequeador| nuevo |	nuevo := super new initializeChequeadorRestricciones:unChequeador.	^nuevo.</body>
</methods>


<methods>
<class-id>Candidateador</class-id> <category>As yet unclassified</category>

<body package="TPING2" selector="chequeadorRestricciones">chequeadorRestricciones^chequeadorRestricciones</body>

<body package="TPING2" selector="chequeadorRestricciones:">chequeadorRestricciones: unChequeadorchequeadorRestricciones := unChequeador</body>

<body package="TPING2" selector="candidatearme:">candidatearme: unUsuario	(self chequeadorRestricciones chequear: unUsuario) ifTrue: [ self listaCandidatos add: (unUsuario dni) ] ifFalse: [ Transcript print: 'error: no se puede votar TODO']</body>

<body package="TPING2" selector="initializeChequeadorRestricciones:">initializeChequeadorRestricciones:unChequeador	chequeadorRestricciones:= unChequeador.	listaCandidatos:= List new.	^self.</body>

<body package="TPING2" selector="listaCandidatos">listaCandidatos^listaCandidatos</body>
</methods>


<methods>
<class-id>Eleccion class</class-id> <category>As yet unclassified</category>

<body package="TPING2" selector="newEleccionPadronAlumno:padronGraduados:padronProfesores:chequeadorAlumnos:chequeadorGraduados:chequeadorProfesores:">newEleccionPadronAlumno: pAlumno padronGraduados: pGraduados padronProfesores: pProfesores chequeadorAlumnos: cAlumnos chequeadorGraduados: cGraduados chequeadorProfesores: cProfesores| nuevo |	nuevo:= super new.	nuevo padronAlumno: pAlumno.	nuevo padronGraduados: pGraduados.	nuevo padronProfesores: pProfesores.	nuevo logueador: Logueador new.	nuevo candidateadorA: (Candidateador newCandidateador: cAlumnos).	nuevo candidateadorG: (Candidateador newCandidateador: cGraduados).	nuevo candidateadorP: (Candidateador  newCandidateador: cProfesores).^nuevo.</body>
</methods>


<methods>
<class-id>Eleccion</class-id> <category>accessing</category>

<body package="TPING2" selector="candidateadorG:">candidateadorG: uncandicandidateadorG:= uncandi.</body>

<body package="TPING2" selector="padronGraduados">padronGraduados	^padronGraduados</body>

<body package="TPING2" selector="logueador">logueador	^logueador.</body>

<body package="TPING2" selector="padronAlumno:">padronAlumno: anObject	padronAlumnos := anObject</body>

<body package="TPING2" selector="padronGraduados:">padronGraduados: anObject	padronGraduados := anObject</body>

<body package="TPING2" selector="padronProfesores">padronProfesores	^padronProfesores</body>

<body package="TPING2" selector="chequadorAlumnos">chequadorAlumnos	^chequadorAlumnos</body>

<body package="TPING2" selector="logueador:">logueador: unLogueadorlogueador:=unLogueador.</body>

<body package="TPING2" selector="padronProfesores:">padronProfesores: anObject	padronProfesores := anObject</body>

<body package="TPING2" selector="chequadorAlumnos:">chequadorAlumnos: anObject	chequadorAlumnos := anObject</body>

<body package="TPING2" selector="chequeadorGraduados">chequeadorGraduados	^chequeadorGraduados</body>

<body package="TPING2" selector="chequeadorProfesores">chequeadorProfesores	^chequeadorProfesores</body>

<body package="TPING2" selector="candidateadorA:">candidateadorA: uncandicandidateadorA:= uncandi.</body>

<body package="TPING2" selector="chequeadorGraduados:">chequeadorGraduados: anObject	chequeadorGraduados := anObject</body>

<body package="TPING2" selector="chequeadorProfesores:">chequeadorProfesores: anObject	chequeadorProfesores := anObject</body>

<body package="TPING2" selector="padronAlumno">padronAlumno	^padronAlumnos</body>

<body package="TPING2" selector="candidateadorP:">candidateadorP: uncandicandidateadorP:= uncandi.</body>
</methods>

<methods>
<class-id>Eleccion</class-id> <category>viejos</category>

<body package="TPING2" selector="iniciarPostulacionConPadron:conChqueadores:">iniciarPostulacionConPadron: padrones conChqueadores: chequeadores|nuevaInterfaz  mapUsuarioPassEleccion|"Creo map de usuarios-interfaz"mapUsuarioPassEleccion:= Dictionary new."nota: la parte del password no esta modelada""creo los tres tipos de candidateadores"candidateadorA:= Candidateador newCandidateador: chequeadorAlumnos.candidateadorG:= Candidateador newCandidateador: chequeadorGraduados.candidateadorP:= Candidateador  newCandidateador: chequeadorProfesores."agrego el diccionario de usuarios, password y candidateador"	"alumnos"	padronAlumnos do: [ :alumno |		"creo la intefaz"			nuevaInterfaz:= InterfazParaPostulacion newConUsuario: alumno conCandidateador: candidateadorA.		"lo pongo en el map"		mapUsuarioPassEleccion at: (alumno dni) put: nuevaInterfaz.	].	"graduados"	padronGraduados do: [  :graduado |		"creo la intefaz"			nuevaInterfaz:= InterfazParaPostulacion newConUsuario: graduado conCandidateador: candidateadorG.		"lo pongo en el map"		mapUsuarioPassEleccion at: (graduado dni) put: nuevaInterfaz.	].	"profesor"	padronProfesores do: [ :profesor |		"creo la intefaz"			nuevaInterfaz:= InterfazParaPostulacion newConUsuario: profesor conCandidateador: candidateadorP.		"lo pongo en el map"		mapUsuarioPassEleccion at:  (profesor dni)  put: nuevaInterfaz.	].	"al logueador le digo que registre inicio de postulacion"	logueador registrarInicioPostulacion: mapUsuarioPassEleccion .</body>
</methods>

<methods>
<class-id>Eleccion</class-id> <category>exportables</category>

<body package="TPING2" selector="cerrarPostulacion">cerrarPostulacion"tengo que crear un map nuevo con InterfazParaEleccionCerrada"| listaCandidatosAlu listaCandidatosGra listaCandidatosPro mapUsuarioPassEleccion nuevaInterfaz |"listaCandidatos"listaCandidatosAlu:= ( candidateadorA) listaCandidatos .listaCandidatosGra:= (candidateadorG) listaCandidatos.listaCandidatosPro:= ( candidateadorP) listaCandidatos.mapUsuarioPassEleccion:= Dictionary new."agrego el diccionario de usuarios, password y candidateador"	"alumnos"	padronAlumnos do: [ :alumno |		"creo la intefaz"			nuevaInterfaz:= InterfazParaPostulacionCerrada newConUsuario: alumno conListaCandidatos: listaCandidatosAlu.		"lo pongo en el map"		mapUsuarioPassEleccion at: alumno put: nuevaInterfaz.	].	"graduados"	padronGraduados do: [  :graduado |		"creo la intefaz"			nuevaInterfaz:= InterfazParaPostulacion newConUsuario: graduado conListaCandidatos: listaCandidatosGra.		"lo pongo en el map"		mapUsuarioPassEleccion at: graduado put: nuevaInterfaz.	].	"profesor"	padronProfesores do: [ :profesor |		"creo la intefaz"			nuevaInterfaz:= InterfazParaPostulacion newConUsuario: profesor conListaCandidatos: listaCandidatosPro.		"lo pongo en el map"		mapUsuarioPassEleccion at:  profesor  put: nuevaInterfaz.	].	logueador actualizarOpcionesDisponibles: mapUsuarioPassEleccion</body>

<body package="TPING2" selector="cerrarComicio">cerrarComicio</body>

<body package="TPING2" selector="iniciarPostulacion">iniciarPostulacion|nuevaInterfaz  mapUsuarioPassEleccion |"Creo map de usuarios-interfaz que le voy a pasar a Loguin"mapUsuarioPassEleccion:= Dictionary new."nota: la parte del password no esta modelada""agrego el diccionario de usuarios, password y candidateador"	"alumnos"	padronAlumnos do: [ :alumno |		"creo la intefaz"			nuevaInterfaz:= InterfazParaPostulacion newConUsuario: alumno conCandidateador: candidateadorA.		"lo pongo en el map"		mapUsuarioPassEleccion at: alumno put: nuevaInterfaz.	].	"graduados"	padronGraduados do: [  :graduado |		"creo la intefaz"			nuevaInterfaz:= InterfazParaPostulacion newConUsuario: graduado conCandidateador: candidateadorG.		"lo pongo en el map"		mapUsuarioPassEleccion at: graduado put: nuevaInterfaz.	].	"profesor"	padronProfesores do: [ :profesor |		"creo la intefaz"			nuevaInterfaz:= InterfazParaPostulacion newConUsuario: profesor conCandidateador: candidateadorP.		"lo pongo en el map"		mapUsuarioPassEleccion at:  profesor  put: nuevaInterfaz.	].	logueador actualizarOpcionesDisponibles: mapUsuarioPassEleccion </body>

<body package="TPING2" selector="iniciarComicio">iniciarComicio"recupero los 3 candidateadores para poder conocer las listas -----------------------------------------------------------------------------------------------------------"| listaCandidatosAlu listaCandidatosGra listaCandidatosPro  nuevaInterfaz mapUsuarioPassEleccion |listaCandidatosAlu:= ( candidateadorA) listaCandidatos .listaCandidatosGra:= (candidateadorG) listaCandidatos.listaCandidatosPro:= ( candidateadorP) listaCandidatos.						"creo los maps-------------------------------------------------------------------------------------------------------------------------------------------------------------------------"mapUsuarioPassEleccion:= Dictionary new."creo los tres instancias de urnas/mesas-------------------------------------------------------------------------------------------------------------------------------------"	urnaA:= UrnaElectoral new.	urnaG:= UrnaElectoral   new.	urnaP:= UrnaElectoral  new."agrego el diccionario:  las claves son dni, los significados son intefaces -----------------------------------------------------------------------------------------------"	"alumnos"	padronAlumnos do: [ :alumno |		"creo la intefaz"			nuevaInterfaz:= InterfazParaVotacion newConUsuario: alumno conUrna: urnaA conLista: listaCandidatosAlu.		mapUsuarioPassEleccion at: alumno put: nuevaInterfaz.		].	"graduados"	padronGraduados do: [  :graduado |		"creo la intefaz"			nuevaInterfaz:= InterfazParaVotacion newConUsuario: graduado conUrna: urnaG conLista: listaCandidatosGra.		"lo pongo en el map"		mapUsuarioPassEleccion at: graduado put: nuevaInterfaz.	].	"profesor"	padronProfesores do: [ :profesor |		"creo la intefaz"			nuevaInterfaz:= InterfazParaVotacion newConUsuario: profesor conUrna: urnaP conLista: listaCandidatosPro.		"lo pongo en el map"		mapUsuarioPassEleccion at: profesor put: nuevaInterfaz.	].	"actualizo"	logueador actualizarOpcionesDisponibles: mapUsuarioPassEleccion.</body>
</methods>


<methods>
<class-id>InterfazParaPostulacion class</class-id> <category>As yet unclassified</category>

<body package="TPING2" selector="newConUsuario:conCandidateador:">newConUsuario: unUsuario conCandidateador: unCandidateador	^super new initializeConUsuario: unUsuario conCandidateador: unCandidateador.</body>
</methods>


<methods>
<class-id>InterfazParaPostulacion</class-id> <category>As yet unclassified</category>

<body package="TPING2" selector="candidatearme">candidatearme	candidateador candidatearme: usuario</body>

<body package="TPING2" selector="candidateador">candidateador^candidateador.</body>
</methods>

<methods>
<class-id>InterfazParaPostulacion</class-id> <category>initialize-release</category>

<body package="TPING2" selector="initializeConUsuario:conCandidateador:"> initializeConUsuario: unUsuario conCandidateador: unCandidateadorusuario:= unUsuario.candidateador:= unCandidateador.^self.</body>
</methods>


<methods>
<class-id>InterfazParaVotacion class</class-id> <category>instance creation</category>

<body package="TPING2" selector="newConUsuario:conUrna:conLista:">newConUsuario: unUsuario conUrna: unaUrna conLista: unaLista^super new initializeConUsuario: unUsuario conUrna: unaUrna conLista: unaLista.</body>
</methods>


<methods>
<class-id>InterfazParaVotacion</class-id> <category>As yet unclassified</category>

<body package="TPING2" selector="registrarVoto:">registrarVoto: unUsuario	 unUsuario registrarQueVoto.</body>

<body package="TPING2" selector="votoA:">votoA: unConjuntoCandidato	urna registrarVotoDe: usuario A: unConjuntoCandidato.</body>

<body package="TPING2" selector="votoEnBlanco">votoEnBlanco	urna registrarVotoEnBlancoDe: usuario</body>

<body package="TPING2" selector="listaCandidatos">listaCandidatos	^lista</body>

<body package="TPING2" selector="initializeConUsuario:conUrna:conLista:">initializeConUsuario: unUsuario conUrna: unaUrna  conLista: unaListausuario:= unUsuario.urna:=unaUrna.lista:= unaLista.^self.</body>

<body package="TPING2" selector="votoAnulado">votoAnulado	urna registrarVotoAnuladoDe: usuario.</body>
</methods>


<methods>
<class-id>InterfazParaEleccionCerrada</class-id> <category>initialize-release</category>

<body package="TPING2" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>
</methods>


<methods>
<class-id>Logueador class</class-id> <category>instance creation</category>

<body package="TPING2" selector="new">new	"Answer a newly created and initialized instance."	^super new initialize</body>
</methods>


<methods>
<class-id>Logueador</class-id> <category>accessing</category>

<body package="TPING2" selector="creador:">creador: anObject	creador := anObject</body>

<body package="TPING2" selector="creador">creador	^creador</body>
</methods>

<methods>
<class-id>Logueador</class-id> <category>probablementeNoVayanAca</category>

<body package="TPING2" selector="cerrarComicio">cerrarComicio</body>

<body package="TPING2" selector="iniciarComicioConPadron:">iniciarComicioConPadron: padrones| urnaA urnaG urnaP padronAlumnos padronGraduados padronProfesores nuevaInterfaz listaCandidatosAlu listaCandidatosGra listaCandidatosPro |"desmutiplexo los padrones--------------------------------------------------------------------------------------------------------------------------------------------------------"padronAlumnos := padrones at: 'Alumnos'.padronGraduados:= padrones at: 'Graduados'.padronProfesores:= padrones at: 'Profesores'."recupero los 3 candidateadores para poder conocer las listas -----------------------------------------------------------------------------------------------------------"listaCandidatosAlu:= ((mapUsuarioPassEleccion at: (padronAlumnos any dni)) candidateador) listaCandidatos .listaCandidatosGra:= ((mapUsuarioPassEleccion at: (padronAlumnos any dni)) candidateador) listaCandidatos.listaCandidatosPro:= ((mapUsuarioPassEleccion at: (padronAlumnos any dni)) candidateador) listaCandidatos.						"creo los tres instancias de urnas/mesas-------------------------------------------------------------------------------------------------------------------------------------"	urnaA:= UrnaElectoral new.	urnaG:= UrnaElectoral new.	urnaP:= UrnaElectoral new."agrego el diccionario:  las claves son dni, los significados son intefaces -----------------------------------------------------------------------------------------------"	"alumnos"	padronAlumnos do: [ :alumno |		"creo la intefaz"			nuevaInterfaz:= InterfazParaVotacion newConUsuario: alumno conUrna: urnaA conLista: listaCandidatosAlu.		mapUsuarioPassEleccion at: (alumno dni) put: nuevaInterfaz.		].	"graduados"	padronGraduados do: [  :graduado |		"creo la intefaz"			nuevaInterfaz:= InterfazParaVotacion newConUsuario: graduado conUrna: urnaG conLista: listaCandidatosGra.		"lo pongo en el map"		mapUsuarioPassEleccion at: (graduado dni) put: nuevaInterfaz.	].	"profesor"	padronProfesores do: [ :profesor |		"creo la intefaz"			nuevaInterfaz:= InterfazParaVotacion newConUsuario: profesor conUrna: urnaP conLista: listaCandidatosPro.		"lo pongo en el map"		mapUsuarioPassEleccion at: (profesor dni) put: nuevaInterfaz.	]</body>

<body package="TPING2" selector="iniciarPostulacionConPadron:conChqueadores:">iniciarPostulacionConPadron: padrones conChqueadores: chequeadores| padronAlumnos padronGraduados padronProfesores checkA checkG checkP candidateadorA candidateadorG  candidateadorP nuevaInterfaz |"Creo map de usuarios-interfaz"mapUsuarioPassEleccion:= Dictionary new."nota: la parte del password no esta modelada""desmutiplexo los padrones"padronAlumnos := padrones at: 'Alumnos'.padronGraduados:= padrones at: 'Graduados'.padronProfesores:= padrones at: 'Profesores'."desmultiplexo chequeadores"checkA:= chequeadores at: 'Alumnos'.checkG:=chequeadores at: 'Graduados'.checkP:=chequeadores at: 'Profesores'."creo los tres tipos de candidateadores"candidateadorA:= Candidateador newCandidateador: checkA.candidateadorG:= Candidateador newCandidateador: checkG.candidateadorP:= Candidateador  newCandidateador: checkP."agrego el diccionario de usuarios, password y candidateador"	"alumnos"	padronAlumnos do: [ :alumno |		"creo la intefaz"			nuevaInterfaz:= InterfazParaPostulacion newConUsuario: alumno conCandidateador: candidateadorA.		"lo pongo en el map"		mapUsuarioPassEleccion at: (alumno dni) put: nuevaInterfaz.	].	"graduados"	padronGraduados do: [  :graduado |		"creo la intefaz"			nuevaInterfaz:= InterfazParaPostulacion newConUsuario: graduado conCandidateador: candidateadorG.		"lo pongo en el map"		mapUsuarioPassEleccion at: (graduado dni) put: nuevaInterfaz.	].	"profesor"	padronProfesores do: [ :profesor |		"creo la intefaz"			nuevaInterfaz:= InterfazParaPostulacion newConUsuario: profesor conCandidateador: candidateadorP.		"lo pongo en el map"		mapUsuarioPassEleccion at:  (profesor dni)  put: nuevaInterfaz.	]</body>
</methods>

<methods>
<class-id>Logueador</class-id> <category>exportables</category>

<body package="TPING2" selector="actualizarOpcionesDisponibles:">actualizarOpcionesDisponibles: mapNuevo	mapUsuarioPassEleccion:= mapNuevo.</body>
</methods>

<methods>
<class-id>Logueador</class-id> <category>As yet unclassified</category>

<body package="TPING2" selector="login:password:">login: unDNI password: unPassword	"devolvemos la intefaz"	| usuarioEncontrado |	usuarioEncontrado:= (mapUsuarioPassEleccion keys) detect: [:usuario | (usuario dni )= unDNI].	^mapUsuarioPassEleccion at: usuarioEncontrado.</body>
</methods>


<methods>
<class-id>CreadorPostulacion</class-id> <category>initialize-release</category>

<body package="TPING2" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>
</methods>



</st-source>
