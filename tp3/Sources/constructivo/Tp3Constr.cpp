#include <iostream>
#include <fstream>
#include <vector>
#include <list>
#include <set>
#include <algorithm>

using namespace std;

struct Clausula;
typedef int Variable;
struct Literal {
  Literal() {
    //clausulas = new list<int>();
    asignada = false;
  };
  Literal(const Literal& otro) {
    //clausulas->assign(otro.clausulas->begin(),otro.clausulas->end()) ;
    negacion = otro.negacion;
    v = otro.v;
    clausulas = otro.clausulas;
    asignada = otro.asignada;
    };
  Literal(bool n, Variable v) : negacion(n), v(v) {
    //clausulas = new list<int>();
    asignada = false;
  };
  bool operator== (const Literal &otro) const {
    return negacion == otro.negacion && v==otro.v;
  };
  bool operator!= (const Literal &otro) const {
    return negacion != otro.negacion || v!=otro.v;
  };
  bool operator< (const Literal &c) const {
    return clausulas.size() < c.clausulas.size() || (clausulas.size() == c.clausulas.size() && *this != c);
  };
  void operator= (const Literal &otro) {
    negacion = otro.negacion;
    v = otro.v;
    clausulas = otro.clausulas;
    asignada = otro.asignada;
    //clausulas->assign(otro.clausulas->begin(),otro.clausulas->end()) ;
  };
  bool negacion;
  Variable v;
  set<int> clausulas;
  bool asignada;
};

struct Clausula {
  Clausula() {
  };
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

static bool leer(ifstream &entrada, Caso **c);
static void construir(Caso &c, Asignacion &asig, list<int> &clausulas_satisfechas);
static void resolver(ofstream &salida, Caso &c);

int main() {
  ifstream entrada("Tp3.in");
  ofstream salida("Tp3Constr.out");
  #ifdef TIEMPOS
	ofstream tiempos("Tp3ConstrTiempos.out");
	timeval inicio;
	timeval fin;
	double diferencia;
	#endif
  Caso *c;
  while(leer(entrada,&c)) {
    #ifdef TIEMPOS
		gettimeofday(&inicio, NULL);
	  #endif
    resolver(salida,*c);
    #ifdef TIEMPOS
		gettimeofday(&fin, NULL);
		diferencia = (fin.tv_sec - inicio.tv_sec)*1000000 + fin.tv_usec - inicio.tv_usec;
		
		tiempos << diferencia << endl;
		#endif
    delete c;
  }
  return 0;
}

static bool leer(ifstream &entrada, Caso **d) {
  bool success;
  int cant_clausulas, cant_variables;
  entrada >> cant_clausulas >> cant_variables;
  success = cant_variables!= -1 && cant_clausulas != -1;
  if(success) {
    Caso *c = new Caso(cant_clausulas, cant_variables);
    for(int i = 0;i<c->cant_clausulas;++i) {
      int literales;
      entrada >> literales;
      Clausula temp_clausula;
      temp_clausula.numero = i+1;
      for(int j = 1; j <= literales;++j) {
        int temp;
        Literal temp_literal;
        entrada >> temp;
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


static void resolver(ofstream &salida, Caso &c) {
  Asignacion res(c); 
  list<int> satisfechas;
  construir(c, res, satisfechas);
  salida << satisfechas.size() << endl;
  salida << "C";
  for(list<int>::iterator it = satisfechas.begin() ; it!=satisfechas.end();++it) {
    salida  << " " << *it;
  }
  salida << endl;
  salida << "V";
  for(int i = 0 ; i<c.cant_variables;++i) {
    if(res.v[i]) {
      salida<< " " << i+1;
    }
  }
  salida << endl;
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
