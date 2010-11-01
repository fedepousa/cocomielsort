package ubadbtools.scheduleAnalyzer.nonLocking;

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

public class NonLockingSchedule extends Schedule
{
	//[start] Add Actions
	public void addAction(Action action)
	{
		actions.add((NonLockingAction)action);
	}

	public void addRead(String transaction, String item)
	{
		actions.add(new NonLockingAction(NonLockingActionType.READ, transaction, item));
	}

	public void addWrite(String transaction, String item)
	{
		actions.add(new NonLockingAction(NonLockingActionType.WRITE, transaction, item));
	}

	public void addCommit(String transaction)
	{
		actions.add(new NonLockingAction(NonLockingActionType.COMMIT, transaction));
	}
	public ScheduleType getType()
	{
		return ScheduleType.NON_LOCKING;
	}
	//[end]

	//[start] buildScheduleGraph

	@Override
	public ScheduleGraph buildScheduleGraph()
	{


		ScheduleGraph sg = new ScheduleGraph();
		for(String transaccion: getTransactions()){
			sg.addTransaction(transaccion);
		}

        // para facilitar el recorrido vamos a separar las acciones por items

        Map<String,List<Par<Action,Integer> > > operXItem = new HashMap<String, List<Par<Action,Integer> > >();
        for(String item:getItems()){
        	operXItem.put(item, new LinkedList<Par<Action,Integer>>());
        }
        int i = 1;

        for(Action accion : getActions()){
            if(!accion.commits()){
            // el i es el indice en la historia, necesario para armar los ejes
        	operXItem.get(accion.getItem()).add(new Par<Action, Integer>(accion, i));

            }
            i=i+1;
        }

        // usamos un diccionario para wvitar ejes repetidos
        Map<String,Set<String>> ejesYaPuestos = new HashMap<String, Set<String>>();
        for(String transaccion:getTransactions()){
        	ejesYaPuestos.put(transaccion, new HashSet<String>());
        }

        for(String item: getItems()){
        	List<Par<Action,Integer>> operaciones = operXItem.get(item);
            int tam = operaciones.size();
            //recorremos cada accion
            for (int j = 0; j < tam; j++) {
            	Action operacionActual = operaciones.get(0).fst;
            	String transaccionActual = operacionActual.getTransaction();
            	Integer indiceActual = operaciones.get(0).snd;
            	operaciones.remove(0); // removemos la que ya miramos

                //dada una accion empezamos a mirar hacia adelante
                //para ver si genera algun eje
            	for(int k =0; k < operaciones.size(); k ++){
            		// tratamos de agregar un eje para la operacion actual,
            		// y ademas vemos si hay que seguir agregando
            	       Action proximaAccion = operaciones.get(k).fst;
            	        String proximaTransaccion = proximaAccion.getTransaction();
            	        Integer proximoIndice = operaciones.get(k).snd;

            	        if(proximaTransaccion == transaccionActual){
            	            /* no estoy en el caso caso donde tengo algo asi w1,r1,r2, tengo que saltar r1 y seguir buscando */
            	            if(!operacionActual.writes() && proximaAccion.reads()){
            	                break;
            	            }

            	        }
            	        /* la transaccion que viene ahora es distinta */
            	        else if(operacionActual.writes()) {
            	            //caso: write vs *
            	            //pongo el eje si hace falta
            	            if(!ejesYaPuestos.get(transaccionActual).contains(proximaTransaccion)){
            	                sg.addArc(new ScheduleArc(transaccionActual,
            	                                          proximaTransaccion,
            	                               indiceActual,proximoIndice));
            	                ejesYaPuestos.get(transaccionActual).add(proximaTransaccion);

            	                }
            	            //caso write vs write: hay que parar de buscar
            	          //caso write vs read: hay que seguir buscando
            	            if(proximaAccion.writes()){
            	               break;
            	            }

            	        }
            	        else{
            	            // caso: read vs write
            	            // pongo el eje y tengo que parar
            	            if(proximaAccion.writes()){
            	                if(!ejesYaPuestos.get(transaccionActual).contains(proximaTransaccion)){
            	                sg.addArc(new ScheduleArc(operacionActual.getTransaction(),
            	                               proximaTransaccion,
            	                               indiceActual,proximoIndice));
            	                ejesYaPuestos.get(transaccionActual).add(proximaTransaccion);
            	                }
            	                break;
            	            }
            	            // caso: read vs read
            	            // sigo sin poner ningun eje
            	        }

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
		Map<String,Boolean> tuvoCommit = new HashMap<String, Boolean>();
		// inicialmente nadie hizo commit
		for(String transaccion:getTransactions()){
			tuvoCommit.put(transaccion,false );
		}
		for(Action accion : getActions()){
			String transaccionActual = accion.getTransaction();
			if(accion.commits()){
				if(tuvoCommit.get(transaccionActual)){
					return new LegalResult(false,transaccionActual,"Mas de un commit");
				}
				tuvoCommit.put(transaccionActual, true);
			}
			else{
				if(tuvoCommit.get(transaccionActual)){
					return new LegalResult(false,transaccionActual,"El commit no es la ultima accion");
				}
			}
		}
		return new LegalResult(true,null,null);

	}
	//[end]
}
