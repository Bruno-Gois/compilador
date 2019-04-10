lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}

TK_class : 'class Program';

LCURLY : '{';
RCURLY : '}';

LBRACKET : '[';
RBRACKET : ']';

WS_ : (' ' | '\n' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHARLITERAL : '\'' (ESC|CHAR) '\'';

STRING : '"' (ESC|CHAR)* '"';

HEXLIT : '0x' ('a'..'f' | 'A'..'F' | '0'..'9')+;

NUMBER : ('0'..'9')+ (~'x');

MINUS : '-';

ID  : ('a'..'z' | 'A'..'Z')+;

fragment 
 CHAR : ('a'..'z' | 'A'..'Z' | '0'..'9' | ' ' | '!' | '#' | '$' | '%' | '&' | '(' | ')' | '*' | '+' | ',' | '.' | ':' | '?');

fragment
 ESC : '\\' ('n'|'t'|'\\'|'"'|'\'') ;
