#include <iostream>
#include <vector>
#include <fstream>
#include <sys/types.h> 
#include <dirent.h> 
#include <string>


using namespace std;

void convertir(ifstream &entrada, ofstream &salida);

static bool is_target (const string &ext_input, const dirent &, const string &);
static bool is_file(const dirent &ent);
static string extension(const string & name);
static bool contains(const string &c, const string &name) ;

int main(int argc, char * argv[] ) 
{ 
   
    // If a file name contains any of the characters in ignored
    // such file will not be processed.
    string ignored = "~";
    
    // Files with an extension matching ext_input will be processed.
    string ext_input = "cnf";
    
    // Default value for the name of the output file with the volumes
    // calculated with Grillado.
    // Can be configured with command line argument -o "some_file_name"
    string output_name = "conversion.in";
    
    // Default value for the name of the output file with the list
    // of processed files.
    // Can be configured with command line 
    // argument -l "some_list_file_name"
    string list_name = "list.out";
    int iteracion = 0;
    DIR *dir = opendir("."); 
    ofstream salida(output_name.c_str());
    ofstream list(list_name.c_str());
    if(dir) 
    { 
        struct dirent *ent; 
        while((ent = readdir(dir)) != NULL) 
        { 
	    	    
            if(is_target(ext_input,*ent,ignored)) {
              list << ent->d_name << endl;
              ifstream entrada(ent->d_name);
              convertir(entrada, salida);
            }
            ++iteracion;
            //cout << iteracion << endl;
        } 
        
        salida << -1 << " "<< -1  ;
        cerr << "Se procesan todos todos los archivos con extension cnf." << endl;
    } 
    else 
    { 
        cout << "Error opening directory." << endl; 
    } 
    return 0; 
}
static string extension(const string &name) {
  string res;
  if(name.rfind(".")!=string::npos) {
    res = name.substr(name.rfind(".")+1);
  }
  return res;
}

static bool is_target (const string &ext_input, const dirent &ent, const string &ignored) {
  return extension(string(ent.d_name))==ext_input && is_file(ent) && !contains(ignored,string(ent.d_name));
}


static bool contains(const string &c, const string &name) {
  bool res = false;
  for(int j=0;j<c.size();++j) {
    res = res || (name.find(c[j])<name.size());
  }
  return res;
}

static bool is_file(const dirent & ent) {
  bool res = ent.d_type == DT_REG;
  return res;
  
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


