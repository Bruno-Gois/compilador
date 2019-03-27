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

ID  :
  ('a'..'z' | 'A'..'Z')+;

WS_ : (' ' | '\n' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHARLITERAL : '\'' (ESC|CHAR) '\'';

STRING : '"' (ESC|CHAR)* '"';

fragment 
 CHAR : ('a'..'z' | 'A'..'Z' | '0'..'9' | ' ' | '!' | '#' | '$' | '%' | '&') ;

fragment
 ESC : '\\' [nt\\"] ;
