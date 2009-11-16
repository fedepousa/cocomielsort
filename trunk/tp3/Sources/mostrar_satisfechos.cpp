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
    string ext_input = "out";
    
    // Default value for the name of the output file with the volumes
    // calculated with Grillado.
    // Can be configured with command line argument -o "some_file_name"
    string output_name = "conversion.in";
    
    // Default value for the name of the output file with the list
    // of processed files.
    // Can be configured with command line 
    // argument -l "some_list_file_name"
    string list_name = "list.output";
    int iteracion = 0;
    DIR *dir = opendir("."); 
    ofstream list(list_name.c_str());
    if(dir) 
    { 
        struct dirent *ent; 
        while((ent = readdir(dir)) != NULL) 
        { 
	    	    
            if(is_target(ext_input,*ent,ignored)) {
              list << ent->d_name << endl;
              output_name = ent->d_name;
              output_name  += ".sat";
              ifstream entrada(ent->d_name);
              ofstream salida(output_name.c_str());
              convertir(entrada, salida);
            }
            ++iteracion;
            //cout << iteracion << endl;
        } 
        
        cerr << "Se procesan todos todos los archivos con extension out." << endl;
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
  while(getline(entrada, temp,'\n')) {
    start = temp[0];
    if(start != 'C'  && start != 'V') {
      salida << temp << endl;
    }
  }
}  


