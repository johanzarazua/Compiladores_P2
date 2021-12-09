%{
#include <iostream>
#include <string>
using namespace std;

#include "../Tokens.h"
#include "Scanner.h"
//#undef YY_DECL
//#define YY_DECL int C_1::Scanner::yylex();
%}

%option c++
%option debug
%option outfile="Scanner.cpp"
%option yyclass="C_1::Scanner"
%option noyywrap
%option case-insensitive

ENTERO [0-9]+
FLOTANTE [0-9]*\.[0-9]+([Ee][+-]?[0-9]+)?
ID [A-Za-z_][A-Za-z0-9_]*
ESP [ \t\n\r]
CADENA ["]([^"\\\n]|\\.|\\\n)*["]

%%

"int"   { return INT;}
"float" { return FLOAT;}
"char"     { return CHAR;}
"double"   { return DOUBLE;}
"struct"   { return STRUCT;}
"void"     { return VOID;}
"else"  { return ELSE;}
"if"    { return IF;}
"while" { return WHILE;}
"do"       { return DO;}
"print"    { return PRINT;}
"scan"     { return SCAN;}
"break"    { return BREAK;}
"return"   { return RETURN;}
"+"        { return MAS;}
"-"        { return MENOS;}
"*"        { return MUL;}
"/"        { return DIV;}
"="        { return ASIG;}
"("        { return LPAR;}
")"        { return RPAR;}
"||"       { return OR;}
"&&"       { return AND;}
"!"        { return NEG;}
"<"        { return MENOR;}
">"        { return MAYOR;}
"=="       { return IGUAL;}
"!="       { return DIF;}
"<="       { return MENORE;}
">="       { return MAYORE;}
";"        { return PYC;}
","        { return COMA;}
"{"        { return LLLAV;}
"}"        { return RLLAV;}
"."        { return PUNTO;}

{ENTERO}   { return NUMERO;}
{FLOTANTE} { return NUMERO;}
{CADENA}   { return CADENA;}
{ID} {return ID;}
{ESP} {}


.    { cout<<"ERROR LEXICO "<<yytext<<endl;}   //Cualquier caracter excepto salto de linea

%%