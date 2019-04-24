parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program: TK_class LCURLY field_decl* method_decl* RCURLY EOF;

field: type ID | type ID LBRACKET INT_LITERAL RBRACKET;

field_decl: field (COMMA field)* SEMICOLON;

method_decl: (type | VOID) ID LPARENTHESIS parameters RPARENTHESIS block;

type: INT_BOOLEAN;

parameters: (type ID (COMMA type ID)*)*;

block: LCURLY var_decl* statement* RCURLY;

var_decl: type ID (COMMA ID)* SEMICOLON;

statement: location assign_op expr SEMICOLON
          | method_call SEMICOLON
          | IF LPARENTHESIS expr RPARENTHESIS block
          | IF LPARENTHESIS expr RPARENTHESIS block ELSE block
          | FOR ID EQUALS expr COMMA expr block
          | RETURN expr? SEMICOLON 
          | BREAK SEMICOLON
          | CONTINUE SEMICOLON
          | block;

location: ID | ID LBRACKET expr RBRACKET;

assign_op: EQUALS | PLUS EQUALS | MINUS EQUALS;

expr: location
    | method_call
    | literal
    | expr bin_op expr
    | MINUS expr
    | EXCLAMATION expr
    | LPARENTHESIS expr RPARENTHESIS;

literal: INT_LITERAL |  CHARLITERAL | BOOLEAN;

method_call: ID LPARENTHESIS (expr (COMMA expr)* )? RPARENTHESIS
            | CALLOUT LPARENTHESIS string_literal (COMMA callout_arg)* RPARENTHESIS;

bin_op: arith_op | REL_OP | EQ_OP | COND_OP;

arith_op: (PLUS | MINUS | MULTIPLICATION | DIVISION);

string_literal: CHARLITERAL*;

callout_arg: expr | string_literal;


