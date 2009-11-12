#include <iostream>
#include <vector>
#include <fstream>

using namespace std;

void convertir(ifstream &entrada, ofstream &salida);
int main(int argc, char ** argv) {
  ofstream salida("conversion.in");
  string param;
  if(argc ==1 ) {
    cerr << "No se suministraron parametros" << endl;
    cerr << "Uso: " << endl;
    cerr << argv[0] << " primer_archivo.cnf segundo_archivo.cnf [opcional: mas_archivos.cnf]" << endl;
    cerr << "El output se hara en el archivo conversion.in, en el formato definido para el TP." << endl; 
    return 0;
  }
  for(int i = 1 ; i < argc ; ++i) {
    param = argv[i];
    ifstream  entrada(param.c_str());
    convertir(entrada, salida);
  }
  salida << -1 << " "<< -1  ;
  return 0;
}

void convertir(ifstream &entrada, ofstream &salida) {
  string temp;
  char start;
  entrada >> start;
  while(start == 'c') {
    getline(entrada, temp,'\n');
    entrada >> start;
  }
  string cnf;
  
  int nbvar, nbclauses;
  entrada >> cnf >>nbvar >> nbclauses;
  salida << nbclauses << " " << nbvar << endl;
  for(int i = 0; i<nbclauses;++i) {
    int literal;
    vector<int> literales;
    do {
      entrada >> literal;
      literales.push_back(literal);
    } while(literal!=0);
    salida << '\t' << literales.size()-1 << '\t';
    for(int j = 0 ; j < literales.size()-1; ++j) {
      salida << " " << literales[j];
    }
    salida << endl;
  }
}  


