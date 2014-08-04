// #SOLVED

#include <iostream>
#include <math.h>

using namespace std;

bool isPrime(long long number);

int main() {
  long long sum = 0;
  long long limit = 2000000;
  for(long long i = 2; i < limit; i++) {
    if( isPrime(i) ) {
      cout << i << endl;
      sum += i;
    }
  }
  cout << "Sum = " << sum << endl;
  
  return 0;
}

bool isPrime(long long number) {
  bool isPrime = true;
  for(long long i = 2; i*i <= number && isPrime; i++) {
    isPrime = !( number % i == 0 );
  }
  return isPrime;
}
