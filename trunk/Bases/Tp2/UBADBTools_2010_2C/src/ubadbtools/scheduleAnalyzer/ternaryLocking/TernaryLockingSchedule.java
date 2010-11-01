package ubadbtools.scheduleAnalyzer.ternaryLocking;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import ubadbtools.scheduleAnalyzer.common.Action;
import ubadbtools.scheduleAnalyzer.common.Schedule;
import ubadbtools.scheduleAnalyzer.common.ScheduleArc;
import ubadbtools.scheduleAnalyzer.common.ScheduleGraph;
import ubadbtools.scheduleAnalyzer.common.ScheduleType;
import ubadbtools.scheduleAnalyzer.common.results.LegalResult;

public class TernaryLockingSchedule extends Schedule
{
	//[start] Add Actions
	public void addAction(Action action)
	{
		actions.add((TernaryLockingAction)action);
	}

	public void addRLock(String transaction, String item)
	{
		actions.add(new TernaryLockingAction(TernaryLockingActionType.RLOCK, transaction, item));
	}

	public void addWLock(String transaction, String item)
	{
		actions.add(new TernaryLockingAction(TernaryLockingActionType.WLOCK, transaction, item));
	}

	public void addUnlock(String transaction, String item)
	{
		actions.add(new TernaryLockingAction(TernaryLockingActionType.UNLOCK, transaction, item));
	}

	public void addCommit(String transaction)
	{
		actions.add(new TernaryLockingAction(TernaryLockingActionType.COMMIT, transaction));
	}
	public ScheduleType getType()
	{
		return ScheduleType.TERNARY_LOCKING;
	}
	//[end]

	//[start] buildScheduleGraph
	@Override
	public ScheduleGraph buildScheduleGraph()
	{
		//TODO: Completar
		//Se deben agregar arcos entre T1 -> T2 cuando:
		//- T1 hace Rlock de un ítem A y T2 luego hace WLock de A
		//- T1 hace Wlock de un ítem A y T2 luego hace RLock de A
		//- T1 hace Wlock de un ítem A y T2 luego hace WLock de A
		//OBS1: No hay arcos entre RLocks sobre el mismo ítem
		//OBS2: No agregar arcos que se deducen por transitividad

		ScheduleGraph graph = new ScheduleGraph();

		//aca se guarda la info de los ejes ya puestos para no repetirlos
		Map<String, Set<String> > edges = new HashMap<String, Set<String> >();

		for(String transaccion: getTransactions()){
			//se agrega un nodo en el grafo
			graph.addTransaction(transaccion);
			//se agrega entrada en el mapa
			edges.put(transaccion, new HashSet<String>());
		}

		for(Action actualAction: getActions()){

			String actualTransaction = actualAction.getTransaction();

			//Si Ti hace WLock de X y Tj (i<>j) hace RLock de X, (antes que cualquier otra
			//haga WLock de X), se hace un arco Ti -> Tj
			if (actualAction.writes()){
				for(Action action: getActions()){

					String transaction = action.getTransaction();
					if (canBeAConflictBetween(actualAction, action,
					actualTransaction, transaction)){

						if (action.reads() &&
						!edges.get(actualTransaction).contains(transaction)){

							addEdge(graph, edges, actualAction, action,
							actualTransaction, transaction);
						}
						else if (action.writes()){
							break;
						}
					}
				}
			}
			//Si Ti hace RLock o WLock de X, y luego Tj es la próxima que hace WLock de X
			//(i<>j), se hace un arco Ti -> Tj
			for(Action action: getActions()){
				String transaction = action.getTransaction();

				if (canBeAConflictBetween(actualAction, action, actualTransaction,
				transaction) &&	action.writes() &&
				!edges.get(actualTransaction).contains(transaction)){

					addEdge(graph, edges, actualAction, action,
					actualTransaction, transaction);
					break;
				}
			}
		}
		return graph;
	}
	//[end]

	private boolean canBeAConflictBetween(Action actualAction, Action action,
	String actualTransaction, String transaction) {
		return
		//si una accion ocurre despues de la otra
		getActions().indexOf(action) >
		getActions().indexOf(actualAction) &&
		//pertenecen a transacciones distintas
		actualTransaction != transaction &&
		//y actuan sobre el mismo item
		action.getItem() == actualAction.getItem();
	}

	private void addEdge(ScheduleGraph graph, Map<String, Set<String>> edges,
	Action actualAction, Action action, String actualTransaction,
	String transaction) {
		//se agrega el eje al grafo
		ScheduleArc arc = new ScheduleArc(actualTransaction,transaction,
		getActions().indexOf(actualAction), getActions().indexOf(action));
		graph.addArc(arc);
		//se guarda informacion para no volver a poner un eje entre esas transacciones
		Set<String> set = edges.get(actualTransaction);
		set.add(transaction);
		edges.put(actualTransaction, set);
	}

	//[start] analyzeLegality


    private class ControlAnalisisTernario{
    	private Map<String,Set<String> > rlockeados; //Item -> conj de transacciones
    	private Map<String,String> wlockeados; //Item -> Transaccion

    	public ControlAnalisisTernario(){
    		rlockeados = new HashMap<String, Set<String> >();
    		wlockeados = new HashMap<String, String>();
    	}
    	// un estado es legal (en el sentido de posible estado final) si
    	// ninguna transaccion tiene nada loqueado
    	public Boolean estadoLegal(){
    		return rlockeados.isEmpty() && wlockeados.isEmpty();
    	}

    	// Devuelve una transaccion que tiene algun item lockeado
    	public String transaccionConLock(){
    		if (!wlockeados.isEmpty()){
    			return wlockeados.values().iterator().next();
    		}
    		else if(!rlockeados.isEmpty()){
    			return rlockeados.get(rlockeados.keySet().iterator().next()).iterator().next();
    		}
    		else{
    			return null;
    		}

    	}
    	public Boolean estaRLockeado(String item){
    		if( rlockeados.containsKey(item)){
    			return true;
    		}
    		else{
    			return false;
    		}
    	}
    	public Boolean estaWLockeado(String item){
    		if( wlockeados.containsKey(item)){
    			return true;
    		}
    		else{
    			return false;
    		}
    	}
    	public Boolean estaLockeado(String item){
    		return (rlockeados.containsKey(item) || wlockeados.containsKey(item));
    	}
    	public Boolean puedeRLockear(String item, String transaccion){
    		/* puede rlockear si:
    		 * - el item no esta wlockeado
    		 * - la transaccion no lo tiene ya rlockeado
    		 */
    		if(wlockeados.containsKey(item)){
    			return false;
    		}
    		if(rlockeados.containsKey(item)){
    			if(rlockeados.get(item).contains(transaccion)){
    				return false;
    			}
    		}
    		return true;
    	}
    	public Boolean puedeWLockear(String item, String transaccion){
    		/* puede wlockear si:
    		 * - el item no esta wlockeado
    		 *- si el item esta rlockeado, solo lo esta por la transaccion
    		 */
    		if(wlockeados.containsKey(item)){
    			return false;
    		}
    		if(rlockeados.containsKey(item)){
    			if(rlockeados.get(item).size() == 1 && rlockeados.get(item).contains(transaccion)){
    				return true;
    			}
    			else{
    				return false;
    			}
    		}
    		return true;
    	}

    	public void wlockear(String item, String transaccion) {
    		if(puedeWLockear(item,transaccion)){
    			wlockeados.put(item, transaccion);
    			if(rlockeados.containsKey(item)){
    			   rlockeados.remove(item);
    			}
    		}
    	}

    	public void rlockear(String item, String transaccion) {
    		if(puedeRLockear(item, transaccion)){
    			if(rlockeados.containsKey(item)){
    				rlockeados.get(item).add(transaccion);
    			}
    			else{
    				Set<String> s = new HashSet<String>();
    				s.add(transaccion);
    				rlockeados.put(item, s );
    			}
    		}
    	}

    	public Boolean puedeUnlockear(String item, String transaccion){
    		/* puede wlockear si:
    		 * - la transaccion lo tiene rlockeado al item
    		 * - la transaccion lo tiene wlockeado
    		 */
    		return
    		((estaRLockeado(item) && rlockeados.get(item).contains(transaccion)) ||
    		 (estaWLockeado(item) && wlockeados.get(item) == transaccion));
    	}

    	public void unlockear(String item, String transaccion) {
             if(puedeUnlockear(item, transaccion)){
            	 if(estaWLockeado(item)){
            		 wlockeados.remove(item);
            	 }
            	 else{
            		 rlockeados.get(item).remove(transaccion);
            		 if (rlockeados.get(item).isEmpty()){
            			 rlockeados.remove(item);
            		 }
            	 }
             }

    	}

    }
	@Override
	public LegalResult analyzeLegality()
	{
		//TODO: Completar
		//Un schedule es legal cuando:
		//- Cada transacción T posee como máximo un commit
		//- Si T hace RLOCK A o WLOCK A, luego debe hacer UNLOCK A
		//- Si T hace UNLOCK A, antes debe haber hecho RLOCK A o WLOCK A
		//- Si T hace RLOCK A o WLOCK A, no puede volver a hacer RLOCK A o WLOCK A a menos que antes haya hecho UNLOCK A
		//- Si T hace RLOCK A, ninguna otra transacción T' puede hacer WLOCK A hasta que T libere a A
		//- Si T hace WLOCK A, ninguna otra transacción T' puede hacer RLOCK A o WLOCK A hasta que T libere a A

        ControlAnalisisTernario control = new ControlAnalisisTernario();
        Set<String> yaComiteo = new HashSet<String>();
        for(Action accionGenerica: getActions()){

        	TernaryLockingAction accion = (TernaryLockingAction) accionGenerica;
        	String transaccion = accion.getTransaction();
        	String item = accion.getItem();
        	// Chequeo de varios commits
        	if(yaComiteo.contains(transaccion) &&  ! accion.getType().equals(TernaryLockingActionType.UNLOCK)){
        		return new LegalResult(false,transaccion,transaccion.concat(" intenta realizar operaciones que no son unlock despues del commit"));
        	}

        	// caso commit
        	if(accion.getType().equals(TernaryLockingActionType.COMMIT)){
        		yaComiteo.add(transaccion);
        	}

        	// caso rlock
        	else if(accion.getType().equals(TernaryLockingActionType.RLOCK)){
        		if(control.puedeRLockear(item, transaccion)){
        			control.rlockear(item, transaccion);
        		}
        		else{
        			return new LegalResult(false, transaccion, transaccion.concat(" intenta hacer un rlock invalido"));
        		}
        	}

        	// caso wlock
        	else if(accion.getType().equals(TernaryLockingActionType.WLOCK)){
        		if(control.puedeWLockear(item, transaccion)){
        			control.wlockear(item, transaccion);
        		}

        		else{
        			return new LegalResult(false, transaccion, transaccion.concat(" intenta hacer un wlock invalido"));
        		}

        	}

        	// caso unlock
        	else{
        		if(control.puedeUnlockear(item, transaccion)){
        				control.unlockear(item, transaccion);

        		}
        		else{
        			return new LegalResult(false, transaccion, transaccion.concat(" intenta hacer un unlock invalido"));
        		}
        	}

        }

        // chequeamos que quedaran todos los items liberados
		if(control.estadoLegal()){
			return new LegalResult(true,null,null);
		}
		else{
			String transaccion = control.transaccionConLock();
			return new LegalResult(false,transaccion, transaccion.concat(" tiene un lock que no libera"));
		}
	}
	//[end]
}
