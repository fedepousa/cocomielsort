#include <vector>
#include <cmath>
#include <algorithm>
#include <iostream>
#include <vector>


using namespace std;



class Str_local{

	public:
	
	
	
		struct str_incidencia{ unsigned int indice; bool p;	};
	
		Str_local(int c, int v, vector<bool> *asig, vector< vector< int > > *claus, unsigned int clau_verd);
		
		~Str_local();
		

		void estructurar();

		void contarOkPorClausula();

		int resolverEspecial(unsigned int i, vector <str_incidencia> &variables_a_cambiar, bool valor,bool cambiar);
			  
		 
		void elegir_asig_en_N(int &res, unsigned int &max_iteracion, unsigned int & i_max);


		int clau;
		int var;
		unsigned int clausulas_verdaderas;
		vector<str_incidencia> *variables; // Array de vectors
		unsigned int *cant_ok_por_clausula;
		vector<bool> *asignacion;
		vector< vector< int > > *clausulas;
};



Str_local::Str_local(int c, int v, vector<bool> *asig, vector< vector< int > > *claus, unsigned int clau_verd){
	clau = c;
	var = v;
	asignacion = asig;
	clausulas = claus;
	cant_ok_por_clausula = new unsigned int[c];
	variables = new vector<str_incidencia> [v];
	for(unsigned int i = 0; i<c; ++i) cant_ok_por_clausula[i] = 0;
	clausulas_verdaderas = clau_verd;
	
}

Str_local::~Str_local(){
	
	//borro el vector que lleva la suma de las clausulas
	delete [] cant_ok_por_clausula;	
	
	//borro el array variables
	delete [] variables;
	
}



void Str_local::estructurar(){
	vector< vector<int> > *clausu = clausulas;
	unsigned int c= clausu->size();
	for(unsigned int i = 0; i<c;++i){
		unsigned int long_clau = ((*clausu)[i]).size();
		for(unsigned int j = 0; j<long_clau;++j){
			//la variable que incide
			int variable = ((*clausu)[i])[j];
			
			//creo una str_indicencia nuevo para meterlo en el vector

			str_incidencia *nueva = new str_incidencia;
			//seteo el str_incidencia
			nueva->indice =  i; 
			nueva->p = (variable>0); 
			
			//pusheo la nueva estructura
			variables[ abs( variable)-1].push_back(*nueva);
			delete nueva;
			}
	}
	
	
	
	
}
	
void Str_local::contarOkPorClausula(){
// O(c * v)
	unsigned int c= clausulas->size();
	for(unsigned int i = 0; i<c;++i){
		unsigned int lit = (*clausulas)[i].size();
		for(unsigned int j = 0; j<lit;++j){
			int temp = (((*clausulas)[i])[j]);
			if (((temp>0) && (*asignacion)[temp-1]) || ((temp<0) && !(*asignacion)[abs(temp)-1]) ) ++cant_ok_por_clausula[i];
		}	
	}
}

int Str_local::resolverEspecial(unsigned int i, vector <str_incidencia> &variables_a_cambiar, bool valor,bool cambiar){
	// en i voy a tener el indice de la variable
	// en variables_a_cambiar voy a tener las clausulas donde incide la variable
	// valor el valor al cual cambie

		 unsigned int cant_clau_a_modificar = variables_a_cambiar.size();
		 int clausulas_q_cambian=0;
		 for(unsigned int j=0; j <cant_clau_a_modificar; ++j){
			 unsigned int numero_clausula = variables_a_cambiar[j].indice;
			 bool positiva =variables_a_cambiar[j].p;
			 unsigned int valor_por_clausula = cant_ok_por_clausula[numero_clausula];
			//si valor falso y positva entonces tengo que restar uno
			//si valor falso y positiva es falso sumo uno
			//si valor verdadero y positivo esta ok sumo uno
			//si valor verdadero y positivo esta falso, resto 1
		
			bool estaba_en_cero = (valor_por_clausula==0);
		
			
			if (valor==positiva) ++valor_por_clausula;
			else --valor_por_clausula;
			if(estaba_en_cero && (valor_por_clausula != 0)) ++clausulas_q_cambian;
			if(!estaba_en_cero && (valor_por_clausula==0)) --clausulas_q_cambian;
			if (cambiar){ 
				cant_ok_por_clausula[numero_clausula] = valor_por_clausula;
				clausulas_verdaderas +=clausulas_q_cambian;
			}
		 }
		 return (clausulas_q_cambian + clausulas_verdaderas);
}
	  
void Str_local::elegir_asig_en_N(int &res, unsigned int &max_iteracion, unsigned int & i_max) {
  for(unsigned int i= 0; i <var; ++i){
      //niego una
      (*asignacion)[i] = !((*asignacion)[i]);
	  
      //me fijo a ver si negandola tengo un mejor resultado
      res = Str_local::resolverEspecial(i, ((variables)[i]),((*asignacion)[i]),false);
	       
      //en caso de ser mejor, actualizo el max_iteracion y me guardo el indice que cambie
      if (res> max_iteracion) {max_iteracion = res; i_max = i;} 
      
      //vuelvo a la asignacion de que parti
     (*asignacion)[i] = !((*asignacion)[i]);			
    }  
}

		
