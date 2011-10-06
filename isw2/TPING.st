<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.7.1 of 26 de julio de 2010 on 5 de octubre de 2011 at 21:03:45</time-stamp>


<component-created>
<name>TP</name> <type>package</type>
</component-created><!-- Package TP* -->


<component-created>
<name>TP</name> <type>package</type>
</component-created>

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
<package>TP</package>
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
<package>TP</package>
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
<package>TP</package>
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
<package>TP</package>
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
<package>TP</package>
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
<package>TP</package>
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
<package>TP</package>
</attributes>
</class>

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
<package>TP</package>
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
<package>TP</package>
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
<package>TP</package>
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
<package>TP</package>
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
<package>TP</package>
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
<package>TP</package>
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
<package>TP</package>
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
<package>TP</package>
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
<package>TP</package>
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
<package>TP</package>
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
<package>TP</package>
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
<package>TP</package>
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
<package>TP</package>
</attributes>
</class>

<class>
<name>Eleccion</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>chequadorAlumnos chequeadorGraduados chequeadorProfesores padronAlumnos padronGraduados padronProfesores candidateadorA candidateadorP candidateadorG chequeadorAlumnos logueador urnaA urnaP urnaG </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>TP</package>
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
<package>TP</package>
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
<package>TP</package>
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
<package>TP</package>
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
<package>TP</package>
</attributes>
</class>

<methods>
<class-id>Usuario class</class-id> <category>instance creation</category>

<body package="TP" selector="new">new
</methods>


<methods>
<class-id>Usuario</class-id> <category>As yet unclassified</category>

<body package="TP" selector="nombre">nombre

<body package="TP" selector="dni">dni
</methods>

<methods>
<class-id>Usuario</class-id> <category>votacion</category>

<body package="TP" selector="yaVotaste">yaVotaste

<body package="TP" selector="registrarQueVoto">registrarQueVoto
</methods>

<methods>
<class-id>Usuario</class-id> <category>setters</category>

<body package="TP" selector="dni:">dni: unDni
</methods>

<methods>
<class-id>Usuario</class-id> <category>initialize-release</category>

<body package="TP" selector="initialize">initialize
</methods>


<methods>
<class-id>UsuarioGraduado class</class-id> <category>As yet unclassified</category>

<body package="TP" selector="newGraduadoConDni:ConNombre:facultadEgreso:mesesDocente:">newGraduadoConDni: aDni  ConNombre: nombreUsuario facultadEgreso: facEgre mesesDocente: mesDoc 
</methods>


<methods>
<class-id>UsuarioGraduado</class-id> <category>As yet unclassified</category>

<body package="TP" selector="cantidadMaximaDeVotos">cantidadMaximaDeVotos
</methods>

<methods>
<class-id>UsuarioGraduado</class-id> <category>accessing</category>

<body package="TP" selector="facultadEgreso">facultadEgreso

<body package="TP" selector="mesesDocente">mesesDocente
</methods>

<methods>
<class-id>UsuarioGraduado</class-id> <category>initialize-release</category>

<body package="TP" selector="initializeGraduadoConDni:ConNombre:facultadEgreso:mesesDocente:">initializeGraduadoConDni: aDni ConNombre: nombreUsuario  facultadEgreso: facEgre mesesDocente: mesDoc
</methods>


<methods>
<class-id>InterfazUsuario class</class-id> <category>instance creation</category>

<body package="TP" selector="new">new
</methods>


<methods>
<class-id>InterfazUsuario</class-id> <category>initialize-release</category>

<body package="TP" selector="initialize">initialize
</methods>

<methods>
<class-id>InterfazUsuario</class-id> <category>As yet unclassified</category>

<body package="TP" selector="usuario:">usuario: usr
</methods>


<methods>
<class-id>InterfazParaPostulacionCerrada class</class-id> <category>As yet unclassified</category>

<body package="TP" selector="newConUsuario:conListaCandidatos:">newConUsuario: usr conListaCandidatos: lista
</methods>


<methods>
<class-id>InterfazParaPostulacionCerrada</class-id> <category>As yet unclassified</category>

<body package="TP" selector="listaCandidatos:">listaCandidatos: unalista
</methods>

<methods>
<class-id>InterfazParaPostulacionCerrada</class-id> <category>GUI</category>

<body package="TP" selector="mostrarInterfaz">mostrarInterfaz
</methods>

<methods>
<class-id>InterfazParaPostulacionCerrada</class-id> <category>initialize-release</category>

<body package="TP" selector="initialize">initialize
</methods>


<methods>
<class-id>InterfazParaComicioCerrado class</class-id> <category>As yet unclassified</category>

<body package="TP" selector="newConUsuario:">newConUsuario: unUsuario
</methods>


<methods>
<class-id>InterfazParaComicioCerrado</class-id> <category>GUI</category>

<body package="TP" selector="mostrarInterfaz">mostrarInterfaz
</methods>

<methods>
<class-id>InterfazParaComicioCerrado</class-id> <category>initialize-release</category>

<body package="TP" selector="initialize">initialize
</methods>


<methods>
<class-id>LogueadorInterfaz class</class-id> <category>instance creation</category>

<body package="TP" selector="new:">new: unLogueador
</methods>


<methods>
<class-id>LogueadorInterfaz</class-id> <category>exportables</category>

<body package="TP" selector="logueador:">logueador: unLogueador

<body package="TP" selector="login:password:">login: unDNI password: unPassword
</methods>


<methods>
<class-id>ChequeadorReestricciones class</class-id> <category>instance creation</category>

<body package="TP" selector="new">new
</methods>


<methods>
<class-id>ChequeadorReestricciones</class-id> <category>initialize-release</category>

<body package="TP" selector="initialize">initialize
</methods>


<methods>
<class-id>ChequeadorAlumno class</class-id> <category>instance creation</category>

<body package="TP" selector="new">new
</methods>


<methods>
<class-id>ChequeadorAlumno</class-id> <category>As yet unclassified</category>

<body package="TP" selector="chequear:">chequear: unAlumno
</methods>

<methods>
<class-id>ChequeadorAlumno</class-id> <category>initialize-release</category>

<body package="TP" selector="initialize">initialize
</methods>


<methods>
<class-id>ExepcionNoSeCumplenRequisitosCandidato</class-id> <category>initialize-release</category>

<body package="TP" selector="initialize">initialize
</methods>


<methods>
<class-id>Persona class</class-id> <category>instance creation</category>

<body package="TP" selector="new">new
</methods>


<methods>
<class-id>Persona</class-id> <category>accessing</category>

<body package="TP" selector="nombre:">nombre: anObject

<body package="TP" selector="dni:">dni: anObject

<body package="TP" selector="dni">dni

<body package="TP" selector="nombre">nombre
</methods>

<methods>
<class-id>Persona</class-id> <category>initialize-release</category>

<body package="TP" selector="initialize">initialize
</methods>


<methods>
<class-id>UrnaElectoral class</class-id> <category>instance creation</category>

<body package="TP" selector="new">new
</methods>


<methods>
<class-id>UrnaElectoral</class-id> <category>initialize-release</category>

<body package="TP" selector="initialize">initialize
</methods>

<methods>
<class-id>UrnaElectoral</class-id> <category>ver votos</category>

<body package="TP" selector="votosEnBlanco">votosEnBlanco

<body package="TP" selector="votosValidos">votosValidos
</methods>

<methods>
<class-id>UrnaElectoral</class-id> <category>registrar</category>

<body package="TP" selector="registrarVotoA:">registrarVotoA:  unConjuntoDeDnisCandidato

<body package="TP" selector="registrarVotoEnBlanco">registrarVotoEnBlanco
</methods>


<methods>
<class-id>Candidateador class</class-id> <category>instance creation</category>

<body package="TP" selector="newCandidateador:">newCandidateador: unChequeador
</methods>


<methods>
<class-id>Candidateador</class-id> <category>As yet unclassified</category>

<body package="TP" selector="chequeadorRestricciones">chequeadorRestricciones

<body package="TP" selector="chequeadorRestricciones:">chequeadorRestricciones: unChequeador

<body package="TP" selector="candidatearme:">candidatearme: unUsuario

<body package="TP" selector="initializeChequeadorRestricciones:">initializeChequeadorRestricciones:unChequeador

<body package="TP" selector="listaCandidatos">listaCandidatos
</methods>


<methods>
<class-id>Eleccion class</class-id> <category>As yet unclassified</category>

<body package="TP" selector="newEleccionPadronAlumno:padronGraduados:padronProfesores:chequeadorAlumnos:chequeadorGraduados:chequeadorProfesores:">newEleccionPadronAlumno: pAlumno padronGraduados: pGraduados padronProfesores: pProfesores chequeadorAlumnos: cAlumnos chequeadorGraduados: cGraduados chequeadorProfesores: cProfesores
</methods>


<methods>
<class-id>Eleccion</class-id> <category>accessing</category>

<body package="TP" selector="padronAlumno:">padronAlumno: anObject

<body package="TP" selector="padronAlumno">padronAlumno

<body package="TP" selector="chequeadorProfesores:">chequeadorProfesores: anObject

<body package="TP" selector="logueador">logueador

<body package="TP" selector="padronGraduados:">padronGraduados: anObject

<body package="TP" selector="padronProfesores:">padronProfesores: anObject

<body package="TP" selector="chequeadorGraduados:">chequeadorGraduados: anObject

<body package="TP" selector="logueador:">logueador: unLogueador

<body package="TP" selector="chequadorAlumnos">chequadorAlumnos

<body package="TP" selector="candidateadorA:">candidateadorA: uncandi

<body package="TP" selector="chequadorAlumnos:">chequadorAlumnos: anObject

<body package="TP" selector="candidateadorG:">candidateadorG: uncandi

<body package="TP" selector="candidateadorP:">candidateadorP: uncandi

<body package="TP" selector="padronProfesores">padronProfesores

<body package="TP" selector="chequeadorProfesores">chequeadorProfesores

<body package="TP" selector="chequeadorGraduados">chequeadorGraduados

<body package="TP" selector="padronGraduados">padronGraduados
</methods>

<methods>
<class-id>Eleccion</class-id> <category>viejos</category>

<body package="TP" selector="iniciarPostulacionConPadron:conChqueadores:">iniciarPostulacionConPadron: padrones conChqueadores: chequeadores
</methods>

<methods>
<class-id>Eleccion</class-id> <category>exportables</category>

<body package="TP" selector="iniciarComicio">iniciarComicio

<body package="TP" selector="cerrarPostulacion">cerrarPostulacion

<body package="TP" selector="iniciarPostulacion">iniciarPostulacion

<body package="TP" selector="cerrarComicio">cerrarComicio
</methods>


<methods>
<class-id>InterfazParaPostulacion class</class-id> <category>As yet unclassified</category>

<body package="TP" selector="newConUsuario:conCandidateador:">newConUsuario: unUsuario conCandidateador: unCandidateador
</methods>


<methods>
<class-id>InterfazParaPostulacion</class-id> <category>initialize-release</category>

<body package="TP" selector="initializeConUsuario:conCandidateador:"> initializeConUsuario: unUsuario conCandidateador: unCandidateador
</methods>

<methods>
<class-id>InterfazParaPostulacion</class-id> <category>GUI</category>

<body package="TP" selector="mostrarInterfaz">mostrarInterfaz
</methods>

<methods>
<class-id>InterfazParaPostulacion</class-id> <category>As yet unclassified</category>

<body package="TP" selector="candidateador">candidateador

<body package="TP" selector="candidatearme">candidatearme
</methods>


<methods>
<class-id>InterfazParaVotacion class</class-id> <category>instance creation</category>

<body package="TP" selector="newConUsuario:conUrna:conLista:">newConUsuario: unUsuario conUrna: unaUrna conLista: unaLista
</methods>


<methods>
<class-id>InterfazParaVotacion</class-id> <category>GUI</category>

<body package="TP" selector="mostrarInterfaz">mostrarInterfaz
</methods>

<methods>
<class-id>InterfazParaVotacion</class-id> <category>As yet unclassified</category>

<body package="TP" selector="votoA:">votoA: unConjuntoCandidato

<body package="TP" selector="listaCandidatos">listaCandidatos

<body package="TP" selector="chequearSiPuedeVotar:A:">chequearSiPuedeVotar: unUsuario  A: unConjuntoDeDnisCandidato

<body package="TP" selector="initializeConUsuario:conUrna:conLista:">initializeConUsuario: unUsuario conUrna: unaUrna  conLista: unaLista

<body package="TP" selector="registrarVoto:">registrarVoto: unUsuario

<body package="TP" selector="votoEnBlanco">votoEnBlanco
</methods>


<methods>
<class-id>InterfazParaEleccionCerrada</class-id> <category>GUI</category>

<body package="TP" selector="mostrarInterfaz">mostrarInterfaz
</methods>

<methods>
<class-id>InterfazParaEleccionCerrada</class-id> <category>initialize-release</category>

<body package="TP" selector="initialize">initialize
</methods>


<methods>
<class-id>Logueador class</class-id> <category>instance creation</category>

<body package="TP" selector="new">new
</methods>


<methods>
<class-id>Logueador</class-id> <category>accessing</category>

<body package="TP" selector="creador:">creador: anObject

<body package="TP" selector="creador">creador
</methods>

<methods>
<class-id>Logueador</class-id> <category>probablementeNoVayanAca</category>

<body package="TP" selector="iniciarPostulacionConPadron:conChqueadores:">iniciarPostulacionConPadron: padrones conChqueadores: chequeadores

<body package="TP" selector="cerrarComicio">cerrarComicio</body>

<body package="TP" selector="iniciarComicioConPadron:">iniciarComicioConPadron: padrones
</methods>

<methods>
<class-id>Logueador</class-id> <category>exportables</category>

<body package="TP" selector="login:password:">login: unDNI password: unPassword

<body package="TP" selector="actualizarOpcionesDisponibles:">actualizarOpcionesDisponibles: mapNuevo
</methods>


<methods>
<class-id>Creador class</class-id> <category>instance creation</category>

<body package="TP" selector="new">new
</methods>


<methods>
<class-id>Creador</class-id> <category>initialize-release</category>

<body package="TP" selector="initialize">initialize
</methods>


<methods>
<class-id>CreadorPostulacion</class-id> <category>initialize-release</category>

<body package="TP" selector="initialize">initialize
</methods>


<methods>
<class-id>CreadorVotacion</class-id> <category>initialize-release</category>

<body package="TP" selector="initialize">initialize
</methods>


<methods>
<class-id>CreadorEleccionCerrada</class-id> <category>initialize-release</category>

<body package="TP" selector="initialize">initialize
</methods>


<methods>
<class-id>ChequeadorProfesores</class-id> <category>As yet unclassified</category>

<body package="TP" selector="chequear:">chequear: unProf
</methods>

<methods>
<class-id>ChequeadorProfesores</class-id> <category>initialize-release</category>

<body package="TP" selector="initialize">initialize
</methods>


<methods>
<class-id>ChequeadorGraduados</class-id> <category>As yet unclassified</category>

<body package="TP" selector="chequear:">chequear: unGraduado
</methods>

<methods>
<class-id>ChequeadorGraduados</class-id> <category>initialize-release</category>

<body package="TP" selector="initialize">initialize
</methods>


<methods>
<class-id>UsuarioAlumno class</class-id> <category>As yet unclassified</category>

<body package="TP" selector="newAlumnoConDNI:ConNombre:libreta:materias:">newAlumnoConDNI: aDni ConNombre: nombre libreta: aLibreta materias: lasMaterias 
</methods>


<methods>
<class-id>UsuarioAlumno</class-id> <category>As yet unclassified</category>

<body package="TP" selector="cantidadMaximaDeVotos">cantidadMaximaDeVotos

<body package="TP" selector="LU">LU

<body package="TP" selector="materias">materias
</methods>

<methods>
<class-id>UsuarioAlumno</class-id> <category>initialize-release</category>

<body package="TP" selector="initializeAlumnoConDNI:ConNombre:libreta:materias:">initializeAlumnoConDNI: aDni ConNombre: nombreUsuario  libreta: aLibreta materias: lasMaterias 
</methods>


<methods>
<class-id>UsuarioProfesor class</class-id> <category>As yet unclassified</category>

<body package="TP" selector="newProfesorConDni:ConNombre:mesesDocente:mesaElectoral:candidateador:">newProfesorConDni: aDni  ConNombre: nombreUsuario mesesDocente: mesDoc mesaElectoral: mesa candidateador: unCandidateador

<body package="TP" selector="newProfesorConDni:ConNombre:mesesDocente:">newProfesorConDni: aDni  ConNombre: nombreUsuario mesesDocente: mesDoc 
</methods>


<methods>
<class-id>UsuarioProfesor</class-id> <category>As yet unclassified</category>

<body package="TP" selector="cantidadMaximaDeVotos">cantidadMaximaDeVotos

<body package="TP" selector="mesesDocente:">mesesDocente: cantMeses

<body package="TP" selector="mesesDocente">mesesDocente
</methods>

<methods>
<class-id>UsuarioProfesor</class-id> <category>initialize-release</category>

<body package="TP" selector="initializeDni:ConNombre:mesesDoc:">initializeDni: aDni ConNombre: nombreUsuario mesesDoc: mesDoc 
</methods>



</st-source>