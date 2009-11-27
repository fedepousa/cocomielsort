#include <iostream>
#include <vector>
#include <fstream>
#ifdef TIEMPOS
#include <sys/time.h>
#endif

using namespace std;

int satisfacer(int altura, bool asignar, vector< vector< int > > &estadoActual);
// Hace true las clausulas que puede, las que tiene el literal negado, o bien les saca el literal o si es unitaria
// la cuenta como insatisfacible, el int que devuelve es la cantidad de insatisfacibles que aparecieron.
int pos(int altura, vector<int> &clausu);
bool esta(int altura, vector<int> &clausu);
bool haceTrue(vector<int> &clausula, vector<bool> &asignacion);

int main(){
	ifstream entrada("Tp3.in");
	ofstream salida("Tp3ExaBack.out");
	#ifdef TIEMPOS
	ofstream tiempos("Tp3ExaBackTiempos.out");
	timeval inicio;
	timeval fin;
	double diferencia;
	#endif
	
	
	
	
	int c; //Cantidad de clausulas
	int v; //Cantidad de variables
	int var; // Cantidad de variables dentro de una clausula
	vector< vector< int > > clausulas; //Aca meto todas las clausulas
	vector< vector< vector< int > > > ramaArbol; //Espacio para los estados de cada nodo de la rama
	vector<bool> asignacion; //Asignacion de las variables
	int res; //Aca voy a acumular el resultado de una asignacion
	int max=0; //Aca se guarda el maximo total
	int inSat;
	int aux; //Auxiliar para ir levantando
	int altura;
	vector<bool> asignacion_max;
	vector<int> ramaInSat;
	vector<int> siguientes;
	
	while(entrada >> c >> v && !(c==-1 && v==-1)){
		max=0;
		for(int i=0;i<c;++i){
			vector<int> clausula;
			clausulas.push_back(clausula);
			entrada >> var;
			for(int j=0;j<var;++j){
				entrada >> aux;
				clausulas[i].push_back(aux);
			} 
		}	
		
		#ifdef TIEMPOS
		gettimeofday(&inicio, NULL);
		#endif
		
		
		/* 
		 * Aca hay que inicializar inSat por ejemplo con el constructivo 
		 * cosa de ya poder hacer buenas podas de entrada
		 */
	
		ramaArbol.push_back(clausulas); //Estado 0, raiz del arbol
		ramaArbol.push_back(clausulas); //Le copio los estados al primer nodo para que empiece
		altura = 0;
		ramaInSat.push_back(inSat);
		siguientes.push_back(0);
		asignacion.push_back(0);//pongo un 0 para tener bien los indices
		asignacion.push_back(0);//arranco con false a x1
		
		

		while(siguientes[0]!=2){
			if(altura=v){//si ya llegue a una hoja
				ramaInSat[altura] += satisfacer(altura, asignacion[altura], ramaArbol[altura]);
				if(inSat > ramaInSat[altura]){
					inSat = ramaInSat[altura];
					asignacion_max = asignacion;
				}
				altura--;
				ramaInSat.erase(ramaInSat.end()-1);
				siguientes.erase(siguientes.end()-1);
				ramaArbol.erase(ramaArbol.end()-1);
				asignacion.erase(asignacion.end()-1);
				siguientes[altura]++;
				
			}				
			else {
				if(siguientes[altura]==2){//backtrack
					altura--;
					ramaInSat.erase(ramaInSat.end()-1);
					siguientes.erase(siguientes.end()-1);
					ramaArbol.erase(ramaArbol.end()-1);
					asignacion.erase(asignacion.end()-1);
					siguientes[altura]++;
				}
				else {
					if(siguientes[altura]==0){//Estoy por primera vez, calculo todo
						ramaInSat[altura] += satisfacer(altura, asignacion[altura], ramaArbol[altura]);
						if(ramaInSat[altura] >= inSat){//La rama ya no sirve, backtrack
							altura--;
							ramaInSat.erase(ramaInSat.end()-1);
							siguientes.erase(siguientes.end()-1);
							ramaArbol.erase(ramaArbol.end()-1);
							asignacion.erase(asignacion.end()-1);
							siguientes[altura]++;
						} else{//si la rama sirve, copio todo para seguir
							ramaInSat.push_back(ramaInSat[altura]);
							siguientes.push_back(0);
							ramaArbol.push_back(ramaArbol[altura]);
							altura++;
							asignacion.push_back(0);
						}
					} else {//caso siguiente 1
						ramaInSat.push_back(ramaInSat[altura]);
						siguientes.push_back(0);
						ramaArbol.push_back(ramaArbol[altura]);
						altura++;
						asignacion.push_back(1);
					}
				}
			}
			
		}
		
		
				 
		/*
		
		#ifdef TIEMPOS
		gettimeofday(&fin, NULL);
		diferencia = (fin.tv_sec - inicio.tv_sec)*1000000 + fin.tv_usec - inicio.tv_usec;
		
		tiempos << diferencia << endl;
		#endif
		salida << max << endl;
		salida << "C";
		for(int i= 0; i<c;++i) {
		  if(haceTrue(clausulas[i],asignacion_max)) {
		    salida << " " << i + 1;
      		}
    	}
    	salida << endl << "V";
    	for(int i = 0;i<v;++i) {
      	if(asignacion_max[i]) {
        	salida << " " << i + 1;
      		}
    	}
    	salida << endl;
		
		*/
		
		
		
		
		
		
		asignacion.clear();
		asignacion_max.clear();
		clausulas.clear();
		siguientes.clear();
		ramaArbol.clear();
		ramaInSat.clear();
	}
	
	
	return 0;
	
}


int satisfacer(int altura, bool asignar, vector< vector < int > > &estadoActual){
	int res = 0;
	int cant = estadoActual.size();
	for(int i=0;i<cant;++i){
		if(asignar){
			if(esta(altura, estadoActual[i])){
				estadoActual.erase(estadoActual.begin()+i);	
			} else {
				if(esta(-altura, estadoActual[i])) {
					if(estadoActual[i].size() == 1){
						res++;
						estadoActual.erase(estadoActual.begin()+i);
					} else {
						int posi = pos(-altura, estadoActual[i]);
						estadoActual[i].erase(estadoActual[i].begin()+posi);
					}
					
				}
			}
		} else {
			if(esta(-altura, estadoActual[i])){
				estadoActual.erase(estadoActual.begin()+i);	
			} else {
				if(esta(altura, estadoActual[i])) {
					if(estadoActual[i].size() == 1){
						res++;
						estadoActual.erase(estadoActual.begin()+i);
					} else {
						int posi = pos(altura, estadoActual[i]);
						estadoActual[i].erase(estadoActual[i].begin()+posi);
					}
					
				}
			}
		
		}	
	}	
	
	return res;
}

bool esta(int altura, vector<int> &clausu){
	bool res = false;
	int cant = clausu.size();
	for(int i=0;i<cant;++i){
		if(clausu[i]==altura){
			res = true;
			break;
		}
	}
	return res;
}
int pos(int altura, vector<int> &clausu){
	int res;
	int cant = clausu.size();
	for(int i=0;i<cant;++i){
		if(clausu[i]==altura){
			res = i;
			break;
		}
	}
	
	return res;
}

bool haceTrue(vector<int> &clausula, vector<bool> &asignacion){
	bool res = false;
	for(int i=0; i<clausula.size();++i){
		if(clausula[i]>0){
			if(asignacion[clausula[i]-1] == true){
				res = true;
				break;
			}	
		} else {
			if(asignacion[abs(clausula[i])-1] == false){
				res = true;
				break;
			}
		}
	}
	return res;
}
