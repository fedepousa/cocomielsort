#include <iostream>
#include <vector>
#include <fstream>
#include <list>
#include <set>
#include <algorithm>
#include <queue>
#include <vector>
#include <cmath>
#include <algorithm>
#include <iostream>


#ifdef TIEMPOS
#include <sys/time.h>
#endif

using namespace std;

struct Clausula;
typedef int Variable;


#include "local.h"

vector<unsigned int> clausula_originales_a_clausulas_cc;
vector<unsigned int> variables_originales_a_variables_cc;


void mostrar_vector(vector<unsigned int> &v) {
  for(vector<unsigned int>::iterator it = v.begin(); it!=v.end();++it){
    cout << *it << " ";
  }
  cout << endl;
}

void mostrar_vector(vector<bool> &v) {
  for(vector<bool>::iterator it = v.begin(); it!=v.end();++it){
    cout << *it << " ";
  }
  cout << endl;
}

void mostrar_vector(vector<int> &v) {
  for(vector<int>::iterator it = v.begin(); it!=v.end();++it){
    cout << *it << " ";
  }
  cout << endl;
}
//Prototipos de las heredadas
static bool leer(ifstream &entrada, Caso **c,vector< vector<int> > &claus);
static void construir(Caso &c, Asignacion &asig, list<int> &clausulas_satisfechas);
unsigned int resolver(vector< vector<int> > &clausulas, vector<bool> &asignacion);
bool haceTrue(vector<int> &clausula, vector<bool> &asignacion);
void siguiente(vector<bool> &asignacion, int cant);
void generar_renombres(vector< vector <unsigned int > >  &renombres_clausulas, vector< vector <unsigned int > >  &renombres_variables, vector< vector <int > >  cc, unsigned int comp_conexa_de_la_iesima_clausula[], unsigned int v, Str_local &nueva, vector< vector <int > >  &cc1) ;




void generar_casos_cc(Str_local *casos[], vector< vector <unsigned int> >&renombres_clausulas, vector< vector <unsigned int> >&renombres_variables, Str_local &nueva, vector<bool> asignaciones[], vector<bool> & asignacion, vector< vector< int > > &clausulas,vector< vector< int > > clausulas_cc[], unsigned int max_iteraciones[], unsigned int max_iteraciones_maximas[], Caso *c[], Caso &caso_global) ;



void unificar_cc( unsigned int &max_iteracion_maxima, unsigned int max_iteraciones_maximas[],Str_local &nueva,  Str_local *casos[], vector< vector< unsigned int> > &renombres_variables, vector< vector< unsigned int> > &renombres_clausulas, vector<bool> asignaciones[], vector<bool> &asignacion) ;




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

//En este caso estamos tomando como criterio de parada un extremo, pero podria ser una cte como cantidad de pasos
		while(bandera){	
			//busco donde tengo el maximo, modificando de uno en uno la asignacion.
			nueva.elegir_asig_en_N(res, max_iteracion, i_max); //O(c*v)

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
	ofstream salida("Tp3LocalFiltro.out");
	#ifdef TIEMPOS
	ofstream tiempos("Tp3LocalFiltroTiempos.out");
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
		

		#ifdef TIEMPOS
		gettimeofday(&inicio, NULL);
    #endif
    
		v = caso->cant_variables;
		c = caso->cant_clausulas;
	  clausula_originales_a_clausulas_cc = vector<unsigned int>(c,0);
	  variables_originales_a_variables_cc = vector<unsigned int>(v,0);
    
    asignacion = vector<bool>( v , true);
	    
    //  Si quiero usar la heuristica constructiva sin dividir en cc
    // tengo que descomentar esto.
		//~ list<int> satisfechas;
		//~ Asignacion asig(*caso);
    //~ construir(*caso, asig, satisfechas);
    //~ asignacion.assign(asig.v,asig.v + asig.n);
		
		
		//aca habria que hacer que al vector asignacion, le llegue una asignacion valida, llamando a otra resolucion.	
		
		
		
			
		//El valor maximo hasta entonces
		//unsigned int max_iteracion = resolver(clausulas, asignacion); //O(c*v)
		//unsigned int max_iteracion_maxima = max_iteracion;
		unsigned int max_iteracion;
		unsigned int max_iteracion_maxima;
		bool bandera = true;
		unsigned int i_max;
	
		Str_local nueva(c,v,&asignacion,&clausulas,max_iteracion);  //O(c)
		nueva.estructurar();										//O(c * lit) = O( c * 2 v) = O(c*v)
		nueva.contarOkPorClausula();								//O(c * lit) = O( c * 2 v) = O(c*v)


		//A esta altura tengo en nueva.variables un array q por cada variable me dice en q clausulas incide.
		//Tengo clausulas que es vector de vector de int que me dice q variables hay por clausula
		
		
		//Creo y armo matriz de incidencia
		bool mat_in[c][c];
		for(unsigned int i=0;i<c;++i) {for(unsigned int j=0;j<c;++j) mat_in[i][j]=false;}
		
		
		//por cada clausula
		for(unsigned int i=0;i<c;++i){
			//por cada literal de cada clausula
			unsigned int cota= clausulas[i].size();
			for(unsigned int j=0;j<cota;++j){
					vector< str_incidencia > *vec  = &(nueva.variables[abs(clausulas[i][j])-1]);
					unsigned int cota2= vec->size();
					for(unsigned int k=0;k<cota2;++k){
						unsigned int c_amiga = (((*vec)[k]).indice);
						mat_in[i][c_amiga]= true;
					}
			}
		} 
		
		//Si son marcados o no;
		bool visitados[c];
		for(unsigned int i=0;i<c;++i) visitados[i]=false;
		
		
		//chequeo todos los nodos para comprobar que fueron visitados
		vector<vector<int> > cc;
		
		for(unsigned int i=0;i<c;++i){
			if(!visitados[i]){
				//Creo nueva cc
				vector<int> *nuevaCC = new vector<int>;
				//Creo cola
				queue<int> cola;
				//pusheo primera clausula de la nueva cc a la cola
				cola.push(i);
				//pusheo a la cc la primera clausula
				nuevaCC->push_back(i);
				visitados[i]=true;
				while(!cola.empty()){
					unsigned int actual = cola.front();
					cola.pop();
					for(unsigned int a=0;a<c;++a){
						if(mat_in[actual][a]&& (!visitados[a])) { 
							cola.push(a); 
							visitados[a]=true;
							nuevaCC->push_back(a);
						}							
					}
					
				}
				cc.push_back(*nuevaCC);
				delete nuevaCC;
			}
		}
		
		
		 

//  SE SUPONE QUE ACA YA TENES EN CC LO QDIJIMOS DE LAS COMP CONEXAS
// nueva.variable un array de vectores de str_incidencia
// osea q tenes por cada variable un vector con str_incidencia que si haces esa str_incidencia.indice te deberia dar el numero de clausula
//
    unsigned int comp_conexa_de_la_iesima_clausula[c];
    vector< vector <unsigned int > >  renombres_clausulas(  cc.size(), vector<unsigned int>());
    vector< vector <unsigned int > >  renombres_variables(  cc.size(), vector<unsigned int>());
    vector< vector <int> > cc_variables(  cc.size(), vector< int>());
    Caso *casos[cc.size()];
    Str_local *nuevas[cc.size()];
    generar_renombres(renombres_clausulas, renombres_variables, cc, comp_conexa_de_la_iesima_clausula,  v, nueva,cc_variables);
    vector<bool> asignaciones[cc.size()];
    vector< vector< int > > clausulas_cc[cc.size()];
    unsigned int max_iteraciones[cc.size()];
		unsigned int max_iteraciones_maximas[cc.size()]; 
		generar_casos_cc(nuevas, renombres_clausulas, renombres_variables, nueva, asignaciones,  asignacion,clausulas, clausulas_cc, max_iteraciones,  max_iteraciones_maximas, casos, *caso) ;
		for(int i = 0 ; i < cc.size() ; ++i) {
		  bandera = true;
		  local(res,max_iteraciones[i],max_iteraciones_maximas[i],i_max,*nuevas[i],asignaciones[i],bandera); //O(iter_criterio * c * v)
    }
		
	  unificar_cc( max_iteracion_maxima,  max_iteraciones_maximas,nueva,nuevas, renombres_variables,renombres_clausulas, asignaciones, asignacion ) ;
	
	
		#ifdef TIEMPOS
		gettimeofday(&fin, NULL);
		diferencia = (fin.tv_sec - inicio.tv_sec)*1000000 + fin.tv_usec - inicio.tv_usec;
		tiempos << diferencia << endl;
		#endif

		
		//Volcar resultados en archivo.
		if(resolver(clausulas,asignacion)!= max_iteracion_maxima) cout << "Estamos en el horno" << endl; 
		if(cc.size() > 1) cout << " Bien ahi, filtro! " << endl;
		escribirResultados(salida,nueva,asignacion,max_iteracion_maxima,c,v);
		

		asignacion.clear();
		clausulas.clear();
		delete caso;
	}
	return 0;
}

void unificar_cc( unsigned int &max_iteracion_maxima, unsigned int max_iteraciones_maximas[],Str_local &nueva,  Str_local *casos[], vector< vector< unsigned int> > &renombres_variables, vector< vector< unsigned int> > &renombres_clausulas, vector<bool> asignaciones[], vector<bool> &asignacion) {
  max_iteracion_maxima = 0;
  for(int cc = 0; cc < renombres_variables.size(); ++cc) {
    
    // Se puede copiar la asignacion que ya se tenia
    for(int var = 0 ; var < renombres_variables[cc].size();++var) {
      asignacion[renombres_variables[cc][var]] = asignaciones[cc][var];
    }
    
    // O se puede generar una constructiva
    
    for(int clau = 0 ; clau < renombres_clausulas[cc].size();++clau) {
      nueva.cant_ok_por_clausula[renombres_clausulas[cc][clau]] = casos[cc]->cant_ok_por_clausula[clau];
    }
    max_iteracion_maxima += max_iteraciones_maximas[cc];
  }
  
}
void generar_casos_cc(Str_local *casos[], vector< vector <unsigned int> >&renombres_clausulas, vector< vector <unsigned int> >&renombres_variables, Str_local &nueva, vector<bool> asignaciones[], vector<bool> & asignacion, vector< vector< int > > &clausulas,vector< vector< int > > clausulas_cc[], unsigned int max_iteraciones[], unsigned int max_iteraciones_maximas[], Caso *c[], Caso &caso_global) {
  for(int i = 0; i < renombres_clausulas.size();++i) {
    // El for recorre todas las cc
    
    const int cant_c = renombres_clausulas[i].size();
    const int cant_v = renombres_variables[i].size();
    
    // Lo siguiente solo es necesario si por alguna razon se quiere usar la heuristica 
		// constructiva en la cc.
		// *************************************************************
		c[i] = new Caso(cant_c, cant_v);
		for(int var = 0 ; var < cant_v; ++var) {
		  int var_orig = renombres_variables[i][var];
		  for(set<int>::iterator it = caso_global.literales[var_orig].clausulas.begin();it != caso_global.literales[var_orig].clausulas.end(); ++ it)  {
		    c[i]->literales[var].clausulas.insert(clausula_originales_a_clausulas_cc[(*it)-1]+1) ;
      }
		  for(set<int>::iterator it = caso_global.literales_negados[var_orig].clausulas.begin();it != caso_global.literales_negados[var_orig].clausulas.end(); ++ it)  {
		    
		    c[i]->literales_negados[var].clausulas.insert(clausula_originales_a_clausulas_cc[(*it)-1]+1) ;
      }
    }
    
    
		list<int> satisfechas;
		Asignacion asig(*c[i]);
    construir(*c[i], asig, satisfechas);
    asignaciones[i].assign(asig.v,asig.v + asig.n);
    
    // *************************************************************
    
    
    
    
    
    
    
    // Tambien se puede asignar directamente la asignacion global,
    // es decir, la que se creo sin tener en cuenta las cc.
    // *************************************************************
    //~ for(int var = 0; var<renombres_variables[i].size();++var) {
      //~ asignaciones[i].push_back(asignacion[renombres_variables[i][var]]);
    //~ }
    // Para cada variable (con el numero que recibe en la cc) 
    // le asigno el valor que tenia originalmente.
    // *************************************************************
    
    
    for(int clau = 0; clau<renombres_clausulas[i].size();++clau) {
      // A cada clausula (con el numero que recibe en la cc)
      // Le agrego a la lista de clausulas de la cc las variables (renombradas)
      // que aparecen originalmente.
      clausulas_cc[i].push_back(vector<int>());
      for(vector<int>::iterator it = clausulas[renombres_clausulas[i][clau]].begin(); it !=clausulas[renombres_clausulas[i][clau]].end() ; ++it) {
        if(*it > 0) {
          clausulas_cc[i][clau].push_back(variables_originales_a_variables_cc[(*it)-1]+1);
        }
        else {
          clausulas_cc[i][clau].push_back(-(variables_originales_a_variables_cc[abs(*it)-1]+1));
        }
      }
    }
    max_iteraciones[i] = resolver(clausulas_cc[i], asignaciones[i]);
    max_iteraciones_maximas[i] = max_iteraciones[i];
    casos[i] = new Str_local(cant_c, cant_v, &asignaciones[i], &clausulas_cc[i], max_iteraciones[i]);
    casos[i]->estructurar();
    casos[i]->contarOkPorClausula();
    //Str_local nueva(c,v,&asignaciones[i],&clausulas,max_iteracion);  //O(c)
		//nueva.estructurar();										//O(c * lit) = O( c * 2 v) = O(c*v)
		//nueva.contarOkPorClausula();								//O(c * lit) = O( c * 2 v) = O(c*v)
		
		
		
  }
}

void generar_renombres(vector< vector <unsigned int > >  &renombres_clausulas, vector< vector <unsigned int > >  &renombres_variables, vector< vector <int > >  cc, unsigned int comp_conexa_de_la_iesima_clausula[], unsigned int v, Str_local &nueva, vector< vector <int > >  &cc_variables) {
  for(int i = 0; i < cc.size();++i) {
      for(vector<int>::iterator it =cc[i].begin(); it != cc[i].end() ; ++it){
        renombres_clausulas[i].push_back(*it);
        comp_conexa_de_la_iesima_clausula[*it] = i;
	      clausula_originales_a_clausulas_cc[*it] = renombres_clausulas[i].size()-1;
      }
    }
    for(int i = 0; i< v; ++i) {
      if(!nueva.variables[i].empty()) {
        cc_variables[comp_conexa_de_la_iesima_clausula[nueva.variables[i][0].indice]].push_back(i);
        variables_originales_a_variables_cc[i] = cc_variables[comp_conexa_de_la_iesima_clausula[nueva.variables[i][0].indice]].size()-1;
      }
    }
    for(int i = 0; i < cc.size();++i) {
      for(vector<int>::iterator it =cc_variables[i].begin(); it != cc_variables[i].end() ; ++it){
        renombres_variables[i].push_back((*it));
      }
    }
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
