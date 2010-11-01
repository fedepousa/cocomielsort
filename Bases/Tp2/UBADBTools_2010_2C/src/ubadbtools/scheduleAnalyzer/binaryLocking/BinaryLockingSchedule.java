package ubadbtools.scheduleAnalyzer.binaryLocking;

import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import ubadbtools.scheduleAnalyzer.common.Action;
import ubadbtools.scheduleAnalyzer.common.Schedule;
import ubadbtools.scheduleAnalyzer.common.ScheduleArc;
import ubadbtools.scheduleAnalyzer.common.ScheduleGraph;
import ubadbtools.scheduleAnalyzer.common.ScheduleType;
import ubadbtools.scheduleAnalyzer.common.results.LegalResult;

public class BinaryLockingSchedule extends Schedule
{
	//[start] Add Actions
	public void addAction(Action action)
	{
		actions.add((BinaryLockingAction)action);
	}

	public void addLock(String transaction, String item)
	{
		actions.add(new BinaryLockingAction(BinaryLockingActionType.LOCK, transaction, item));
	}

	public void addUnlock(String transaction, String item)
	{
		actions.add(new BinaryLockingAction(BinaryLockingActionType.UNLOCK, transaction, item));
	}

	public void addCommit(String transaction)
	{
		actions.add(new BinaryLockingAction(BinaryLockingActionType.COMMIT, transaction));
	}
	public ScheduleType getType()
	{
		return ScheduleType.BINARY_LOCKING;
	}
	//[end]


	//[start] buildScheduleGraph
	@Override
	public ScheduleGraph buildScheduleGraph()
	{
		//TODO: Completar
		//Se deben agregar arcos entre T1 -> T2 cuando:
		//- T1 hace lock de un ítem A y T2 hace lock de A
		//OBS: No agregar arcos que se deducen por transitividad
		ScheduleGraph sg = new ScheduleGraph();
		for(String transaccion: getTransactions()){
			sg.addTransaction(transaccion);
		}

        Map<String,List<Par<BinaryLockingAction,Integer> > > operXItem;
        operXItem = new HashMap<String, List<Par<BinaryLockingAction,Integer> > >();

        for(String item:getItems()){
        	operXItem.put(item, new LinkedList<Par<BinaryLockingAction,Integer>>());
        }
        int i = 1;
        // separo acciones por item para hacer mas facil la busqueda de ejes
        for(Action accionGenerica : getActions()){
        	BinaryLockingAction accion = (BinaryLockingAction) accionGenerica;

        	// solo guardamos los locks
            if( accion.getType().equals(BinaryLockingActionType.LOCK)){

            // al igual que antes, el indice sirve para saber en
            // que parte de la historia esta la accion
        	operXItem.get(accion.getItem()).add(new Par<BinaryLockingAction, Integer>(accion, i));

            }
            i=i+1;
        }

        //diccionario para evitar ejes repetidos
        Map<String,Set<String>> ejesYaPuestos = new HashMap<String, Set<String>>();

        for(String transaccion:getTransactions()){
        	ejesYaPuestos.put(transaccion, new HashSet<String>());
        }

        for(String item: getItems()){
        	List<Par<BinaryLockingAction,Integer>> operaciones = operXItem.get(item);
            int tam = operaciones.size();
            for (int j = 0; j < tam-1; j++) {
            	BinaryLockingAction operacionActual = operaciones.get(0).fst;
            	Integer indiceActual = operaciones.get(0).snd;
            	String transaccionActual = operacionActual.getTransaction();
            	operaciones.remove(0);
            	String proximaTransaccion =operaciones.get(0).fst.getTransaction();
                /* si es la misma transaccion, paro de buscar ejes porque los agarro
                 * la siguiente accion
                 */
            	if(!(proximaTransaccion == transaccionActual)){
            		 //si se genera un eje nuevo, lo agrego
                     if(!ejesYaPuestos.get(transaccionActual).contains(proximaTransaccion)){

            		 sg.addArc(new ScheduleArc(transaccionActual,
            						       proximaTransaccion,
            						       indiceActual, operaciones.get(0).snd));
            		 ejesYaPuestos.get(transaccionActual).add(proximaTransaccion);
                     }
               }
               else {
            	    break;
            	}
            }
        }
		return sg;
	}

	//[end]

	//[start] analyzeLegality
	@Override
	public LegalResult analyzeLegality()
	{
		//TODO: Completar
		//Un schedule es legal cuando:
		//- Cada transacción T posee como máximo un commit
		//- Si T hace LOCK A, luego debe hacer UNLOCK A
		//- Si T hace UNLOCK A, antes debe haber hecho LOCK A
		//- Si T hace LOCK A, no puede volver a hacer LOCK A a menos que antes haya hecho UNLOCK A
		//- Si T hace LOCK A, ninguna otra transacción T' puede hacer LOCK A hasta que T libere a A
		Map<String,Boolean> tuvoCommit = new HashMap<String, Boolean>();
		Map<String, String> lockeados = new HashMap<String, String>();
		for(String transaccion:getTransactions()){
			tuvoCommit.put(transaccion,false );
		}
		for(Action accionGenerica:getActions() ){
			BinaryLockingAction accion = (BinaryLockingAction) accionGenerica;
			String transaccionActual = accion.getTransaction();
			//la transaccion hace un commit
			if(accion.commits()){
				if(tuvoCommit.get(transaccionActual)){
					return new LegalResult(false,transaccionActual,"Mas de un commit");
				}
				tuvoCommit.put(transaccionActual, true);
			}

			else{
			    if(tuvoCommit.get(transaccionActual)){
				     if(accion.getType().equals(BinaryLockingActionType.UNLOCK)){
	                    // si hago unlock el item tiene q estar lockeado y ademas por mi
	                    if((!(lockeados.containsKey(accion.getItem())) )|| lockeados.get(accion.getItem()) != transaccionActual){
	                            return new LegalResult(false,transaccionActual, "Intento de unlock de un item que no tiene lockeado");
	                    }

				   }
				   else {
				       return new LegalResult(false,transaccionActual,"Hay una accion que no es un unlock despues de un commit");
				   }
				}
                // Si hago lock tengo que ver que el item no este lockeado previamente
				if(accion.getType().equals(BinaryLockingActionType.LOCK)){
					if(lockeados.containsValue(accion.getItem())){
						return new LegalResult(false,transaccionActual,"Intento de lockear un item lockeado");
					}
					else{
						lockeados.put(accion.getItem(), transaccionActual);
					}
				}

				else if(accion.getType().equals(BinaryLockingActionType.UNLOCK)){
					// si hago unlock el item tiene q estar lockeado y ademas por mi
					if((!(lockeados.containsKey(accion.getItem())) )|| lockeados.get(accion.getItem()) != transaccionActual){
                            return new LegalResult(false,transaccionActual, "Intento de unlock de un item que no tiene lockeado");
				    }
					else{
						lockeados.remove(accion.getItem());
					}
				}
			}
		}
		// tiene que quedar todo sin lockear
		if(lockeados.keySet().isEmpty()){
		     return new LegalResult(true,null,null);
		}
		else{
			return new LegalResult(false, lockeados.values().iterator().next(), lockeados.values().iterator().next().concat(" no hace unlock de todo lo que lockeo"));
		}
	}
	//[end]
}
