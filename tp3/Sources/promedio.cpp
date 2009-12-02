#include <iostream>
#include <vector>
#include <fstream>
#include <list>
#include <set>
#include <algorithm>

using namespace std;

int main(int argc, char * argv[] ) {
  if(argc>2) {
    ifstream entrada(argv[1]);
    int maximo = atoi(argv[2]);
    int minimo = maximo;
    int maxima_instancia = 0;
    int temp;
    int acum = 0;
    int contador = 0;
    while(entrada >> temp) {
      ++contador;
      minimo = temp < minimo ? temp : minimo;
      maxima_instancia = temp > maxima_instancia ? temp : maxima_instancia;
      acum += maximo - temp;
    }
    cout.precision(5);
    
    cout << "Archivo .sat: " << argv[1] << endl;
    cout << "Promedio de clausulas insatisfechas: " <<double(acum) / double(contador) << endl;
    cout << "Minimo de clausulas satisfechas: " <<minimo << endl;
    cout << "Maximo de clausulas satisfechas: " <<maxima_instancia << endl;
  }
  else {
    cerr << "Uso: " << endl;
    cerr << argv[0] << " archivo.sat cant_clausulas" << endl;
  }
  return 0;  
}
