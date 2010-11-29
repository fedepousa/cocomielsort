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
import ubadbtools.queryOptimizer.common.conditions.LiteralOperand;
import ubadbtools.queryOptimizer.common.conditions.QueryCondition;
import ubadbtools.queryOptimizer.common.conditions.QueryConditionOperand;
import ubadbtools.queryOptimizer.common.conditions.QueryConditionOperator;
import ubadbtools.queryOptimizer.common.conditions.QuerySingleCondition;
import ubadbtools.queryOptimizer.common.join.JoinNode;
import ubadbtools.queryOptimizer.common.projection.ProjectionNode;
import ubadbtools.queryOptimizer.common.relation.RelationNode;

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
	
	public List<String> tablas(QueryNode qN){
		//Devuelve una lista con los alias de las tablas involucrados de ahi para abajos
		
		//Si es una proyeccion llamo para abajo
		if(qN.isProjection() || qN.isSelection()){
			return tablas(((QuerySingleInputNode) qN).getLowerNode());
		}
		
		
		List<String> resultado = new ArrayList<String>();
		
		//Si es un join/naturalJoin/producto
		//el resultado es apendear el resultado de la llamada recursiva de sus hijos
		if(qN.isJoin()  || qN.isNaturalJoin() || qN.isProduct() ){
			List<String> tablaIzq = tablas(( (QueryDoubleInputNode) qN).getLeftLowerNode());
			List<String> tablaDer = tablas(( (QueryDoubleInputNode) qN).getRightLowerNode());
			//apendeo las listas
			for(String nuevo : tablaDer){
				resultado.add(nuevo);
			}
			for(String nuevo : tablaIzq){
				resultado.add(nuevo);
			}
			return resultado;
		}
		
		//Si es una relacion agrego el alias a la lista.
		if(qN.isRelation()){
			
			resultado.add( ((RelationNode ) qN).getRelationAlias());
							
		}
		
		return resultado;
	
		
		
		
		}
		
	public Map<String, Set<String> > copioDiccionario(Map<String, Set<String> > dic){
		//hace una copia del diccionario dic al diccionario copia
		
		Map<String, Set<String> > resultado = new HashMap<String, Set<String>>();
		for (String clave : dic.keySet()){
			//TODO: Estoy suponiendo que el conjunto (dic.get(clave)) se copia
			resultado.put(clave, dic.get(clave));
		}
		
		return resultado;
	
	}
	

	
	
	public void resolve(QueryNode qN){
	
		
		 
		
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
				
					
			//Creamos nodo de proyeccion
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
		if( qN.isProduct()){
			//me guardo el diccionario como backup
			Map<String,Set<String> > diccionario_backUp = copioDiccionario(diccionario);
			
			//Creo la lista de relaciones involucradas de izquierda
			List< String> relacionesInvolucradasIzquierda = new ArrayList<String>();
			relacionesInvolucradasIzquierda = tablas(((QueryDoubleInputNode) qN).getLeftLowerNode() );
			
			//borro del diccionario las claves de tablas que no esten involucradas de ahi para abajo (en hijo izquierda)
			Set<String> dic_Set = diccionario.keySet();
			for(String clave  : dic_Set ){
				//Si la clave no esta involucrada, la borro
				if (! (relacionesInvolucradasIzquierda.contains(clave))){
					diccionario.remove(clave);
				}
				
			}
			
			//Llamo a la funcion con la rama izquierda
			resolve( ((QueryDoubleInputNode) qN).getLeftLowerNode() );
			
			
			
					
			//Reestablezco el diccionario original
			diccionario.clear();
			diccionario = copioDiccionario(diccionario_backUp);
			
			
			
			//Creo la lista de relaciones involucradas de derecha
			List< String> relacionesInvolucradasDerecha = new ArrayList<String>();
			relacionesInvolucradasDerecha = tablas(((QueryDoubleInputNode) qN).getRightLowerNode() );
			
			//borro del diccionario las claves de tablas que no esten involucradas de ahi para abajo (en hijo derecha)
			dic_Set = diccionario.keySet();
			for(String clave  : dic_Set ){
				//Si la clave no esta involucrada, la borro
				if (! (relacionesInvolucradasDerecha.contains(clave))){
					diccionario.remove(clave);
				}
				
			}
			
			//Llamo a la funcion con la rama derecha
			resolve( ((QueryDoubleInputNode) qN).getRightLowerNode() );
			
		return ;
		}
					

		
		
		//Si es Join
		if( qN.isJoin()){
			//TODO: Falta agregar las condiciones del join
			
			//Interpreto la condicion del join
			QueryCondition condicion = ((JoinNode) qN).getCondition();
			QueryConditionOperator operando = ((QuerySingleCondition) condicion).getOperator();
			QueryConditionOperand op1 = ((QuerySingleCondition) condicion).getLeftOperand();
			QueryConditionOperand op2 = ((QuerySingleCondition) condicion).getRightOperand();
			//Aca no se como saber si son FieldOperand o LiteralOperand, necesitamos saberlo para ver como pusheamos en el diccionario
			
			
			
			
			
			
			//me guardo el diccionario como backup
			Map<String,Set<String> > diccionario_backUp = copioDiccionario(diccionario);
			
			//Creo la lista de relaciones involucradas de izquierda
			List< String> relacionesInvolucradasIzquierda = new ArrayList<String>();
			relacionesInvolucradasIzquierda = tablas(((QueryDoubleInputNode) qN).getLeftLowerNode() );
			
			//borro del diccionario las claves de tablas que no esten involucradas de ahi para abajo (en hijo izquierda)
			Set<String> dic_Set = diccionario.keySet();
			for(String clave  : dic_Set ){
				//Si la clave no esta involucrada, la borro
				if (! (relacionesInvolucradasIzquierda.contains(clave))){
					diccionario.remove(clave);
				}
				
			}
			
			//Llamo a la funcion con la rama izquierda
			resolve( ((QueryDoubleInputNode) qN).getLeftLowerNode() );
			
			
			
			//Reestablezco el diccionario original
			diccionario.clear();
			diccionario = copioDiccionario(diccionario_backUp);
			
			//Creo la lista de relaciones involucradas de derecha
			List< String> relacionesInvolucradasDerecha = new ArrayList<String>();
			relacionesInvolucradasDerecha = tablas(((QueryDoubleInputNode) qN).getRightLowerNode() );
			
			//borro del diccionario las claves de tablas que no esten involucradas de ahi para abajo (en hijo derecha)
			dic_Set = diccionario.keySet();
			for(String clave  : dic_Set ){
				//Si la clave no esta involucrada, la borro
				if (! (relacionesInvolucradasDerecha.contains(clave))){
					diccionario.remove(clave);
				}
				
			}
			
			//Llamo a la funcion con la rama derecha
			resolve( ((QueryDoubleInputNode) qN).getRightLowerNode() );
			
		return ;
		}
		
		
		
		//Si es NaturalJoin
		if( qN.isJoin()){
			//TODO: infiero las condicciones de junta y las agrego al diccionario
			
			//me guardo el diccionario como backup
			Map<String,Set<String> > diccionario_backUp = copioDiccionario(diccionario);
			
			//Creo la lista de relaciones involucradas de izquierda
			List< String> relacionesInvolucradasIzquierda = new ArrayList<String>();
			relacionesInvolucradasIzquierda = tablas(((QueryDoubleInputNode) qN).getLeftLowerNode() );
			
			//borro del diccionario las claves de tablas que no esten involucradas de ahi para abajo (en hijo izquierda)
			Set<String> dic_Set = diccionario.keySet();
			for(String clave  : dic_Set ){
				//Si la clave no esta involucrada, la borro
				if (! (relacionesInvolucradasIzquierda.contains(clave))){
					diccionario.remove(clave);
				}
				
			}
			
			//Llamo a la funcion con la rama izquierda
			resolve( ((QueryDoubleInputNode) qN).getLeftLowerNode() );
			
			
			
			//Reestablezco el diccionario original
			diccionario.clear();
			diccionario = copioDiccionario(diccionario_backUp);
			
			//Creo la lista de relaciones involucradas de derecha
			List< String> relacionesInvolucradasDerecha = new ArrayList<String>();
			relacionesInvolucradasDerecha = tablas(((QueryDoubleInputNode) qN).getRightLowerNode() );
			
			//borro del diccionario las claves de tablas que no esten involucradas de ahi para abajo (en hijo derecha)
			dic_Set = diccionario.keySet();
			for(String clave  : dic_Set ){
				//Si la clave no esta involucrada, la borro
				if (! (relacionesInvolucradasDerecha.contains(clave))){
					diccionario.remove(clave);
				}
				
			}
			
			//Llamo a la funcion con la rama derecha
			resolve( ((QueryDoubleInputNode) qN).getRightLowerNode() );
			
		return ;
		}
		
				
		//si es una relacion
		if(qN.isRelation()){
			//Creamos la lista de querys fields
			List<QueryField> lista = new ArrayList<QueryField>();
			
			for(String clave : diccionario.keySet()){
				for (String significado : diccionario.get(clave)){
					//Para cada clave, para cada significado
					QueryField nuevaQ = new QueryField(clave, significado);
					lista.add(nuevaQ);
										
				}
				
			}
				
					
			//Creamos nodo de proyeccion
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
				
				return ;
			
		}
		
			
		

		
	
		
	}
	
	
	
	
		

		
		
		
	}

