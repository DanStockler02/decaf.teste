parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program: CLSS ID LCURLY field_decl* method_decl* RCURLY;

field_decl: (LCURLY type ID | type ID LBRACKET int_litaral RBRACKET RCURLY)* PONTOVIR;

method_decl: {type | VD} ID LPARENT (type ID(VIRGULA type ID)*)? RPARENT block;

block: LCURLY var_decl* statement* RCURLY;

var_decl: (type ID)* PONTOVIR;

type: (INT | BL);

statement: (location assing_op expr PONTOVIR | method_call PONTOVIR | IF (expr) block [ EL block ] | FR ID ATRIBUICAO expr PONTOVIR expr  block | RTN [expr] PONTOVIR | BRK PONTOVIR | CNT | block;

assing_op: ATRIBUICAO | INCREMENTO | DECREMENTO;

method_call: method_name LPARENT [(expr)*] RPARENT | CLLT LPARENT string_literal [, (callout_arg)* ,] RPARENT;

method_name: ID;

location: ID | ID LBRACKET expr RBRACKET;

expr: location | method_call | literal | expr bin_op expr | SUB expr | EXCL expr | LPARENT expr RBRACKET;

callout_arg: expr | string_literal;

bin_op: arith_op | rel_op |  eq_op | cond_op;

arith_op: SUM|SUB|MULT|REST;

rel_op: MENOR|MAIOR|MEROIG|MAIORIG;

eq_op: IGUALDADE|DIFERENTE;

cond_op: AND| OR;

literal: int_litaral | char_literal | bool_literal;

id: ID alpha_num*;

alpha_num: ALPHA|NUM;

hex_digit: NUM | a | b | c | d | e | f | A | B | C | D | E | F;

int_litaral: decimal_literal | hex_literal;

decimal_literal: NUM | (NUM)*;

hex_literal: HEXA | (HEXA)*;

bool_literal: BOLN;

char_literal: '(CHAR)*';

string_literal: "(CHAR)*";












