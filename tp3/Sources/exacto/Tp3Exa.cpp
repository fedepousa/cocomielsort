#include <iostream>
#include <vector>
#include <fstream>
#ifdef TIEMPOS
#include <sys/time.h>
#endif

using namespace std;

int resolver(vector< vector<int> > &clausulas, vector<bool> &asignacion);
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
	vector<bool> asignacion_max;
	while(entrada >> c >> v && !(c==-1 && v==-1)){
		max = 0;
		for(int i=0;i<c;++i){
			vector< int > clausula;
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
		int cant = 1;
		for(int i=0;i<v;++i){
			cant *= 2;
		} // Con esto cuento la cantidad de asignaciones diferentes que existen
		
		for(int i=0;i<v;++i){
			asignacion.push_back(false);
		}// Armo la primera asignacion posible poniendo todos en false.
		
		asignacion_max = asignacion;
		
		for(int i=0;i<cant;++i){
			res = resolver(clausulas, asignacion);
			if(res>max){
				max = res;
				asignacion_max = asignacion;
			}
			siguiente(asignacion,i+1);
		}
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
		asignacion.clear();
		asignacion_max.clear();
		clausulas.clear();
	}
	return 0;
}

int resolver(vector< vector<int> > &clausulas, vector<bool> &asignacion){
	int res = 0;	
	int cant = clausulas.size();
	for(int i=0; i<cant;++i){
		if(haceTrue(clausulas[i], asignacion)){
			res++;
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

void siguiente(vector<bool> &asignacion, int cual){
	int cant = asignacion.size();
	for(int i=0;i<cant;++i){
		if(cual%2 == 0){
			asignacion[i]=false;
		} else {asignacion[i]=true;}
		cual /= 2;
	}
}
