%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
extern FILE *yyin,*yyout;
extern int lineNum;
int ErrorRecovered = 0;
char message[100];

int yyerror(char *str);
int yylex();
%}

%token T_VAR T_FOR T_WHILE T_BRK T_CNT T_STRING T_ID T_CM T_SCLN T_NUM T_DIGIT T_TRUE T_FALSE
%token T_OBR T_CBR T_UADD T_USUB T_SOBR T_SCBR T_FOBR T_FCBR
%left T_ADD T_SUB T_MUL T_DIV T_MOD
%right T_EQ T_MULASN T_DIVASN T_MODASN T_ADDASN T_SUBASN
%token T_GT T_GTE T_LT T_LTE T_CMP T_NEQ T_SCMP T_SNEQ T_LAND T_LOR T_AND T_OR T_XOR
%token T_NT T_BTNT T_RS T_LS
%%
Statement: DeclareStat T_SCLN Statement {printf("working\n");} |
	   AssignExpression T_SCLN Statement {printf("Assign\n");} |
	   T_FOR T_OBR{printf("open brace forloop\n");} ForAssignExpression T_SCLN CondExpression T_SCLN UnaryExpression T_CBR{printf("close brace forloop\n");} CompoundStatement {printf("valid for loop  \n");} Statement  |
	   T_WHILE T_OBR{printf("open brace whileloop\n");} WhileCondExpression T_CBR{printf("close brace whileloop\n");}  CompoundStatement {printf("valid while loop  \n");} Statement  | {printf("end of stat\n");};
	   //T_NL{printf("new line char\n");} | ;


DeclareStat: T_VAR list{printf("this is the varlist\n");} ;


list: T_ID | T_NUM | AssignExpression | Array | T_ID T_CM list | AssignExpression T_CM list | Array T_CM list | T_NUM T_CM list ;


Array: T_SOBR{printf("square braces open\n");} list T_SCBR | T_SOBR T_SCBR ;


AssignExpression: T_ID AssignOp Expression {printf("Assignment Expression\n");} | T_ID T_EQ Array ;


AssignOp: T_EQ{printf("equal2\n");} | T_MULASN | T_DIVASN | T_MODASN | T_ADDASN | T_SUBASN ;

/*Expression: Expression{printf("express start\n");} ArithOp{printf("arth oper\n");} Expression{printf("express end\n");} | T_OBR{printf("open bracekt\n");} Expression ArithOp Expression T_CBR{printf("close bracekt\n");} | ExpressionTerm{printf("express term\n");} | '';
*/
Expression: T_NUM{printf("num of exp\n");} | T_DIGIT | T_ID{printf("id of exp\n");} |
	    Expression T_ADD{printf("add\n");} Expression {$$ = $1 + $3;} |
	    Expression T_SUB{printf("sub\n");} Expression {$$ = $1 - $3;} |
	    Expression T_MUL{printf("mult\n");} Expression {$$ = $1 * $3;} |
	    Expression T_DIV{printf("div\n");} Expression {$$ = $1 / $3;} |
	    T_OBR{printf("open bracekt\n");} Expression T_SUB Expression T_CBR{printf("close bracekt\n");} ;

ForAssignExpression: DeclareStat | AssignExpression | ;


WhileCondExpression: CondExpression | T_TRUE | T_FALSE | T_NUM | T_DIGIT ;


CondExpression: Expression CondOpt Expression | ;


CondOpt: logicalOpt | RelOpt ;


RelOpt:
	T_LT | T_GT | T_GTE | T_LTE | T_CMP | T_SCMP | T_NEQ | T_SNEQ ;


logicalOpt: T_LAND | T_LOR ;


UnaryExpression: UnaryOp T_ID | T_ID UnaryOp{printf("unary expression\n");} | ;


UnaryOp: T_UADD | T_USUB ;


CompoundStatement:
	T_FOBR{printf("flower open bracekt\n");} Statement T_FCBR{printf("compound\n");} ;
//ExpressionTerm: T_ID{printf("id of exp\n");} | T_NUM{printf("num of exp\n");} | T_DIGIT ;

//ArithOp: T_SUB | T_DIV | T_MUL | T_ADD{printf("add\n");} | T_MOD ;


//Start: T_VAR T_ID {printf("valid\n");};

%%
/*
int yyerror(char *msg)
{
printf("invalid string: %s \n",msg);
exit(0);
}

void main()
{
printf("enter the string\n");
yyparse();
}
*/
/*
int yywrap()
{

        return 1;
} */

int main()
{

    yyin=fopen("input.txt","r");


    //yyout=fopen("output.js","w");
	yyparse();
if(ErrorRecovered==0) printf("Success!\n");
	fclose(yyin);

    return 0;
}


int yyerror(char *str)
{
				if(ErrorRecovered==0){
					{


						printf("Error Found @ line #%d: ", lineNum+1);
						if(strcmp(str,"Invalid character")==0 || strcmp(str,"Identifier greater than 5 characters")==0)
							printf("%s!", str);
						else if(strlen(message))
						printf("%s\n",message);
						else printf("%s\n", str);
					}
					printf("\n");
					ErrorRecovered = 1;

				}
	return 0;

}
