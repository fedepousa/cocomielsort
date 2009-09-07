#include <iostream>
#include <fstream>
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <fstream>
#include <cstdlib>
using namespace std;


//Estructuras
struct tupla{
	bool apuntado;
	bool apunta_der;
	bool apunta_abajo;

};


typedef struct nodo{
	tupla *puntero;
	nodo *sig;

}nodo;


struct lista{
	nodo *primero;
	nodo *ultimo;
	int cuantos;


};


//probando svn


//Agrega la lista
void agregar(lista &lista, tupla *puntero){

	nodo *nuevo = new nodo;
	if (lista.ultimo==NULL){
		lista.primero = nuevo;
		lista.ultimo= nuevo;
		nuevo->puntero = puntero;
		lista.cuantos = 1;
	}
	else{
		lista.ultimo->sig = nuevo;
		lista.ultimo = nuevo;
		lista.cuantos++;
	}

}





//Destructor
void destruiTodo(lista lis){
	nodo *t0 = lis.primero;
	nodo *t1;

	while(t0!=NULL){
		//borro el array de configuracion.	
		delete [] (t0->puntero) ;
		t1= t0->sig;
		//borro nodo
		delete t0;
		t0 = t1;
	}
}




//Copia de array
void copiarArray(tupla *nuevo, tupla*original, int m){
	for(int i = 0; i< m;i++){
	nuevo[i].apuntado = original[i].apuntado;
	nuevo[i].apunta_der = original[i].apunta_der;
	nuevo[i].apunta_abajo = original[i].apunta_abajo;

	}	
}




//Mostra por pantalla configuracion.
void mostraConfig(tupla *config, int n){
	cout<<"relaciones: ";
	for(int i = 0; i< n;i++){
		for(int j = 0; j< n;j++){
			if( config[i*n+j].apunta_der == true) cout<< "("<<i<<","<<j<<") -> "<< "("<<i<<","<<j+1<<")"<<endl;
			if( config[i*n+j].apunta_abajo == true) cout<< "("<<i<<","<<j<<") -> "<< "("<<i+1<<","<<j<<")"<<endl;
		}
	}

	cout<<"Ocupados";
	for(int i = 0; i< n;i++){
		for(int j = 0; j< n;j++){
			if( config[i*n+j].apuntado == true) cout<< "("<<i<<","<<j<<")  ;";
		
		}
	}
	cout<<endl<<endl;
}



//Variable global
int totales=0;
lista muertas;
lista lis;

void mostraTab(tupla *tab,int n){
cout<<n<<endl;
for(int f = 0; f< n;f++){
			for(int c = 0; c< n;c++){
				if (tab[f*n+c].apuntado!=true) cout<<'#';
				else cout<<'_';
			}
		cout<<endl;
		}


}


void funcion( int f,  int c, tupla *config, int n, bool mostraOut ){

	if (mostraOut) mostraConfig(config,n);
	if (!(f==(n-1) && c==(n-1))){
		if( (config[f*n+c]).apuntado == true){	//casos en que ya esta usado es cuadrado (o no sirve)
			if(c==n-1) funcion(f+1,0,config,n,mostraOut);
			else  funcion(f,c+1,config,n,mostraOut);
		}
		else{
			//me marco como ocupado
			config[f*n+c].apuntado == true;
			//chequeo si puedo apuntar al de la derecha
			if( (c!=n-1) && config[f*n+c+1].apuntado ==false){
				//y tambien al de abajo
				if( (f!=n-1) &&config[f*n+c+n].apuntado ==false){	
					unsigned int cuenta = n;
					cuenta = cuenta * cuenta;
					tupla *configVertical = new tupla[cuenta];
	 				copiarArray(configVertical, config,cuenta);
					//marco al de abajo como apuntado
					configVertical[f*n+c+n].apuntado = true;	
					//marco que apunto al de abajo		
					configVertical[f*n+c].apunta_abajo = true;
					//llamo de nuevo a la funcion
					if(c==n-1) funcion(f+1,0,configVertical,n,mostraOut);
					else  funcion(f,c+1,configVertical,n,mostraOut);
				}
				//va para derecha (aprovecho el confg para apuntar al de la derecha en vez de crear uno nuevo)
				//pongo q apunta a la derecha
				config[f*n+c].apunta_der = true;
				//pongo que el de la derecha ya esta apuntado
				config[f*n+c+1].apuntado = true;
				//llamo de nuevo a la funcion
				if(c==n-1) funcion(f+1,0,config,n,mostraOut);
				else  funcion(f,c+1,config,n,mostraOut);		

			}else{
				//chequeo si puedo apuntar abajo				
				if( (f!=n-1) && config[f*n+c+n].apuntado ==false){
					//solo abajo
					//seteo q apunta abajo
					config[f*n+c].apunta_abajo=true;
					//seteo al de abajo como ocupado
					config[f*n+c+n].apuntado=true;
					//llamo de nuevo a la funcion
					if(c==n-1) funcion(f+1,0,config,n,mostraOut);
					else  funcion(f,c+1,config,n,mostraOut);	
				}else {

						if (mostraOut) {cout<<"Configuracion que no anda"<<endl;
						mostraConfig(config,n);
						}
 					delete [] config;
					}

			}
		}


	}else{
		//es el ultimo cuadradito
		if (config[n*n-1].apuntado == true) {
		totales++;
		mostraConfig(config,n);
		delete [] config;

		}
		else{

				if (mostraOut) {cout<<"Configuracion que no anda"<<endl;
						mostraConfig(config,n);
				}
				delete [] config;	
			}
	}
}



/*
void leer(ifstream &archivo){

	int n;
	bool b=true;

while(b){
	string tam_s;
	getline(archivo,tam_s,'\n');
	n = atoi(tam_s.c_str());
	if (n != -1){

		tupla *conf= new tupla[n*n];	
		for(int f = 0; f< n;f++){
			getline(archivo,tam_s,'\n');
			for(int c = 0; c< n;c++){
				conf[f*n+c].apuntado = ( tam_s[c]=='#');
				conf[f*n+c].apunta_der=false;
				conf[f*n+c].apunta_abajo=false;
			}
		}

		totales = 0;
		funcion(0,0, conf,n, false);
		//cout<<"Cantidad de formas: "<<totales<<endl;
		mostraTab(conf,n);



	}
	else b= false;
}



}

*/

void leer(ifstream &archivo){

	int n;
	bool b=true;

while(b){
	string tam_s;
	archivo >> n;
	if (n != -1){

		tupla *conf= new tupla[n*n];	
		for(int f = 0; f< n;f++){
			//getline(archivo,tam_s,'\n');
			for(int c = 0; c< n;c++){
				char temp = archivo.get();
				while(temp!= '#' && temp!='_') {
				  temp = archivo.get();
				}
				conf[f*n+c].apuntado = ( temp=='#');
				conf[f*n+c].apunta_der=false;
				conf[f*n+c].apunta_abajo=false;
			}
			getline(archivo,tam_s,'\n');
		}

		totales = 0;
		mostraTab(conf,n);
		funcion(0,0, conf,n, false);
		//cout<<"Cantidad de formas: "<<totales<<endl;
		



	}
	else b= false;
}
int main(){




	//creo la lista

	lis.ultimo = NULL;
	lis.primero = NULL;
	lis.cuantos = 0;




	muertas.ultimo = NULL;
	muertas.primero = NULL;
	muertas.cuantos = 0;

	ifstream entrada("Tp1Ej3.in");
	leer(entrada);
	// los 0,0 son de la posicion que empieza en casillero
	// conf es la configuracion inicial.
	// lis, va guardando las configuraciones correctas
	// n el tamaño de ancho
	// el ultimo bool es para mostrar unos mensajes

	//
/*
	int n = 14;
	tupla *conf= new tupla[n*n];


bool ar[14*14]={true,true,true,true,true,false,false,false,false,true,true,true,true,true,true,true,true,false,false,true,true,true,true,false,false,true,true,true,true,true,false,false,true,true,true,true,true,true,false,false,true,true,true,false,false,true,true,true,true,true,true,true,true,false,false,true,false,true,true,true,false,false,true,true,false,false,true,true,true,false,false,true,true,true,true,true,true,true,true,true,true,true,true,false,false,true,true,true,true,true,false,false,true,true,true,true,true,false,false,true,true,true,true,true,true,true,true,true,true,true,true,false,false,true,true,true,false,false,true,true,false,false,true,true,true,false,false,true,true,true,true,false,false,false,false,true,true,true,true,false,true,false,false,true,true,true,true,true,true,true,true,false,false,true,true,true,false,false,true,true,true,true,true,true,false,false,true,true,true,true,true,false,false,true,true,true,true,false,false,true,true,true,true,true,true,true,true,false,false,false,false,true,true,true,true,true};



for(int f = 0; f< (n*n);f++) {
conf[f].apuntado = ar[f];
conf[f].apunta_der = false;
conf[f].apunta_abajo = false;


}

totales = 0;
mostraTab(conf,n);
cout<<"empezo"<<endl;
funcion(0,0, conf,n, false);
cout<<"los totales son: "<<totales;


*/


/*
	ifstream archivo("entrada.txt");
	leer(archivo);

*/
/*
destruiTodo(lis);
destruiTodo(muertas);
*/

}

