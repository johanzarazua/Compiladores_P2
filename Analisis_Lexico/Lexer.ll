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

CARACTERI [']([^'])+[']
ENTERO [0-9]+
FLOTANTE [0-9]*\.[0-9]+([Ee][+-]?[0-9]+)?[fF]|[0-9]+[Ee][+-]?[0-9]+[fF]
DOUBLE [0-9]*\.[0-9]+([Ee][+-]?[0-9]+)?[dD]?|[0-9]+[Ee][+-]?[0-9]+[dD]?
ID [A-Za-z_][A-Za-z0-9_]*
ESP [ \t\n\r]
CADENA ["]([^"\\\n]|\\.|\\\n)*["]
CARACTER [']([^']){1}[']

%%

"int"      { return INT;}
"float"    { return FLOAT;}
"char"     { return CHAR;}
"double"   { return DOUBLE;}
"struct"   { return STRUCT;}
"void"     { return VOID;}
"else"     { return ELSE;}
"if"       { return IF;}
"while"    { return WHILE;}
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
{FLOTANTE} { return NUMEROF;}
{DOUBLE}   { return NUMEROD;}
{CADENA}   { return CADENA;}
{CARACTER} { return CARACT;}
{CARACTERI} { cout<<"ERROR LEXICO"<<yytext<<endl;}
{ID}       {return ID;}
{ESP}      {}


.    { cout<<"ERROR LEXICO "<<yytext<<endl;}   //Cualquier caracter excepto salto de linea

%%