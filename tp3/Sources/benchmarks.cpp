#include <iostream>
#include <vector>
#include <fstream>
#include <sys/types.h> 
#include <dirent.h> 
#include <string>
#include <cstdio>
#include <cstdlib>
#include <algorithm>

using namespace std;

// Esta es la carpeta en la que se van a copiar todos los outputs.
// TIENE QUE ESTAR CREADA
string output_folder = "output";

// Nombre de archivo que devuelve el ejecutable que queres probar.
string output_programa = "Tp3TabuDoc.out";

// Nombre del archivo de tiempos que devuelve el ejecutable que queres probar.
string output_programa_tiempos = "Tp3TabuDocTiempos.out";

// Nombre del ejecutable que queres probar.
string programa = "tabu";
static bool banned (const string &s);
static bool is_target (const string &ext_input, const dirent &, const string &);
static bool is_dir(const dirent &ent);
static string extension(const string & name);
static bool contains(const string &c, const string &name) ;
static void analizar(const string &dirname);
static void inicializar();
static void mostrar_satisfechos();


const string satis = "mostrar_satisfechos";
const string conv_source = "dimacs2algo";
const string conv = "conversion";
const string output_conv = "conversion.in";
const unsigned int banned_dir_number = 3;
const string banned_array[banned_dir_number]= {".","..", "output"};
int main(int argc, char * argv[] ) 
{ 
   
    // If a file name contains any of the characters in ignored
    // such file will not be processed.
    string ignored = "~";
    
    // Files with an extension matching ext_input will be processed.
    string ext_input = "cnf";
    
    
    string output_name = "conversion.in";
    
    // Default value for the name of the output file with the list
    // of processed files.
    // Can be configured with command line 
    // argument -l "some_list_file_name"
    if(argc > 2)  {
      if(argc == 4) {
        programa = argv[1];
        output_programa = argv[2];
        output_programa_tiempos = argv[3];
      }
      else {
        cout << " le pifiaste a los parametros" << endl;
        return 0;
      }
    }
    
    string list_name = "list.output";
    int iteracion = 0;
    DIR *dir = opendir("."); 
    ofstream list(list_name.c_str());
    inicializar();
    if(dir) 
    { 
        struct dirent *ent; 
        while((ent = readdir(dir)) != NULL) 
        { 
	    	    
            if(is_target(ext_input,*ent,ignored)) {
              list << ent->d_name << endl;
              analizar(ent->d_name);
            }
            ++iteracion;
            //cout << iteracion << endl;
        } 
        mostrar_satisfechos();
        cerr << "Se procesan todas las carpetas." << endl;
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
  return  is_dir(ent) && !contains(ignored,string(ent.d_name))&&!banned(ent.d_name);
}


static bool contains(const string &c, const string &name) {
  bool res = false;
  for(int j=0;j<c.size();++j) {
    res = res || (name.find(c[j])<name.size());
  }
  return res;
}

static bool is_dir(const dirent & ent) {
  bool res = ent.d_type == DT_DIR;
  return res;
  
}

static bool banned(const string &s) {
  const string * it = find(banned_array,banned_array+banned_dir_number,s);
  return it != banned_array+banned_dir_number;
}

static void analizar(const string &dirname) {
  string move_to = "./" + dirname;
  string move = "cp " + conv + " " + move_to;
  system((move).c_str());
  system(("cd " + move_to + " ; ./"+conv).c_str());
  
  system(("mv " + move_to+"/" + output_conv+ " ./").c_str());
  system(("mv " + output_conv + " Tp3.in" ).c_str());
  system(("./"+programa).c_str());
  system(("mv " + output_programa + " ./"+output_folder + "/" + dirname + "-" + output_programa ).c_str());
  system(("mv " + output_programa_tiempos + " ./"+output_folder + "/" +  dirname + "-" + output_programa_tiempos + "-tiempos" ).c_str());
  
}

static void inicializar() {
  string compilar = "g++ -o ";
  string compilar_satis = compilar + satis + " " + satis +  ".cpp";
  string compilar_conv = compilar + conv + " " + conv_source+ ".cpp";
  system(compilar_satis.c_str());
  system(compilar_conv.c_str());
  
}

static void mostrar_satisfechos() {
  string move_to = "./" + output_folder;
  string move = "cp " + satis + " " + move_to;
  system((move).c_str());
  system(("cd " + move_to + " ; ./"+satis).c_str());
}
//system("process1");
