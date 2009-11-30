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
    int temp;
    int acum = 0;
    int contador = 0;
    while(entrada >> temp) {
      ++contador;
      acum += maximo - temp;
    }
    cout.precision(5);
    
    cout << "Archivo .sat: " << argv[1] << endl;
    cout << "Promedio de clausulas insatisfechas: " <<double(acum) / double(contador) << endl;
  }
  else {
    cerr << "Uso: " << endl;
    cerr << argv[0] << " archivo.sat cant_clausulas" << endl;
  }
  return 0;  
}
