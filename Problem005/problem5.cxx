#include <iostream>
using namespace std;

int main(){
   int max;
   int i = 0;
   bool isResult = false;
   cout << "What is your max? ";
   cin >> max;
   while( !isResult )
   {
	   isResult = true;
	   ++i;
	   for( int j = 1; j <= max; j++){
	      if( (i % j) != 0 )
	  	   isResult = false;
      }
   }
   cout << "The result is: " << i << endl;
   return 0;
}
