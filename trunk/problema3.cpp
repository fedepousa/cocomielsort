#include <iostream>
#include <fstream>
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <fstream>
#include <cstdlib>
using namespace std;


//Estructura
struct tupla{
	bool apuntado;
	bool apunta_der;
	bool apunta_abajo;

};

//Variable global
int totales=0;



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
	cout<<"Relaciones: "<<endl;
	for(int i = 0; i< n;i++){
		for(int j = 0; j< n;j++){
			if( config[i*n+j].apunta_der == true) cout<< "("<<i<<","<<j<<") -> "<< "("<<i<<","<<j+1<<")"<<endl;
			if( config[i*n+j].apunta_abajo == true) cout<< "("<<i<<","<<j<<") -> "<< "("<<i+1<<","<<j<<")"<<endl;
		}
	}

	cout<<"Ocupados: ";
	for(int i = 0; i< n;i++){
		for(int j = 0; j< n;j++){
			if( config[i*n+j].apuntado == true) cout<< "("<<i<<","<<j<<")  ;";
		
		}
	}
	cout<<endl<<endl;
}



//Muestra el tablero
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

//La funcion que hace todo el calculo
void funcion( int f,  int c, tupla *config, int n, bool mostraOut ){
	if (mostraOut) mostraConfig(config,n);

	if (!(f==(n-1) && c==(n-1))){	//chequeo que no sea el ultimo cuadradito a revisar
		if( (config[f*n+c]).apuntado == true){	//casos en que ya esta usado es cuadrado (o no sirve/esta roto)
			//llamo a la funcion
			if(c==n-1) funcion(f+1,0,config,n,mostraOut);
			else  funcion(f,c+1,config,n,mostraOut);
		}
		else{
			//marco a la casilla actual como apuntada/ocupada/usada
			config[f*n+c].apuntado == true;
			//chequeo si puedo apuntar al de la derecha
			if( (c!=n-1) && config[f*n+c+1].apuntado ==false){
				//chequeo si puedo apuntar abajo tambien
				if( (f!=n-1) &&config[f*n+c+n].apuntado ==false){
					//si entro aca, va a llamar a la funcion dos veces pq entra en ambas combinaciones
					//creo un array q representa una nueva configuracion	
					unsigned int cuenta = n;
					cuenta = cuenta * cuenta;
					tupla *configVertical = new tupla[cuenta];
					//copio el array para q lo ya se relaciona quede asi
	 				copiarArray(configVertical, config,cuenta);
					//marco al de abajo como apuntado
					configVertical[f*n+c+n].apuntado = true;	
					//marco que apunto al de abajo		
					configVertical[f*n+c].apunta_abajo = true;
					//llamo a la funcion
					if(c==n-1) funcion(f+1,0,configVertical,n,mostraOut);
					else  funcion(f,c+1,configVertical,n,mostraOut);
				}
				//combinacion que va para derecha(aprovecho el confg para apuntar al de la der en vez de crear uno nuevo)
				//pongo q apunta a la derecha
				config[f*n+c].apunta_der = true;
				//pongo que el de la derecha ya esta apuntado
				config[f*n+c+1].apuntado = true;
				//llamo de nuevo a la funcion
				if(c==n-1) funcion(f+1,0,config,n,mostraOut);
				else  funcion(f,c+1,config,n,mostraOut);		

			}else{
				//chequeo si puedo apuntar abajo (ya se que a la derecha no pude)				
				if( (f!=n-1) && config[f*n+c+n].apuntado ==false){
					//relaciono solo con el de abajo.
					//seteo q apunta abajo
					config[f*n+c].apunta_abajo=true;
					//seteo al de abajo como ocupado
					config[f*n+c+n].apuntado=true;
					//llamo de nuevo a la funcion
					if(c==n-1) funcion(f+1,0,config,n,mostraOut);
					else  funcion(f,c+1,config,n,mostraOut);	
				}else {
					//Si estoy aca significa que la casilla donde estoy parado no fue relacionada ni con el de arriba
					//ni con el de la izquierda, y esta no puede relacionarse ni con su derecha ni con el de abajo
					//por lo tanto esta configuracion de tablero no sirve
					if (mostraOut) {
						cout<<"Configuracion que no anda"<<endl;
						mostraConfig(config,n);
					}
 					delete [] config;
					}

			}
		}


	}else{
		//Llegue al ultimo cuadradito
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




//Funcion que lee los archivos de entrada y saca otro
void leer(ifstream &archivo){
	int conta=0;
	int n;
	bool b=true;
	ofstream salida("Tp1Ej3.out");
	bool agregar = false;
while(b){
conta++;
	string tam_s;
	archivo >> n;
	if (n != -1){
		tupla *conf= new tupla[n*n];	
		for(int f = 0; f< n;f++){
			for(int c = 0; c< n;c++){
				char temp = archivo.get();
				while(temp!= '#' && temp!='_') {
				  temp = archivo.get();
				}
				conf[f*n+c].apuntado = ( temp=='_');
				conf[f*n+c].apunta_der=false;
				conf[f*n+c].apunta_abajo=false;
			}
			getline(archivo,tam_s,'\n');
		}
		if(agregar) salida << endl;
		agregar = true;
		totales = 0;
		cout<<"----------------------Experimento numero: "<<conta<<"----------------------"<<endl;
		funcion(0,0, conf,n, false);
		cout<<"----------------------Cantidad totales: "<<totales<<"----------------------"<<endl;
		cout<<endl<<endl;
		cout<<"------------------------------------------------------------------"<<endl;
		salida <<totales;
		



	}
	else b= false;
}
}




int main(){

	ifstream entrada("Tp1Ej3.in");
	leer(entrada);


  return 0;

}









//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*
// Cosas potencialmente borrables

typedef struct nodo{
	tupla *puntero;
	nodo *sig;

}nodo;


struct lista{
	nodo *primero;
	nodo *ultimo;
	int cuantos;


};



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

lista muertas;
lista lis;

*/
