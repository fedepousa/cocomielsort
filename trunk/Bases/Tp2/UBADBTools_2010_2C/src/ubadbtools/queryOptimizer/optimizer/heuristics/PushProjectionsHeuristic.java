package ubadbtools.queryOptimizer.optimizer.heuristics;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import ubadbtools.queryOptimizer.common.QueryDoubleInputNode;
import ubadbtools.queryOptimizer.common.QueryField;
import ubadbtools.queryOptimizer.common.QueryNode;
import ubadbtools.queryOptimizer.common.QuerySingleInputNode;
import ubadbtools.queryOptimizer.common.projection.ProjectionNode;

/**
 * 
 * Bajar proyecciones (OJO, no hasta las hojas sino hasta la �ltima selecci�n -en caso de que la hubiera, sino s� hasta la hoja-)
 *
 */
public class PushProjectionsHeuristic extends Heuristic
{
	
	Map<String,Set<String> > diccionario;
	
	
	public PushProjectionsHeuristic()
	{
		//Agrego dependencia
		previousHeuristic = new PushSelectionsHeuristic();
	}
	
	@Override
	protected void internalApplyHeuristic(QueryNode qN)
	{
		
		 this.diccionario = new HashMap<String,Set<String> >();
		 resolve(qN);
		 System.out.println("PushProjectionsHeuristic");
	}
	
	public void resolve(QueryNode qN){
	
		// TODO Auto-generated method stub

		
		//Creamos diccionario que vamos a ir llevando para abajo
	 
		
		//Si es proyeccion
		if(qN.isProjection()){
			//Lo unico que quiero hacer es agregar info al diccionario y llamar a mi hijo.
			
			//Me devuelve una lista con todos los campos a proyectar
			List<QueryField> aux = ((ProjectionNode) qN).getProjectedFields();
			
			//Itero para cada elemento de la lista
			for(QueryField actual : aux){
				//Si la clave ya estaba definida en el diccionario
				if(diccionario.containsKey(actual.getRelationAlias())){
					//Tomo el conjunto de definicion
					Set<String> aux2 = diccionario.get(actual.getRelationAlias());
					//Agrego la nueva parte de definicion
					aux2.add(actual.getFieldName());
					diccionario.put(actual.getRelationAlias(),aux2);
					
				}else{
				//Si la clave no estaba	
					Set<String> aux2 = new HashSet<String>();
					aux2.add(actual.getFieldName());
					diccionario.put(actual.getRelationAlias(),aux2);
				}
				//Sigo con la funcion para abajo
				resolve(((QuerySingleInputNode) qN).getLowerNode());
			}
			
		return ;	
		}
		
		
		//Si es seleccion
		if(qN.isSelection()){
		//Voy a querer crear un nodo nuevo de proyeccion con los atributos del diccionario, linkearlo con this y su padre, y llamar para abajo 
		//para que siga el algortimo. (diccionario para abajo = diccionaro antes + lo que use la seleccion

			//Creamos la lista de querys fields
			List<QueryField> lista = new ArrayList<QueryField>();
			
			for(String clave : diccionario.keySet()){
				for (String significado : diccionario.get(clave)){
					//Para cada clave, para cada significado
					QueryField nuevaQ = new QueryField(clave, significado);
					lista.add(nuevaQ);
										
				}
				
			}
				
					
			//Creamos nodo se proyeccion
			ProjectionNode nuevoNodo = new ProjectionNode(lista);
			
			//Linkeamos
			// nuevo -> qN
				nuevoNodo.linkWith(qN);
			//qn.padre->nuevo
				//Le preguntamos al padre si es Single o Double
				if (qN.getUpperNode().getClass().equals(QuerySingleInputNode.class)){
					//Si es single
					((QuerySingleInputNode) (qN.getUpperNode())).linkWith(nuevoNodo);
				}else{
					//Es double entonce lo casteamos bien
					QueryDoubleInputNode padre = ((QueryDoubleInputNode) (qN.getUpperNode()));
					if(padre.getLeftLowerNode().equals(qN)){
						//Si qN era hijo izquierda
						//Lo agregamos a la izquierda
						padre.linkWith(nuevoNodo, padre.getRightLowerNode());
					}else{
						//Si qN era hijo izquierda
						//Lo agregamos a la izquierda
						padre.linkWith(padre.getLeftLowerNode(), nuevoNodo);			
					}
				}
			
			//Llamos para abajo
			resolve(((QuerySingleInputNode) qN).getLowerNode());			
		
			return;
		}
		
		
		
		
		//Si es producto
			
			//me guardo el diccionario como backup
		
				//calculo las tablas presentes en la rama izquierda
				//saco del diccionario lo sobrante 
				//Llamo a rama izquirda
			
		
			//cuando termina, reestablezco diccionario
			
				//calculo las tablas presentes en la rama derecha
				//saco del diccionario lo sobrante 
				//llamo a rama derecha
		
				
		//Si es join
			// agregamos al diccionario la condicion de junta
			//hago lo mismo de producto
		
		//Si es natural join
			//infiero las condicciones de junta y las agrego al diccionario
			//hago lo mismo de producto
		
			
		
		//Si es relacion
			//Creo un nodo projeccion con el diccionario
			//No tiene llamda recursiva
			//No modifico el diccionario
		
	
		
	}
	
	
	
	
		

		
		
		
	}

