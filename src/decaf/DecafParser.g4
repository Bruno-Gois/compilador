parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

//program: TK_class LCURLY field_decl* method_decl* RCURLY EOF;

program: TK_class LCURLY RCURLY EOF;

//field_decl: (type id | (type id LBRACKET int_literal LBRACKET))+, ;

//n pode ter simbolo terminal no parser
//no parser serao utilizados tokens(Maiúsculo)
//parser so aceita tokens e variáveis
