<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.7.1 of 26 de julio de 2010 on 4 de octubre de 2011 at 12:18:07</time-stamp>


<component-created>
<name>(none)</name> <type>package</type>
</component-created><!-- Package (none)* -->


<component-property>
<name>(none)</name> <type>package</type>
<property>comment</property> <value>'This "package" is a special package that holds all code (classes, methods, shares, namespaces) that does not show up in a normal package. It is generated automatically. Removing it will remove the code contained in it, but the package itself never goes away. It can serve as a temporary "scratch space" to try quick throw away work before creating a normal package.'</value>
</component-property>

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
<package>(none)</package>
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
<package>(none)</package>
</attributes>
</class>

<class>
<name>MesaElectoral</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>validos blanco anulados </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>(none)</package>
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
<package>(none)</package>
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
<package>(none)</package>
</attributes>
</class>

<class>
<name>InterfezUsuario</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>usuario </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>(none)</package>
</attributes>
</class>

<class>
<name>InterfazParaPostulacion</name>
<environment>Smalltalk</environment>
<super>InterfezUsuario</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>candidateador </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>(none)</package>
</attributes>
</class>

<class>
<name>InterfazParaVotacion</name>
<environment>Smalltalk</environment>
<super>InterfezUsuario</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>urna lista </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>(none)</package>
</attributes>
</class>

<class>
<name>InterfazParaEleccionCerrada</name>
<environment>Smalltalk</environment>
<super>InterfezUsuario</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>(none)</package>
</attributes>
</class>

<class>
<name>SistemaLogin</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>mapUsuarioPassEleccion </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>(none)</package>
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
<package>(none)</package>
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
<package>(none)</package>
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
<package>(none)</package>
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
<package>(none)</package>
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
<package>(none)</package>
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
<package>(none)</package>
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
<package>(none)</package>
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
<package>(none)</package>
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
<package>(none)</package>
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
<package>(none)</package>
</attributes>
</class>

<methods>
<class-id>Usuario class</class-id> <category>instance creation</category>

<body package="(none)" selector="new">new	"Answer a newly created and initialized instance."	^super new initialize</body>
</methods>


<methods>
<class-id>Usuario</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="nombre">nombre</body>

<body package="(none)" selector="dni">dni^dni</body>
</methods>

<methods>
<class-id>Usuario</class-id> <category>votacion</category>

<body package="(none)" selector="yaVotaste">yaVotaste	 ^voto</body>

<body package="(none)" selector="registrarQueVoto">registrarQueVoto	voto:= true.</body>
</methods>

<methods>
<class-id>Usuario</class-id> <category>setters</category>

<body package="(none)" selector="dni:">dni: unDni	dni:= unDni</body>
</methods>

<methods>
<class-id>Usuario</class-id> <category>initialize-release</category>

<body package="(none)" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>
</methods>


<methods>
<class-id>UsuarioAlumno class</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="newAlumnoConDNI:libreta:materias:">newAlumnoConDNI: aDni libreta: aLibreta materias: lasMaterias | nuevoAlumno |	 nuevoAlumno:= super new initializeAlumnoConDNI: aDni libreta: aLibreta materias: lasMaterias.  ^nuevoAlumno</body>
</methods>


<methods>
<class-id>UsuarioAlumno</class-id> <category>initialize-release</category>

<body package="(none)" selector="initializeAlumnoConDNI:libreta:materias:">initializeAlumnoConDNI: aDni libreta: aLibreta materias: lasMaterias 	materias:= lasMaterias.	dni:= aDni.	LU:= aLibreta.	voto:=false.		^self</body>
</methods>

<methods>
<class-id>UsuarioAlumno</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="LU">LU^LU</body>

<body package="(none)" selector="materias">materias^materias.</body>
</methods>


<methods>
<class-id>UsuarioProfesor class</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="newProfesorConDni:mesesDocente:mesaElectoral:candidateador:">newProfesorConDni: aDni  mesesDocente: mesDoc mesaElectoral: mesa candidateador: unCandidateador| nuevo |	nuevo := super new  initializeDni: aDni mesesDoc: mesDoc mesElec: mesa candidateador: unCandidateador.	^nuevo.</body>

<body package="(none)" selector="newProfesorConDni:mesesDocente:">newProfesorConDni: aDni  mesesDocente: mesDoc | nuevo |	nuevo := super new  initializeDni: aDni mesesDoc: mesDoc .	^nuevo.</body>
</methods>


<methods>
<class-id>UsuarioProfesor</class-id> <category>initialize-release</category>

<body package="(none)" selector="initializeDni:mesesDoc:">initializeDni: aDni mesesDoc: mesDoc dni:= aDni.mesesDocente:= mesDoc.voto:=false.^self.</body>
</methods>

<methods>
<class-id>UsuarioProfesor</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="mesesDocente">mesesDocente^mesesDocente</body>

<body package="(none)" selector="mesesDocente:">mesesDocente: cantMesesmesesDocente :=  cantMeses</body>
</methods>


<methods>
<class-id>UsuarioGraduado class</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="newGraduadoConDni:facultadEgreso:mesesDocente:">newGraduadoConDni: aDni  facultadEgreso: facEgre mesesDocente: mesDoc | nuevo |	nuevo := super new initializeGraduadoConDni: aDni  facultadEgreso: facEgre mesesDocente: mesDoc.	^nuevo.</body>
</methods>


<methods>
<class-id>UsuarioGraduado</class-id> <category>accessing</category>

<body package="(none)" selector="facultadEgreso">facultadEgreso	^facultadEgreso</body>

<body package="(none)" selector="mesesDocente">mesesDocente	^mesesDocente</body>
</methods>

<methods>
<class-id>UsuarioGraduado</class-id> <category>initialize-release</category>

<body package="(none)" selector="initializeGraduadoConDni:facultadEgreso:mesesDocente:">initializeGraduadoConDni: aDni  facultadEgreso: facEgre mesesDocente: mesDocdni:= aDni.facultadEgreso:= facEgre.mesesDocente:=mesDoc.	voto:=false.^self</body>
</methods>


<methods>
<class-id>ChequeadorReestricciones class</class-id> <category>instance creation</category>

<body package="(none)" selector="new">new	"Answer a newly created and initialized instance."	^super new initialize</body>
</methods>


<methods>
<class-id>ChequeadorReestricciones</class-id> <category>initialize-release</category>

<body package="(none)" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>
</methods>


<methods>
<class-id>ChequeadorAlumno class</class-id> <category>instance creation</category>

<body package="(none)" selector="new">new^super new initialize</body>
</methods>


<methods>
<class-id>ChequeadorAlumno</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="chequear:">chequear: unAlumno^ (unAlumno materias size &gt;1)</body>
</methods>

<methods>
<class-id>ChequeadorAlumno</class-id> <category>initialize-release</category>

<body package="(none)" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>
</methods>


<methods>
<class-id>MesaElectoral class</class-id> <category>instance creation</category>

<body package="(none)" selector="new">new	| nuevo |	nuevo:=super new initialize.		^nuevo</body>
</methods>


<methods>
<class-id>MesaElectoral</class-id> <category>initialize-release</category>

<body package="(none)" selector="initialize">initialize 	validos:= Bag new.	blanco:= 0.	anulados:= 0.	^self</body>
</methods>

<methods>
<class-id>MesaElectoral</class-id> <category>ver votos</category>

<body package="(none)" selector="votosAnulados">votosAnulados^anulados</body>

<body package="(none)" selector="votosValidos">votosValidos^ validos</body>

<body package="(none)" selector="votosEnBlanco">votosEnBlanco^blanco</body>
</methods>

<methods>
<class-id>MesaElectoral</class-id> <category>registrar</category>

<body package="(none)" selector="registrarVotoEnBlancoDe:">registrarVotoEnBlancoDe: unUsuario	(unUsuario yaVotaste) ifFalse: [									"registro el voto"									blanco:=	blanco+1.								].	"registro que ya voto"	unUsuario registrarQueVoto.</body>

<body package="(none)" selector="registrarVotoDe:A:">registrarVotoDe: unUsuario A: unDNICandidato	"registrar voto"	(unUsuario yaVotaste) ifFalse: [										validos add: unDNICandidato	].		"registro que ya voto"	unUsuario registrarQueVoto.</body>

<body package="(none)" selector="registrarVotoAnuladoDe:">registrarVotoAnuladoDe: unUsuario	"registro el voto"	(unUsuario yaVotaste) ifFalse: [ 										anulados:=anulados+1.].	"registro que ya voto"	unUsuario registrarQueVoto.</body>
</methods>


<methods>
<class-id>Candidateador class</class-id> <category>instance creation</category>

<body package="(none)" selector="newCandidateador:">newCandidateador: unChequeador| nuevo |	nuevo := super new initializeChequeadorRestricciones:unChequeador.	^nuevo.</body>
</methods>


<methods>
<class-id>Candidateador</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="initializeChequeadorRestricciones:">initializeChequeadorRestricciones:unChequeador	chequeadorRestricciones:= unChequeador.	listaCandidatos:= List new.	^self.</body>

<body package="(none)" selector="listaCandidatos">listaCandidatos^listaCandidatos</body>

<body package="(none)" selector="chequeadorRestricciones">chequeadorRestricciones^chequeadorRestricciones</body>

<body package="(none)" selector="chequeadorRestricciones:">chequeadorRestricciones: unChequeadorchequeadorRestricciones := unChequeador</body>

<body package="(none)" selector="candidatearme:">candidatearme: unUsuario	(self chequeadorRestricciones chequear: unUsuario) ifTrue: [ self listaCandidatos add: (unUsuario dni) ] ifFalse: [ Transcript print: 'error: no se puede votar TODO']</body>
</methods>

<methods>
<class-id>Candidateador</class-id> <category>initialize-release</category>

<body package="(none)" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>
</methods>


<methods>
<class-id>Eleccion class</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="newEleccionPadronAlumno:padronGraduados:padronProfesores:chequeadorAlumnos:chequeadorGraduados:chequeadorProfesores:">newEleccionPadronAlumno: pAlumno padronGraduados: pGraduados padronProfesores: pProfesores chequeadorAlumnos: cAlumnos chequeadorGraduados: cGraduados chequeadorProfesores: cProfesores| nuevo |	nuevo:= super new initialize.	nuevo padronAlumno: pAlumno.	nuevo padronGraduados: pGraduados.	nuevo padronProfesores: pProfesores.	nuevo chequadorAlumnos: cAlumnos.	nuevo chequeadorGraduados: cGraduados.	nuevo chequeadorProfesores: cProfesores.^nuevo.</body>
</methods>


<methods>
<class-id>Eleccion</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="iniciarComicio">iniciarComiciomesaAlumnos := MesaElectoral new: (candidateadorA listaCandidatos).mesaProfesores := MesaElectoral new: (candidateadorP listaCandidatos).mesaGraduados := MesaElectoral new: (candidateadorG listaCandidatos).(self padronAlumno) do: [:alumno |  alumno mesaElectoral: mesaAlumnos ].(self padronGraduados) do: [:alumno |  alumno mesaElectoral: mesaGraduados ].(self padronProfesores) do: [:alumno |  alumno mesaElectoral: mesaProfesores].</body>

<body package="(none)" selector="iniciarPostulacion">iniciarPostulacion"seteamos los candidateadores"candidateadorA := (Candidateador newCandidateador: (self chequadorAlumnos)).candidateadorG := (Candidateador newCandidateador: (self chequeadorGraduados)).candidateadorP := (Candidateador newCandidateador: (self chequeadorProfesores)).(self padronAlumno) do: [:alumno |  alumno candidateador: candidateadorA  ].(self padronGraduados) do: [:alumno |  alumno candidateador: candidateadorG  ].(self padronProfesores) do: [:alumno |  alumno candidateador: candidateadorP].</body>
</methods>

<methods>
<class-id>Eleccion</class-id> <category>accessing</category>

<body package="(none)" selector="padronGraduados">padronGraduados	^padronGraduados</body>

<body package="(none)" selector="chequadorAlumnos:">chequadorAlumnos: anObject	chequadorAlumnos := anObject</body>

<body package="(none)" selector="padronProfesores">padronProfesores	^padronProfesores</body>

<body package="(none)" selector="padronProfesores:">padronProfesores: anObject	padronProfesores := anObject</body>

<body package="(none)" selector="padronAlumno">padronAlumno	^padronAlumno</body>

<body package="(none)" selector="chequeadorProfesores">chequeadorProfesores	^chequeadorProfesores</body>

<body package="(none)" selector="padronGraduados:">padronGraduados: anObject	padronGraduados := anObject</body>

<body package="(none)" selector="chequeadorGraduados">chequeadorGraduados	^chequeadorGraduados</body>

<body package="(none)" selector="chequeadorProfesores:">chequeadorProfesores: anObject	chequeadorProfesores := anObject</body>

<body package="(none)" selector="padronAlumno:">padronAlumno: anObject	padronAlumno := anObject</body>

<body package="(none)" selector="chequeadorGraduados:">chequeadorGraduados: anObject	chequeadorGraduados := anObject</body>

<body package="(none)" selector="chequadorAlumnos">chequadorAlumnos	^chequadorAlumnos</body>
</methods>

<methods>
<class-id>Eleccion</class-id> <category>initialize-release</category>

<body package="(none)" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Edit the following to properly initialize instance variables ***"	chequadorAlumnos := nil.	chequeadorGraduados := nil.	chequeadorProfesores := nil.	padronAlumno := nil.	padronGraduados := nil.	padronProfesores := nil.	" *** And replace this comment with additional initialization code *** "	^self</body>
</methods>


<methods>
<class-id>InterfezUsuario class</class-id> <category>instance creation</category>

<body package="(none)" selector="new">new	"Answer a newly created and initialized instance."	^super new initialize</body>
</methods>


<methods>
<class-id>InterfezUsuario</class-id> <category>initialize-release</category>

<body package="(none)" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>
</methods>


<methods>
<class-id>InterfazParaPostulacion class</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="newConUsuario:conCandidateador:">newConUsuario: unUsuario conCandidateador: unCandidateador	^super new initializeConUsuario: unUsuario conCandidateador: unCandidateador.</body>
</methods>


<methods>
<class-id>InterfazParaPostulacion</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="candidateador">candidateador^candidateador.</body>

<body package="(none)" selector="candidatearme">candidatearme	candidateador candidatearme: usuario</body>
</methods>

<methods>
<class-id>InterfazParaPostulacion</class-id> <category>initialize-release</category>

<body package="(none)" selector="initializeConUsuario:conCandidateador:"> initializeConUsuario: unUsuario conCandidateador: unCandidateadorusuario:= unUsuario.candidateador:= unCandidateador.^self.</body>
</methods>


<methods>
<class-id>InterfazParaVotacion class</class-id> <category>instance creation</category>

<body package="(none)" selector="newConUsuario:conUrna:conLista:">newConUsuario: unUsuario conUrna: unaUrna conLista: unaLista^super new initializeConUsuario: unUsuario conUrna: unaUrna conLista: unaLista.</body>
</methods>


<methods>
<class-id>InterfazParaVotacion</class-id> <category>initialize-release</category>

<body package="(none)" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>
</methods>

<methods>
<class-id>InterfazParaVotacion</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="initializeConUsuario:conUrna:conLista:">initializeConUsuario: unUsuario conUrna: unaUrna  conLista: unaListausuario:= unUsuario.urna:=unaUrna.lista:= unaLista.^self.</body>

<body package="(none)" selector="votoAnulado">votoAnulado	urna registrarVotoAnuladoDe: usuario.</body>

<body package="(none)" selector="votoUnCandidato:">votoUnCandidato: unCandidato	urna registrarVotoDe: usuario A: unCandidato.	</body>

<body package="(none)" selector="votoEnBlanco">votoEnBlanco	urna registrarVotoEnBlancoDe: usuario</body>

<body package="(none)" selector="listaCandidatos">listaCandidatos	^lista</body>
</methods>


<methods>
<class-id>InterfazParaEleccionCerrada</class-id> <category>initialize-release</category>

<body package="(none)" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>
</methods>


<methods>
<class-id>SistemaLogin class</class-id> <category>instance creation</category>

<body package="(none)" selector="new">new	"Answer a newly created and initialized instance."	^super new initialize</body>
</methods>


<methods>
<class-id>SistemaLogin</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="login:password:">login: unDNI password: unPassword	"devolvemos la intefaz"	^ (mapUsuarioPassEleccion at: unDNI)</body>
</methods>

<methods>
<class-id>SistemaLogin</class-id> <category>accessing</category>

<body package="(none)" selector="creador">creador	^creador</body>

<body package="(none)" selector="creador:">creador: anObject	creador := anObject</body>
</methods>

<methods>
<class-id>SistemaLogin</class-id> <category>probablementeNoVayanAca</category>

<body package="(none)" selector="iniciarPostulacionConPadron:conChqueadores:">iniciarPostulacionConPadron: padrones conChqueadores: chequeadores| padronAlumnos padronGraduados padronProfesores checkA checkG checkP candidateadorA candidateadorG  candidateadorP nuevaInterfaz |"Creo map de usuarios-interfaz"mapUsuarioPassEleccion:= Dictionary new."nota: la parte del password no esta modelada""desmutiplexo los padrones"padronAlumnos := padrones at: 'Alumnos'.padronGraduados:= padrones at: 'Graduados'.padronProfesores:= padrones at: 'Profesores'."desmultiplexo chequeadores"checkA:= chequeadores at: 'Alumnos'.checkG:=chequeadores at: 'Graduados'.checkP:=chequeadores at: 'Profesores'."creo los tres tipos de candidateadores"candidateadorA:= Candidateador newCandidateador: checkA.candidateadorG:= Candidateador newCandidateador: checkG.candidateadorP:= Candidateador  newCandidateador: checkP."agrego el diccionario de usuarios, password y candidateador"	"alumnos"	padronAlumnos do: [ :alumno |		"creo la intefaz"			nuevaInterfaz:= InterfazParaPostulacion newConUsuario: alumno conCandidateador: candidateadorA.		"lo pongo en el map"		mapUsuarioPassEleccion at: (alumno dni) put: nuevaInterfaz.	].	"graduados"	padronGraduados do: [  :graduado |		"creo la intefaz"			nuevaInterfaz:= InterfazParaPostulacion newConUsuario: graduado conCandidateador: candidateadorG.		"lo pongo en el map"		mapUsuarioPassEleccion at: (graduado dni) put: nuevaInterfaz.	].	"profesor"	padronProfesores do: [ :profesor |		"creo la intefaz"			nuevaInterfaz:= InterfazParaPostulacion newConUsuario: profesor conCandidateador: candidateadorP.		"lo pongo en el map"		mapUsuarioPassEleccion at:  (profesor dni)  put: nuevaInterfaz.	]</body>

<body package="(none)" selector="cerrarComicio">cerrarComicio</body>

<body package="(none)" selector="iniciarComicioConPadron:">iniciarComicioConPadron: padrones| urnaA urnaG urnaP padronAlumnos padronGraduados padronProfesores nuevaInterfaz listaCandidatosAlu listaCandidatosGra listaCandidatosPro |"desmutiplexo los padrones--------------------------------------------------------------------------------------------------------------------------------------------------------"padronAlumnos := padrones at: 'Alumnos'.padronGraduados:= padrones at: 'Graduados'.padronProfesores:= padrones at: 'Profesores'."recupero los 3 candidateadores para poder conocer las listas -----------------------------------------------------------------------------------------------------------"listaCandidatosAlu:= ((mapUsuarioPassEleccion at: (padronAlumnos any dni)) candidateador) listaCandidatos .listaCandidatosGra:= ((mapUsuarioPassEleccion at: (padronAlumnos any dni)) candidateador) listaCandidatos.listaCandidatosPro:= ((mapUsuarioPassEleccion at: (padronAlumnos any dni)) candidateador) listaCandidatos.						"creo los tres instancias de urnas/mesas-------------------------------------------------------------------------------------------------------------------------------------"	urnaA:= MesaElectoral new.	urnaG:= MesaElectoral new.	urnaP:= MesaElectoral new."agrego el diccionario:  las claves son dni, los significados son intefaces -----------------------------------------------------------------------------------------------"	"alumnos"	padronAlumnos do: [ :alumno |		"creo la intefaz"			nuevaInterfaz:= InterfazParaVotacion newConUsuario: alumno conUrna: urnaA conLista: listaCandidatosAlu.		mapUsuarioPassEleccion at: (alumno dni) put: nuevaInterfaz.		].	"graduados"	padronGraduados do: [  :graduado |		"creo la intefaz"			nuevaInterfaz:= InterfazParaVotacion newConUsuario: graduado conUrna: urnaG conLista: listaCandidatosGra.		"lo pongo en el map"		mapUsuarioPassEleccion at: (graduado dni) put: nuevaInterfaz.	].	"profesor"	padronProfesores do: [ :profesor |		"creo la intefaz"			nuevaInterfaz:= InterfazParaVotacion newConUsuario: profesor conUrna: urnaP conLista: listaCandidatosPro.		"lo pongo en el map"		mapUsuarioPassEleccion at: (profesor dni) put: nuevaInterfaz.	]</body>
</methods>

<methods>
<class-id>SistemaLogin</class-id> <category>initialize-release</category>

<body package="(none)" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Edit the following to properly initialize instance variables ***"	creador := nil.	" *** And replace this comment with additional initialization code *** "	^self</body>
</methods>


<methods>
<class-id>Creador class</class-id> <category>instance creation</category>

<body package="(none)" selector="new">new	"Answer a newly created and initialized instance."	^super new initialize</body>
</methods>


<methods>
<class-id>Creador</class-id> <category>initialize-release</category>

<body package="(none)" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>
</methods>


<methods>
<class-id>CreadorPostulacion</class-id> <category>initialize-release</category>

<body package="(none)" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>
</methods>


<methods>
<class-id>CreadorVotacion</class-id> <category>initialize-release</category>

<body package="(none)" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>
</methods>


<methods>
<class-id>CreadorEleccionCerrada</class-id> <category>initialize-release</category>

<body package="(none)" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>
</methods>


<methods>
<class-id>ChequeadorProfesores</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="chequear:">chequear: unProf^ (unProf mesesDocente&gt;48)</body>
</methods>

<methods>
<class-id>ChequeadorProfesores</class-id> <category>initialize-release</category>

<body package="(none)" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>
</methods>


<methods>
<class-id>ChequeadorGraduados</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="chequear:">chequear: unGraduado| unBoolean otroBoolean |	unBoolean := unGraduado mesesDocente &gt;8.	otroBoolean := (unGraduado facultadEgreso) == 'FCEN'.	^ (  unBoolean or: [otroBoolean] )</body>
</methods>

<methods>
<class-id>ChequeadorGraduados</class-id> <category>initialize-release</category>

<body package="(none)" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>
</methods>



</st-source>
