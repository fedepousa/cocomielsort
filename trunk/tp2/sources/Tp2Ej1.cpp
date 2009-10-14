#include <iostream>
#include <fstream>
#include <sys/time.h>

using namespace std;


int max(int a, int b){
	if (a>b){
		return a;
	}	
	return b;
} 

int maximo(int* vector, int tamanio){
	if(tamanio==1){
		return vector[0];
	}
	int resParc1;
	int resParc2;
	int temp;
	resParc1 = vector[0];
	resParc2 = max(vector[0],vector[1]);
	for(int i=2;i<tamanio;i++){
		int temp = resParc2;
		resParc2 = max(resParc2,resParc1+vector[i]);
		resParc1 = temp;
	}
	return resParc2;
}
int resolver(int *vect, int tamanio);
int main(){
	ifstream entrada("Tp2Ej1.in"); //Declaro el flujo de entrada
	ofstream salida("Tp2Ej1.out"); //Aca escribimos los resultados
	ofstream tiempos("Tp2Ej1Tiempos.out"); //Aca escribimos los tiempos
	timeval inicio;
	timeval fin;
	double diferencia;
	int tamanio; 
	
	
	entrada >> tamanio; // Levanto el tamanio del primer caso
	while(tamanio != -1){ // Se itera hasta que aparezca un -1
		int vector[tamanio];
		int res = 0;
		
		for(int i=0;i<tamanio;i++){//Levanto el arreglo
			entrada >> vector[i];
		}
	
		gettimeofday(&inicio, NULL);
	
		res = resolver(vector, tamanio);
		
		gettimeofday(&fin, NULL);
		diferencia = (fin.tv_sec - inicio.tv_sec)*1000000 + fin.tv_usec - inicio.tv_usec;
		
		tiempos << diferencia << endl;
		salida << res << endl;
	
	
		entrada >> tamanio; //Vuelvo a levantar el tamanio para el proximo caso
	}
	
	
	return 0;
}
int resolver(int *vector, int tamanio) {
  int res = 0;
  if(tamanio>3){ // Si el tamanio es 3 o menos, entra por casos triviales mas abajo
			int vector1[tamanio-1]; 
			int	vector2[tamanio-3];
			int res1=0;
			int res2=0;
		
			for(int i=0;i<tamanio-1;i++){ // Copio todo el arreglo salvo la ultima posicion
				vector1[i] = vector[i];
			}
		
			for(int j=0;j<tamanio-3;j++){ // Copio todo el arreglo salvo la primera, la ultima y la antepenultima posicion
				vector2[j] = vector[j+1];	
			}
			res1 = maximo(vector1, tamanio-1); // Saco el maximo con el primer vector auxiliar
			res2 = maximo(vector2, tamanio-3); // Saco el maximo con el segundo vector auxiliar
		
			res = max(res1, res2+vector[tamanio-1]); // El maximo total.
	
		}
		if(tamanio == 3){ // Caso trivial, el mayor de los 3
			res = max(max(vector[0],vector[1]),vector[2]);
		}
		if(tamanio == 2) { // Caso trivial, el mayor de los 2
			res = max(vector[0],vector[1]);
		}
		if(tamanio == 1){ // Caso trivial, el unico elemento que hay
			res = vector[0];
		}
  return res;
}
