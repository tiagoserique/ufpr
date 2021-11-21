
#include "lib-evaluator.h"

int evaluator(tNode* root){
    if ( !root ) 
        return 0; 


    if ( !root->left && !root->right ) 
        return atoi(root->value); 
  

    int left_value  = evaluator(root->left); 
  
    int right_value = evaluator(root->right); 
  

    if ( !strcmp(root->value, "+") ){
        printf("%d %s %d\n", left_value, "+", right_value);
        return left_value + right_value; 
    }
  

    if ( !strcmp(root->value, "-") ){
        printf("%d %s %d\n", left_value, "-", right_value);
        return left_value - right_value; 
    }
  

    if ( !strcmp(root->value, "*") ){
        printf("%d %s %d\n", left_value, "*", right_value);
        return left_value * right_value; 
    }
  
  
    printf("%d %s %d\n", left_value, "/", right_value);
    
    return left_value / right_value; 
}