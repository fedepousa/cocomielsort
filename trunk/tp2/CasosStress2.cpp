#include <fstream>

using namespace std;

int main(){
	ofstream archivo("Tp2Ej2.in");
	int casos = 500;
	int m = 3;
	int n = 8;
	int altGrafo = 9999;
	while(casos){
		archivo << m << " " << n << endl;
		archivo << 3 << " " << 2  << " " << '-' << " " << 1 << " " << 4 << endl;
		archivo << 3 << " " << altGrafo << " " << '-' << " " << 1 << " " << 4 << endl;
		archivo << 3 << " " << 4 << " " << '-' << " " << 1 << " " << 4 << endl;
		archivo << 3 << " " << 6 << " " << '-' << " " << 1 << " " << 4 << endl;
		archivo << 3 << " " << 4 << " " << '|' << " " << 2 << " " << 4 << endl;
		archivo << 4 << " " << 4 << " " << '|' << " " << 2 << " " << 4 << endl;
		archivo << 2 << " " << 10 << " " << '|' << " " << 1 << " " << 4 << endl;
		archivo << 9 << " " << 10 << " " << '|' << " " << 1 << " " << 4 << endl;
		casos--;
		altGrafo = 9999 + 500*(500-casos); 
	}
	archivo << -1 << " " << -1 << endl;

	return 0;
}
