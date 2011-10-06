<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.7.1 of 26 de julio de 2010 on 6 de octubre de 2011 at 16:45:34</time-stamp>


<component-created>
<name>TP_conflictos</name> <type>package</type>
</component-created><!-- Package TP_conflictos* -->


<component-created>
<name>TP_conflictos</name> <type>package</type>
</component-created>

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
<package>TP_conflictos</package>
</attributes>
</class>

<comment>
<class-id>ResultadoEleccion</class-id>
<body>La clase representa el resultado de una elección. Esta clase es abstracta. Un resultado concreto será una instancia de RepresentantesYSuplentes o un ResultadoConflictivo.</body>
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
<package>TP_conflictos</package>
</attributes>
</class>

<comment>
<class-id>ResultadoCompleto</class-id>
<body>ResultadoCompleto representa el resultado de una elección donde ya se definieron quienes son los representantes y suplentes de los claustros de profesores, docentes y estudiantes. Instance Variables	repEstudiantes	&lt;Object | ProtoObject&gt;	description of repEstudiantes	repGraduados	&lt;Object | ProtoObject&gt;	description of repGraduados	repProfesores	&lt;Object | ProtoObject&gt;	description of repProfesores	supEstudiantes	&lt;Object | ProtoObject&gt;	description of supEstudiantes	supGraduados	&lt;Object | ProtoObject&gt;	description of supGraduados	supProfesores	&lt;Object | ProtoObject&gt;	description of supProfesores</body>
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
<package>TP_conflictos</package>
</attributes>
</class>

<comment>
<class-id>EleccionConflictivaException</class-id>
<body>EleccionConflictivaException es lanzada cuando se intenta acceder a los representantes de un ResultadoConflictivo de una elección.</body>
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
<package>TP_conflictos</package>
</attributes>
</class>

<comment>
<class-id>ExistenVariosResultadosCompatiblesConLaEleccionException</class-id>
<body>ExistenVariosResultadosCompatiblesConLaEleccionException se lanza cuando más de una subclase de ResultadoEleccion podría construir una instancia válida.</body>
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
<package>TP_conflictos</package>
</attributes>
</class>

<comment>
<class-id>NumeroIncorrectoDeRepresentantesException</class-id>
<body>NumeroIncorrectoDeRepresentantesException es lanzada cuando al intentar resolver un conflicto se ingresa un número incorrecto de representantes.</body>
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
<package>TP_conflictos</package>
</attributes>
</class>

<comment>
<class-id>ResultadoConflictivo</class-id>
<body>Representa el resultado de una elección en la que hay ambigüedades respecto de cuáles candidatos deben ser los representantes y cuáles los suplentes.</body>
</comment>

<methods>
<class-id>ResultadoEleccion class</class-id> <category>instance creation</category>

<body package="TP_conflictos" selector="newConEscrutinio:cantidadDeRepresentantes:">newConEscrutinio: conteoDeVotos cantidadDeRepresentantes: cantidad	"Answer a newly created and initialized instance."	| result matchingClasses |	matchingClasses := self subclasses select: [:e | e matchConEscrutinio: conteoDeVotos CantidadRepresentantes: cantidad].	(matchingClasses size &gt; 1) ifTrue: [ EleccionConflictivaException raiseWith: (ResultadoConflictivo newConEscrutinio: conteoDeVotos cantidadDeRepresentantes: cantidad)].	(matchingClasses isEmpty  ) ifTrue: [result := ResultadoConflictivo newConEscrutinio: conteoDeVotos cantidadDeRepresentantes: cantidad. ]	ifFalse: [	result := (matchingClasses any) newConEscrutinio: conteoDeVotos cantidadDeRepresentantes: cantidad.].	^result.</body>
</methods>


<methods>
<class-id>ResultadoEleccion</class-id> <category>getters</category>

<body package="TP_conflictos" selector="escrutinio">escrutinio	^SubclassResponsibilityError.</body>

<body package="TP_conflictos" selector="candidatos">candidatos	(self escrutinio) keys.</body>
</methods>

<methods>
<class-id>ResultadoEleccion</class-id> <category>listarResultados</category>

<body package="TP_conflictos" selector="votos:">votos: unCandidato	self escrutinio at: unCandidato</body>
</methods>


<methods>
<class-id>ResultadoCompleto class</class-id> <category>instance creation</category>

<body package="TP_conflictos" selector="matchConEscrutinio:CantidadRepresentantes:">matchConEscrutinio: conteoDeVotos CantidadRepresentantes: cantidad	| reps sups sortBlock ordenados totalVotosValidos  result |	totalVotosValidos := conteoDeVotos inject: 0 into: [ :acum :v | acum + v.].	sortBlock := [ :a :b | (conteoDeVotos at: a) &gt; (conteoDeVotos at: b). ].	ordenados := SortedCollection sortBlock: sortBlock.	ordenados addAll: conteoDeVotos keys.	ordenados := ordenados select: [ :e | (((conteoDeVotos at: e) * 10) &gt; totalVotosValidos).].	result := (ordenados size &gt;= cantidad).	ordenados select: [ :e | (((conteoDeVotos at: e) * 10) &gt; totalVotosValidos).].	reps := List new.	sups:= List new.	ordenados inject: 0 into: [ :acum :e | (acum &lt; cantidad) ifTrue: [reps add: e] ifFalse: [ sups add: e.]. acum+1.].		^result and: [((sups size = 0) or: [((conteoDeVotos at: (reps last)) &gt; (conteoDeVotos at: (sups first)))])].</body>

<body package="TP_conflictos" selector="newConEscrutinio:cantidadDeRepresentantes:">newConEscrutinio: conteoDeVotos cantidadDeRepresentantes: cantidad	"Answer a newly created and initialized instance."	| reps sups sortBlock ordenados totalVotosValidos  |	totalVotosValidos := conteoDeVotos inject: 0 into: [ :acum :v | acum + v.].	sortBlock := [ :a :b | (conteoDeVotos at: a) &gt; (conteoDeVotos at: b). ].	ordenados := SortedCollection sortBlock: sortBlock.	ordenados addAll: conteoDeVotos keys.	reps := List new.	sups:= List new.	ordenados inject: 0 into: [ :acum :e | (acum &lt; cantidad) ifTrue: [reps add: e] ifFalse: [ sups add: e.]. acum+1.].	sups := sups select: [ :e | (((conteoDeVotos at: e) * 10) &gt; totalVotosValidos).].	^self newConEscturinio: conteoDeVotos Representantes: reps Suplentes: sups.</body>

<body package="TP_conflictos" selector="newConEscturinio:Representantes:Suplentes:">newConEscturinio: conteoDeVotos Representantes: representantes Suplentes: suplentes	"Answer a newly created and initialized instance."	^super new initializeEscrutinio: conteoDeVotos Representantes: representantes Suplentes: suplentes.</body>
</methods>


<methods>
<class-id>ResultadoCompleto</class-id> <category>initialize-release</category>

<body package="TP_conflictos" selector="initializeEscrutinio:Representantes:Suplentes:">initializeEscrutinio: conteoDeVotos Representantes: listaRepresentantes Suplentes: listaSuplentes	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	escrutinio := conteoDeVotos.	representantes := listaRepresentantes.	suplentes := listaSuplentes.	^self</body>
</methods>

<methods>
<class-id>ResultadoCompleto</class-id> <category>accessing</category>

<body package="TP_conflictos" selector="representantes">representantes	^representantes</body>

<body package="TP_conflictos" selector="suplentes">suplentes	^suplentes</body>
</methods>


<methods>
<class-id>EleccionConflictivaException</class-id> <category>initialize-release</category>

<body package="TP_conflictos" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>
</methods>


<methods>
<class-id>ExistenVariosResultadosCompatiblesConLaEleccionException</class-id> <category>initialize-release</category>

<body package="TP_conflictos" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>
</methods>


<methods>
<class-id>NumeroIncorrectoDeRepresentantesException</class-id> <category>initialize-release</category>

<body package="TP_conflictos" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>
</methods>


<methods>
<class-id>ResultadoConflictivo class</class-id> <category>instance creation</category>

<body package="TP_conflictos" selector="matchConEscrutinio:CantidadRepresentantes:">matchConEscrutinio: conteoDeVotos CantidadRepresentantes: cantidad"	| reps sups sortBlock ordenados totalVotosValidos  result |"	^false.	"totalVotosValidos := conteoDeVotos inject: 0 into: [ :acum :v | acum + v.].	sortBlock := [ :a :b | (conteoDeVotos at: a) &gt; (conteoDeVotos at: b). ].	ordenados := SortedCollection sortBlock: sortBlock.	ordenados addAll: conteoDeVotos keys.	result := (ordenados size &lt; cantidad).	ordenados select: [ :e | (((conteoDeVotos at: e) * 10) &gt; totalVotosValidos).].	reps := List new.	sups:= List new.	ordenados inject: 0 into: [ :acum :e | (acum &lt; cantidad) ifTrue: [reps add: e] ifFalse: [ sups add: e.]. acum+1.].		^result or: [((sups size &gt; 0) and: [((conteoDeVotos at: (reps last)) &gt; (conteoDeVotos at: (sups first)))])]."</body>

<body package="TP_conflictos" selector="newConEscrutinio:cantidadDeRepresentantes:">newConEscrutinio: conteoDeVotos cantidadDeRepresentantes: cantidad	"Answer a newly created and initialized instance."	^super new initializeEscrutinio: conteoDeVotos cantidadDeRepresentantes: cantidad.</body>
</methods>


<methods>
<class-id>ResultadoConflictivo</class-id> <category>resolucionDeConflicto</category>

<body package="TP_conflictos" selector="representantes">representantes	^EleccionConflictivaException signalWith: self.</body>

<body package="TP_conflictos" selector="resolverConRepresentantes:Suplentes:">resolverConRepresentantes: representantes Suplentes: suplentes		representantes size = cantidadDeReps ifFalse: [ (Exception new raise)].	^ResultadoCompleto newConEscturinio: (self escrutinio) Representantes: representantes Suplentes: suplentes.</body>

<body package="TP_conflictos" selector="suplentes">suplentes	^EleccionConflictivaException signalWith: self.</body>
</methods>

<methods>
<class-id>ResultadoConflictivo</class-id> <category>initialize-release</category>

<body package="TP_conflictos" selector="initializeEscrutinio:cantidadDeRepresentantes:">initializeEscrutinio: conteoDeVotos cantidadDeRepresentantes: cantidad	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	cantidadDeReps := cantidad.	escrutinio := conteoDeVotos.	^self</body>
</methods>



</st-source>
