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

<body package="(none)" selector="new">new
</methods>


<methods>
<class-id>Usuario</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="nombre">nombre</body>

<body package="(none)" selector="dni">dni
</methods>

<methods>
<class-id>Usuario</class-id> <category>votacion</category>

<body package="(none)" selector="yaVotaste">yaVotaste

<body package="(none)" selector="registrarQueVoto">registrarQueVoto
</methods>

<methods>
<class-id>Usuario</class-id> <category>setters</category>

<body package="(none)" selector="dni:">dni: unDni
</methods>

<methods>
<class-id>Usuario</class-id> <category>initialize-release</category>

<body package="(none)" selector="initialize">initialize
</methods>


<methods>
<class-id>UsuarioAlumno class</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="newAlumnoConDNI:libreta:materias:">newAlumnoConDNI: aDni libreta: aLibreta materias: lasMaterias 
</methods>


<methods>
<class-id>UsuarioAlumno</class-id> <category>initialize-release</category>

<body package="(none)" selector="initializeAlumnoConDNI:libreta:materias:">initializeAlumnoConDNI: aDni libreta: aLibreta materias: lasMaterias 
</methods>

<methods>
<class-id>UsuarioAlumno</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="LU">LU

<body package="(none)" selector="materias">materias
</methods>


<methods>
<class-id>UsuarioProfesor class</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="newProfesorConDni:mesesDocente:mesaElectoral:candidateador:">newProfesorConDni: aDni  mesesDocente: mesDoc mesaElectoral: mesa candidateador: unCandidateador

<body package="(none)" selector="newProfesorConDni:mesesDocente:">newProfesorConDni: aDni  mesesDocente: mesDoc 
</methods>


<methods>
<class-id>UsuarioProfesor</class-id> <category>initialize-release</category>

<body package="(none)" selector="initializeDni:mesesDoc:">initializeDni: aDni mesesDoc: mesDoc 
</methods>

<methods>
<class-id>UsuarioProfesor</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="mesesDocente">mesesDocente

<body package="(none)" selector="mesesDocente:">mesesDocente: cantMeses
</methods>


<methods>
<class-id>UsuarioGraduado class</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="newGraduadoConDni:facultadEgreso:mesesDocente:">newGraduadoConDni: aDni  facultadEgreso: facEgre mesesDocente: mesDoc 
</methods>


<methods>
<class-id>UsuarioGraduado</class-id> <category>accessing</category>

<body package="(none)" selector="facultadEgreso">facultadEgreso

<body package="(none)" selector="mesesDocente">mesesDocente
</methods>

<methods>
<class-id>UsuarioGraduado</class-id> <category>initialize-release</category>

<body package="(none)" selector="initializeGraduadoConDni:facultadEgreso:mesesDocente:">initializeGraduadoConDni: aDni  facultadEgreso: facEgre mesesDocente: mesDoc
</methods>


<methods>
<class-id>ChequeadorReestricciones class</class-id> <category>instance creation</category>

<body package="(none)" selector="new">new
</methods>


<methods>
<class-id>ChequeadorReestricciones</class-id> <category>initialize-release</category>

<body package="(none)" selector="initialize">initialize
</methods>


<methods>
<class-id>ChequeadorAlumno class</class-id> <category>instance creation</category>

<body package="(none)" selector="new">new
</methods>


<methods>
<class-id>ChequeadorAlumno</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="chequear:">chequear: unAlumno
</methods>

<methods>
<class-id>ChequeadorAlumno</class-id> <category>initialize-release</category>

<body package="(none)" selector="initialize">initialize
</methods>


<methods>
<class-id>MesaElectoral class</class-id> <category>instance creation</category>

<body package="(none)" selector="new">new
</methods>


<methods>
<class-id>MesaElectoral</class-id> <category>initialize-release</category>

<body package="(none)" selector="initialize">initialize
</methods>

<methods>
<class-id>MesaElectoral</class-id> <category>ver votos</category>

<body package="(none)" selector="votosAnulados">votosAnulados

<body package="(none)" selector="votosValidos">votosValidos

<body package="(none)" selector="votosEnBlanco">votosEnBlanco
</methods>

<methods>
<class-id>MesaElectoral</class-id> <category>registrar</category>

<body package="(none)" selector="registrarVotoEnBlancoDe:">registrarVotoEnBlancoDe: unUsuario

<body package="(none)" selector="registrarVotoDe:A:">registrarVotoDe: unUsuario A: unDNICandidato

<body package="(none)" selector="registrarVotoAnuladoDe:">registrarVotoAnuladoDe: unUsuario
</methods>


<methods>
<class-id>Candidateador class</class-id> <category>instance creation</category>

<body package="(none)" selector="newCandidateador:">newCandidateador: unChequeador
</methods>


<methods>
<class-id>Candidateador</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="initializeChequeadorRestricciones:">initializeChequeadorRestricciones:unChequeador

<body package="(none)" selector="listaCandidatos">listaCandidatos

<body package="(none)" selector="chequeadorRestricciones">chequeadorRestricciones

<body package="(none)" selector="chequeadorRestricciones:">chequeadorRestricciones: unChequeador

<body package="(none)" selector="candidatearme:">candidatearme: unUsuario
</methods>

<methods>
<class-id>Candidateador</class-id> <category>initialize-release</category>

<body package="(none)" selector="initialize">initialize
</methods>


<methods>
<class-id>Eleccion class</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="newEleccionPadronAlumno:padronGraduados:padronProfesores:chequeadorAlumnos:chequeadorGraduados:chequeadorProfesores:">newEleccionPadronAlumno: pAlumno padronGraduados: pGraduados padronProfesores: pProfesores chequeadorAlumnos: cAlumnos chequeadorGraduados: cGraduados chequeadorProfesores: cProfesores
</methods>


<methods>
<class-id>Eleccion</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="iniciarComicio">iniciarComicio

<body package="(none)" selector="iniciarPostulacion">iniciarPostulacion
</methods>

<methods>
<class-id>Eleccion</class-id> <category>accessing</category>

<body package="(none)" selector="padronGraduados">padronGraduados

<body package="(none)" selector="chequadorAlumnos:">chequadorAlumnos: anObject

<body package="(none)" selector="padronProfesores">padronProfesores

<body package="(none)" selector="padronProfesores:">padronProfesores: anObject

<body package="(none)" selector="padronAlumno">padronAlumno

<body package="(none)" selector="chequeadorProfesores">chequeadorProfesores

<body package="(none)" selector="padronGraduados:">padronGraduados: anObject

<body package="(none)" selector="chequeadorGraduados">chequeadorGraduados

<body package="(none)" selector="chequeadorProfesores:">chequeadorProfesores: anObject

<body package="(none)" selector="padronAlumno:">padronAlumno: anObject

<body package="(none)" selector="chequeadorGraduados:">chequeadorGraduados: anObject

<body package="(none)" selector="chequadorAlumnos">chequadorAlumnos
</methods>

<methods>
<class-id>Eleccion</class-id> <category>initialize-release</category>

<body package="(none)" selector="initialize">initialize
</methods>


<methods>
<class-id>InterfezUsuario class</class-id> <category>instance creation</category>

<body package="(none)" selector="new">new
</methods>


<methods>
<class-id>InterfezUsuario</class-id> <category>initialize-release</category>

<body package="(none)" selector="initialize">initialize
</methods>


<methods>
<class-id>InterfazParaPostulacion class</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="newConUsuario:conCandidateador:">newConUsuario: unUsuario conCandidateador: unCandidateador
</methods>


<methods>
<class-id>InterfazParaPostulacion</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="candidateador">candidateador

<body package="(none)" selector="candidatearme">candidatearme
</methods>

<methods>
<class-id>InterfazParaPostulacion</class-id> <category>initialize-release</category>

<body package="(none)" selector="initializeConUsuario:conCandidateador:"> initializeConUsuario: unUsuario conCandidateador: unCandidateador
</methods>


<methods>
<class-id>InterfazParaVotacion class</class-id> <category>instance creation</category>

<body package="(none)" selector="newConUsuario:conUrna:conLista:">newConUsuario: unUsuario conUrna: unaUrna conLista: unaLista
</methods>


<methods>
<class-id>InterfazParaVotacion</class-id> <category>initialize-release</category>

<body package="(none)" selector="initialize">initialize
</methods>

<methods>
<class-id>InterfazParaVotacion</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="initializeConUsuario:conUrna:conLista:">initializeConUsuario: unUsuario conUrna: unaUrna  conLista: unaLista

<body package="(none)" selector="votoAnulado">votoAnulado

<body package="(none)" selector="votoUnCandidato:">votoUnCandidato: unCandidato

<body package="(none)" selector="votoEnBlanco">votoEnBlanco

<body package="(none)" selector="listaCandidatos">listaCandidatos
</methods>


<methods>
<class-id>InterfazParaEleccionCerrada</class-id> <category>initialize-release</category>

<body package="(none)" selector="initialize">initialize
</methods>


<methods>
<class-id>SistemaLogin class</class-id> <category>instance creation</category>

<body package="(none)" selector="new">new
</methods>


<methods>
<class-id>SistemaLogin</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="login:password:">login: unDNI password: unPassword
</methods>

<methods>
<class-id>SistemaLogin</class-id> <category>accessing</category>

<body package="(none)" selector="creador">creador

<body package="(none)" selector="creador:">creador: anObject
</methods>

<methods>
<class-id>SistemaLogin</class-id> <category>probablementeNoVayanAca</category>

<body package="(none)" selector="iniciarPostulacionConPadron:conChqueadores:">iniciarPostulacionConPadron: padrones conChqueadores: chequeadores

<body package="(none)" selector="cerrarComicio">cerrarComicio</body>

<body package="(none)" selector="iniciarComicioConPadron:">iniciarComicioConPadron: padrones
</methods>

<methods>
<class-id>SistemaLogin</class-id> <category>initialize-release</category>

<body package="(none)" selector="initialize">initialize
</methods>


<methods>
<class-id>Creador class</class-id> <category>instance creation</category>

<body package="(none)" selector="new">new
</methods>


<methods>
<class-id>Creador</class-id> <category>initialize-release</category>

<body package="(none)" selector="initialize">initialize
</methods>


<methods>
<class-id>CreadorPostulacion</class-id> <category>initialize-release</category>

<body package="(none)" selector="initialize">initialize
</methods>


<methods>
<class-id>CreadorVotacion</class-id> <category>initialize-release</category>

<body package="(none)" selector="initialize">initialize
</methods>


<methods>
<class-id>CreadorEleccionCerrada</class-id> <category>initialize-release</category>

<body package="(none)" selector="initialize">initialize
</methods>


<methods>
<class-id>ChequeadorProfesores</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="chequear:">chequear: unProf
</methods>

<methods>
<class-id>ChequeadorProfesores</class-id> <category>initialize-release</category>

<body package="(none)" selector="initialize">initialize
</methods>


<methods>
<class-id>ChequeadorGraduados</class-id> <category>As yet unclassified</category>

<body package="(none)" selector="chequear:">chequear: unGraduado
</methods>

<methods>
<class-id>ChequeadorGraduados</class-id> <category>initialize-release</category>

<body package="(none)" selector="initialize">initialize
</methods>



</st-source>