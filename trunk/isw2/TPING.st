<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.7.1 of 26 de julio de 2010 on 5 de octubre de 2011 at 17:04:56</time-stamp>


<component-created>
<name>(none)</name> <type>package</type>
</component-created><!-- Package (none)* -->


<component-property>
<name>(none)</name> <type>package</type>
<property>comment</property> <value>'This "package" is a special package that holds all code (classes, methods, shares, namespaces) that does not show up in a normal package. It is generated automatically. Removing it will remove the code contained in it, but the package itself never goes away. It can serve as a temporary "scratch space" to try quick throw away work before creating a normal package.'</value>
</component-property>

<class>
<name>Usuario</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>dni voto nombre </inst-vars>
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
<package>(none)</package>
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
<package>(none)</package>
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
<package>(none)</package>
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
<package>(none)</package>
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
<name>ExepcionNoSeCumplenRequisitosCandidato</name>
<environment>Smalltalk</environment>
<super>Core.GenericException</super>
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
<name>Persona</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>nombre dni </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>(none)</package>
</attributes>
</class>

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
<inst-vars>chequadorAlumnos chequeadorGraduados chequeadorProfesores padronAlumnos padronGraduados padronProfesores candidateadorA candidateadorP candidateadorG urnaAlumnos urnaProfesores urnaGraduados chequeadorAlumnos logueador urnaA urnaP urnaG </inst-vars>
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
<super>InterfazUsuario</super>
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
<super>InterfazUsuario</super>
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
<super>InterfazUsuario</super>
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

<methods>
<class-id>UrnaElectoral class</class-id> <category>instance creation</category>

<body package="(none)" selector="new">new	| nuevo |	nuevo:=super new initialize.		^nuevo</body>
</methods>


<methods>
<class-id>UrnaElectoral</class-id> <category>initialize-release</category>

<body package="(none)" selector="initialize">initialize 	validos:= Bag new.	blanco:= 0.	anulados:= 0.	^self</body>
</methods>

<methods>
<class-id>UrnaElectoral</class-id> <category>ver votos</category>

<body package="(none)" selector="votosAnulados">votosAnulados^anulados</body>

<body package="(none)" selector="votosEnBlanco">votosEnBlanco^blanco</body>

<body package="(none)" selector="votosValidos">votosValidos^ validos</body>
</methods>

<methods>
<class-id>UrnaElectoral</class-id> <category>registrar</category>

<body package="(none)" selector="registrarVotoEnBlanco">registrarVotoEnBlanco"registro el voto"blanco:=	blanco+1.</body>

<body package="(none)" selector="registrarVotoA:">registrarVotoA:  unConjuntoDeDnisCandidato unConjuntoDeDnisCandidato do: [:unDni |  validos add: unDni ].</body>
</methods>


<methods>
<class-id>Candidateador class</class-id> <category>instance creation</category>

<body package="(none)" selector="newCandidateador:">newCandidateador: unChequeador| nuevo |	nuevo := super new initializeChequeadorRestricciones:unChequeador.	^nuevo.</body>
</methods>


<methods>
<class-id>Candidateador</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="candidatearme:">candidatearme: unUsuario	(self chequeadorRestricciones chequear: unUsuario) ifTrue: [ self listaCandidatos add: (unUsuario) ] ifFalse: [ 																													ExepcionNoSeCumplenRequisitosCandidato raise.																											]</body>

<body package="(none)" selector="chequeadorRestricciones">chequeadorRestricciones^chequeadorRestricciones</body>

<body package="(none)" selector="initializeChequeadorRestricciones:">initializeChequeadorRestricciones:unChequeador	chequeadorRestricciones:= unChequeador.	listaCandidatos:= List new.	^self.</body>

<body package="(none)" selector="chequeadorRestricciones:">chequeadorRestricciones: unChequeadorchequeadorRestricciones := unChequeador</body>

<body package="(none)" selector="listaCandidatos">listaCandidatos^listaCandidatos</body>
</methods>


<methods>
<class-id>Eleccion class</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="newEleccionPadronAlumno:padronGraduados:padronProfesores:chequeadorAlumnos:chequeadorGraduados:chequeadorProfesores:">newEleccionPadronAlumno: pAlumno padronGraduados: pGraduados padronProfesores: pProfesores chequeadorAlumnos: cAlumnos chequeadorGraduados: cGraduados chequeadorProfesores: cProfesores| nuevo |	nuevo:= super new.	nuevo padronAlumno: pAlumno.	nuevo padronGraduados: pGraduados.	nuevo padronProfesores: pProfesores.	nuevo logueador: Logueador new.	nuevo candidateadorA: (Candidateador newCandidateador: cAlumnos).	nuevo candidateadorG: (Candidateador newCandidateador: cGraduados).	nuevo candidateadorP: (Candidateador  newCandidateador: cProfesores).^nuevo.</body>
</methods>


<methods>
<class-id>Eleccion</class-id> <category>accessing</category>

<body package="(none)" selector="chequeadorProfesores">chequeadorProfesores	^chequeadorProfesores</body>

<body package="(none)" selector="chequeadorProfesores:">chequeadorProfesores: anObject	chequeadorProfesores := anObject</body>

<body package="(none)" selector="chequadorAlumnos:">chequadorAlumnos: anObject	chequadorAlumnos := anObject</body>

<body package="(none)" selector="padronAlumno:">padronAlumno: anObject	padronAlumnos := anObject</body>

<body package="(none)" selector="padronGraduados">padronGraduados	^padronGraduados</body>

<body package="(none)" selector="logueador:">logueador: unLogueadorlogueador:=unLogueador.</body>

<body package="(none)" selector="padronGraduados:">padronGraduados: anObject	padronGraduados := anObject</body>

<body package="(none)" selector="padronProfesores">padronProfesores	^padronProfesores</body>

<body package="(none)" selector="padronProfesores:">padronProfesores: anObject	padronProfesores := anObject</body>

<body package="(none)" selector="padronAlumno">padronAlumno	^padronAlumnos</body>

<body package="(none)" selector="chequadorAlumnos">chequadorAlumnos	^chequadorAlumnos</body>

<body package="(none)" selector="chequeadorGraduados">chequeadorGraduados	^chequeadorGraduados</body>

<body package="(none)" selector="logueador">logueador	^logueador.</body>

<body package="(none)" selector="candidateadorG:">candidateadorG: uncandicandidateadorG:= uncandi.</body>

<body package="(none)" selector="candidateadorA:">candidateadorA: uncandicandidateadorA:= uncandi.</body>

<body package="(none)" selector="chequeadorGraduados:">chequeadorGraduados: anObject	chequeadorGraduados := anObject</body>

<body package="(none)" selector="candidateadorP:">candidateadorP: uncandicandidateadorP:= uncandi.</body>
</methods>

<methods>
<class-id>Eleccion</class-id> <category>viejos</category>

<body package="(none)" selector="iniciarPostulacionConPadron:conChqueadores:">iniciarPostulacionConPadron: padrones conChqueadores: chequeadores|nuevaInterfaz  mapUsuarioPassEleccion|"Creo map de usuarios-interfaz"mapUsuarioPassEleccion:= Dictionary new."nota: la parte del password no esta modelada""creo los tres tipos de candidateadores"candidateadorA:= Candidateador newCandidateador: chequeadorAlumnos.candidateadorG:= Candidateador newCandidateador: chequeadorGraduados.candidateadorP:= Candidateador  newCandidateador: chequeadorProfesores."agrego el diccionario de usuarios, password y candidateador"	"alumnos"	padronAlumnos do: [ :alumno |		"creo la intefaz"			nuevaInterfaz:= InterfazParaPostulacion newConUsuario: alumno conCandidateador: candidateadorA.		"lo pongo en el map"		mapUsuarioPassEleccion at: (alumno dni) put: nuevaInterfaz.	].	"graduados"	padronGraduados do: [  :graduado |		"creo la intefaz"			nuevaInterfaz:= InterfazParaPostulacion newConUsuario: graduado conCandidateador: candidateadorG.		"lo pongo en el map"		mapUsuarioPassEleccion at: (graduado dni) put: nuevaInterfaz.	].	"profesor"	padronProfesores do: [ :profesor |		"creo la intefaz"			nuevaInterfaz:= InterfazParaPostulacion newConUsuario: profesor conCandidateador: candidateadorP.		"lo pongo en el map"		mapUsuarioPassEleccion at:  (profesor dni)  put: nuevaInterfaz.	].	"al logueador le digo que registre inicio de postulacion"	logueador registrarInicioPostulacion: mapUsuarioPassEleccion .</body>
</methods>

<methods>
<class-id>Eleccion</class-id> <category>exportables</category>

<body package="(none)" selector="cerrarComicio">cerrarComicio"tengo que crear un map nuevo con InterfazParaEleccionCerrada"| mapUsuarioPassEleccion nuevaInterfaz |mapUsuarioPassEleccion:= Dictionary new."agrego el diccionario de usuarios, password y candidateador"	"alumnos"	padronAlumnos do: [ :alumno |		"creo la intefaz"			nuevaInterfaz:= InterfazParaComicioCerrado newConUsuario: alumno.		"lo pongo en el map"		mapUsuarioPassEleccion at: alumno put: nuevaInterfaz.	].	"graduados"	padronGraduados do: [  :graduado |		"creo la intefaz"			nuevaInterfaz:= InterfazParaComicioCerrado newConUsuario: graduado.		"lo pongo en el map"		mapUsuarioPassEleccion at: graduado put: nuevaInterfaz.	].	"profesor"	padronProfesores do: [ :profesor |		"creo la intefaz "			nuevaInterfaz:= InterfazParaComicioCerrado newConUsuario:  profesor .		"lo pongo en el map"		mapUsuarioPassEleccion at:  profesor  put: nuevaInterfaz.	].	logueador actualizarOpcionesDisponibles: mapUsuarioPassEleccion</body>

<body package="(none)" selector="cerrarPostulacion">cerrarPostulacion"tengo que crear un map nuevo con InterfazParaEleccionCerrada"| listaCandidatosAlu listaCandidatosGra listaCandidatosPro mapUsuarioPassEleccion nuevaInterfaz |"listaCandidatos"listaCandidatosAlu:= ( candidateadorA) listaCandidatos .listaCandidatosGra:= (candidateadorG) listaCandidatos.listaCandidatosPro:= ( candidateadorP) listaCandidatos.mapUsuarioPassEleccion:= Dictionary new."agrego el diccionario de usuarios, password y candidateador"	"alumnos"	padronAlumnos do: [ :alumno |		"creo la intefaz"			nuevaInterfaz:= InterfazParaPostulacionCerrada newConUsuario: alumno conListaCandidatos: listaCandidatosAlu.		"lo pongo en el map"		mapUsuarioPassEleccion at: alumno put: nuevaInterfaz.	].	"graduados"	padronGraduados do: [  :graduado |		"creo la intefaz"			nuevaInterfaz:= InterfazParaPostulacionCerrada newConUsuario: graduado conListaCandidatos: listaCandidatosGra.		"lo pongo en el map"		mapUsuarioPassEleccion at: graduado put: nuevaInterfaz.	].	"profesor"	padronProfesores do: [ :profesor |		"creo la intefaz"			nuevaInterfaz:= InterfazParaPostulacionCerrada newConUsuario: profesor conListaCandidatos: listaCandidatosPro.		"lo pongo en el map"		mapUsuarioPassEleccion at:  profesor  put: nuevaInterfaz.	].	logueador actualizarOpcionesDisponibles: mapUsuarioPassEleccion</body>

<body package="(none)" selector="iniciarPostulacion">iniciarPostulacion|nuevaInterfaz  mapUsuarioPassEleccion |"Creo map de usuarios-interfaz que le voy a pasar a Loguin"mapUsuarioPassEleccion:= Dictionary new."nota: la parte del password no esta modelada""agrego el diccionario de usuarios, password y candidateador"	"alumnos"	padronAlumnos do: [ :alumno |		"creo la intefaz"			nuevaInterfaz:= InterfazParaPostulacion newConUsuario: alumno conCandidateador: candidateadorA.		"lo pongo en el map"		mapUsuarioPassEleccion at: alumno put: nuevaInterfaz.	].	"graduados"	padronGraduados do: [  :graduado |		"creo la intefaz"			nuevaInterfaz:= InterfazParaPostulacion newConUsuario: graduado conCandidateador: candidateadorG.		"lo pongo en el map"		mapUsuarioPassEleccion at: graduado put: nuevaInterfaz.	].	"profesor"	padronProfesores do: [ :profesor |		"creo la intefaz"			nuevaInterfaz:= InterfazParaPostulacion newConUsuario: profesor conCandidateador: candidateadorP.		"lo pongo en el map"		mapUsuarioPassEleccion at:  profesor  put: nuevaInterfaz.	].	logueador actualizarOpcionesDisponibles: mapUsuarioPassEleccion </body>

<body package="(none)" selector="iniciarComicio">iniciarComicio"recupero los 3 candidateadores para poder conocer las listas -----------------------------------------------------------------------------------------------------------"| listaCandidatosAlu listaCandidatosGra listaCandidatosPro  nuevaInterfaz mapUsuarioPassEleccion |listaCandidatosAlu:= ( candidateadorA) listaCandidatos .listaCandidatosGra:= (candidateadorG) listaCandidatos.listaCandidatosPro:= ( candidateadorP) listaCandidatos.						"creo los maps-------------------------------------------------------------------------------------------------------------------------------------------------------------------------"mapUsuarioPassEleccion:= Dictionary new."creo los tres instancias de urnas/mesas-------------------------------------------------------------------------------------------------------------------------------------"	urnaA:= UrnaElectoral new.	urnaG:= UrnaElectoral   new.	urnaP:= UrnaElectoral  new."agrego el diccionario:  las claves son dni, los significados son intefaces -----------------------------------------------------------------------------------------------"	"alumnos"	padronAlumnos do: [ :alumno |		"creo la intefaz"			nuevaInterfaz:= InterfazParaVotacion newConUsuario: alumno conUrna: urnaA conLista: listaCandidatosAlu.		mapUsuarioPassEleccion at: alumno put: nuevaInterfaz.		].	"graduados"	padronGraduados do: [  :graduado |		"creo la intefaz"			nuevaInterfaz:= InterfazParaVotacion newConUsuario: graduado conUrna: urnaG conLista: listaCandidatosGra.		"lo pongo en el map"		mapUsuarioPassEleccion at: graduado put: nuevaInterfaz.	].	"profesor"	padronProfesores do: [ :profesor |		"creo la intefaz"			nuevaInterfaz:= InterfazParaVotacion newConUsuario: profesor conUrna: urnaP conLista: listaCandidatosPro.		"lo pongo en el map"		mapUsuarioPassEleccion at: profesor put: nuevaInterfaz.	].	"actualizo"	logueador actualizarOpcionesDisponibles: mapUsuarioPassEleccion.</body>
</methods>


<methods>
<class-id>InterfazUsuario class</class-id> <category>instance creation</category>

<body package="(none)" selector="new">new	"Answer a newly created and initialized instance."	^super new initialize</body>
</methods>


<methods>
<class-id>InterfazUsuario</class-id> <category>initialize-release</category>

<body package="(none)" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>
</methods>

<methods>
<class-id>InterfazUsuario</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="usuario:">usuario: usr	usuario:=usr.</body>
</methods>


<methods>
<class-id>InterfazParaPostulacion class</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="newConUsuario:conCandidateador:">newConUsuario: unUsuario conCandidateador: unCandidateador	^super new initializeConUsuario: unUsuario conCandidateador: unCandidateador.</body>
</methods>


<methods>
<class-id>InterfazParaPostulacion</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="candidatearme">candidatearme	candidateador candidatearme: usuario</body>

<body package="(none)" selector="candidateador">candidateador^candidateador.</body>
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
<class-id>InterfazParaVotacion</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="votoA:">votoA: unConjuntoCandidato	(self chequearSiPuedeVotar: usuario A: unConjuntoCandidato) ifTrue:[		urna registrarVotoDe: usuario A: unConjuntoCandidato.		self registrarVoto: usuario.].</body>

<body package="(none)" selector="chequearSiPuedeVotar:A:">chequearSiPuedeVotar: unUsuario  A: unConjuntoDeDnisCandidato		(unUsuario yaVotaste) ifFalse: [						"chequeo si puede votar a tantos candidatos como quiso	"																		( (unConjuntoDeDnisCandidato size) &lt;= (unUsuario cantidadMaximaDeVotos)) ifTrue:[									"puede votar a todos los candidatos, registro los votos estos"								^true.						].							].^false.</body>

<body package="(none)" selector="votoEnBlanco">votoEnBlanco	(self chequearSiPuedeVotar: usuario A: (List new)) ifTrue:[		urna registrarVotoEnBlanco.		self registrarVoto: usuario.].</body>

<body package="(none)" selector="listaCandidatos">listaCandidatos| unaPersona |	^ lista inject: List new into: [:Lista :elemento | unaPersona := Persona new.unaPersona nombre: (elemento nombre).unaPersona dni: (elemento dni).Lista add: (unaPersona) . ^Lista.].</body>

<body package="(none)" selector="registrarVoto:">registrarVoto: unUsuario	 unUsuario registrarQueVoto.</body>

<body package="(none)" selector="initializeConUsuario:conUrna:conLista:">initializeConUsuario: unUsuario conUrna: unaUrna  conLista: unaListausuario:= unUsuario.urna:=unaUrna.lista:= unaLista.^self.</body>
</methods>


<methods>
<class-id>InterfazParaEleccionCerrada</class-id> <category>initialize-release</category>

<body package="(none)" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>
</methods>


<methods>
<class-id>Logueador class</class-id> <category>instance creation</category>

<body package="(none)" selector="new">new	"Answer a newly created and initialized instance."	^super new initialize</body>
</methods>


<methods>
<class-id>Logueador</class-id> <category>accessing</category>

<body package="(none)" selector="creador">creador	^creador</body>

<body package="(none)" selector="creador:">creador: anObject	creador := anObject</body>
</methods>

<methods>
<class-id>Logueador</class-id> <category>probablementeNoVayanAca</category>

<body package="(none)" selector="iniciarComicioConPadron:">iniciarComicioConPadron: padrones| urnaA urnaG urnaP padronAlumnos padronGraduados padronProfesores nuevaInterfaz listaCandidatosAlu listaCandidatosGra listaCandidatosPro |"desmutiplexo los padrones--------------------------------------------------------------------------------------------------------------------------------------------------------"padronAlumnos := padrones at: 'Alumnos'.padronGraduados:= padrones at: 'Graduados'.padronProfesores:= padrones at: 'Profesores'."recupero los 3 candidateadores para poder conocer las listas -----------------------------------------------------------------------------------------------------------"listaCandidatosAlu:= ((mapUsuarioPassEleccion at: (padronAlumnos any dni)) candidateador) listaCandidatos .listaCandidatosGra:= ((mapUsuarioPassEleccion at: (padronAlumnos any dni)) candidateador) listaCandidatos.listaCandidatosPro:= ((mapUsuarioPassEleccion at: (padronAlumnos any dni)) candidateador) listaCandidatos.						"creo los tres instancias de urnas/mesas-------------------------------------------------------------------------------------------------------------------------------------"	urnaA:= UrnaElectoral new.	urnaG:= UrnaElectoral new.	urnaP:= UrnaElectoral new."agrego el diccionario:  las claves son dni, los significados son intefaces -----------------------------------------------------------------------------------------------"	"alumnos"	padronAlumnos do: [ :alumno |		"creo la intefaz"			nuevaInterfaz:= InterfazParaVotacion newConUsuario: alumno conUrna: urnaA conLista: listaCandidatosAlu.		mapUsuarioPassEleccion at: (alumno dni) put: nuevaInterfaz.		].	"graduados"	padronGraduados do: [  :graduado |		"creo la intefaz"			nuevaInterfaz:= InterfazParaVotacion newConUsuario: graduado conUrna: urnaG conLista: listaCandidatosGra.		"lo pongo en el map"		mapUsuarioPassEleccion at: (graduado dni) put: nuevaInterfaz.	].	"profesor"	padronProfesores do: [ :profesor |		"creo la intefaz"			nuevaInterfaz:= InterfazParaVotacion newConUsuario: profesor conUrna: urnaP conLista: listaCandidatosPro.		"lo pongo en el map"		mapUsuarioPassEleccion at: (profesor dni) put: nuevaInterfaz.	]</body>

<body package="(none)" selector="cerrarComicio">cerrarComicio</body>

<body package="(none)" selector="iniciarPostulacionConPadron:conChqueadores:">iniciarPostulacionConPadron: padrones conChqueadores: chequeadores| padronAlumnos padronGraduados padronProfesores checkA checkG checkP candidateadorA candidateadorG  candidateadorP nuevaInterfaz |"Creo map de usuarios-interfaz"mapUsuarioPassEleccion:= Dictionary new."nota: la parte del password no esta modelada""desmutiplexo los padrones"padronAlumnos := padrones at: 'Alumnos'.padronGraduados:= padrones at: 'Graduados'.padronProfesores:= padrones at: 'Profesores'."desmultiplexo chequeadores"checkA:= chequeadores at: 'Alumnos'.checkG:=chequeadores at: 'Graduados'.checkP:=chequeadores at: 'Profesores'."creo los tres tipos de candidateadores"candidateadorA:= Candidateador newCandidateador: checkA.candidateadorG:= Candidateador newCandidateador: checkG.candidateadorP:= Candidateador  newCandidateador: checkP."agrego el diccionario de usuarios, password y candidateador"	"alumnos"	padronAlumnos do: [ :alumno |		"creo la intefaz"			nuevaInterfaz:= InterfazParaPostulacion newConUsuario: alumno conCandidateador: candidateadorA.		"lo pongo en el map"		mapUsuarioPassEleccion at: (alumno dni) put: nuevaInterfaz.	].	"graduados"	padronGraduados do: [  :graduado |		"creo la intefaz"			nuevaInterfaz:= InterfazParaPostulacion newConUsuario: graduado conCandidateador: candidateadorG.		"lo pongo en el map"		mapUsuarioPassEleccion at: (graduado dni) put: nuevaInterfaz.	].	"profesor"	padronProfesores do: [ :profesor |		"creo la intefaz"			nuevaInterfaz:= InterfazParaPostulacion newConUsuario: profesor conCandidateador: candidateadorP.		"lo pongo en el map"		mapUsuarioPassEleccion at:  (profesor dni)  put: nuevaInterfaz.	]</body>
</methods>

<methods>
<class-id>Logueador</class-id> <category>exportables</category>

<body package="(none)" selector="login:password:">login: unDNI password: unPassword	"devolvemos la intefaz"	| usuarioEncontrado |	usuarioEncontrado:= (mapUsuarioPassEleccion keys) detect: [:usuario | (usuario dni )= unDNI].	^mapUsuarioPassEleccion at: usuarioEncontrado.</body>

<body package="(none)" selector="actualizarOpcionesDisponibles:">actualizarOpcionesDisponibles: mapNuevo	mapUsuarioPassEleccion:= mapNuevo.</body>
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
<class-id>ChequeadorReestricciones class</class-id> <category>instance creation</category>

<body package="(none)" selector="new">new	"Answer a newly created and initialized instance."	^super new initialize</body>
</methods>


<methods>
<class-id>ChequeadorReestricciones</class-id> <category>initialize-release</category>

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


<methods>
<class-id>Usuario class</class-id> <category>instance creation</category>

<body package="(none)" selector="new">new	"Answer a newly created and initialized instance."	^super new initialize</body>
</methods>


<methods>
<class-id>Usuario</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="nombre">nombre	^nombre.</body>

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

<body package="(none)" selector="newAlumnoConDNI:ConNombre:libreta:materias:">newAlumnoConDNI: aDni ConNombre: nombre libreta: aLibreta materias: lasMaterias | nuevoAlumno |	 nuevoAlumno:= super new initializeAlumnoConDNI: aDni ConNombre: nombre libreta: aLibreta materias: lasMaterias.  ^nuevoAlumno</body>
</methods>


<methods>
<class-id>UsuarioAlumno</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="LU">LU^LU</body>

<body package="(none)" selector="materias">materias^materias.</body>

<body package="(none)" selector="cantidadMaximaDeVotos">cantidadMaximaDeVotos^1.</body>
</methods>

<methods>
<class-id>UsuarioAlumno</class-id> <category>initialize-release</category>

<body package="(none)" selector="initializeAlumnoConDNI:ConNombre:libreta:materias:">initializeAlumnoConDNI: aDni ConNombre: nombreUsuario  libreta: aLibreta materias: lasMaterias 	materias:= lasMaterias.	dni:= aDni.	LU:= aLibreta.	voto:=false.	nombre:=nombreUsuario.		^self</body>
</methods>


<methods>
<class-id>UsuarioProfesor class</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="newProfesorConDni:ConNombre:mesesDocente:">newProfesorConDni: aDni  ConNombre: nombreUsuario mesesDocente: mesDoc | nuevo |	nuevo := super new  initializeDni: aDni ConNombre: nombreUsuario mesesDoc: mesDoc.					     	^nuevo.</body>

<body package="(none)" selector="newProfesorConDni:ConNombre:mesesDocente:mesaElectoral:candidateador:">newProfesorConDni: aDni  ConNombre: nombreUsuario mesesDocente: mesDoc mesaElectoral: mesa candidateador: unCandidateador| nuevo |	nuevo := super new  initializeDni: aDni ConNombre: nombreUsuario mesesDoc: mesDoc.					     	^nuevo.</body>
</methods>


<methods>
<class-id>UsuarioProfesor</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="cantidadMaximaDeVotos">cantidadMaximaDeVotos^2.</body>

<body package="(none)" selector="mesesDocente">mesesDocente^mesesDocente</body>

<body package="(none)" selector="mesesDocente:">mesesDocente: cantMesesmesesDocente :=  cantMeses</body>
</methods>

<methods>
<class-id>UsuarioProfesor</class-id> <category>initialize-release</category>

<body package="(none)" selector="initializeDni:ConNombre:mesesDoc:">initializeDni: aDni ConNombre: nombreUsuario mesesDoc: mesDoc dni:= aDni.mesesDocente:= mesDoc.voto:=false.nombre:= nombreUsuario.^self.</body>
</methods>


<methods>
<class-id>UsuarioGraduado class</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="newGraduadoConDni:ConNombre:facultadEgreso:mesesDocente:">newGraduadoConDni: aDni  ConNombre: nombreUsuario facultadEgreso: facEgre mesesDocente: mesDoc | nuevo |	nuevo := super new initializeGraduadoConDni: aDni ConNombre: nombreUsuario facultadEgreso: facEgre mesesDocente: mesDoc.	^nuevo.</body>
</methods>


<methods>
<class-id>UsuarioGraduado</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="cantidadMaximaDeVotos">cantidadMaximaDeVotos^1.</body>
</methods>

<methods>
<class-id>UsuarioGraduado</class-id> <category>accessing</category>

<body package="(none)" selector="mesesDocente">mesesDocente	^mesesDocente</body>

<body package="(none)" selector="facultadEgreso">facultadEgreso	^facultadEgreso</body>
</methods>

<methods>
<class-id>UsuarioGraduado</class-id> <category>initialize-release</category>

<body package="(none)" selector="initializeGraduadoConDni:ConNombre:facultadEgreso:mesesDocente:">initializeGraduadoConDni: aDni ConNombre: nombreUsuario  facultadEgreso: facEgre mesesDocente: mesDocdni:= aDni.facultadEgreso:= facEgre.mesesDocente:=mesDoc.	voto:=false.^self</body>
</methods>


<methods>
<class-id>InterfazParaPostulacionCerrada class</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="newConUsuario:conListaCandidatos:">newConUsuario: usr conListaCandidatos: lista| nuevo |	nuevo:=super new.nuevo usuario: usr.nuevo listaCandidatos: lista.</body>
</methods>


<methods>
<class-id>InterfazParaPostulacionCerrada</class-id> <category>initialize-release</category>

<body package="(none)" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Edit the following to properly initialize instance variables ***"	listaCandidatos := nil.	" *** And replace this comment with additional initialization code *** "	^self</body>
</methods>

<methods>
<class-id>InterfazParaPostulacionCerrada</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="listaCandidatos:">listaCandidatos: unalistalistaCandidatos:= unalista.</body>
</methods>


<methods>
<class-id>InterfazParaComicioCerrado class</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="newConUsuario:">newConUsuario: unUsuario| nuevo |	nuevo:=  super new.nuevo usuario: unUsuario.</body>
</methods>


<methods>
<class-id>InterfazParaComicioCerrado</class-id> <category>initialize-release</category>

<body package="(none)" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>
</methods>


<methods>
<class-id>LogueadorInterfaz class</class-id> <category>instance creation</category>

<body package="(none)" selector="new:">new: unLogueador	^(super new) logueador: unLogueador.</body>
</methods>


<methods>
<class-id>LogueadorInterfaz</class-id> <category>exportables</category>

<body package="(none)" selector="login:password:">login: unDNI password: unPassword^ (logueador login: unDNI password: unPassword).</body>

<body package="(none)" selector="logueador:">logueador: unLogueador		logueador:= unLogueador.</body>
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
<class-id>ExepcionNoSeCumplenRequisitosCandidato</class-id> <category>initialize-release</category>

<body package="(none)" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>
</methods>


<methods>
<class-id>Persona class</class-id> <category>instance creation</category>

<body package="(none)" selector="new">new	"Answer a newly created and initialized instance."	^super new initialize</body>
</methods>


<methods>
<class-id>Persona</class-id> <category>accessing</category>

<body package="(none)" selector="nombre">nombre	^nombre</body>

<body package="(none)" selector="nombre:">nombre: anObject	nombre := anObject</body>

<body package="(none)" selector="dni">dni	^dni</body>

<body package="(none)" selector="dni:">dni: anObject	dni := anObject</body>
</methods>

<methods>
<class-id>Persona</class-id> <category>initialize-release</category>

<body package="(none)" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Edit the following to properly initialize instance variables ***"	nombre := nil.	dni := nil.	" *** And replace this comment with additional initialization code *** "	^self</body>
</methods>



</st-source>
