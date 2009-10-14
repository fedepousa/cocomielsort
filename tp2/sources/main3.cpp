#include <iostream>
#include <fstream>
#include <vector>
#include <sys/time.h>


using namespace std;


void strassen(int **m, int **a, int **b, int start_a_x, int start_a_y, int start_b_x, int start_b_y, int n, int start_m_x, int start_m_y);


void invertir(int ** a, int n);
void resolver(vector<int> *adyacencias,int n,  int &a, int &b, int &c, int &d, int &e, int &f);
int main() {
  ifstream entrada("Tp2Ej3.in");
  ofstream salida("Tp2Ej3.out");
	ofstream tiempos("Tp2Ej3Tiempos.out"); //Aca escribimos los tiempos
	timeval inicio;
	timeval fin;
	double diferencia;
  int n;
  while(entrada >> n && n!=-1) {
    int temp,a,b,c,d,e,f;
    int k;
    vector<int> *adyacencias = new vector<int>[n];
    for(int i = 0; i<n; ++i) {
      entrada >> k;
      for(int j = 0 ; j<k;++j) {
        entrada >> temp;
        adyacencias[i].push_back(temp-1);
      }
    }
    
    
    gettimeofday(&inicio, NULL);
    resolver(adyacencias, n, a, b, c, d, e, f);
    gettimeofday(&fin, NULL);
    diferencia = (fin.tv_sec - inicio.tv_sec)*1000000 + fin.tv_usec - inicio.tv_usec;
    tiempos << diferencia << endl;
    salida << a << " "<< b <<  " "<< c << " " << d << " "<< e << " "<<f << '\n';
    delete [] adyacencias;
  }
  
  
  return 0;  
}



void sumar(int **m, int **a, int **b, int start_a_x, int start_a_y, int start_b_x, int start_b_y, int n, int start_m_x, int start_m_y) {
  for(int f = 0; f< n; ++f) {
    for(int c = 0; c<n; ++c) {
      m[start_m_x + f][start_m_y + c] = a[start_a_x+f][start_a_y+c] + b[start_b_x+f][start_b_y+c]; 
    }
  }
}


void restar(int **m, int **a, int **b, int start_a_x, int start_a_y, int start_b_x, int start_b_y, int n, int start_m_x, int start_m_y) {
  for(int f = 0; f< n; ++f) {
    for(int c = 0; c<n; ++c) {
      m[start_m_x + f][start_m_y + c] = a[start_a_x+f][start_a_y+c] - b[start_b_x+f][start_b_y+c]; 
    }
  }
}





// Estoy suponiendo n potencia de 2
// El rango obviamente [start, start+n)
void strassen(int **m, int **a, int **b, int start_a_x, int start_a_y, int start_b_x, int start_b_y, int n, int start_m_x, int start_m_y) {
  if(n==1) {
    m[start_m_x][start_m_y] = a[start_a_x][start_a_y] * b[start_b_x][start_b_y]; 
  }
  else {
    int **m1 = new int * [n/2];
    int **temp_m1 = new int * [n/2];
    int **m2 = new int * [n/2];
    int **m3 = new int * [n/2];
    int **m4 = new int * [n/2];
    int **m5 = new int * [n/2];
    int **m6 = new int * [n/2];
    int **temp_m6 = new int * [n/2];
    int **m7 = new int * [n/2];
    int **temp_m7 = new int * [n/2];
    
    for(int i=0;i<n/2;++i) {
      m1[i] = new int[n/2];
      temp_m1[i] = new int  [n/2];
      m2[i] = new int[n/2];
      m3[i] = new int[n/2];
      m4[i] = new int[n/2];
      m5[i] = new int[n/2];
      m6[i] = new int[n/2];
      temp_m6[i] = new int[n/2];
      m7[i] = new int[n/2];
      temp_m7[i] = new int[n/2];
    }
    sumar(m1,a,a,start_a_x,start_a_y,start_a_x+n/2,start_a_y+n/2,n/2,0,0);
    sumar(temp_m1,b,b,start_b_x,start_b_y,start_b_x+n/2,start_b_y+n/2,n/2,0,0);
    strassen(m1,m1,temp_m1,0,0,0,0,n/2,0,0);
    
    sumar(m2,a,a,start_a_x+n/2,start_a_y,start_a_x+n/2,start_a_y+n/2,n/2,0,0);
    strassen(m2,m2,b,0,0,start_b_x,start_b_y,n/2,0,0);
    
    restar(m3,b,b,start_b_x,start_b_y+n/2,start_b_x+n/2,start_b_y+n/2,n/2,0,0);
    strassen(m3,a,m3,start_a_x,start_a_y,0,0,n/2,0,0);
    
    restar(m4,b,b,start_b_x+n/2,start_b_y,start_b_x,start_b_y,n/2,0,0);
    strassen(m4,a,m4,start_a_x+n/2,start_a_y+n/2,0,0,n/2,0,0);
    
    sumar(m5,a,a,start_a_x,start_a_y,start_a_x,start_a_y+n/2,n/2,0,0);
    strassen(m5,m5,b,0,0,start_b_x+n/2,start_b_y+n/2,n/2,0,0);
    
    restar(m6,a,a,start_a_x+n/2,start_a_y,start_a_x,start_a_y,n/2,0,0);
    sumar(temp_m6,b,b,start_b_x,start_b_y,start_b_x,start_b_y+n/2,n/2,0,0);
    strassen(m6,m6,temp_m6,0,0,0,0,n/2,0,0);
    
    restar(m7,a,a,start_a_x,start_a_y+n/2,start_a_x+n/2,start_a_y+n/2,n/2,0,0);
    sumar(temp_m7,b,b,start_b_x+n/2,start_b_y,start_b_x+n/2,start_b_y+n/2,n/2,0,0);
    strassen(m7,m7,temp_m7,0,0,0,0,n/2,0,0);
    
    sumar(m,m1,m4,0,0,0,0,n/2,0,0);
    restar(m,m,m5,0,0,0,0,n/2,0,0);
    sumar(m,m,m7,0,0,0,0,n/2,0,0);
    
    sumar(m,m3,m5,0,0,0,0,n/2,0,n/2);
    
    sumar(m,m2,m4,0,0,0,0,n/2,n/2,0);
    
    restar(m,m1,m2,0,0,0,0,n/2,n/2,n/2);
    sumar(m,m,m3,n/2,n/2,0,0,n/2,n/2,n/2);
    sumar(m,m,m6,n/2,n/2,0,0,n/2,n/2,n/2);
    for(int i=0;i<n/2;++i) {
      delete [] m1[i];
      delete [] temp_m1[i];
      delete [] m2[i];
      delete [] m3[i];
      delete [] m4[i];
      delete [] m5[i];
      delete [] m6[i];
      delete [] temp_m6[i];
      delete [] m7[i];
      delete [] temp_m7[i];
    }
    delete [] m1;
    delete [] temp_m1;
    delete [] m2;
    delete [] m3;
    delete [] m4;
    delete [] m5;
    delete [] m6;
    delete [] temp_m6;
    delete [] m7;
    delete [] temp_m7;

  }
}



void resolver(vector<int> *adyacencias,int n,  int &a, int &b, int &c, int &d, int &e, int &f) {
  a = b = c = d = e = f = 0;
  int tam = 1;
  while(tam < n) tam = tam << 1;
  int ** ady = new int * [tam];
  int ** cam = new int * [tam];
  // Inicializo la matriz de caminos de longitud 3 en 0s.
  for(int i = 0;i<tam ; ++i) {
    cam[i] = new int [tam];
    for(int j = 0;j<tam;++j) {
      cam[i][j] = 0;
    }
  }
  // Inicializo la matriz de adyacencias de longitud 3 en 0s.
  for(int i = 0;i<tam ; ++i) {
    ady[i] = new int [tam];
    for(int j = 0;j<tam;++j) {
      ady[i][j] = 0;
    }
  }
  // Lleno la matriz de adyacencias.
  for(int i = 0;i<n;++i) {
    for(int j = 0; j<adyacencias[i].size();j++) {
      ady[i][adyacencias[i][j]] = 1;
    }
  }
  // Matriz de caminos = ady^3 = ady^2 * ady
  strassen(cam, ady, ady,0,0,0,0,tam,0,0);
  strassen(cam, cam, ady,0,0,0,0,tam,0,0);
  int en_ciclo = -1;
  int indice = 0;
  // Busco en la diagonal el primer nodo (primero numericamente) 
  // tal que existe un camino de longitud 3 hacia si mismo. 
  // LLamemoslo a.
  while(indice<n) {
    if(cam[indice][indice] > 0) {
      en_ciclo = indice;
      indice = n -1;
    }
    ++indice;
  }
  // Si encontre el nodo que buscaba, encuentro el primer nodo 
  // (primero numericamente) tal que conoce a "a" y a algun 
  // conocido de "a".
  // Una vez encontrado, de los conocidos que comparte me quedo con 
  // el primero (primero numericamente).
  if(en_ciclo !=-1) {
    int i = en_ciclo + 1;
    while(i < n) {
      int j = i + 1;
      while(j<n) {
        if(ady[en_ciclo][i] &&  ady[en_ciclo][j] && ady[i][j]  ) {
          a = en_ciclo+1;
          b = i+1;
          c = j+1;
          i = n;
          j = n;
        }
        ++j;
      }
      ++i;
    }
  }
  
  // Invierto la matriz y hago el mismo procedimiento.
  invertir(ady,n);
  strassen(cam, ady, ady,0,0,0,0,tam,0,0);
  strassen(cam, cam, ady,0,0,0,0,tam,0,0);
  
  en_ciclo = -1;
  indice = 0;
  while(indice<n) {
    if(cam[indice][indice] > 0) {
      en_ciclo = indice;
      indice = n -1;
    }
    ++indice;
  }
  
  if(en_ciclo !=-1) {
    int i = en_ciclo + 1;
    while(i < n) {
      int j = i + 1;
      while(j<n) {
        if(ady[en_ciclo][i] &&  ady[en_ciclo][j] && ady[i][j]  ) {
          d = en_ciclo+1;
          e = i+1;
          f = j+1;
          i = n;
          j = n;
        }
        ++j;
      }
      ++i;
    }
  }
  
  
  for(int i = 0;i<tam ; ++i) {
    delete [] cam[i];
    
  }
  delete [] cam;
  for(int i = 0;i<tam ; ++i) {
    delete [] ady[i];
  }
  delete [] ady;
  
}



void invertir(int ** a, int n) {
  for(int f =0;f<n ; f++) {
    for(int c = 0 ; c<n; c++) {
      a[f][c] = a[f][c]==1 ? 0 : 1;
    }
  }
}


