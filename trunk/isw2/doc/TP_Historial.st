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

<body package="TP_historial" selector="newConResultadoProfesores:resultadoGraduados:resultadoEstudiantes:">newConResultadoProfesores: resPro resultadoGraduados: resGrad resultadoEstudiantes: resEstu
</methods>


<methods>
<class-id>ActaElectoral</class-id> <category>accessing</category>

<body package="TP_historial" selector="representantesGraduados">representantesGraduados

<body package="TP_historial" selector="suplentesEstudiantes">suplentesEstudiantes

<body package="TP_historial" selector="suplentesProfesores">suplentesProfesores

<body package="TP_historial" selector="representantesEstudiantes">representantesEstudiantes

<body package="TP_historial" selector="suplentesGraduados">suplentesGraduados

<body package="TP_historial" selector="fecha">fecha

<body package="TP_historial" selector="representantesProfesores">representantesProfesores
</methods>

<methods>
<class-id>ActaElectoral</class-id> <category>initialize-release</category>

<body package="TP_historial" selector="initializeConResultadoProfesores:resultadoGraduados:resultadoEstudiantes:">initializeConResultadoProfesores: resPro resultadoGraduados: resGrad resultadoEstudiantes: resEstu 
</methods>


<methods>
<class-id>HistorialElecciones class</class-id> <category>instance creation</category>

<body package="TP_historial" selector="new">new
</methods>


<methods>
<class-id>HistorialElecciones</class-id> <category>accessing</category>

<body package="TP_historial" selector="listarElecciones">listarElecciones
</methods>

<methods>
<class-id>HistorialElecciones</class-id> <category>agregarElecciones</category>

<body package="TP_historial" selector="agregarEleccion:">agregarEleccion: actaElectoral
</methods>

<methods>
<class-id>HistorialElecciones</class-id> <category>initialize-release</category>

<body package="TP_historial" selector="initialize">initialize
</methods>



</st-source>