#include <iostream>
#include <fstream>
#include <vector>
#include <queue>
#include <sys/time.h>


using namespace std;
int resolver() ;

struct valla{
	unsigned int x;
	unsigned int y;
	char direccion;
	unsigned int w;
	unsigned int h;
	
};


unsigned int ancho;
unsigned int alto;
unsigned int marea;
unsigned int min_x;
unsigned int min_y;
unsigned int max_x;
unsigned int max_y;



vector<valla> vallas;



struct nodo{

	unsigned int norte;
	unsigned int oeste;
	unsigned int sur;
	unsigned int este;
	bool marcado;
	
};

struct tupla{
 unsigned int x;
 unsigned int y;
 	
	
};

tupla mete(unsigned int a, unsigned int b){
tupla temp;
temp.x=a;
temp.y=b;
return temp;	
	
}

	#define  ALTO max_y-min_y+2
	#define  ANCHO max_x-min_x+2

int cuenta_veces = 0;
//leer de archivo, pone las vallas en un un vector
bool leer(ifstream &entrada){
  vallas.clear();
	//declaramos variables
	int temp_cant_vallas;
	int temp_marea;
	unsigned int cant_vallas;
	valla temp;

	entrada>> temp_marea;
	entrada>> temp_cant_vallas;
	bool termino = temp_marea==-1 || temp_cant_vallas==-1;
	
	if(!termino) {
    marea = temp_marea;
    cant_vallas = temp_cant_vallas;
    for(unsigned int i = 0; i < cant_vallas ; ++i){
      entrada >> temp.x;
      entrada >> temp.y;
      entrada >> temp.direccion;
      entrada >> temp.w;
      entrada >> temp.h;
      //todo : suponemos que es por copia el pushback ojo
      vallas.push_back(temp);
      
    }
	}
	

	
	return !termino;
}


//esta funcion pone los parametros del matriz en cero todos
void inicializar(nodo **mat){
	
	for(unsigned int f = 0; f<alto;++f){
		for(unsigned int c = 0; c<ancho;++c){	
			 mat[f][c].norte = 0 ;
			 mat[f][c].oeste = 0 ;
			 mat[f][c].sur = 0 ;
			 mat[f][c].este = 0 ;
			 mat[f][c].marcado = false ;
			
		}	
		
		
		
	}
}


//seteamos maximos y minimos
void maxmin(){
	min_x = vallas[0].x;	
	min_y = vallas[0].y;	
	max_x = 0;	
	max_y = 0;	
	unsigned int tam_vector = vallas.size();

	for(unsigned int i=0;i <tam_vector;++i){
		
		if(vallas[i].direccion == '|') {
			//x
			if( min_x > vallas[i].x) min_x= vallas[i].x;
			if( max_x < vallas[i].x) max_x= vallas[i].x;
			
			//y
			if (min_y > vallas[i].y) min_y = vallas[i].y;
			if (max_y < vallas[i].y+ vallas[i].w ) max_y = vallas[i].y + vallas[i].w;
		}else{
			//x
			if( min_x > vallas[i].x) min_x= vallas[i].x;
			if( max_x < vallas[i].x+ vallas[i].w) max_x= vallas[i].x + vallas[i].w ; 
			
			//y
			if (min_y > vallas[i].y) min_y = vallas[i].y;
			if (max_y < vallas[i].y) min_y = vallas[i].y;
			
		}
		
			
			

	}


		
	
}

//seteamos matrix
void setearMatriz(nodo **mat, valla &valla_subi){
	
	if( valla_subi.direccion =='|'){
		for(unsigned int i = 1 ; i <= valla_subi.w ;++i){
			
			//toco el este del de la izquierda
			mat[valla_subi.y-min_y+i][valla_subi.x-min_x].este= valla_subi.h;
			
			//toco el oeste del de la  derecha
			mat[valla_subi.y-min_y+i][valla_subi.x-min_x+1].oeste= valla_subi.h;
			
			
		}
	}
	else{
		for(unsigned int i = 1 ; i <= valla_subi.w ;++i){
			
			//toco el sur del de arriba
			mat[valla_subi.y-min_y+1][valla_subi.x-min_x+i].sur= valla_subi.h;
			
			//toco el norte del de abajo
			mat[valla_subi.y-min_y][valla_subi.x-min_x+i].norte= valla_subi.h;
			
			
		}
		
		
	}
	
	
	
}

unsigned int bfs(nodo **mat){
	//implementamos cola de tupla de indices
	queue<tupla> cola;

	//pusheo el primer nodo y lo pongo como marcado

	cola.push( mete(0,0));
	mat[0][0].marcado = true;

	//contador de recorridos
	unsigned int contador=0;

	while(!cola.empty()){
		//sumo uno al contador
		++contador;

		// guardo en temp el nodo actual y lo saco de la cola
		tupla temp = cola.front(); cola.pop();
		
		//lo marco como visitado
		mat[temp.x][temp.y].marcado = true;
		
		//encolamos cada adyacencia si corresponde
		
		//agrego derecha, sino estaba marcado
		if (temp.y <= ANCHO-2 && !mat[temp.x][temp.y+1].marcado &&mat[temp.x][temp.y].este < marea) {cola.push(mete(temp.x,temp.y+1));  mat[temp.x][temp.y+1].marcado = true;}
		
		//agrego izquierda, sino estaba marcado
		if (temp.y >0 &&  !mat[temp.x][temp.y-1].marcado && mat[temp.x][temp.y].oeste < marea) {cola.push(mete(temp.x,temp.y-1)); mat[temp.x][temp.y-1].marcado = true;}
		
		//agrego ARRIBA, sino estaba marcado  
		if (temp.x <= ALTO -2 && !mat[temp.x+1][temp.y].marcado &&mat[temp.x][temp.y].norte < marea) {cola.push(mete(temp.x+1,temp.y)); mat[temp.x+1][temp.y].marcado = true;}
		
		//agrego ABAJO, sino estaba marcado  
		if (temp.x >0 && !mat[temp.x-1][temp.y].marcado && mat[temp.x][temp.y].sur < marea){ cola.push(mete(temp.x-1,temp.y)); mat[temp.x-1][temp.y].marcado = true;}
	}

	return contador;
		
		
} 

int main(){
	ofstream salida("Tp2Ej2.out");
	ifstream entrada("Tp2Ej2.in");
	ofstream tiempos("Tp2Ej2Tiempos.out"); //Aca escribimos los tiempos
	timeval inicio;
	timeval fin;
	double diferencia;
	//leemos del archivo
	while(leer(entrada)) {
      
    
	int res = 0;
	gettimeofday(&inicio, NULL);
	res = resolver();
	gettimeofday(&fin, NULL);
	diferencia = (fin.tv_sec - inicio.tv_sec)*1000000 + fin.tv_usec - inicio.tv_usec;
		
  tiempos << diferencia << endl;
	salida << res << endl;
	
  } 
	return 0;
}

int resolver() {
  //buscamos max y min posiciones de las vayas para poder crear la matriz
    maxmin();
    int res;
    //creamos la matriz
    
    alto = ALTO;
    ancho = ANCHO;
    nodo **matriz;
    matriz =  new nodo*[alto];
    for(unsigned int i = 0; i < alto ; ++i) matriz[i] = new nodo[ancho];
    
    
    
    //Inicializamos la matriz
    inicializar(matriz);
    
    //Seteamos la Matriz
    unsigned int tam_va = vallas.size();
    for(unsigned int i = 0; i < tam_va ; ++i) setearMatriz(matriz, vallas[i] );
     
     res= alto*ancho-bfs(matriz) ;
     
     
     //Matamos la matriz
     for(unsigned int i = 0; i < ALTO ; ++i) delete [] matriz[i];
     delete [] matriz;
     
     return  res;
}

