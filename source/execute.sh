lex identi.l 
yacc -d yacc-file.y
gcc lex.yy.c y.tab.c -ll 