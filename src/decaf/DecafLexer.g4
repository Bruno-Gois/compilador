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

WS_ : (' ' | '\n' | '\t' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHARLITERAL : '\'' (ESC|CHAR) '\'';

RESERVED_WORD : ('if' | 'boolean' | 'callout' | 'class' | 'else' |'int' |'return' | 'void' | 'for' | 'break' | 'continue');

BOOLEAN : ('true' | 'false');

STRING : '"' (ESC|CHAR)+ '"';

NUMBER : ('0'..'9')+ ~('x');

HEXLIT : '0x' ('a'..'f' | 'A'..'F' | '0'..'9')+;

MINUS : '-';

ID  : ('a'..'z' | 'A'..'Z' | '_' | '1'..'9')+;
//~(['0x'])
//teste nao preve id comecando em 0

OPERATION : ('+' | '-' | '*' | '<' | ('<' '=') | ('!' '=') | ('&' '&'));

TOKENS : (','| ';' | '[' | '|' | '=' | '(' | ')' | ']' | '>');

fragment 
 CHAR : ('a'..'z' | 'A'..'Z' | '0'..'9' | ' ' | '!' | '#' | '$' | '%' | '&' | '(' | ')' | '*' | '+' | ',' | '.' | ':' | '?' | '_');

fragment
 ESC : '\\' ('n'|'t'|'\\'|'"'|'\'') ;
