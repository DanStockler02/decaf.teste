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

ID  : ('_'|ALPHA)(ALPHA|NUM|'_')*;

WS_ : (' ' | '\n' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHAR : '\'' (ESC|ASCII) '\'';
STRING : '"' (ESC|~'"')* '"';


fragment ESC :  '\\' ('n'|'t'|'\\'|'"');
fragment ASCII : [a-zA-Z0-9 !#-&(-/:-@^-`{-~];
fragment ALPHA : ('a'..'z'|'A'..'Z');
fragment NUM : ('0'..'9');

