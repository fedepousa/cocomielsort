#include <algorithm>
#include <vector>
#include <iostream>
#include <fstream>
#include <numeric>
#include <cmath>
#include <sys/time.h>


/*
Instrucciones de uso

Compilar: g++ -g main2.cpp
Ejecutar: ./a.out archivoEntrada ArchivSalidaLogaritmicaOTiempo
la salida stander tiene el nombre Tp1Ej2.out

*/
using namespace std;

unsigned long int amigo(unsigned long int n);
void fact_primos(vector< unsigned long int > &primos,vector< unsigned  int > &exp,unsigned long int n);
int leer( ifstream &entrada, vector< unsigned long int > &v);
void escribir(vector<unsigned long int> &v);

double sumaGlobal;
bool conta;
unsigned long int suma_divisores_propios(vector < unsigned long int > &primos, vector < unsigned int > &exp, unsigned long int n);
unsigned long int pot(unsigned long int b, unsigned int e);

unsigned long int maxsinsumaglobal(unsigned long int a, unsigned long int b){

	if (a>b) return a;
	else return b;

}

unsigned long int max(unsigned long int a, unsigned long int b){
	sumaGlobal += maxsinsumaglobal(log(a+1),log(b+1));
	if (a>b) return a;
	else return b;

}


int main ( int argc, char **argv ){
 ifstream entrada(argv[1]);
 
  vector< unsigned long int > datos;
  vector< unsigned long int > resultados;


 leer(entrada, datos);
  

  unsigned int tam = datos.size();


  
  string nombresalida= argv[2];
  ofstream salida(nombresalida.c_str());
  salida.precision(10);
  

	
	conta=false;
	int ing;
	//Mensaje
	cout<<"Ingresa 1 - Para conteo logaritmico"<<endl<<"Ingresa 2 - Para medir tiempo"<<endl;
	cin>>ing;
	if(ing==1) conta=true;

	

 for(unsigned int i = 0; i<tam;i++) {
    unsigned long int temp= (datos[i]);
 if(conta){
				if(conta)  sumaGlobal = 1;


	
//Para medir el conteo logartimico
temp = amigo(temp);
resultados.push_back(temp);
if (i< (tam-1)) salida<<sumaGlobal<<',';
else salida<<sumaGlobal;

}
else{


	/// para medir tiempo

	timeval inicio;
	timeval fin;
	double diferencia;
	gettimeofday(&inicio, NULL);
	///


 
	temp = amigo(temp); //esta es la funcion que queremos medir el tiempo

	/// obtener medicion
	gettimeofday(&fin, NULL);
	diferencia = (fin.tv_sec - inicio.tv_sec)*1000000 + fin.tv_usec - inicio.tv_usec ;
	//salida_tiempo << "SU TIEMPO DE EJECUCION EN MICROSEGUNDOS FUE: " << diferencia <<endl;
	///


	resultados.push_back(temp);
	if (i< (tam-1)) salida<<diferencia<<',';
	else salida<<diferencia;
}	

  }


  escribir(resultados);



  return 0;
}



unsigned long int amigo(unsigned long int n) {

  unsigned long int copiaN = n;
				if(conta) sumaGlobal+= log(n+1);
  unsigned long int res = 0;
				if(conta) sumaGlobal += 1;
  vector < unsigned long int > primos;
  vector < unsigned int > exp;

  fact_primos(primos,exp,n);

  res = suma_divisores_propios(primos,exp,n);
				if(conta) sumaGlobal += log(1+ res);
  copiaN = n;
				if(conta) sumaGlobal += log(n+1);
  n = res;
				if(conta) sumaGlobal += log(res+1);
 //aca cambimos, en vez de destruir
  vector < unsigned long int > primos1;
  vector < unsigned int > exp1;

  fact_primos(primos1,exp1,n);

  n = suma_divisores_propios(primos1,exp1,n);
				if(conta) sumaGlobal += log(n+1);
  if(copiaN!= n || res == copiaN) res = 0;

  /////
				if(conta) sumaGlobal += log(maxsinsumaglobal(n,copiaN)+1);
				if(conta) sumaGlobal += log(maxsinsumaglobal(res,copiaN)+1);
  ////
  return res;
}


void fact_primos(vector< unsigned long int > &primos,vector< unsigned  int > &exp,unsigned long int n) {
								if(conta) sumaGlobal += log(n+1);
  if(n>0) {
    unsigned int temp;
    temp = 0;
								if(conta) sumaGlobal +=1;
    while((n % 2) == 0) {
								if(conta) sumaGlobal += 1;// por la guarda del while
								if(conta) sumaGlobal += log ((n%2) +1);
								if(conta) sumaGlobal += log(temp+1);   //por el if de abajo
      if(temp==0) {
	primos.push_back(2);
								if(conta) sumaGlobal += 1; // TODO
								// SUPONEMOS O(1) lo cual es un verso
      }
								if(conta) sumaGlobal += 1 + log(temp+1);
      ++temp;
								if(conta) sumaGlobal += log(n+1); // por la division de abajo
								if(conta) sumaGlobal += log ((n/2) + 1);
	  n = n/2;

    }
								if(conta) sumaGlobal += log(temp+1); // por el if que esta abajo
    if(temp!=0) {
      exp.push_back(temp);
								if(conta) sumaGlobal+=1;
    }
	
    //for(unsigned int i =3;i*i<= n ;i += 2) {
		for(unsigned int i =3;i<= (sqrt(n)) ;i += 2) {

								sumaGlobal+= log(n) * log(n);
								sumaGlobal+= log(sqrt(n)); // por el n q es maximo

	  temp = 0;
								if(conta) ++sumaGlobal;
								//por el temp de arriba

      while((n % i) == 0) {
								if(conta) sumaGlobal+= log(n+1)*log(i+1) +  log((n%i) +1); // porla guarda del while
								if(conta) ++sumaGlobal;
	if( temp==0) {
	  primos.push_back(i);
						// TODO la estamos usando en o de 1
						if(conta) ++sumaGlobal;
	}
						if(conta) ++sumaGlobal; // del temp
	++temp;
						// la division mas la asignacion
						if(conta) sumaGlobal += log(n+1)*log(i+1) + log ((n/i) +1);
	n = n/i;
      }
						// por la guarda del if
						if(conta)sumaGlobal += log(temp+1);
      if(temp!=0) {
	exp.push_back(temp);
						// suponemos o de 1 TODO
						if(conta) ++sumaGlobal;
      }
    }
						// por la gurda del if
						if(conta)sumaGlobal+= log(n+1);
						// TODO abajo suponemso o de 1 los push
    if(n != 0 && n!=1) {
            /////////
           // aca le agregue n!= 1 pq sino, funciona de pedo pero hace mil cuentas mas
            ////////
         primos.push_back(n); exp.push_back(1); sumaGlobal+= 2;
         }
  }
}


unsigned long int suma_divisores_propios(vector < unsigned long int > &primos, vector < unsigned int > &exp, unsigned long int n) {
  unsigned long int res = 1;
							if(conta)		++sumaGlobal;
  unsigned int tam = exp.size();
									//TODO asumimos o de 1 de nuevo
									if(conta)++sumaGlobal;
  for(unsigned int i = 0; i <tam;i++) {
									// por el coso del for
									if(conta)++sumaGlobal; // por el i++
									if(conta)sumaGlobal+= log(tam+1);

									//falta sumar la potencia
									if(conta)sumaGlobal+= log(primos[i]+1);//por sumar 1 a primos[i]
									if(conta)sumaGlobal+= log(exp[i]+1);  //por sumar 1 al exp[i]
									if(conta)sumaGlobal+= pow(exp[i]+1,2)* log(primos[i])*log(primos[i]);
									if(conta)sumaGlobal+= log(res+1)* log(1+(pow(primos[i],exp[i]+1)-1)) * log(2+primos[i]-1);
    res *= (pow(primos[i],exp[i]+1)-1)/(primos[i]-1);
  }
									if(conta) sumaGlobal+= log(n+1) + log(res+1);
  res -= n;
  return res;
}


int leer( ifstream &entrada, vector< unsigned long int > &v) {
 unsigned long long int buf;
  while((entrada >> buf)!=0) {
    v.push_back(buf);
  }
  return 0;


}

void escribir(vector<unsigned long int> &v) {
  ofstream salida("TpEj2.out");
  for(unsigned int i=0;i<v.size();++i){
    salida << v[i];
    if(i+1<v.size()) salida << endl;
  }
}

