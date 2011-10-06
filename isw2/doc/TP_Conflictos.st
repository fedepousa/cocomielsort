<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® Personal Use Edition, 7.8 of 30 de marzo de 2011 on 5 de octubre de 2011 at 3:14:03</time-stamp>


<component-created>
<name>TP_Conflictos</name> <type>package</type>
</component-created><!-- Package TP_Conflictos* -->


<component-property>
<name>TP_Conflictos</name> <type>package</type>
<property>comment</property> <value>'En este paquete pongo las clases referidas a los conflictos con los resultados de una elección.'</value>
</component-property>

<class>
<name>ResultadoEleccion</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>escrutinio </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>TP_Conflictos</package>
</attributes>
</class>

<comment>
<class-id>ResultadoEleccion</class-id>
<body>La clase representa el resultado de una elección. Esta clase es abstracta. Un resultado concreto será una instancia de RepresentantesYSuplentes o un ResultadoConflictivo.
</comment>

<class>
<name>ResultadoCompleto</name>
<environment>Smalltalk</environment>
<super>ResultadoEleccion</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>representantes suplentes </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>TP_Conflictos</package>
</attributes>
</class>

<comment>
<class-id>ResultadoCompleto</class-id>
<body>ResultadoCompleto representa el resultado de una elección donde ya se definieron quienes son los representantes y suplentes de los claustros de profesores, docentes y estudiantes. 
</comment>

<class>
<name>EleccionConflictivaException</name>
<environment>Smalltalk</environment>
<super>Core.GenericException</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>TP_Conflictos</package>
</attributes>
</class>

<comment>
<class-id>EleccionConflictivaException</class-id>
<body>EleccionConflictivaException es lanzada cuando se intenta acceder a los representantes de un ResultadoConflictivo de una elección.
</comment>

<class>
<name>ExistenVariosResultadosCompatiblesConLaEleccionException</name>
<environment>Smalltalk</environment>
<super>Core.GenericException</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>TP_Conflictos</package>
</attributes>
</class>

<comment>
<class-id>ExistenVariosResultadosCompatiblesConLaEleccionException</class-id>
<body>ExistenVariosResultadosCompatiblesConLaEleccionException se lanza cuando más de una subclase de ResultadoEleccion podría construir una instancia válida.
</comment>

<class>
<name>NumeroIncorrectoDeRepresentantesException</name>
<environment>Smalltalk</environment>
<super>Core.GenericException</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>TP_Conflictos</package>
</attributes>
</class>

<comment>
<class-id>NumeroIncorrectoDeRepresentantesException</class-id>
<body>NumeroIncorrectoDeRepresentantesException es lanzada cuando al intentar resolver un conflicto se ingresa un número incorrecto de representantes.
</comment>

<class>
<name>ResultadoConflictivo</name>
<environment>Smalltalk</environment>
<super>ResultadoEleccion</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>cantidadDeReps </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>TP_Conflictos</package>
</attributes>
</class>

<comment>
<class-id>ResultadoConflictivo</class-id>
<body>Representa el resultado de una elección en la que hay ambigüedades respecto de cuáles candidatos deben ser los representantes y cuáles los suplentes.</body>
</comment>

<methods>
<class-id>NumeroIncorrectoDeRepresentantesException</class-id> <category>initialize-release</category>

<body package="TP_Conflictos" selector="initialize">initialize
</methods>


<methods>
<class-id>ResultadoEleccion class</class-id> <category>instance creation</category>

<body package="TP_Conflictos" selector="newConEscrutinio:cantidadDeRepresentantes:">newConEscrutinio: conteoDeVotos cantidadDeRepresentantes: cantidad
</methods>


<methods>
<class-id>ResultadoEleccion</class-id> <category>getters</category>

<body package="TP_Conflictos" selector="candidatos">candidatos

<body package="TP_Conflictos" selector="escrutinio">escrutinio
</methods>

<methods>
<class-id>ResultadoEleccion</class-id> <category>listarResultados</category>

<body package="TP_Conflictos" selector="votos:">votos: unCandidato
</methods>


<methods>
<class-id>ResultadoCompleto class</class-id> <category>instance creation</category>

<body package="TP_Conflictos" selector="newConEscrutinio:cantidadDeRepresentantes:">newConEscrutinio: conteoDeVotos cantidadDeRepresentantes: cantidad

<body package="TP_Conflictos" selector="newConEscturinio:Representantes:Suplentes:">newConEscturinio: conteoDeVotos Representantes: representantes Suplentes: suplentes
</methods>


<methods>
<class-id>ResultadoCompleto</class-id> <category>match</category>

<body package="TP_Conflictos" selector="matchConEscrutinio:CantidadRepresentantes:">matchConEscrutinio: conteoDeVotos CantidadRepresentantes: cantidad
</methods>

<methods>
<class-id>ResultadoCompleto</class-id> <category>accessing</category>

<body package="TP_Conflictos" selector="representantes">representantes

<body package="TP_Conflictos" selector="suplentes">suplentes
</methods>

<methods>
<class-id>ResultadoCompleto</class-id> <category>initialize-release</category>

<body package="TP_Conflictos" selector="initializeEscrutinio:Representantes:Suplentes:">initializeEscrutinio: conteoDeVotos Representantes: listaRepresentantes Suplentes: listaSuplentes
</methods>


<methods>
<class-id>ResultadoConflictivo class</class-id> <category>instance creation</category>

<body package="TP_Conflictos" selector="newConEscrutinio:cantidadDeRepresentantes:">newConEscrutinio: conteoDeVotos cantidadDeRepresentantes: cantidad
</methods>


<methods>
<class-id>ResultadoConflictivo</class-id> <category>match</category>

<body package="TP_Conflictos" selector="matchConEscrutinio:CantidadRepresentantes:">matchConEscrutinio: conteoDeVotos CantidadRepresentantes: cantidad
</methods>

<methods>
<class-id>ResultadoConflictivo</class-id> <category>resolucionDeConflicto</category>

<body package="TP_Conflictos" selector="suplentes">suplentes

<body package="TP_Conflictos" selector="representantes">representantes

<body package="TP_Conflictos" selector="resolverConRepresentantes:Suplentes:">resolverConRepresentantes: representantes Suplentes: suplentes
</methods>

<methods>
<class-id>ResultadoConflictivo</class-id> <category>initialize-release</category>

<body package="TP_Conflictos" selector="initializeEscrutinio:cantidadDeRepresentantes:">initializeEscrutinio: conteoDeVotos cantidadDeRepresentantes: cantidad
</methods>


<methods>
<class-id>EleccionConflictivaException</class-id> <category>initialize-release</category>

<body package="TP_Conflictos" selector="initialize">initialize
</methods>


<methods>
<class-id>ExistenVariosResultadosCompatiblesConLaEleccionException</class-id> <category>initialize-release</category>

<body package="TP_Conflictos" selector="initialize">initialize
</methods>



</st-source>