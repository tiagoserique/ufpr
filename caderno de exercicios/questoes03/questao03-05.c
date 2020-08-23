#include <stdio.h>
#include <math.h>

int main(){

    double a, b, c, raiz1, raiz2, delta;

    scanf(" %lf %lf %lf", &a, &b, &c);

    delta = ( b * b ) - ( 4 * a * c );

    if ( delta > 0 ){
        
        delta = sqrt(delta);

        raiz1 = ( -b + delta ) / 2 * a;
        
        raiz2 = ( -b - delta ) / 2 * a;
    
        printf("raiz 1 = %lf, raiz 2 = %lf\n", raiz1, raiz2);
    }
    else if ( delta < 0 ){
       delta *= -1; 
       
       delta = sqrt(delta); 
    
       printf("parte real = %f, parte imaginaria = %f * i\n", -b/(2 * a), delta/(2 * a));
    }
    else if ( delta == 0 ){

        raiz1 = -b / 2 * a;
        
        printf("raiz = %lf\n", raiz1);
    }

    return 0;
}
