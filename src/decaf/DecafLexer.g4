lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}

tokens
{
  TK_class
}

PROGR: 'Program';
IF : 'if';
BL : 'boolean';
CLLT : 'callout';
EL : 'else';
INT : 'int';
RTN : 'return';
VD : 'void';
FR : 'for';
BRK : 'break';
CNT : 'continue';
CLSS : 'class';
LCURLY : '{';
RCURLY : '}';
LPARENT:'(';
RPARENT:')';
LBRACKET:'[';
RBRACKET:']';
PONTOVIR:';';
VIRGULA :',';
MULT:'*';
DIV:'/';
SUB: '-';
SUM: '+';
EXP:'^';
REST:'%';
EXCL:'!';
AND: '&&';
OR: '||';
IGUALDADE:'==';
DIFERENTE:'!=';
MAIOR: '>';
MENOR: '<';
MAIORIG:'>=';
MENORIG: '<=';
INCREMENTO: '+=';
DECREMENTO:'-=';
ATRIBUICAO:'=';
BOOLN : (BOLN);

HEXA : '0x'('0'..'9'|'a'..'f'|'A'..'F')+;


ID  : ('_'|ALPHA)(ALPHA|NUM|'_')*;

WS_ : (' '|'\t'| '\n' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHAR : '\'' (ESC|ASCII) '\'';
STRING : '\"' (ESC|ASCII|'\\'|'\"'|'\\\'')* '\"';
NUMBER : (NUM)+;
OPR : (OPERA);


fragment ESC :  '\\' ('n'|'t'|'\\'|'"');
fragment ASCII : [a-zA-Z0-9 !#-&(-/:-@^-`{-~];
fragment ALPHA : ('a'..'z'|'A'..'Z');
fragment NUM : ('0'..'9');
fragment OPERA : ('+'|'-'|'*'|'<'|'<='|'!='|'&&');
fragment BOLN : ('true'|'false');