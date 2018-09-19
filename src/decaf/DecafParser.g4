parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program: CLSS PROGR LCURLY field_decl* method_decl* RCURLY;

field_decl: type id (VIRGULA type id)* PONTOVIR
| type id LBRACKET int_literal RBRACKET (VIRGULA type id VIRGULA LBRACKET int_literal RBRACKET)* PONTOVIR;

method_decl: (type | VD)  id LPARENT (type id(VIRGULA type id)* )? RPARENT block;

block: LCURLY var_decl* statement* RCURLY;

var_decl: (type id)* PONTOVIR;

type: INT | BL;

statement: location assign_op expr PONTOVIR | method_call PONTOVIR | IF LPARENT expr RPARENT block (EL block)?  
| FR ID ATRIBUICAO expr VIRGULA expr block 
| RTN expr? PONTOVIR 
| BRK PONTOVIR 
| CNT PONTOVIR 
| block;

assign_op: ATRIBUICAO | INCREMENTO | DECREMENTO;

method_call: method_name LPARENT (expr (VIRGULA expr)*)? RPARENT 
| CLLT LPARENT string_literal (VIRGULA callout_arg (VIRGULA callout_arg)*)? RPARENT;

method_name: ID;

location: id | id LBRACKET expr RBRACKET;

expr: location 
| method_call 
| literal
| expr bin_op expr 
| SUB expr 
| EXCL expr 
| LPARENT expr RPARENT;

callout_arg: expr | string_literal;

bin_op: arith_op | rel_op |  eq_op | cond_op;

arith_op: SUM|SUB|MULT|REST|DIV;

rel_op: MENOR|MAIOR|MENORIG|MAIORIG;

eq_op: IGUALDADE|DIFERENTE;

cond_op: AND| OR;

literal: int_literal | char_literal | bool_literal;

id: ID;

alpha_num: ALP | NUMBER;

int_literal: decimal_literal | hex_literal;

decimal_literal: NUMBER | (NUMBER)+;

hex_literal: HEXA | (HEXA)+;

bool_literal: BOL;

char_literal: CHAR;

string_literal: STRING;












