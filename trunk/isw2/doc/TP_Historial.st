<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.7.1 of 26 de julio de 2010 on 6 de octubre de 2011 at 16:45:23</time-stamp>


<component-created>
<name>TP_historial</name> <type>package</type>
</component-created><!-- Package TP_historial* -->


<component-created>
<name>TP_historial</name> <type>package</type>
</component-created>

<class>
<name>ActaElectoral</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>resultadoProfesores fechaDeConfeccionDelActa resultadoGraduados resultadoEstudiantes representantesEstudiantes representantesGraduados representantesProfesores suplentesEstudiantes suplentesGraduados suplentesProfesores </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>TP_historial</package>
</attributes>
</class>

<class>
<name>HistorialElecciones</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>eleccionesPasadas </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>TP_historial</package>
</attributes>
</class>

<methods>
<class-id>ActaElectoral class</class-id> <category>instance creation</category>

<body package="TP_historial" selector="newConResultadoProfesores:resultadoGraduados:resultadoEstudiantes:">newConResultadoProfesores: resPro resultadoGraduados: resGrad resultadoEstudiantes: resEstu	"Answer a newly created and initialized instance."		^super new initializeConResultadoProfesores: resPro resultadoGraduados: resGrad resultadoEstudiantes: resEstu </body>
</methods>


<methods>
<class-id>ActaElectoral</class-id> <category>accessing</category>

<body package="TP_historial" selector="representantesGraduados">representantesGraduados	^representantesGraduados.</body>

<body package="TP_historial" selector="suplentesEstudiantes">suplentesEstudiantes	^suplentesEstudiantes.</body>

<body package="TP_historial" selector="suplentesProfesores">suplentesProfesores	^suplentesProfesores.</body>

<body package="TP_historial" selector="representantesEstudiantes">representantesEstudiantes	^representantesEstudiantes.</body>

<body package="TP_historial" selector="suplentesGraduados">suplentesGraduados	^suplentesGraduados.</body>

<body package="TP_historial" selector="fecha">fecha	^fechaDeConfeccionDelActa.</body>

<body package="TP_historial" selector="representantesProfesores">representantesProfesores	^representantesProfesores.</body>
</methods>

<methods>
<class-id>ActaElectoral</class-id> <category>initialize-release</category>

<body package="TP_historial" selector="initializeConResultadoProfesores:resultadoGraduados:resultadoEstudiantes:">initializeConResultadoProfesores: resPro resultadoGraduados: resGrad resultadoEstudiantes: resEstu 	"Initialize a newly created instance. This method must answer the receiver."	representantesProfesores := resPro representantes.	representantesEstudiantes := resEstu representantes.	representantesGraduados := resGrad representantes.	suplentesProfesores := resPro suplentes.	suplentesEstudiantes := resEstu suplentes.	suplentesGraduados := resGrad suplentes.	resultadoProfesores := resPro.	resultadoGraduados := resGrad.	resultadoEstudiantes := resEstu.	fechaDeConfeccionDelActa := Date today.	^self</body>
</methods>


<methods>
<class-id>HistorialElecciones class</class-id> <category>instance creation</category>

<body package="TP_historial" selector="new">new	"Answer a newly created and initialized instance."	^super new initialize</body>
</methods>


<methods>
<class-id>HistorialElecciones</class-id> <category>accessing</category>

<body package="TP_historial" selector="listarElecciones">listarElecciones	^eleccionesPasadas. </body>
</methods>

<methods>
<class-id>HistorialElecciones</class-id> <category>agregarElecciones</category>

<body package="TP_historial" selector="agregarEleccion:">agregarEleccion: actaElectoral	eleccionesPasadas add: actaElectoral.</body>
</methods>

<methods>
<class-id>HistorialElecciones</class-id> <category>initialize-release</category>

<body package="TP_historial" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	" *** Replace this comment with the appropriate initialization code *** "	eleccionesPasadas := List new.	^self</body>
</methods>



</st-source>
