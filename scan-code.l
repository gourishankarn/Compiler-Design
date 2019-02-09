%{ #include<stdio.h> 
   #include <string.h>
   #include "y.tab.h";

%}

DIGIT [0-9]
ALPHA [a-zA-Z]
SCHAR [_-]

%%

\/\/.*							{;}
[ \t]                           {;}
[\n]                            { line++; }
"int"                           return INT;
"float" return FLOAT;
"char"  return CHAR;
"void"  return VOID;
"for"   return FOR;
"while" return WHILE;
"return" return {;}

#.*								return INCLUDE ;
{ALPHA}([_a-zA-Z0-9])* 			{yylval.id = (char *) strdup(yytext) ; return IDENTIFIER ;}
{DIGIT}+					    return NUM ;
{DIGIT}+"."{DIGIT}+				return FNUM ;
"<="							return LE ;
">="							return GE ;
"=="							return EE ;
"!="							return NE ;
">"							    return '>' ;
"<"								return '<' ;
"="						     	return '=' ;
{ALPHA}?\"(\\.|[^\\"])*\"		return STRING ;
{ALPHA}?\"(\\.|[^\\"])*    		printf("ERROR: STRING @ LINE: %d\n", line) ;
\/\*(.*\n)*.*\*\/				{;}
"{"							    {++scope; return '{' ;}
"}"								{--scope; if(!scope) ++scope_count; return '}' ;}
"("								return '(' ;
")"								return ')' ;
"["								return '[' ;
"]"								return ']' ;
"+"								return '+' ;
"-"								return '-' ;
"*"								return '*' ;
"/"								return '/' ;
"&"								return '&' ;
"++"							return INCR ;
"--"							return DECR ;
";"								return ';' ;
","							    return ',' ;
.								printf("LEXICAL ERROR @ LINE %d\n", line) ;

%%

int yywrap(void){
	return 1 ;
}

/*int main(){
	extern FILE *yyin ;
	yyin=fopen("./test-cases/comment.js","r");
	yylex() ;
	return 0 ;
}*/