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

<body package="TPING" selector="new">new
</methods>


<methods>
<class-id>ChequeadorReestricciones</class-id> <category>initialize-release</category>

<body package="TPING" selector="initialize">initialize
</methods>


<methods>
<class-id>Eleccion class</class-id> <category>As yet unclassified</category>

<body package="TPING" selector="newEleccionPadronAlumno:padronGraduados:padronProfesores:chequeadorAlumnos:chequeadorGraduados:chequeadorProfesores:">newEleccionPadronAlumno: pAlumno padronGraduados: pGraduados padronProfesores: pProfesores chequeadorAlumnos: cAlumnos chequeadorGraduados: cGraduados chequeadorProfesores: cProfesores
</methods>


<methods>
<class-id>Eleccion</class-id> <category>As yet unclassified</category>

<body package="TPING" selector="iniciarComicio">iniciarComicio

<body package="TPING" selector="iniciarPostulacion">iniciarPostulacion
</methods>

<methods>
<class-id>Eleccion</class-id> <category>accessing</category>

<body package="TPING" selector="padronProfesores:">padronProfesores: anObject

<body package="TPING" selector="chequeadorGraduados:">chequeadorGraduados: anObject

<body package="TPING" selector="chequeadorProfesores:">chequeadorProfesores: anObject

<body package="TPING" selector="padronAlumno:">padronAlumno: anObject

<body package="TPING" selector="padronGraduados">padronGraduados

<body package="TPING" selector="chequeadorProfesores">chequeadorProfesores

<body package="TPING" selector="chequadorAlumnos:">chequadorAlumnos: anObject

<body package="TPING" selector="chequeadorGraduados">chequeadorGraduados

<body package="TPING" selector="chequadorAlumnos">chequadorAlumnos

<body package="TPING" selector="padronAlumno">padronAlumno

<body package="TPING" selector="padronProfesores">padronProfesores

<body package="TPING" selector="padronGraduados:">padronGraduados: anObject
</methods>

<methods>
<class-id>Eleccion</class-id> <category>initialize-release</category>

<body package="TPING" selector="initialize">initialize
</methods>


<methods>
<class-id>ChequeadorProfesores</class-id> <category>As yet unclassified</category>

<body package="TPING" selector="chequear:">chequear: unProf
</methods>

<methods>
<class-id>ChequeadorProfesores</class-id> <category>initialize-release</category>

<body package="TPING" selector="initialize">initialize
</methods>


<methods>
<class-id>ChequeadorGraduados</class-id> <category>As yet unclassified</category>

<body package="TPING" selector="chequear:">chequear: unGraduado
</methods>

<methods>
<class-id>ChequeadorGraduados</class-id> <category>initialize-release</category>

<body package="TPING" selector="initialize">initialize
</methods>


<methods>
<class-id>Usuario class</class-id> <category>instance creation</category>

<body package="TPING" selector="new">new
</methods>


<methods>
<class-id>Usuario</class-id> <category>As yet unclassified</category>

<body package="TPING" selector="nombre">nombre</body>

<body package="TPING" selector="dni">dni
</methods>

<methods>
<class-id>Usuario</class-id> <category>votacion</category>

<body package="TPING" selector="yaVotaste">yaVotaste

<body package="TPING" selector="registrarQueVoto">registrarQueVoto
</methods>

<methods>
<class-id>Usuario</class-id> <category>setters</category>

<body package="TPING" selector="nombre:">nombre: unNombre

<body package="TPING" selector="dni:">dni: unDni

<body package="TPING" selector="candidateador">candidateador

<body package="TPING" selector="candidateador:">candidateador: unCandidateador

<body package="TPING" selector="mesaElectoral">mesaElectoral

<body package="TPING" selector="mesaElectoral:">mesaElectoral: mesa
</methods>

<methods>
<class-id>Usuario</class-id> <category>initialize-release</category>

<body package="TPING" selector="initialize">initialize
</methods>


<methods>
<class-id>UsuarioAlumno class</class-id> <category>As yet unclassified</category>

<body package="TPING" selector="newAlumnoConDNI:libreta:materias:mesaElectoral:candidateador:">newAlumnoConDNI: aDni libreta: aLibreta materias: lasMaterias mesaElectoral: mesa candidateador: unCandidateador
</methods>


<methods>
<class-id>UsuarioAlumno</class-id> <category>As yet unclassified</category>

<body package="TPING" selector="materias">materias

<body package="TPING" selector="LU">LU

<body package="TPING" selector="materias:">materias: lasMaterias
</methods>

<methods>
<class-id>UsuarioAlumno</class-id> <category>setters</category>

<body package="TPING" selector="LU:">LU: unaLU
</methods>

<methods>
<class-id>UsuarioAlumno</class-id> <category>initialize-release</category>

<body package="TPING" selector="initialize">initialize
</methods>


<methods>
<class-id>UsuarioProfesor class</class-id> <category>As yet unclassified</category>

<body package="TPING" selector="newProfesorConDni:mesesDocente:mesaElectoral:candidateador:">newProfesorConDni: aDni  mesesDocente: mesDoc mesaElectoral: mesa candidateador: unCandidateador
</methods>


<methods>
<class-id>UsuarioProfesor</class-id> <category>As yet unclassified</category>

<body package="TPING" selector="mesesDocente:">mesesDocente: cantMeses

<body package="TPING" selector="mesesDocente">mesesDocente
</methods>


<methods>
<class-id>UsuarioGraduado class</class-id> <category>As yet unclassified</category>

<body package="TPING" selector="newGraduadoConDni:facultadEgreso:mesesDocente:mesaElectoral:candidateador:">newGraduadoConDni: aDni  facultadEgreso: facEgre mesesDocente: mesDoc mesaElectoral: mesa candidateador: unCandidateador
</methods>


<methods>
<class-id>UsuarioGraduado</class-id> <category>accessing</category>

<body package="TPING" selector="facultadEgreso">facultadEgreso

<body package="TPING" selector="mesesDocente:">mesesDocente: anObject

<body package="TPING" selector="facultadEgreso:">facultadEgreso: anObject

<body package="TPING" selector="mesesDocente">mesesDocente
</methods>

<methods>
<class-id>UsuarioGraduado</class-id> <category>initialize-release</category>

<body package="TPING" selector="initialize">initialize
</methods>


<methods>
<class-id>ChequeadorAlumno class</class-id> <category>instance creation</category>

<body package="TPING" selector="new">new
</methods>


<methods>
<class-id>ChequeadorAlumno</class-id> <category>As yet unclassified</category>

<body package="TPING" selector="chequear:">chequear: unAlumno
</methods>

<methods>
<class-id>ChequeadorAlumno</class-id> <category>initialize-release</category>

<body package="TPING" selector="initialize">initialize
</methods>


<methods>
<class-id>MesaElectoral class</class-id> <category>instance creation</category>

<body package="TPING" selector="new:">new: unListaCandidatos
</methods>


<methods>
<class-id>MesaElectoral</class-id> <category>As yet unclassified</category>

<body package="TPING" selector="votosValidos:">votosValidos: unDiccionario

<body package="TPING" selector="votosEnBlancoEncero">votosEnBlancoEncero
</methods>

<methods>
<class-id>MesaElectoral</class-id> <category>votacion</category>

<body package="TPING" selector="votosValidos">votosValidos

<body package="TPING" selector="yo:votoA:">yo: unVotante votoA: unCandidato

<body package="TPING" selector="votosEnBlanco">votosEnBlanco

<body package="TPING" selector="votosAnulados">votosAnulados

<body package="TPING" selector="votosAnulados:">votosAnulados: votos

<body package="TPING" selector="votosEnBlanco:">votosEnBlanco: votos

<body package="TPING" selector="yoVotoAnulado:">yoVotoAnulado: unVotante

<body package="TPING" selector="yoVotoEnBlanco:">yoVotoEnBlanco: unVotante
</methods>

<methods>
<class-id>MesaElectoral</class-id> <category>initialize-release</category>

<body package="TPING" selector="initialize">initialize
</methods>


<methods>
<class-id>Candidateador class</class-id> <category>instance creation</category>

<body package="TPING" selector="newCandidateador:">newCandidateador: unChequeador
</methods>


<methods>
<class-id>Candidateador</class-id> <category>As yet unclassified</category>

<body package="TPING" selector="chequeadorRestricciones">chequeadorRestricciones

<body package="TPING" selector="chequeadorRestricciones:">chequeadorRestricciones: unChequeador

<body package="TPING" selector="candidatearme:">candidatearme: unUsuario

<body package="TPING" selector="listaCandidatos">listaCandidatos

<body package="TPING" selector="listaCandidatos:">listaCandidatos: unaLista
</methods>

<methods>
<class-id>Candidateador</class-id> <category>initialize-release</category>

<body package="TPING" selector="initialize">initialize
</methods>



</st-source>