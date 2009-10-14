#include <vector>
#include <iostream>
#include <fstream>
#include <cmath>
#include <stack>
#include <functional>
#include <list>
#include <utility>

using namespace std;



struct Casilla {
  Casilla();
  inline bool mas_aristas_que(const Casilla &otro) const;
  

  unsigned int x;
  unsigned int y;
  bool sana;
  bool apunta_abajo;
  bool apunta_derecha;
  void * tablero_asociado;
  inline int aristas() const;
};


typedef pair<unsigned int,Casilla*> aristas_pcasilla;


Casilla::Casilla() : x(-1), y(-1), sana(true),apunta_abajo(false),apunta_derecha(false),tablero_asociado(NULL){}

struct Tablero {
  Tablero(int f, int c,bool sanas = true);
  Tablero(const Tablero& otro);
  Tablero & operator=(const Tablero &otro);
  ~Tablero();
  
  void partir_tablero(Tablero  &t1, Tablero &t2, bool h) const;
  
  
  Casilla **t;
  int f;
  int c;
  int cant_sanas;
  int blancas, negras;
};

inline static bool se_puede_arriba(int f, int c, const Tablero & t) {
  bool res;
  res = f-1>=0 && t.t[f][c].sana && t.t[f-1][c].sana;
  return res;
}

inline static bool se_puede_izquierda(int f, int c, const Tablero & t) {
  bool res;
  res = c-1>=0 && t.t[f][c].sana && t.t[f][c-1].sana;
  return res;
}

inline static bool se_puede_derecha(int f, int c, const Tablero & t) {
  bool res;
  res = c+1<t.c && t.t[f][c].sana && t.t[f][c+1].sana;
  return res;
}

inline static bool se_puede_abajo(int f, int c, const Tablero & t) {
  bool res;
  res = f+1<t.f && t.t[f][c].sana && t.t[f+1][c].sana;
  return res;
}

inline static bool se_puede_alguno(int f, int c, const Tablero & t) {
  return se_puede_derecha(f,c,t)||se_puede_abajo(f,c,t);
}
inline int Casilla::aristas() const {
  int res = 0;
  res += se_puede_arriba(y,x,*static_cast<Tablero*>(tablero_asociado));
  res += se_puede_derecha(y,x,*static_cast<Tablero*>(tablero_asociado));
  res += se_puede_abajo(y,x,*static_cast<Tablero*>(tablero_asociado));
  res += se_puede_izquierda(y,x,*static_cast<Tablero*>(tablero_asociado));
  
  res *= static_cast<Tablero*>(tablero_asociado)->t[y][x].sana;
  return res;
}
inline bool Casilla::mas_aristas_que(const Casilla &otro) const {
  return this->aristas() > otro.aristas();
}

struct mas_aristas : public binary_function<Casilla*, Casilla*, bool> {
  inline bool operator()(Casilla *x, Casilla *y) { return x->mas_aristas_que(*y); }
};
void Tablero::partir_tablero(Tablero &t1, Tablero &t2, bool horizontal) const {
  unsigned int fila, col;
  for(int i  = 0;i<t1.f;++i) {
    for(int j=0;j<t1.c;++j) {
      t1.t[i][j] = t[i][j];
      t1.t[i][j].x = j;
      t1.t[i][j].y = i;
      t1.t[i][j].tablero_asociado = static_cast<void*>(&t1);
    }
  }
  for(int i  = 0;i<t2.f;++i) {
    for(int j=0;j<t2.c;++j) {
      
      if(horizontal) {
	fila = i;
	col = j+t1.c;
      }
      else {
	fila = i + t1.f;
	col = j;
      }
      t2.t[i][j] = t[fila][col];
      t2.t[i][j].x = j;
      t2.t[i][j].y = i;
      t2.t[i][j].tablero_asociado = static_cast<void*>(&t2);
    }
  }
  
}

Tablero::Tablero(const Tablero &otro) : f(otro.f), c(otro.c), cant_sanas(otro.cant_sanas), negras(otro.negras), blancas(otro.blancas)  {
  t = new Casilla* [f];
  for(int i = 0; i<f;++i) {
    t[i] = new Casilla [c];
    for(int j =0 ;j<c;++j) {
      t[i][j] = otro.t[i][j];
      t[i][j].tablero_asociado = static_cast<void*>(this);
    }
  }
}

Tablero & Tablero::operator=(const Tablero &otro) {
  for (int i = 0;i<f;++i) {
    delete [] t[i];
  }
  delete [] t;
  f = otro.f;
  c = otro.c;
  t = new Casilla* [f];
  for(int i = 0; i<f;++i) {
    t[i] = new Casilla [c];
    for(int j =0 ;j<c;++j) {
      t[i][j] = otro.t[i][j];
      t[i][j].tablero_asociado = static_cast<void*>(this);
    }
  }
  cant_sanas = otro.cant_sanas;
  negras = otro.negras;
  blancas = otro.blancas;
  return *this;
}
Tablero::Tablero(int f, int c,bool sanas) : f(f), c(c), cant_sanas(f*c), negras(cant_sanas/2), blancas(cant_sanas-negras) {
  if(!sanas) {
    cant_sanas = 0;
    negras = 0;
    blancas = 0;
  }
  t = new Casilla* [f];
  for(int i = 0; i<f;++i) {
    t[i] = new Casilla [c];
    for(int j = 0;j<c;++j){
      t[i][j].x= j;
      t[i][j].y= i;
      t[i][j].tablero_asociado = static_cast<void*>(this);
      t[i][j].sana = sanas;
    }
  }
}
Tablero::~Tablero() {
  for (int i = 0;i<f;++i) {
    delete [] t[i];
  }
  delete [] t;
}


static unsigned long long int cant_dist_unidos(const Tablero &tab1,const Tablero &tab2, bool horizontal, int de = 0);
static unsigned int cantidad_sanas_y_color(Tablero &t);
static unsigned long long int cantidad_dist( Tablero &t, bool first = true, bool b_filtrar =true) ;
static unsigned long long int contar_dist(const Tablero &t);
static bool filtrar(Tablero &t, vector<Casilla*>&);
static void dividir_disjuntos(Tablero & t, vector<Casilla*> &sanas, vector<Tablero*> & res);
static void agregar_alcanzables(list<Casilla*> &alcanzables, unsigned int &alcanzados, bool **visitados, Casilla *sana,unsigned int & min_f,unsigned int &max_f,unsigned int &min_c,unsigned int &max_c);
static void llenar_tablero(list<Casilla*> & alcanzables, Tablero &nuevo, unsigned int min_f, unsigned int min_c);


static bool es_completable(const Tablero &t) {
  bool res = t.cant_sanas%2==0&&t.negras==t.blancas;
  return res;
}

static unsigned long long int cantidad_dist( Tablero &t, bool first_time, bool b_filtrar) {
  
  unsigned long long int res = 0;
  cantidad_sanas_y_color(t);
  vector<Casilla*> sanas;
  vector<Tablero*> disjuntos;
  if(b_filtrar) {
    if(!filtrar(t,sanas)) {
      return 0;
    }
    dividir_disjuntos(t, sanas,  disjuntos);
  }
  if(disjuntos.size()>1) {
    res = 1;
    for(int i = 0;i<disjuntos.size();++i){
      res *= cantidad_dist(*disjuntos[i],false);
      delete disjuntos[i];
    }
    return res;
  }
  
  if(t.cant_sanas == 0) {
    return 1;
  }
  bool horizontal = t.f<t.c;
  if(t.f>2||t.c>2) {
    int cant_filas1, cant_filas2, cant_col1, cant_col2;
    if(horizontal) {
      cant_filas1 = t.f;
      cant_col1 = t.c/2;
      cant_filas2 = t.f;
      cant_col2 = t.c-(t.c/2);
    }
    else {
      cant_filas1 = t.f/2;
      cant_col1 = t.c;
      cant_filas2 = t.f-(t.f/2);
      cant_col2 = t.c;
    }
    Tablero tab1(cant_filas1,cant_col1);
    Tablero tab2(cant_filas2,cant_col2);
    t.partir_tablero(tab1, tab2, horizontal);
    res += cant_dist_unidos(tab1,tab2,horizontal);
    res += cantidad_dist(tab1) * cantidad_dist(tab2);
  }
  else {
    res = contar_dist(t);
  }
  return res;
}

static unsigned long long int cantidad_dist_contadas( Tablero& t) {
  unsigned long long int res = 0;
  vector<Casilla*> sanas;
  vector<Tablero*> disjuntos;
  if(filtrar(t,sanas)) {
    dividir_disjuntos(t, sanas,  disjuntos) ;
    res = 1;
    if(disjuntos.size()==0) {
      res = contar_dist(t);
    }
    else {
      for(int i = 0; i<disjuntos.size();++i) {
        res *= contar_dist(*disjuntos[i]);
      }
    }
  }
  else {
    res = 0;
  }
  return res;
}

static unsigned long long int contar_dist(const Tablero &t_input) {
  unsigned long long int res = 0;
  stack<Tablero> tableros;
  tableros.push(t_input);

  stack<int> s_fila, s_col;
  s_fila.push(0);
  s_col.push(0);
  //bool sacar = false;
  do {
    /*
    if(sacar) {
      tableros.pop();
      sacar = false;
    }
    */
    vector<Casilla*> sanas;
    if(filtrar(tableros.top(),sanas)) {
      Tablero &actual = tableros.top();
      int f, c;
      f = s_fila.top();
      s_fila.pop();
      c = s_col.top();
      s_col.pop();
          
      if(actual.f==f+1&& actual.c == c+1) 
      {
        if(!actual.t[f][c].sana) {
          ++res;
        }
        //sacar =true;
        tableros.pop();
      }
      else {
        if(se_puede_alguno(f,c,actual)) {
          bool derecha = se_puede_derecha(f,c,actual);
          bool abajo = se_puede_abajo(f,c,actual);
          if(derecha) {
            derecha = true;
            //Tablero nuevo_der(actual);
            //nuevo_der.t[f][c].sana = false;
            //nuevo_der.t[f][c+1].sana = false;
            //tableros.push(nuevo_der);
            actual.t[f][c].sana = false;
            actual.t[f][c+1].sana = false;
            s_fila.push(f);
            s_col.push(c+1);
          }
          if(abajo) {
            if(derecha) {
              Tablero nuevo_abajo(actual);
              nuevo_abajo.t[f][c+1].sana = true;
              nuevo_abajo.t[f][c].sana = false;
              nuevo_abajo.t[f+1][c].sana = false;
              tableros.push(nuevo_abajo);
              if(c+1<actual.c) {
                s_col.push(c+1);
                s_fila.push(f);
              }
              else {
                s_col.push(0);
                s_fila.push(f+1);
              }
            }
            else {
              actual.t[f][c].sana = false;
              actual.t[f+1][c].sana = false;
              if(c+1<actual.c) {
                s_col.push(c+1);
                s_fila.push(f);
              }
              else {
                s_col.push(0);
                s_fila.push(f+1);
              }
            }
          }
        }
        else {
          if(actual.t[f][c].sana) {
            tableros.pop();
          }
          else {
            if(c+1<actual.c) {
              s_col.push(c+1);
              s_fila.push(f);
            }
            else {
              s_col.push(0);
              s_fila.push(f+1);
            }
          }
        }
      }
    }
    else {
    tableros.pop();
    }
  } while(!tableros.empty());
  return res;
}
#include <cstdlib>
static unsigned int cantidad_sanas_y_color(Tablero &t) {
  unsigned int res = 0;
  unsigned int negras = 0;
  unsigned int blancas = 0;
  for(int i =0; i<t.f;++i) {
    for(int j=0;j<t.c;++j) {
      negras += abs(i-j)%2==1&&t.t[i][j].sana;
      blancas += abs(i-j)%2==0&&t.t[i][j].sana;
      res += t.t[i][j].sana;
    }
  }
  t.negras = negras;
  t.blancas = blancas;
  t.cant_sanas = res;
  return res;
}
static unsigned long long int cant_dist_unidos(const Tablero &tab1, const Tablero &tab2, bool horizontal, int de ) {
  unsigned long long int res = 0;
  int lim;
  if(horizontal) lim = tab1.f;
  else lim = tab1.c;
  int fila1,fila2, col1, col2;
  for(int i = de; i<lim; ++i) {
    if(horizontal) {
      fila1 = i;
      col1 = tab1.c-1;
      fila2 = i;
      col2 = 0;
    }
    else {
      fila1 = tab1.f-1;
      col1 = i;
      fila2 = 0;
      col2 = i;
    }
    if(tab1.t[fila1][col1].sana&&tab2.t[fila2][col2].sana) {
      Tablero copia_tab1(tab1);
      Tablero copia_tab2(tab2);
      copia_tab1.t[fila1][col1].sana = false;
      copia_tab2.t[fila2][col2].sana = false;
      copia_tab1.negras -= abs(fila1-col1)%2==1;
      copia_tab1.blancas -= abs(fila1-col1)%2!=1;
      copia_tab2.negras -= abs(fila2-col2)%2==1;
      copia_tab2.blancas -= abs(fila2-col2)%2!=1;
      --copia_tab1.cant_sanas ;
      --copia_tab2.cant_sanas ;
      res += cant_dist_unidos(copia_tab1,copia_tab2,horizontal,i+1);
      res += cantidad_dist(copia_tab1) * cantidad_dist(copia_tab2);
    }
  }
  
  return res;
}

vector<Tablero> leer(ifstream &archivo){
  vector<Tablero> res;
  int conta=0;
  int n;
  bool b=true;
  ofstream salida("Tp1Ej3.out");
  bool agregar = false;
  while(b){
  conta++;
    string tam_s;
    archivo >> n;
    if (n != -1){
      Tablero conf(n,n);
      for(int f = 0; f< n;f++){
	for (int c = 0; c< n;c++){
	  char temp = archivo.get();
	  while(temp!= '#' && temp!='_') {
	    temp = archivo.get();
	  }
	  conf.t[f][c].sana = ( temp=='#');
	}
	getline(archivo,tam_s,'\n');
      }
      cantidad_sanas_y_color(conf);
      res.push_back(conf);
      if(agregar) salida << endl;
      agregar = true;
      cout<<"----------------------Experimento numero: "<<conta<<"----------------------"<<endl;
      unsigned long long int totales = cantidad_dist(conf);
      cout<<"----------------------Cantidad totales: "<<totales<<"----------------------"<<endl;
      cout<<endl<<endl;
      cout<<"------------------------------------------------------------------"<<endl;
      salida <<totales;
	    



    }
    else b= false;
  }
  return res;
}
#include <algorithm>	
#include <set>
             
             
struct DirCambiadas {
  DirCambiadas (): derecha(false),arriba(false),abajo(false),izquierda(false) {};
  bool derecha;
  bool arriba;
  bool abajo;
  bool izquierda;
};


static DirCambiadas sacar_vecinos_sanos(Casilla * vecino, set<aristas_pcasilla> &sanas) {
  DirCambiadas res;
  Casilla * vecino_de_vecino = NULL;
  if(se_puede_arriba(vecino->y,vecino->x,*static_cast<Tablero*>(vecino->tablero_asociado))) {
    res.arriba = true;
    vecino_de_vecino = &static_cast<Tablero*>(vecino->tablero_asociado)->t[vecino->y-1][vecino->x];
    sanas.erase(make_pair(vecino_de_vecino->aristas(),vecino_de_vecino));
  }
  if(se_puede_derecha(vecino->y,vecino->x,*static_cast<Tablero*>(vecino->tablero_asociado))) {
    res.derecha = true;
    vecino_de_vecino = &static_cast<Tablero*>(vecino->tablero_asociado)->t[vecino->y][vecino->x+1];
    sanas.erase(make_pair(vecino_de_vecino->aristas(),vecino_de_vecino));
  }
  if(se_puede_abajo(vecino->y,vecino->x,*static_cast<Tablero*>(vecino->tablero_asociado))) {
    res.abajo = true;
    vecino_de_vecino = &static_cast<Tablero*>(vecino->tablero_asociado)->t[vecino->y+1][vecino->x];
    sanas.erase(make_pair(vecino_de_vecino->aristas(),vecino_de_vecino));
  }
  if(se_puede_izquierda(vecino->y,vecino->x,*static_cast<Tablero*>(vecino->tablero_asociado))) {
    res.izquierda = true;
    vecino_de_vecino = &static_cast<Tablero*>(vecino->tablero_asociado)->t[vecino->y][vecino->x-1];
    sanas.erase(make_pair(vecino_de_vecino->aristas(),vecino_de_vecino));
  }
  return res;
}

static void actualizar_sanas(Casilla * vecino, set<aristas_pcasilla> &sanas, const DirCambiadas &cambiada) {
  Casilla *vecino_de_vecino = NULL;
  if(cambiada.arriba) {
    vecino_de_vecino = &static_cast<Tablero*>(vecino->tablero_asociado)->t[vecino->y-1][vecino->x];
    sanas.insert(make_pair(vecino_de_vecino->aristas(),vecino_de_vecino));
  }
  if(cambiada.derecha) {
    vecino_de_vecino = &static_cast<Tablero*>(vecino->tablero_asociado)->t[vecino->y][vecino->x+1];
    sanas.insert(make_pair(vecino_de_vecino->aristas(),vecino_de_vecino));
  }
  if(cambiada.abajo) {
    vecino_de_vecino = &static_cast<Tablero*>(vecino->tablero_asociado)->t[vecino->y+1][vecino->x];
    sanas.insert(make_pair(vecino_de_vecino->aristas(),vecino_de_vecino));
  }
  if(cambiada.izquierda) {
    vecino_de_vecino = &static_cast<Tablero*>(vecino->tablero_asociado)->t[vecino->y][vecino->x-1];
    sanas.insert(make_pair(vecino_de_vecino->aristas(),vecino_de_vecino));
  }
}


static bool filtrar(Tablero &t, vector<Casilla*> &sanas_out) {
  bool res;
  sanas_out.clear();
  set<aristas_pcasilla> sanas;
  t.cant_sanas = 0;
  t.negras = 0;
  t.blancas = 0;
  for(int f=0;f<t.f;++f){
    for(int c = 0;c<t.c;++c) {
      if(t.t[f][c].sana) {
	sanas.insert(make_pair(t.t[f][c].aristas(),&t.t[f][c]));
	++t.cant_sanas;
	t.negras += abs(f-c)%2==1&&t.t[f][c].sana;
	t.blancas += abs(f-c)%2==0&&t.t[f][c].sana;
      }
    }
  }
  res = es_completable(t);
  DirCambiadas vecinos_cambiados;
  if(res) {
    bool go_on = true;
    Casilla * vecino;
    while(go_on&&!sanas.empty()) {
      Casilla &temp = *(*sanas.begin()).second;
      res = !(temp.sana && temp.aristas() == 0);
      if(temp.aristas()==1) {
      	sanas.erase(make_pair(temp.aristas(),&temp));
        
	--t.cant_sanas;
	--t.cant_sanas;
	--t.negras;
	--t.blancas;
	if(se_puede_arriba(temp.y,temp.x,*static_cast<Tablero*>(temp.tablero_asociado))) {
	  vecino = &static_cast<Tablero*>(temp.tablero_asociado)->t[temp.y-1][temp.x];
          sanas.erase(make_pair(vecino->aristas(),vecino));
          static_cast<Tablero*>(temp.tablero_asociado)->t[temp.y][temp.x].sana = false;
          
          
          
          vecinos_cambiados = sacar_vecinos_sanos(vecino, sanas );
          static_cast<Tablero*>(temp.tablero_asociado)->t[temp.y-1][temp.x].sana = false;
          actualizar_sanas(vecino,sanas,vecinos_cambiados);
	}
	if(se_puede_derecha(temp.y,temp.x,*static_cast<Tablero*>(temp.tablero_asociado))) {
	  vecino = &static_cast<Tablero*>(temp.tablero_asociado)->t[temp.y][temp.x+1];
	  sanas.erase(make_pair(vecino->aristas(),vecino));
	  static_cast<Tablero*>(temp.tablero_asociado)->t[temp.y][temp.x].sana = false;
          
          
          vecinos_cambiados = sacar_vecinos_sanos(vecino, sanas );
          static_cast<Tablero*>(temp.tablero_asociado)->t[temp.y][temp.x+1].sana = false;
          actualizar_sanas(vecino,sanas,vecinos_cambiados);
	}
	if(se_puede_abajo(temp.y,temp.x,*static_cast<Tablero*>(temp.tablero_asociado))) {
	  vecino = &static_cast<Tablero*>(temp.tablero_asociado)->t[temp.y+1][temp.x];
	  sanas.erase(make_pair(vecino->aristas(),vecino));
	  static_cast<Tablero*>(temp.tablero_asociado)->t[temp.y][temp.x].sana = false;
          
          
          vecinos_cambiados = sacar_vecinos_sanos(vecino, sanas );
          static_cast<Tablero*>(temp.tablero_asociado)->t[temp.y+1][temp.x].sana = false;
          actualizar_sanas(vecino,sanas,vecinos_cambiados);
	}
	if(se_puede_izquierda(temp.y,temp.x,*static_cast<Tablero*>(temp.tablero_asociado))) {
	  vecino = &static_cast<Tablero*>(temp.tablero_asociado)->t[temp.y][temp.x-1];
	  sanas.erase(make_pair(vecino->aristas(),vecino));
	  static_cast<Tablero*>(temp.tablero_asociado)->t[temp.y][temp.x].sana = false;
          
          
          vecinos_cambiados = sacar_vecinos_sanos(vecino, sanas );
          static_cast<Tablero*>(temp.tablero_asociado)->t[temp.y][temp.x-1].sana = false;
          actualizar_sanas(vecino,sanas,vecinos_cambiados);
	}
      }
      if(temp.aristas()>1||!res) {
	for(set<aristas_pcasilla>::iterator it = sanas.begin();it!=sanas.end();++it) {
	  sanas_out.push_back(it->second);
	}
	go_on = false;
      }
    }
  }
  return res;
}


void mostrar(bool ** t, int lim_f, int lim_c) {
  for(int z=0;z<lim_f;++z){
    for(int w =0;w<lim_c;++w) {
      cout << t[z][w] << " ";
    }
    cout << endl;
  }
}

static void dividir_disjuntos(Tablero & t, vector<Casilla*> &sanas, vector<Tablero*> & disj) {
  disj.clear();
  bool **visitados;
  unsigned int alcanzados = 0;
  visitados = new bool*[t.f];
  for(int f = 0; f<t.f;++f) {
    visitados[f] = new bool[t.c];
    for(int c = 0;c<t.c;++c){
      visitados[f][c] = false;
    }
  }
  
  int i = 0;
  int f, c;
  while(alcanzados < t.cant_sanas) {
    list<Casilla*> alcanzables;
    unsigned int min_f;
    unsigned int max_f;
    unsigned int min_c;
    unsigned int max_c;
    f = sanas[i]->y;
    c = sanas[i]->x;
    while((!sanas[i]->sana) || (visitados[f][c])) {
      ++i;
      f = sanas[i]->y;
      c = sanas[i]->x;
    }
    //cout << "!sana: " << (!sanas[i]->sana) << endl;
    //cout << "visitados: " << (visitados[sanas[i]->y][sanas[i]->y]) << endl;
    //cout << ((!sanas[i]->sana)|| visitados[sanas[i]->y][sanas[i]->y]) << endl;
    agregar_alcanzables(alcanzables,alcanzados, visitados, sanas[i], min_f,max_f,min_c,max_c);
    if(disj.size()>0||alcanzados<t.cant_sanas) {
      Tablero * nuevo = new Tablero(max_f-min_f+1,max_c-min_c+1,false);
      llenar_tablero(alcanzables,*nuevo,min_f,min_c);
      disj.push_back(nuevo);
    }
  }
  for(int f = 0; f<t.f;++f) {
    delete [] visitados[f];
  }
  delete [] visitados;
}


static void llenar_tablero(list<Casilla*> & alcanzables, Tablero &nuevo, unsigned int min_f, unsigned int min_c) {
  Casilla * temp;
    bool es_blanca;
    int f, c;
    while(!alcanzables.empty()) {
      temp =  alcanzables.back();
      alcanzables.pop_back();
      f = temp->y-min_f;
      c = temp->x-min_c;
      nuevo.t[f][c].sana = true;
      ++nuevo.cant_sanas;
      es_blanca = abs(f-c) %2 == 0;
      nuevo.blancas += es_blanca;
      nuevo.negras += !es_blanca;
    }
}

static void agregar_alcanzables(list<Casilla*> &alcanzables, unsigned int &alcanzados, bool **visitados, Casilla *sana,unsigned int & min_f,unsigned int &max_f,unsigned int &min_c,unsigned int &max_c) {
  min_f = sana->y;
  max_f = sana->y;
  min_c  = sana->x;
  max_c = sana->x;
  list<Casilla*> a_explorar;
  a_explorar.push_back(sana);
  alcanzables.push_back(sana);
  unsigned int f, c;
  visitados[sana->y][sana->x] = true;
  while(!a_explorar.empty()) {
    ++alcanzados;
    Casilla * temp = a_explorar.back();
    a_explorar.pop_back();
    f = temp->y;
    c = temp->x;
    if(f<min_f) min_f = f;
    if(f>max_f) max_f = f;
    if(c<min_c) min_c = c;
    if(c>max_c) max_c = c;
    if(se_puede_arriba(f,c,*static_cast<Tablero*>(temp->tablero_asociado))&&!visitados[f-1][c]) {
      a_explorar.push_back(&static_cast<Tablero*>(temp->tablero_asociado)->t[f-1][c]);
      visitados[f-1][c] = true;
      alcanzables.push_back(&static_cast<Tablero*>(temp->tablero_asociado)->t[f-1][c]);
    }
    if(se_puede_derecha(f,c,*static_cast<Tablero*>(temp->tablero_asociado))&&!visitados[f][c+1]) {
      a_explorar.push_back(&static_cast<Tablero*>(temp->tablero_asociado)->t[f][c+1]);
      visitados[f][c+1] = true;
      alcanzables.push_back(&static_cast<Tablero*>(temp->tablero_asociado)->t[f][c+1]);
    }
    if(se_puede_abajo(f,c,*static_cast<Tablero*>(temp->tablero_asociado))&&!visitados[f+1][c]) {
      a_explorar.push_back(&static_cast<Tablero*>(temp->tablero_asociado)->t[f+1][c]);
      visitados[f+1][c] = true;
      alcanzables.push_back(&static_cast<Tablero*>(temp->tablero_asociado)->t[f+1][c]);
    }
    if(se_puede_izquierda(f,c,*static_cast<Tablero*>(temp->tablero_asociado))&&!visitados[f][c-1]) {
      a_explorar.push_back(&static_cast<Tablero*>(temp->tablero_asociado)->t[f][c-1]);
      visitados[f][c-1] = true;
      alcanzables.push_back(&static_cast<Tablero*>(temp->tablero_asociado)->t[f][c-1]);
    }
  }
}


int main(int argc, char * argv[]) {
  /*
  unsigned long long int res2 = 1;
  res2 = 89;
  res2 *= 89;
  
  res2 *= 89;
  
  res2 *= 89;
  
  res2 *= 89;
  
  cout << res2 << endl;
  return 0;
  */
  ifstream entrada("Tp1Ej3.in");
  leer(entrada);
  return 0;
  if(argc<3) {
    cout << "Uso: " << endl;
    cout << argv[0] << " nro_f nro_c" << endl;
    cout << "Donde nro_f es el numero de filas del tablero y nro_c el numero ";
    cout << "de columnas. " << endl;
    return 0;
  }
  string temp = argv[1];
  string temp2 = argv[2];
  Tablero t(atoi(temp.c_str()),atoi(temp2.c_str()));
  
  unsigned long long int res = cantidad_dist(t);
  cout << res << endl;
  
  return 0;
}
