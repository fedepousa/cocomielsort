#include <algorithm>
#include <vector>
#include <iostream>
#include <fstream>
#include <numeric>



using namespace std;

unsigned long long int amigo(unsigned long long int n);
void fact_primos(vector< unsigned long long int > &primos,vector< unsigned  int > &exp,unsigned long long int n);
int leer( ifstream &entrada, vector< unsigned long long int > &v);
void escribir(vector<unsigned long long int> &v);

unsigned long long int suma_divisores_propios(vector < unsigned long long int > &primos, vector < unsigned int > &exp, unsigned long long int n);
unsigned long long int pot(unsigned long long int b, unsigned int e);

int main() {
  ifstream entrada("Tp1Ej2.in");
  vector< unsigned long long int > datos;
  leer(entrada, datos);
  
  unsigned int tam = datos.size();
  vector< unsigned long long int > resultados;
  for(int i = 0; i<tam;i++) {
    resultados.push_back(amigo(datos[i]));
  }
  escribir(resultados);
  return 0;
}

unsigned long long int amigo(unsigned long long int n) {
  unsigned long long int copiaN = n;
  unsigned long long int res = 0;
  vector < unsigned long long int > primos;
  vector < unsigned int > exp;
  fact_primos(primos,exp,n);
  res = suma_divisores_propios(primos,exp,n);
  copiaN = n;
  n = res;
  primos.clear();
  exp.clear();
  fact_primos(primos,exp,n);
  n = suma_divisores_propios(primos,exp,n);
  if(copiaN!= n || res == copiaN) res = 0;
  return res;
}

void fact_primos(vector< unsigned long long int > &primos,vector< unsigned  int > &exp,unsigned long long int n) {
  if(n>0) {
    unsigned int temp;
    temp = 0;
    while((n % 2) == 0) {
      if(temp==0) {
	primos.push_back(2);
      }
      ++temp;
      n = n/2;
    }
    if(temp!=0) {
      exp.push_back(temp);
    }
    for(int i =3;i<=sqrt(n);i += 2) {
      temp = 0;
      while((n % i) == 0) {
	if( temp==0) {
	  primos.push_back(i);
	}
	++temp;
	n = n/i;
      }
      if(temp!=0) {
	exp.push_back(temp);
      }
    }
    if(n && n!=1){
	exp.push_back(1);
	primos.push_back(n);	
    }
  }
}

unsigned long long int suma_divisores_propios(vector < unsigned long long int > &primos, vector < unsigned int > &exp, unsigned long long int n) {
  unsigned long long int res = 1;
  unsigned int tam = exp.size();
  for(unsigned int i = 0; i <tam;i++) {
    res *= (pot(primos[i],exp[i]+1)-1)/(primos[i]-1); // ((r^(n+1))-1)/(r-1)
  }
  res -= n;
  return res;
}
int leer( ifstream &entrada, vector< unsigned long long int > &v) {
  unsigned long long int buf;
  while((entrada >> buf)!=0) {
    v.push_back(buf);
  }
  return 0;
}

unsigned long long int pot(unsigned long long int b, unsigned int e) {
  
  if(b == 0) return 0;
  if(e== 0) return 1;
  unsigned long long int res = 1;
  while(true) {
    if(e&1) res *= b;
    e = e/2;
    if(e==0) return res;
    b *= b;
  }
}

void escribir(vector<unsigned long long int> &v) {
  ofstream salida("TpEj2.out");
  for(int i=0;i<v.size();++i){
    salida << v[i];
    if(i+1<v.size()) salida << endl;
  }
}


/*

suma divisores propios de m = (po^0 + po^1+...+po^e0)*(po^1 + p1^1+...+p1^e1)*...*(pn^0 + pn^1+...+pn^en) - m

1-(r^(n+1))/1-r
*/ 
