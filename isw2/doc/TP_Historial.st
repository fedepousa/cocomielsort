<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on October 5, 2011 at 11:25:55 am</time-stamp>
<!-- Package TP_Historial* -->


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
<package>TP_Historial</package>
</attributes>
</class>

<class>
<name>ActaElectoral</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>resultadoProfesores cantidadVotosEnBlanco fechaDeConfeccionDelActa resultadoGraduados resultadoEstudiantes representantesEstudiantes representantesGraduados representantesProfesores suplentesEstudiantes suplentesGraduados suplentesProfesores </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>TP_Historial</package>
</attributes>
</class>



<methods>
<class-id>HistorialElecciones class</class-id> <category>instance creation</category>

<body package="TP_Historial" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>


<methods>
<class-id>HistorialElecciones</class-id> <category>accessing</category>

<body package="TP_Historial" selector="listarElecciones">listarElecciones

	^eleccionesPasadas. </body>
</methods>

<methods>
<class-id>HistorialElecciones</class-id> <category>agregarElecciones</category>

<body package="TP_Historial" selector="agregarEleccion:">agregarEleccion: actaElectoral

	eleccionesPasadas add: actaElectoral.</body>
</methods>

<methods>
<class-id>HistorialElecciones</class-id> <category>initialize-release</category>

<body package="TP_Historial" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Replace this comment with the appropriate initialization code *** "
	eleccionesPasadas := List new.
	^self</body>
</methods>


<methods>
<class-id>ActaElectoral class</class-id> <category>instance creation</category>

<body package="TP_Historial" selector="newConResultadoProfesores:resultadoGraduados:resultadoEstudiantes:votosEnBlanco:">newConResultadoProfesores: resPro resultadoGraduados: resGrad resultadoEstudiantes: resEstu votosEnBlanco: blancos
	"Answer a newly created and initialized instance."
	
	^super new initializeConResultadoProfesores: resPro resultadoGraduados: resGrad resultadoEstudiantes: resEstu votosEnBlanco: blancos</body>
</methods>


<methods>
<class-id>ActaElectoral</class-id> <category>accessing</category>

<body package="TP_Historial" selector="representantesEstudiantes">representantesEstudiantes
	^representantesEstudiantes.</body>

<body package="TP_Historial" selector="fecha">fecha

	^fechaDeConfeccionDelActa.</body>

<body package="TP_Historial" selector="suplentesEstudiantes">suplentesEstudiantes

	^suplentesEstudiantes.</body>

<body package="TP_Historial" selector="suplentesGraduados">suplentesGraduados

	^suplentesGraduados.</body>

<body package="TP_Historial" selector="representantesGraduados">representantesGraduados
	^representantesGraduados.</body>

<body package="TP_Historial" selector="cantidadDeVotosEnBlanco">cantidadDeVotosEnBlanco
	
	^cantidadVotosEnBlanco.</body>

<body package="TP_Historial" selector="representantesProfesores">representantesProfesores
	^representantesProfesores.</body>

<body package="TP_Historial" selector="suplentesProfesores">suplentesProfesores

	^suplentesProfesores.</body>
</methods>

<methods>
<class-id>ActaElectoral</class-id> <category>initialize-release</category>

<body package="TP_Historial" selector="initializeConResultadoProfesores:resultadoGraduados:resultadoEstudiantes:votosEnBlanco:">initializeConResultadoProfesores: resPro resultadoGraduados: resGrad resultadoEstudiantes: resEstu votosEnBlanco: blancos
	"Initialize a newly created instance. This method must answer the receiver."
	representantesProfesores := resPro representates.
	representantesEstudiantes := resEstu representates.
	representantesGraduados := resGrad representates.
	resultadoProfesores := resPro.
	resultadoGraduados := resGrad.
	resultadoEstudiantes := resEstu.
	cantidadVotosEnBlanco := blancos.
	fechaDeConfeccionDelActa := Date today.
	^self</body>
</methods>



</st-source>
