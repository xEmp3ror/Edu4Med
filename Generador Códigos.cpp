#include <iostream>
#include <stdlib.h>
#include <string>
#include <random>
#include <ctime>
#include <fstream>

using namespace std;

std::string random_str( std::size_t len )
{
    static const std::string a = 
              "ABCDEFHJKMNPQRSTUVWXYZ0123456789" ;
    static std::mt19937 rng( std::time(0) ) ;
    static std::uniform_int_distribution<std::size_t> distr( 0, a.size() - 1 ) ;
    std::string r ;
    for( std::size_t i = 0 ; i < len; ++i ) r += a[ distr(rng) ] ;
    return r ;
}

int main()
{   
    srand(time(NULL));

    ofstream fichero;
	fichero.open("codigos.txt");
  
    if(fichero.is_open()) {

        for (int i = 0; i < 200; i++) {

            fichero << random_str(6) << "\n";

        }
    }
	cin.get();
	return 0;
}