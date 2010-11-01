package ubadbtools.scheduleAnalyzer.common;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import ubadbtools.scheduleAnalyzer.common.results.LegalResult;
import ubadbtools.scheduleAnalyzer.common.results.RecoverabilityResult;
import ubadbtools.scheduleAnalyzer.common.results.RecoverabilityType;
import ubadbtools.scheduleAnalyzer.common.results.SerialResult;
import ubadbtools.scheduleAnalyzer.common.results.SerializabilityResult;
import ubadbtools.scheduleAnalyzer.exceptions.ScheduleException;


public abstract class Schedule
{
	//[start] Atributos
	private List<String> transactions;
	protected List<String> items;
	protected List<Action> actions;

	public List<String> getTransactions()
	{
		return transactions;
	}
	public List<String> getItems()
	{
		return items;
	}
	public List<Action> getActions()
	{
		return actions;
	}
	public abstract void addAction(Action action);
	public abstract ScheduleType getType();
	//[end]

	//[start] Constructor
	public Schedule()
	{
		transactions = new ArrayList<String>();
		items		 = new ArrayList<String>();
		actions 	 = new ArrayList<Action>();
	}
	//[end]

	//[start] addTransaction
	public void addTransaction(String transaction) throws ScheduleException
	{
		if(getTransactions().contains(transaction))
			throw new ScheduleException("Ya existe una transacción con ese nombre");
		else
			getTransactions().add(transaction);
	}
	//[end]

	//[start] addItem
	public void addItem(String item) throws ScheduleException
	{
		if(items.contains(item))
			throw new ScheduleException("Ya existe una ítem con ese nombre");
		else
			items.add(item);
	}
	//[end]

	//[start] actions
	public void editAction(int actionNumber, Action newAction) throws ScheduleException
	{
		if(actionNumber < 0 || actionNumber >= actions.size())
			throw new ScheduleException("La posición a modificar es inválida");

		actions.set(actionNumber, newAction);
	}

	public void removeAction(int index) throws ScheduleException
	{
		if(index < 0 || index >= actions.size())
			throw new ScheduleException("La posición a remover es inválida");

		actions.remove(index);
	}

	public void swapAction(int indexA, int indexB) throws ScheduleException
	{
		if(indexA < 0 || indexB < 0  || indexA >= actions.size() || indexB >= actions.size())
			throw new ScheduleException("Las posiciones a swapear son inválidas");

		Collections.swap(actions, indexA, indexB);
	}
	//[end]

	//[start] Métodos Abstractos
	public abstract LegalResult analyzeLegality();
	public abstract ScheduleGraph buildScheduleGraph();
	//[end]

	//[start] analyzeSeriality
	public SerialResult analyzeSeriality()
	{
		//TODO: Completar
		//Un schedule es serial si para toda transacción, todas sus acciones aparecen consecutivas dentro del schedule
		//return null;

		/* A medida que encontramos una nueva transaccion la guardamos en el
		   diccionario, y si vuelve a aparecer quiere decir que no era serial */
		Set<String> yaRevisados = new HashSet<String>();
		String actual = null;
		for(Action accion:getActions()){
			if(actual == null){
				actual=accion.getTransaction();
				yaRevisados.add(actual);
			}
			String nuevaTransaccion = accion.getTransaction();
			if(nuevaTransaccion != actual){
				if(yaRevisados.contains(nuevaTransaccion)){
					return new SerialResult(false,nuevaTransaccion,null);
				}
				else{
					actual = nuevaTransaccion;
					yaRevisados.add(actual);
				}
			}

		}
		return new SerialResult(true,null,null);
	}
	//[end]
    private class AnalizadorDeGrafos{

    	   /**
    	   * grafo a bindear para analizar
    	   */
    	    ScheduleGraph grafo;
    	    /**
    	     *  Lista de adyacencias del grafo, para hacer bfs y buscar ciclos
    	     */
    	    Map<String,List<String>> adyacencias;
    	    Map<String,List<String>> adyacenciasReversas;

    	    /**
    	     *
    	     * @param g : grafo a analizar
    	     *
    	     */
            public AnalizadorDeGrafos(ScheduleGraph g){
            	grafo = g;
            	adyacencias = new HashMap<String, List<String>>();
            	adyacenciasReversas = new HashMap<String, List<String>>();
            	for(String transaccion:grafo.getTransactions()){
            		adyacencias.put(transaccion, new LinkedList<String>());
            		adyacenciasReversas.put(transaccion, new LinkedList<String>());

            	}
            	for(ScheduleArc eje: g.getArcs()){
            		adyacencias.get(eje.getStartTransaction()).add(eje.getEndTransaction());
            		adyacenciasReversas.get(eje.getEndTransaction()).add(eje.getStartTransaction());
            	}
            }

            /**
             *
             * @return True si no hay ciclos en el grafo
             */
            public Boolean esAciclico(){
            	Set<String> yaVisitados = new HashSet<String>();
            	List<String> nodos = grafo.getTransactions();

            	Set<String> yaSeguros = new HashSet<String>();
            	for(String nodo:nodos){
            		if(! yaVisitados.contains(nodo)){
            			if (hayCiclo(nodo,yaVisitados,yaSeguros)){
            				return false;
            			}
            		}
            	}
            	return true;
            }

            /**
             *
             * @param nodo : desde donde parto para buscar un ciclo
             * @param yaVisitados : nodos que ya fueron visitados
             * @param yaSeguros : nodos que ya fueron revisados y que no estan en un ciclo
             * @return True si encontro un ciclo
             */
			private boolean hayCiclo(String nodo, Set<String> yaVisitados,
					                 Set<String> yaSeguros) {
                    if(yaVisitados.contains(nodo)){
                    	return false;
                    }
                    yaVisitados.add(nodo);
                    boolean res = false;
                    for(String nodo2: adyacencias.get(nodo)){
                    	if(yaVisitados.contains(nodo2)){
                    		if(!yaSeguros.contains(nodo2) ){
                    			return true;
                    		}
                    	}
                    	else{
                    		res = res || hayCiclo(nodo2, yaVisitados, yaSeguros);
                    	}

                    }

                    yaSeguros.add(nodo);
                    return res;
			}
			/**
			 *
			 * @return un ciclo del grafo si este tiene uno, null sino
			 */
			public List<String> getCiclo(){
				Set<String> yaVisitados = new HashSet<String>();
            	List<String> nodos = grafo.getTransactions();

            	List<String> res = new LinkedList<String>();
            	Set<String> yaSeguros = new HashSet<String>();
            	for(String nodo:nodos){
            		if(! yaVisitados.contains(nodo)){
            			    res = armarCiclo(nodo,yaVisitados,yaSeguros);
            				if(! res.isEmpty()){
            					return res;
            				}

            		}
            	}
            	return null;
            }
            /**
             *
             * @param nodo : nodo desde el cual se trata de construir un cilo
             * @param yaVisitados : nodos ya visitados
             * @param yaSeguros : nodos revisados que no estan en un ciclo
             * @return un ciclo si lo encuentra, lista vacia sino
             */
			private List<String> armarCiclo(String nodo, Set<String> yaVisitados,
					Set<String> yaSeguros) {
                    if(yaVisitados.contains(nodo)){
                    	return new LinkedList<String>();
                    }
                    yaVisitados.add(nodo);
                    List<String> res = new LinkedList<String>();
                    for(String nodo2: adyacencias.get(nodo)){
                    	if(yaVisitados.contains(nodo2)){
                    		if(!yaSeguros.contains(nodo2) ){
                    			res.add(nodo2);
                    			res.add(0,nodo);
                    			break;
                    		}
                    	}
                    	else{
                    		res = armarCiclo(nodo2, yaVisitados, yaSeguros);
                    		if(! res.isEmpty()){
                    			if(res.get(0) != res.get(res.size()-1)){
                    			res.add(0,nodo);
                    			}
                    			break;
                    		}
                    	}

                    }

                    yaSeguros.add(nodo);
                    return res;
			}

			public List<List<String>> getEjecuciones(){
				List<String> nodos = grafo.getTransactions();
				Map<String,List<String>> adyacenciasAux = new HashMap<String, List<String>>(adyacenciasReversas);
				return getEjecucionesAux(nodos,adyacenciasAux);

			}

			private List<List<String>> getEjecucionesAux(List<String> nodos,
					Map<String, List<String>> adyacenciasAux) {
				if(nodos.size() == 1){
					List<List<String>> res = new LinkedList<List<String>>();
					List<String> lista =new LinkedList<String>();
					lista.add(nodos.get(0));
					res.add(lista);
					return res;

				}
                List<String> gradoCero = buscarLosDeGrado0(nodos,adyacenciasAux);
                List<List<String>> res = new LinkedList<List<String>>();
                for(String nodo:gradoCero){
                    nodos.remove(nodo);
                    sacarEjes(nodo,adyacenciasAux);
                    List<List<String>> resAux = getEjecucionesAux(nodos, adyacenciasAux);
                    for(List<String> ejecucion : resAux){
                    	ejecucion.add(0, nodo);
                    	res.add(ejecucion);
                    }
                    nodos.add(nodo);
                    ponerEjes(nodo,adyacenciasAux);
                }
				return res;
			}

			private void ponerEjes(String nodo,
					Map<String, List<String>> adyacenciasAux) {
				for(String nodo2: adyacencias.get(nodo)){
					adyacenciasAux.get(nodo2).add(nodo);
				}

			}

			private void sacarEjes(String nodo,
					Map<String, List<String>> adyacenciasAux) {

				for(String nodo2: adyacencias.get(nodo)){
					adyacenciasAux.get(nodo2).remove(nodo);
				}

			}

			private List<String> buscarLosDeGrado0(List<String> nodos,
					Map<String, List<String>> adyacenciasAux) {

				List<String> res = new LinkedList<String>();
				for(String nodo : nodos){
					if(adyacenciasAux.get(nodo).isEmpty()){
						res.add(nodo);
					}
				}

				return res;
			}







    }
	//[start] analyzeSerializability
	public SerializabilityResult analyzeSerializability()
	{
		ScheduleGraph graph = buildScheduleGraph();
		AnalizadorDeGrafos analizador = new AnalizadorDeGrafos(graph);
		if(! analizador.esAciclico()){
			System.out.println(analizador.getCiclo());
			return new SerializabilityResult(false,null,analizador.getCiclo(),null) ;
		}
		else{
			return new SerializabilityResult(true,analizador.getEjecuciones(),null,null);
		}



	}
	//[end]

	//[start] analyzeRecoverability
	public RecoverabilityResult analyzeRecoverability()
	{
		//TODO: Completar
		//La idea es que usen los métodos reads, writes & commits de cada acción para analizar recuperabilidad
		//Recuperable si:
		//	Toda transacción T hace COMMIT después de que lo hayan hecho todas las transacciones que escribieron algo que T lee
		//Evita aborts en cascada si:
		//	Toda transacción lee de ítems escritos por transacciones que hicieron COMMIT
		//Escricto si:
		//	Toda transacción lee y escribe ítems escritos por transacciones que hicieron COMMIT

		//OBS (importante): Tener en cuenta que en algunos modelos una misma acción puede leer y escribir al mismo tiempo

		//en details se guardaran las transacciones (t1 y t2) en conflicto y el mensaje
		ArrayList<String> details = new ArrayList<String>();
		details.add(""); //t1
		details.add(""); //t2
		details.add(""); //mensaje

		//inicialmente es no recuperable - vemos si es recuperable
		RecoverabilityType type = RecoverabilityType.NON_RECOVERABLE;
		Boolean isRecoverable = true;
		for(Action action : getActions()){
			if (!isRecoverable(action, details)){
				isRecoverable = false;
				break;
			}
		}
		//si es recuperable vemos si evita aborts en cascada
		if (isRecoverable){
			type = RecoverabilityType.RECOVERABLE;
			Boolean avoidsCascadeAborts = true;
			for(Action action : getActions()){
				if (!avoidsCascadeAborts(action, details)){
					avoidsCascadeAborts = false;
					break;
				}
			}
			//si evita aborts en cascada vemos si es estricta
			if (avoidsCascadeAborts){
				type = RecoverabilityType.AVOIDS_CASCADING_ABORTS;
				Boolean isStrict = true;
				for(Action action : getActions()){
					if (!isStrict(action, details)){
						isStrict = false;
						break;
					}
				}
				if (isStrict){
					type = RecoverabilityType.STRICT;
				}
			}
		}
		return new RecoverabilityResult(type,details.get(0),details.get(1),details.get(2));
	}

	private Boolean isRecoverable(Action actualAction, ArrayList<String> details){
		if (actualAction.reads()){
			String actualItem = actualAction.getItem();

			for(Action action : getActions()){
				String transaction = action.getTransaction();
				String actualTransaction = actualAction.getTransaction();

				if (canBeARConflictBetween(actualAction, action, actualItem, transaction, actualTransaction)){
					String mensaje = actualTransaction + " hace commit antes que " + transaction
					+ " que escribe " + actualItem + ".";
					fillDetails(details, transaction, actualTransaction, mensaje);
					return false;
				}
			}
		}
		return true;
	}

	private Boolean avoidsCascadeAborts(Action actualAction, ArrayList<String> details){
		if (actualAction.reads()){
			String actualItem = actualAction.getItem();

			for(Action action : getActions()){
				String transaction = action.getTransaction();
				String actualTransaction = actualAction.getTransaction();

				if (canBeAConflictBetween(actualAction, action, actualItem, actualTransaction, transaction)){
					String mensaje = actualTransaction + " lee " + actualItem + " de " +
					transaction + " que aun no hizo commit.";
					fillDetails(details, transaction, actualTransaction, mensaje);
					return false;
				}
			}
		}
		return true;
	}


	private Boolean isStrict(Action actualAction, ArrayList<String> details){
		String actualItem = actualAction.getItem();

		for(Action action : getActions()){
			String transaction = action.getTransaction();
			String actualTransaction = actualAction.getTransaction();

			if (canBeAConflictBetween(actualAction, action, actualItem, actualTransaction, transaction)){
				String mensaje = actualTransaction + (action.reads() ? " lee " : " escribe ") +
				actualItem + " que " + transaction + " escribio y aun no commiteo.";
				fillDetails(details, transaction, actualTransaction, mensaje);
				return false;
			}
		}
		return true;
	}

	private boolean canBeARConflictBetween(Action actualAction, Action action, String actualItem, String transaction, String actualTransaction) {
		ArrayList<String> transactions = transactionsOrderByCommit();
		String item = action.getItem();

		return
		//una escribe
		action.writes() &&
		//y lo hace antes de que la otra
		getActions().indexOf(action) < getActions().indexOf(actualAction) &&
		//actuan sobre el mismo item
		item == actualItem &&
	     //HACK: si la transaccion no es legal, puede haber un unlock desgogado, chequeamos entonces
        // que la actual haga algo sobre el item
        (actualAction.reads() || actualAction.writes()) &&
		//la segunda hizo commit
		transactions.contains(actualAction.getTransaction()) &&
		//y la primera no hizo commit
		(!transactions.contains(action.getTransaction()) ||
		//o lo hizo despues que la segunda
		transactions.indexOf(action.getTransaction()) >
		transactions.indexOf(actualAction.getTransaction()));
	}


	private boolean canBeAConflictBetween(Action actualAction, Action action, String actualItem, String actualTransaction, String transaction) {
		Action commit = getCommitAction(transaction);
		String item = action.getItem();

		return
		//una escribe
		action.writes() &&
		//y lo hace antes de que la otra
		getActions().indexOf(action) < getActions().indexOf(actualAction) &&
		//HACK: si la transaccion no es legal, puede haber un unlock desgogado, chequeamos entonces
		// que la actual haga algo sobre el item
		(actualAction.reads() || actualAction.writes()) &&
		//actuan sobre el mismo item
		item == actualItem &&
		//pertenecen a transacciones diferentes
		transaction != actualTransaction &&
		// y si la ultima hace commit lo hace luego de que la primera haga commit
		(commit == null || getActions().indexOf(commit) > getActions().indexOf(actualAction));
	}

	//llena details con las transacciones en conflicto y el mensaje

	private void fillDetails(ArrayList<String> details, String transaction, String actualTransaction, String mensaje) {
		details.set(0,transaction);
		details.set(1,actualTransaction);
		details.set(2, mensaje);
	}

	//devuelve la lista de transacciones que hacen commit ordenadas temporalmente

	private ArrayList<String> transactionsOrderByCommit(){
		ArrayList<String> transactions = new ArrayList<String>();
		for(Action action : getActions()){
			if (action.commits()){
				transactions.add(action.getTransaction());
			}
		}
		return transactions;
	}

	//obtiene la accion que hace commit de la transaccion, si no existe devuelve null

	private Action getCommitAction(String transaction){
		Action commit = null;
		for(Action action : getActions()){
			if (action.commits() && action.getTransaction() == transaction){
				commit = action;
			}
		}
		return commit;
	}

	//[end]

	protected class Par<T,S>{
		public T fst;
		public S snd;
		public Par(T f,S s){
			fst=f;
			snd=s;
		}
	}
}
