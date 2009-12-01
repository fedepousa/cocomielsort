#include <vector>
#include <cmath>
#include <algorithm>
#include <iostream>
#include <vector>


using namespace std;
struct TabuStruct;
		struct str_incidencia{ unsigned int indice; bool p;	};
		
class Str_local{

	public:
	
	
	

	
	  
	
		Str_local(int c, int v, vector<bool> *asig, vector< vector< int > > *claus, unsigned int clau_verd);
		
		~Str_local();
		

		void estructurar();

		void contarOkPorClausula();

		int resolverEspecial(unsigned int i, vector <str_incidencia> &variables_a_cambiar, bool valor,bool cambiar);
			  
		 
		void elegir_asig_en_N(int &res, unsigned int &max_iteracion, unsigned int & i_max, unsigned int &max_iteracion_maxima, TabuStruct &tabu);

    void actualizar_clausulas_satisfechas(TabuStruct & tabu);
    
		int clau;
		int var;
		unsigned int clausulas_verdaderas;
		vector<str_incidencia> *variables; // Array de vectors
		unsigned int *cant_ok_por_clausula;
		vector<bool> *asignacion;
		vector< vector< int > > *clausulas;
};


struct TabuStruct {
  TabuStruct(int tabu_longitud, unsigned int cant_max_iteraciones, unsigned int cant_max_iteraciones_entre_optimos, unsigned int cant_variables, Str_local &local) : tabu_longitud(tabu_longitud),tabu_lit(cant_variables,-tabu_longitud), iteracion(0), iteracion_ultimo_maximo(0), cant_max_iteraciones(cant_max_iteraciones), cant_max_iteraciones_entre_optimos(cant_max_iteraciones_entre_optimos),  maxima_cant_satisfechos(0), mejor_asignacion(*local.asignacion) {
    local.actualizar_clausulas_satisfechas(*this);
    };
  
  int tabu_longitud;
  vector<int> tabu_lit;
  int iteracion;
  int iteracion_ultimo_maximo;
  unsigned int cant_max_iteraciones;
  unsigned int cant_max_iteraciones_entre_optimos;
  unsigned int maxima_cant_satisfechos;
  vector<unsigned int> clausulas_satisfechas_en_ultimo_maximo;
  vector<bool> mejor_asignacion;
};






Str_local::Str_local(int c, int v, vector<bool> *asig, vector< vector< int > > *claus, unsigned int clau_verd){
	clau = c;
	var = v;
	asignacion = asig;
	clausulas = claus;
	cant_ok_por_clausula = new unsigned int[c];
	variables = new vector<str_incidencia> [v];
	for(unsigned int i = 0; i<c; ++i) cant_ok_por_clausula[i] = 0;
	clausulas_verdaderas = clau_verd;
	
}

Str_local::~Str_local(){
	
	//borro el vector que lleva la suma de las clausulas
	delete [] cant_ok_por_clausula;	
	
	//borro el array variables
	delete [] variables;
	
}



void Str_local::estructurar(){
	vector< vector<int> > *clausu = clausulas;
	unsigned int c= clausu->size();
	for(unsigned int i = 0; i<c;++i){
		unsigned int long_clau = ((*clausu)[i]).size();
		for(unsigned int j = 0; j<long_clau;++j){
			//la variable que incide
			int variable = ((*clausu)[i])[j];
			
			//creo una str_indicencia nuevo para meterlo en el vector

			str_incidencia *nueva = new str_incidencia;
			//seteo el str_incidencia
			nueva->indice =  i; 
			nueva->p = (variable>0); 
			
			//pusheo la nueva estructura
			variables[ abs( variable)-1].push_back(*nueva);
			delete nueva;
			}
	}
	
	
	
	
}
	
void Str_local::contarOkPorClausula(){
// O(c * v)
	unsigned int c= clausulas->size();
	for(unsigned int i = 0; i<c;++i){
		unsigned int lit = (*clausulas)[i].size();
		for(unsigned int j = 0; j<lit;++j){
			int temp = (((*clausulas)[i])[j]);
			if (((temp>0) && (*asignacion)[temp-1]) || ((temp<0) && !(*asignacion)[abs(temp)-1]) ) ++cant_ok_por_clausula[i];
		}	
	}
}

int Str_local::resolverEspecial(unsigned int i, vector <str_incidencia> &variables_a_cambiar, bool valor,bool cambiar){
	// en i voy a tener el indice de la variable
	// en variables_a_cambiar voy a tener las clausulas donde incide la variable
	// valor el valor al cual cambie

		 unsigned int cant_clau_a_modificar = variables_a_cambiar.size();
		 int clausulas_q_cambian=0;
		 for(unsigned int j=0; j <cant_clau_a_modificar; ++j){
			 unsigned int numero_clausula = variables_a_cambiar[j].indice;
			 bool positiva =variables_a_cambiar[j].p;
			 unsigned int valor_por_clausula = cant_ok_por_clausula[numero_clausula];
			//si valor falso y positva entonces tengo que restar uno
			//si valor falso y positiva es falso sumo uno
			//si valor verdadero y positivo esta ok sumo uno
			//si valor verdadero y positivo esta falso, resto 1
		
			bool estaba_en_cero = (valor_por_clausula==0);
		
			
			if (valor==positiva) ++valor_por_clausula;
			else --valor_por_clausula;
			if(estaba_en_cero && (valor_por_clausula != 0)) ++clausulas_q_cambian;
			if(!estaba_en_cero && (valor_por_clausula==0)) --clausulas_q_cambian;
			if (cambiar){ 
				cant_ok_por_clausula[numero_clausula] = valor_por_clausula;
			}
		 }
		 if(cambiar) {
				clausulas_verdaderas +=clausulas_q_cambian;
     }
		 return (clausulas_q_cambian + clausulas_verdaderas);
}

void Str_local::actualizar_clausulas_satisfechas(TabuStruct & tabu) {
  tabu.clausulas_satisfechas_en_ultimo_maximo.clear();
  for(int i= 0; i<clau;++i) if(cant_ok_por_clausula[i])  tabu.clausulas_satisfechas_en_ultimo_maximo.push_back(i + 1);
  tabu.maxima_cant_satisfechos = tabu.clausulas_satisfechas_en_ultimo_maximo.size();
}
	  
void Str_local::elegir_asig_en_N(int &res, unsigned int &max_iteracion, unsigned int & i_max, unsigned int &max_iteracion_maxima, TabuStruct &tabu) {
  for(unsigned int i= 0; i <var; ++i){
      //niego una
      (*asignacion)[i] = !((*asignacion)[i]);
	  
      //me fijo a ver si negandola tengo un mejor resultado
      res = resolverEspecial(i, ((variables)[i]),((*asignacion)[i]),false);
	       
      //en caso de ser mejor que la optima hasta ahora o en caso de no estar en la lista tabu, actualizo el max_iteracion y me guardo el indice que cambie
      
      if(tabu.tabu_lit[i]+tabu.tabu_longitud <= tabu.iteracion || res > max_iteracion_maxima) {
        if (res> max_iteracion) {max_iteracion = res; i_max = i;} 
      }
      
      //vuelvo a la asignacion de que parti
     (*asignacion)[i] = !((*asignacion)[i]);			
    }  
}

		

struct Literal {
  Literal() {
    asignada = false;
  };
  Literal(const Literal& otro) {
    negacion = otro.negacion;
    v = otro.v;
    clausulas = otro.clausulas;
    asignada = otro.asignada;
    };
  Literal(bool n, Variable v) : negacion(n), v(v) {
    asignada = false;
  };
  bool operator!= (const Literal &otro) const {
    return negacion != otro.negacion || v!=otro.v;
  };
  void operator= (const Literal &otro) {
    negacion = otro.negacion;
    v = otro.v;
    clausulas = otro.clausulas;
    asignada = otro.asignada;
  };
  bool negacion;
  Variable v;
  set<int> clausulas;
  bool asignada;
};

struct Clausula {
  Clausula() {};
  Clausula(const Clausula & otro) : numero(otro.numero) {};
  int numero;
  
};


struct Caso {
  ~Caso();
  Caso(int cant_clausulas, int cant_variables) : cant_clausulas(cant_clausulas), cant_variables(cant_variables) {
    clausulas = new Clausula[cant_clausulas];
    literales = new Literal[cant_variables];
    literales_negados = new Literal[cant_variables];
    for(int i =0;i<cant_variables;++i) {
      literales[i].v = i+1;
      literales[i].negacion = false;
      literales_negados[i].v = i+1;
      literales_negados[i].negacion = true;
    }
  };
  int cant_clausulas;
  int cant_variables;
  int indice_mas_conveniente;
  bool mas_conveniente_es_negado;
  Clausula *clausulas;
  Literal *literales;
  Literal *literales_negados;
};

Caso::~Caso() {
  delete [] clausulas;
  delete [] literales;
  delete [] literales_negados;
}

struct Asignacion {
  Asignacion() {};
  ~Asignacion();
  Asignacion(const Caso &c) : n(c.cant_variables) {v = new bool [n];};
  int n;
  bool *v;
};

Asignacion::~Asignacion() {
  delete [] v;
}

inline static void asignar_literal(const Literal &lit, list<Literal*> &literales, list<int>& clausulas_satisfechas, Asignacion &asig, Caso &c) {
  c.literales[lit.v-1].asignada = true;
  c.literales_negados[lit.v-1].asignada = true;
  set<int>::const_iterator beg = lit.clausulas.begin();
  set<int>::const_iterator en = lit.clausulas.end();
  list<int> temp; 
  temp.assign(beg,en);
  clausulas_satisfechas.merge(temp);
  asig.v[lit.v-1] = !lit.negacion;
  bool eliminar = false;
  list<Literal*>::iterator viejo;
  int max_claus = 0;
  for(list<Literal*>::iterator it = literales.begin(); it!=literales.end();++it) {
    if(eliminar) {
      literales.erase(viejo);
      eliminar = false;
    }
    if((*it)->asignada) {
      eliminar = true;
    }
    else {
      for(set<int>::const_iterator it_clausula = beg; it_clausula!=en;++it_clausula) {
        (*it)->clausulas.erase(*it_clausula);
      }
      if((*it)->clausulas.size() > max_claus)
      {
        max_claus = (*it)->clausulas.size();
        c.indice_mas_conveniente = (*it)->v-1;
        c.mas_conveniente_es_negado = (*it)->negacion;
      }
    } 
        
    viejo = it;
  
  }
}
inline static Literal * elegir_literal(const list<Literal*> &literales, Caso &c) {
  Literal * res;
  if(c.mas_conveniente_es_negado) {
    res = &c.literales_negados[c.indice_mas_conveniente];
  }
  else {
    res = &c.literales[c.indice_mas_conveniente];
  }
  return res;
}
void mostrar_lista(list<int> &l) {
  for(list<int>::iterator it = l.begin();it!=l.end();++it) {
    cout << *it << " ";
  }
  cout << endl;
}
void mostrar_set(set<Literal> &l) {
  for(set<Literal>::iterator it = l.begin();it!=l.end();++it) {
    cout << (*it).v <<" negado:" << (*it).negacion<<   " clausulas: " << (*it).clausulas.size() << endl ;
  }
  cout << endl;
}
inline static void asignar_literales_faltantes(list<Literal*> &literales, Asignacion &asig, Caso &c) {
  for(list<Literal*>::iterator it = literales.begin();it!=literales.end();++it) {
    if(!(*it)->asignada) {
      asig.v[(*it)->v-1] = !(*it)->negacion;
      c.literales[(*it)->v-1].asignada = true;
      c.literales_negados[(*it)->v-1].asignada = true;
    }
  }
}
static void construir(Caso &c, Asignacion &asig, list<int> &clausulas_satisfechas) {
  clausulas_satisfechas.clear();
  bool termine_asignacion = false;
  list<Literal*> literales;
  int max_claus = 0;
  for(int i = 0 ; i <c.cant_variables;++i) {
    literales.push_back(&c.literales[i]);
    if(c.literales[i].clausulas.size() >= max_claus)
    {
      max_claus = c.literales[i].clausulas.size();
      c.indice_mas_conveniente = i;
      c.mas_conveniente_es_negado = c.literales[i].negacion;
    }
    literales.push_back(&c.literales_negados[i]);
        if(c.literales_negados[i].clausulas.size() >= max_claus)
    {
      max_claus = c.literales_negados[i].clausulas.size();
      c.indice_mas_conveniente = i;
      c.mas_conveniente_es_negado = c.literales_negados[i].negacion;
    }
  }
  while(!termine_asignacion) {
    Literal* mas_conveniente = elegir_literal(literales,c);
    asignar_literal(*mas_conveniente, literales, clausulas_satisfechas, asig,c);
    clausulas_satisfechas.unique();
    termine_asignacion = clausulas_satisfechas.size() == c.cant_clausulas;
    if(c.mas_conveniente_es_negado) {
      termine_asignacion |= c.literales_negados[c.indice_mas_conveniente ].asignada;
    }
    else {
      termine_asignacion |= c.literales[c.indice_mas_conveniente ].asignada;
    }
  }
  asignar_literales_faltantes(literales,asig,c);
}


