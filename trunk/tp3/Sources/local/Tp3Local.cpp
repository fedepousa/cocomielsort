#include <iostream>
#include <vector>
#include <fstream>
#include <list>
#include <set>
#include <algorithm>

#ifdef TIEMPOS
#include <sys/time.h>
#endif

using namespace std;

struct Clausula;
typedef int Variable;


#include "local.h"





//Prototipos de las heredadas
static bool leer(ifstream &entrada, Caso **c,vector< vector<int> > &claus);
static void construir(Caso &c, Asignacion &asig, list<int> &clausulas_satisfechas);
unsigned int resolver(vector< vector<int> > &clausulas, vector<bool> &asignacion);
bool haceTrue(vector<int> &clausula, vector<bool> &asignacion);
void siguiente(vector<bool> &asignacion, int cant);



//Escribe el resultado en el ofstream salida
void escribirResultados(ofstream &salida, Str_local  &nueva, vector<bool> &asignacion,unsigned int max_iteracion_maxima,int c,int v){
		//pongo en max el valor de la mejor iteracion que tuve
		salida << max_iteracion_maxima << endl;
		salida << "C";
		for(int i= 0; i<c;++i) if(nueva.cant_ok_por_clausula[i])  salida << " " << i + 1;
		salida << endl << "V";
		for(int i = 0;i<v;++i) 	if(asignacion[i]) salida << " " << i+1;
	    salida << endl;
}

//En globa la real accion de local (el ex-while bandera)
void local(int &res, unsigned int &max_iteracion, unsigned int &max_iteracion_maxima, unsigned int &i_max, Str_local &nueva,vector<bool> &asignacion, bool &bandera){

		while(bandera){	
			//busco donde tengo el maximo, modificando de uno en uno la asignacion.
			nueva.elegir_asig_en_N(res, max_iteracion, i_max);

			if (max_iteracion_maxima < max_iteracion){
				//Si estoy aca es pq encontre una mejor configuracion, entonces cambio asignaciones realmente
				asignacion[i_max] = not (asignacion[i_max]);
				nueva.resolverEspecial(i_max, ((nueva.variables)[i_max]),((asignacion)[i_max]),true);
				max_iteracion_maxima = max_iteracion;
				
			} else bandera = false; // Si llegue aca es que no mejoro, osea que cai en un extremo local, por lo tanto termina.
			
		}
}


int main(){
	ifstream entrada("Tp3.in");
	ofstream salida("Tp3Local.out");
	#ifdef TIEMPOS
	ofstream tiempos("Tp3LocalTiempos.out");
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
	Caso *caso;
	
	while(leer(entrada,&caso,clausulas)) {
		

		
		list<int> satisfechas;
		Asignacion asig(*caso);
        construir(*caso, asig, satisfechas);
		asignacion.assign(asig.v,asig.v + asig.n);
		//aca habria que hacer que al vector asignacion, le llegue una asignacion valida, llamando a otra resolucion.	
		
		v = caso->cant_variables;
		c = caso->cant_clausulas;
		
		
			
		//El valor maximo hasta entonces
		unsigned int max_iteracion = resolver(clausulas, asignacion); 
		unsigned int max_iteracion_maxima = max_iteracion;
		bool bandera = true;
		unsigned int i_max;
		


		Str_local nueva(c,v,&asignacion,&clausulas,max_iteracion);
		nueva.estructurar();
		nueva.contarOkPorClausula();

		local(res,max_iteracion,max_iteracion_maxima,i_max,nueva,asignacion,bandera);

	/*		
		//Mostra por consola la asignacion final
		cout<<" Asignacion final: "; 
		for(int i = 0;i<v;++i)  cout << " " << asignacion[i];
		cout<<endl;
	*/	
		
		//Volcar resultados en archivo.
		escribirResultados(salida,nueva,asignacion,max_iteracion_maxima,c,v);
		

		asignacion.clear();
		clausulas.clear();
		delete caso;
	}
	return 0;
}



bool haceTrue(vector<int> &clausula, vector<bool> &asignacion){
	// Como clausula.size representa la cantidad de literales 
	// y la cantidad de literales es a lo sumo dos veces la cantidad de variable por clausula
	// esto es O(v)
	bool res = false;
	for(unsigned int i=0; i<clausula.size();++i){
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
unsigned int resolver(vector< vector<int> > &clausulas, vector<bool> &asignacion){
//O(c * v )
	unsigned int res = 0;	
	unsigned int cant = clausulas.size();
	for(unsigned int i=0; i<cant;++i){
		if(haceTrue(clausulas[i], asignacion)){
			res++;
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
static bool leer(ifstream &entrada, Caso **d, vector< vector<int> > &claus) {
  bool success;
  claus.clear();
  int cant_clausulas, cant_variables;
  entrada >> cant_clausulas >> cant_variables;
  success = cant_variables!= -1 && cant_clausulas != -1;
  if(success) {
    Caso *c = new Caso(cant_clausulas, cant_variables);
    for(int i = 0;i<c->cant_clausulas;++i) {
      
      claus.push_back(vector<int>());
      int literales;
      entrada >> literales;
      Clausula temp_clausula;
      temp_clausula.numero = i+1;
      for(int j = 1; j <= literales;++j) {
        int temp;
        Literal temp_literal;
        entrada >> temp;
        claus[i].push_back(temp);
        temp_literal.negacion = temp < 0;
        temp_literal.v = abs(temp);
        
        if(temp_literal.negacion) {
          c->literales_negados[temp_literal.v-1].clausulas.insert(i+1);
        }
        else {
          c->literales[temp_literal.v-1].clausulas.insert(i+1) ;
        }
        
      }    
      c->clausulas[i] = temp_clausula;
    }
    *d = c;
  }
  return success;
}
