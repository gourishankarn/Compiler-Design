%{
    #include "y.tab.h"
    int lineNum=0;
    int single=0;
    int multi=0;
%}
singlecmt "//".*
multi \/\*(.*\n)*.*\*\/
%%
"var" 						{return T_VAR;}
"for" 						{return T_FOR;}
"while" 					{return T_WHILE;}
"BREAK"			{return T_BRK;}
"break" 		{return T_BRK;}
"CONTINUE"		{return T_CNT;}
"continue" 		{return T_CNT;}
"TRUE"			{return T_TRUE;}
"true"			{return T_TRUE;}
"FALSE"			{return T_FALSE;}
"false"			{return T_FALSE;}
[a-zA-Z][_a-zA-Z0-9]* 		{return T_ID;}
[\"a-zA-Z][a-zA-Z0-9]*[\"] 	{return T_STRING;}
[0-9]+ 						{return T_NUM;}
[0-9]+[\.][0-9]+ 			{return T_DIGIT;}
"("		{return T_OBR;}
")"		{return T_CBR;}
"["		{return T_SOBR;}
"]"		{return T_SCBR;}
"{"		{return T_FOBR;}
"}"		{return T_FCBR;}
"++"	{return T_UADD;}
"--"	{return T_USUB;}
"+"		{return T_ADD;}
"-"		{return T_SUB;}
"*"		{return T_MUL;}
"/"		{return T_DIV;}
"!"		{return T_NT;}
"~"		{return T_BTNT;}


"%"		{return T_MOD;}

">>" 	{return T_RS;}
"<<" 	{return T_LS;}
">" 	{return T_GT;}
">=" 	{return T_GTE;}
"<" 	{return T_LT;}
"<=" 	{return T_LTE;}
"==" 	{return T_CMP;}
"!=" 	{return T_NEQ;}
"===" 	{return T_SCMP;}
"!==" 	{return T_SNEQ;}
"&"		{return T_AND;}
"^"  	{return T_XOR;}
"|"		{return T_OR;}
"&&"	{return T_LAND;}
"||"	{return T_LOR;}
"="		{return T_EQ;}
"*="	{return T_MULASN;}
"/="	{return T_DIVASN;}
"%="	{return T_MODASN;}
"+="	{return T_ADDASN;}
"-="	{return T_SUBASN;}
","		{return T_CM;}
";"		{return T_SCLN;}
\n {lineNum++;};

{singlecmt} ;
{multi} ;
.|[' ']|[\t] ;
%%

int yywrap()
{
return 1;
}

