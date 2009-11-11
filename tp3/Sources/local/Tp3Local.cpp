#include <iostream>
#include <vector>
#include <fstream>
#ifdef TIEMPOS
#include <sys/time.h>
#endif

using namespace std;

unsigned int resolver(vector< vector<int> > &clausulas, vector<bool> &asignacion);
bool haceTrue(vector<int> &clausula, vector<bool> &asignacion);
void siguiente(vector<bool> &asignacion, int cant);

int main(){
	ifstream entrada("Tp3.in");
	ofstream salida("Tp3Exa.out");
	#ifdef TIEMPOS
	ofstream tiempos("Tp3ExaTiempos.out");
	timeval inicio;
	timeval fin;
	double diferencia;
	#endif
	
	int c; //Cantidad de clausulas
	int v; //Cantidad de variables
	int var; // Cantidad de variables dentro de una clausula
	vector< vector< int > > clausulas; //Aca meto todas las clausulas
	vector<bool> asignacion; //Asignacion de las variables
	int res; //Aca voy a acumular el resultado de una asignacion
	int max=0; //Aca se guarda el maximo total
	int aux; //Auxiliar para ir levantando
	
	
	while(entrada >> c >> v && !(c==-1 && v==-1)){
			//para leer
		for(int i=0;i<c;++i){
			vector< int > clausula;
			clausulas.push_back(clausula);
			entrada >> var;
			for(int j=0;j<var;++j){
				entrada >> aux;
				clausulas[0].push_back(aux);
			}
		}
		
		/*La idea es dado una asignacion generada por otro algortimo
		 *modificar (de a uno), para toda clausula su valor, para a ver si mejora o no la solcion.
		 * en cuanto al criterio de parada podemos probar varios.
		 * - hasta que deje de mejorar 
		 * - x iteraciones
		 * - x tiempo
		 *inicialmente arranquemos con criterio de parada (hasta que deje de mejorar)
		*/
		
		
		//aca habria que hacer que al vector asignacion, le llegue una asignacion valida, llamando a otra resolucion.	
		
		
		//el valor maximo hasta entonces
		unsigned int max_iteracion = resolver(clausulas, asignacion);
		unsigned int i_max;
		unsigned int max_iteracion_maxima = max_iteracion;
		bool bandera = true;
		
		while(bandera){			
			//busco donde tengo el maximo, modificando de a una asignacion.
			for(unsigned int i= 0; i <v; ++i){
				//niego una
				asignacion[i] = not (asignacion[i]);
				//me fijo a ver si negandola tengo un mejor resultado
				res = resolver(clausulas, asignacion);
				
				//en caso de ser mejor, actualizo el max_iteracion y me guardo el indice que cambie
				if (res> max_iteracion) {max_iteracion = res; i_max = i;} 
				
				//vuelvo a la asignacion de que parti
				asignacion[i] = not (asignacion[i]);			
			}
			
			if (max_iteracion_maxima < max_iteracion){
				//si estoy aca es pq encontre una mejor configuracion, entonces cambio asignaciones realmente
				asignacion[i_max] = not (asignacion[i_max]);
				max_iteracion_maxima = max_iteracion;
			} else bandera = false;
			
			
		}
		
		//pongo en max el valor de la mejor iteracion que tuve
		max = (int) max_iteracion_maxima;
		salida << max << endl;
		asignacion.clear();
		clausulas.clear();
		
	}
	return 0;
}

unsigned int resolver(vector< vector<int> > &clausulas, vector<bool> &asignacion){
	unsigned int res = 0;	
	unsigned int cant = clausulas.size();
	for(unsigned int i=0; i<cant;++i){
		if(haceTrue(clausulas[i], asignacion)){
			res++;
		}
	}
	return res;
}

bool haceTrue(vector<int> &clausula, vector<bool> &asignacion){
	bool res = false;
	for(unsigned int i=0; i<clausula.size();++i){
		if(clausula[i]>0){
			if(asignacion[clausula[i]-1] == true){
				res = true;
				break;
			}	
		} else {
			if(asignacion[clausula[i]-1] == false){
				res = true;
				break;
			}
		}
	}
	return res;
}

void siguiente(vector<bool> &asignacion, int cual){
	int cant = asignacion.size();
	for(int i=0;i<cant;++i){
		if(cual%2 == 0){
			asignacion[i]=false;
		} else {asignacion[i]=true;}
		cual /= 2;
	}
}
