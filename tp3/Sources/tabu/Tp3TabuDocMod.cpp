#include <iostream>
#include <vector>
#include <fstream>
#include <list>
#include <set>
#include <algorithm>

#define NAMESPACE_BEGIN
#define NAMESPACE_END
#include "arith_utils.h"
#undef NAMESPACE_BEGIN
#undef NAMESPACE_END

#ifdef TIEMPOS
#include <sys/time.h>
#endif

using namespace std;

struct Clausula;
typedef int Variable;


#ifndef TABU_LONGITUD
#define TABU_LONGITUD (v/3)
#endif
#ifndef CANT_MAX_ITERACIONES
#define CANT_MAX_ITERACIONES (3*v)
#endif

#ifndef CANT_MAX_ITERACIONES_ENTRE_OPTIMOS
#define CANT_MAX_ITERACIONES_ENTRE_OPTIMOS (v/2)
#endif
#ifndef CANT_ASIGNACIONES
#define CANT_ASIGNACIONES (1)
#endif


#include "local.h"





//Prototipos de las heredadas
static bool leer(ifstream &entrada, Caso **c,vector< vector<int> > &claus);
static void construir(Caso &c, Asignacion &asig, list<int> &clausulas_satisfechas);
unsigned int resolver(vector< vector<int> > &clausulas, vector<bool> &asignacion);
bool haceTrue(vector<int> &clausula, vector<bool> &asignacion);
void siguiente(vector<bool> &asignacion, int cant);
void  generar_asignacion(unsigned int i, vector<bool> *&asignaciones, unsigned int v);
unsigned int procesar_asignaciones(TabuStruct **tabus, Str_local **nuevas, vector<bool> *&asignaciones, unsigned int cant_asignaciones);
void borrar_todo(Str_local **nuevas, TabuStruct **tabus, vector<bool> * asig, unsigned int cant);


void escribirResultados(ofstream &salida, TabuStruct &tabu, vector<bool> &asignacion,unsigned int max_iteracion_maxima,int c,int v){
		//pongo en max el valor de la mejor iteracion que tuve
		salida << tabu.maxima_cant_satisfechos << endl;
		salida << "C";
		for(vector<unsigned int>::iterator it = tabu.clausulas_satisfechas_en_ultimo_maximo.begin(); it!= tabu.clausulas_satisfechas_en_ultimo_maximo.end();++it) salida << " " << *it;
		salida << endl << "V";
		for(int i = 0;i<v;++i) 	if(tabu.mejor_asignacion[i]) salida << " " << i+1;
	    salida << endl;
}

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

//En globa la real accion de tabu (el ex-while bandera)
unsigned int tabu(int &res, unsigned int &max_iteracion, unsigned int &max_iteracion_maxima, unsigned int &i_max, Str_local &nueva,vector<bool> &asignacion, bool &bandera, TabuStruct &tabu){
  vector<int> &tabu_lit = tabu.tabu_lit;
  int &iteracion = tabu.iteracion;
  int &tabu_longitud = tabu.tabu_longitud;
  int &iteracion_ultimo_maximo = tabu.iteracion_ultimo_maximo;
  const unsigned int &cant_max_iteraciones = tabu.cant_max_iteraciones;
  const unsigned int &cant_max_iteraciones_entre_optimos = tabu.cant_max_iteraciones_entre_optimos;
  tabu.maxima_cant_satisfechos = max_iteracion_maxima;
  
  
		while(bandera){	
		  ++iteracion;
		  //inicializo el maximo en cero, para que el maximo de una iteracion no se guarde a la siguiente.
		  max_iteracion = 0;
			//busco donde tengo el maximo, modificando de uno en uno la asignacion.
			nueva.elegir_asig_en_N(res, max_iteracion, i_max,max_iteracion_maxima, tabu);




			if (iteracion < iteracion_ultimo_maximo + cant_max_iteraciones_entre_optimos && iteracion < cant_max_iteraciones){
				//Si estoy aca es pq encontre una mejor configuracion, entonces cambio asignaciones realmente
				asignacion[i_max] = not (asignacion[i_max]);
				nueva.resolverEspecial(i_max, ((nueva.variables)[i_max]),((asignacion)[i_max]),true);
        tabu_lit[i_max] = iteracion;
				if(max_iteracion > max_iteracion_maxima) {
          max_iteracion_maxima = max_iteracion;
          iteracion_ultimo_maximo = iteracion;
          tabu.mejor_asignacion = asignacion ;
          nueva.actualizar_clausulas_satisfechas(tabu);
        }
				
			} else bandera = false; // Si llegue aca es que supere las cotas de iteraciones.
			
		}
		asignacion = tabu.mejor_asignacion;
		return iteracion;
}


int main(){
	ifstream entrada("Tp3.in");
	ofstream salida("Tp3TabuDocMod.out");
	#ifdef TIEMPOS
	ofstream tiempos("Tp3TabuDocModTiempos.out");
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
	unsigned int numero_caso = 0;
	while(leer(entrada,&caso,clausulas)) {
		++numero_caso;
    #ifdef TIEMPOS
		gettimeofday(&inicio, NULL);
	  #endif
		list<int> satisfechas;
		Asignacion asig(*caso);
        construir(*caso, asig, satisfechas);
		asignacion.assign(asig.v,asig.v + asig.n);
		//aca habria que hacer que al vector asignacion, le llegue una asignacion valida, llamando a otra resolucion.	
		
		v = caso->cant_variables;
		c = caso->cant_clausulas;
		
		
			
		//El valor maximo hasta entonces
		unsigned int max_iteracion;// = resolver(clausulas, asignacion); 
		unsigned int max_iteracion_maxima;// = max_iteracion;
		bool bandera = true;
		unsigned int i_max;
		
		unsigned int cant_asignaciones = CANT_ASIGNACIONES;
		
		
		//Str_local nueva(c,v,&asignacion,&clausulas,max_iteracion);
		//nueva.estructurar();
		//nueva.contarOkPorClausula();
		vector<bool> *asignaciones = new vector<bool>[cant_asignaciones];
		asignaciones[0] = asignacion;
    Str_local * nuevas[cant_asignaciones];
    //nuevas[0] = nueva;
    TabuStruct * tabus[cant_asignaciones];
    
    for(int i = 0; i<cant_asignaciones;++i){
      generar_asignacion(i, asignaciones, v);
      max_iteracion = resolver(clausulas, asignaciones[i]); 
		  max_iteracion_maxima = max_iteracion;
		  bandera = true;
      nuevas[i] = new Str_local(c,v,&asignaciones[i],&clausulas,max_iteracion);
      nuevas[i]->estructurar();
      nuevas[i]->contarOkPorClausula();
      tabus[i] = new TabuStruct(TABU_LONGITUD, CANT_MAX_ITERACIONES, CANT_MAX_ITERACIONES_ENTRE_OPTIMOS,v, *nuevas[i]);
      tabu(res,max_iteracion,max_iteracion_maxima,i_max,*nuevas[i],asignaciones[i],bandera,*tabus[i]);
    }
    
		unsigned int optima = procesar_asignaciones(tabus, nuevas, asignaciones, cant_asignaciones);
		
		#ifdef TIEMPOS
		gettimeofday(&fin, NULL);
		diferencia = (fin.tv_sec - inicio.tv_sec)*1000000 + fin.tv_usec - inicio.tv_usec;
		
		tiempos << diferencia << endl;
		#endif
    if(resolver(clausulas,asignaciones[optima]) !=  tabus[optima]->maxima_cant_satisfechos) {
      cout << "fundio viela, la cantidad de clausulas verdaderas no coincide" << endl; }
	/*		
		//Mostra por consola la asignacion final
		cout<<" Asignacion final: "; 
		for(int i = 0;i<v;++i)  cout << " " << asignacion[i];
		cout<<endl;
	*/	
		
		//Volcar resultados en archivo.
		escribirResultados(salida,*tabus[optima],asignaciones[optima],tabus[optima]->maxima_cant_satisfechos,c,v);
		

		asignacion.clear();
		clausulas.clear();
		delete caso;
		borrar_todo(nuevas, tabus, asignaciones, cant_asignaciones);		
	}
	return 0;
}


void borrar_todo(Str_local **nuevas, TabuStruct **tabus, vector<bool> * asig, unsigned int cant) {
  for(int i =0;i<cant;++i) {
    delete nuevas[i];
    delete tabus[i];
  }
  delete [] asig;
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


void generar_asignacion(unsigned int j, vector<bool> *&asignaciones, unsigned int v) {
  if(j>0) {
    asignaciones[j].clear();
    Randomizer<float> r(0.0f, 1.0f);
    for(int i = 0 ; i < v;++i) {
      float rndm = r.get();
      if(rndm > 0.5f) {
        asignaciones[j].push_back(true);
      }
      else {
        asignaciones[j].push_back(false);
      }
    }
  }
}
unsigned int procesar_asignaciones(TabuStruct **tabus, Str_local **nuevas, vector<bool> *&asignaciones, unsigned int cant_asignaciones){
  unsigned int res = 0;
  unsigned int max = 0 ;
  for(int i = 0; i < cant_asignaciones; ++i) {
    if(tabus[i]->maxima_cant_satisfechos > max) {
      max = tabus[i]->maxima_cant_satisfechos;
      res = i;
    }
    
  }
  return res;
}


