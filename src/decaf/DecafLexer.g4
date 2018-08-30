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

LCURLY : '{';
RCURLY : '}';

IF : 'if';
BL : 'boolean';
CLLT : 'callout';
EL : 'else';
FLS : 'false';
INT : 'int';
RTN : 'return';
TR : 'true';
VD : 'void';
FR : 'for';
FPR : 'forpar';
BRK : 'break';
CNT : 'continue';
CLSS : 'class';

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

