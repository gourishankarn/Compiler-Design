/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    T_VAR = 258,
    T_FOR = 259,
    T_WHILE = 260,
    T_BRK = 261,
    T_CNT = 262,
    T_STRING = 263,
    T_ID = 264,
    T_CM = 265,
    T_SCLN = 266,
    T_NUM = 267,
    T_DIGIT = 268,
    T_TRUE = 269,
    T_FALSE = 270,
    T_OBR = 271,
    T_CBR = 272,
    T_UADD = 273,
    T_USUB = 274,
    T_SOBR = 275,
    T_SCBR = 276,
    T_FOBR = 277,
    T_FCBR = 278,
    T_ADD = 279,
    T_SUB = 280,
    T_MUL = 281,
    T_DIV = 282,
    T_MOD = 283,
    T_EQ = 284,
    T_MULASN = 285,
    T_DIVASN = 286,
    T_MODASN = 287,
    T_ADDASN = 288,
    T_SUBASN = 289,
    T_GT = 290,
    T_GTE = 291,
    T_LT = 292,
    T_LTE = 293,
    T_CMP = 294,
    T_NEQ = 295,
    T_SCMP = 296,
    T_SNEQ = 297,
    T_LAND = 298,
    T_LOR = 299,
    T_AND = 300,
    T_OR = 301,
    T_XOR = 302,
    T_NT = 303,
    T_BTNT = 304,
    T_RS = 305,
    T_LS = 306
  };
#endif
/* Tokens.  */
#define T_VAR 258
#define T_FOR 259
#define T_WHILE 260
#define T_BRK 261
#define T_CNT 262
#define T_STRING 263
#define T_ID 264
#define T_CM 265
#define T_SCLN 266
#define T_NUM 267
#define T_DIGIT 268
#define T_TRUE 269
#define T_FALSE 270
#define T_OBR 271
#define T_CBR 272
#define T_UADD 273
#define T_USUB 274
#define T_SOBR 275
#define T_SCBR 276
#define T_FOBR 277
#define T_FCBR 278
#define T_ADD 279
#define T_SUB 280
#define T_MUL 281
#define T_DIV 282
#define T_MOD 283
#define T_EQ 284
#define T_MULASN 285
#define T_DIVASN 286
#define T_MODASN 287
#define T_ADDASN 288
#define T_SUBASN 289
#define T_GT 290
#define T_GTE 291
#define T_LT 292
#define T_LTE 293
#define T_CMP 294
#define T_NEQ 295
#define T_SCMP 296
#define T_SNEQ 297
#define T_LAND 298
#define T_LOR 299
#define T_AND 300
#define T_OR 301
#define T_XOR 302
#define T_NT 303
#define T_BTNT 304
#define T_RS 305
#define T_LS 306

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
