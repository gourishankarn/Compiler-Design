%{
    #include <stdio.h>
    int valid = 1;
    int yylex();
%}

%token digit letter 

%%
start : letter s 
s: letter s 
    |digit s 
    |
    ;
%%

int yyerror(){

    printf("It is not an identifier !");

    valid = 0;

    return 0;
}

int main()
{
    printf("Enter the sting to be check for an identifier\n");
    yyparse();
    if(valid){
        printf("It is an identifier\n");
    }
}