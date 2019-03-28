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

WS_ : (' ' | '\n' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHARLITERAL : '\'' (ESC|CHAR) '\'';

STRING : '"' (ESC|CHAR)* '"';

NUMBER : ('0'..'9')+ ~'x';

MINUS : '-';

HEXLIT : '0x' ('a'..'f' | 'A'..'F' | '0'..'9')+;

ID  : ('a'..'z' | 'A'..'Z' | '_' | '0'..'9')+;

fragment 
 CHAR : ('a'..'z' | 'A'..'Z' | '0'..'9' | ' ' | '!' | '#' | '$' | '%' | '&' | '(' | ')' | '*' | '+' | ',' | '.' | ':' | '?' | '_');

fragment
 ESC : '\\' ('n'|'t'|'\\'|'"'|'\'') ;
