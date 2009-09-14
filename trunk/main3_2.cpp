#include <vector>
#include <iostream>
#include <fstream>
#include <cmath>
#include <stack>

using namespace std;

struct Casilla {
  Casilla();
  unsigned int x;
  unsigned int y;
  bool sana;
  bool apunta_abajo;
  bool apunta_derecha;
  unsigned int aristas;
};

Casilla::Casilla() : x(-1), y(-1), sana(true),apunta_abajo(false),apunta_derecha(false),aristas(5){}

struct Tablero {
  Tablero(int f, int c);
  Tablero(const Tablero& otro);
  Tablero & operator=(const Tablero &otro);
  ~Tablero();
  
  void partir_tablero(Tablero  &t1, Tablero &t2, bool h) const;
  
  Casilla **t;
  int f;
  int c;
  int cant_sanas;
};

void Tablero::partir_tablero(Tablero &t1, Tablero &t2, bool horizontal) const {
  unsigned int fila, col;
  for(int i  = 0;i<t1.f;++i) {
    for(int j=0;j<t1.c;++j) {
      t1.t[i][j] = t[i][j];
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
    }
  }
}

Tablero::Tablero(const Tablero &otro) : f(otro.f), c(otro.c), cant_sanas(otro.cant_sanas)  {
  t = new Casilla* [f];
  for(int i = 0; i<f;++i) {
    t[i] = new Casilla [c];
    for(int j =0 ;j<c;++j) {
      t[i][j] = otro.t[i][j];
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
    }
  }
  cant_sanas = otro.cant_sanas;
  return *this;
}
Tablero::Tablero(int f, int c) : f(f), c(c), cant_sanas(f*c) {
  t = new Casilla* [f];
  for(int i = 0; i<f;++i) {
    t[i] = new Casilla [c];
  }
}
Tablero::~Tablero() {
  for (int i = 0;i<f;++i) {
    delete [] t[i];
  }
  delete [] t;
}


static unsigned int cant_dist_unidos(const Tablero &tab1,const Tablero &tab2, bool horizontal, int de = 0);
static unsigned int cantidad_sanas(Tablero &t);
static unsigned int cantidad_dist(const Tablero &t) ;
static unsigned int contar_dist(const Tablero &t);



static bool es_completable(const Tablero &t) {
  bool res = t.cant_sanas%2==0;
  return res;
}

static unsigned int cantidad_dist(const Tablero &t) {
  if(!es_completable(t)) {
    return 0;
  }
  unsigned int res = 0;
  bool horizontal = t.f<t.c;
  if(t.f>2&&t.c>2) {
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
    tab1.cant_sanas = cantidad_sanas(tab1);
    tab2.cant_sanas = t.cant_sanas - tab1.cant_sanas;
    res = cantidad_dist(tab1) * cantidad_dist(tab2);
    res += cant_dist_unidos(tab1,tab2,horizontal);
  }
  else {
    res = contar_dist(t);
  }
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
static unsigned int contar_dist(const Tablero &t_input) {
  unsigned int res = 0;
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
  } while(!tableros.empty());
  return res;
}

static unsigned int cantidad_sanas(Tablero &t) {
  unsigned int res = 0;
  for(int i =0; i<t.f;++i) {
    for(int j=0;j<t.c;++j) {
      res += t.t[i][j].sana;
    }
  }
  return res;
}
static unsigned int cant_dist_unidos(const Tablero &tab1, const Tablero &tab2, bool horizontal, int de ) {
  unsigned int res = 0;
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
      --copia_tab1.cant_sanas ;
      --copia_tab2.cant_sanas ;
      res += cantidad_dist(copia_tab1) * cantidad_dist(copia_tab2);
      res += cant_dist_unidos(copia_tab1,copia_tab2,horizontal,i+1);
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
      conf.cant_sanas = cantidad_sanas(conf);
      res.push_back(conf);
      if(agregar) salida << endl;
      agregar = true;
      cout<<"----------------------Experimento numero: "<<conta<<"----------------------"<<endl;
      int totales = cantidad_dist(conf);
      cout<<"----------------------Cantidad totales: "<<totales<<"----------------------"<<endl;
      cout<<endl<<endl;
      cout<<"------------------------------------------------------------------"<<endl;
      salida <<totales;
	    



    }
    else b= false;
  }
  return res;
}

#include <cstdlib>
int main(int argc, char * argv[]) {
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
  
  unsigned int res = cantidad_dist(t);
  cout << res << endl;
  
  return 0;
}