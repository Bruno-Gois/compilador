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

LPARENTHESIS : '(';
RPARENTHESIS : ')';

SEMICOLON : ';';

WS_ : (' ' | '\n' | '\t' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHARLITERAL : '\'' (ESC|CHAR) '\'';

//RESERVED_WORD : ('if' | INT_BOOLEAN |  'callout' | 'class' | 'else'  |'return' | 'void' | 'for' | 'break' | 'continue');

IF : 'if';

ELSE : 'else';

FOR : 'for';

EQUALS : '=';

VOID : 'void';

RETURN : 'return';

BREAK : 'break';

CONTINUE : 'continue';

INT_BOOLEAN : 'int' | 'boolean';

INT_LITERAL : NUMERIC+ | HEXLIT;

BOOLEAN_LITERAL : 'true' | 'false';

CALLOUT : 'callout';

BOOLEAN : ('true' | 'false');

STRING : '"' (ESC|CHAR)+ '"';

NUMBER : NUMERIC+;

HEXLIT : '0x' ('a'..'f' | 'A'..'F' | NUMERIC)+;

MINUS : '-';

PLUS : '+';

MULTIPLICATION : '*';

DIVISION : '/';

EXCLAMATION : '!';

REL_OP : ('<' | '>' | '<=' | '>=');

EQ_OP : ('==' | '!=');

COND_OP : ('&&' | '||');

ID  : ID_CHAR (ALPHANUMERIC)*;

fragment
ID_CHAR : 'a'..'z' | 'A'..'Z' | '_';

fragment
ALPHANUMERIC : 'a'..'z' | 'A'..'Z' | '_' | '0'..'9';

fragment
NUMERIC : '0'..'9';

OPERATION : ('+' | '-' | '*' | '<' | ('<' '=') | ('!' '=') | ('&' '&'));

TOKENS : (','| ';' | '[' | '|' | '=' | '(' | ')' | ']' | '>');

COMMA : ',';

fragment 
 CHAR : ('a'..'z' | 'A'..'Z' | '0'..'9' | ' ' | '!' | '#' | '$' | '%' | '&' | '(' | ')' | '*' | '+' | ',' | '.' | ':' | '?' | '_');

fragment
 ESC : '\\' ('n'|'t'|'\\'|'"'|'\'') ;
