// import section
import java_cup.runtime.*;


%%
// declaration section
%class MPLexer

%cup

%line
%column

%eofval{
	return new Symbol( sym.EOF );
%eofval}

%{
   public int getLine(){
      return yyline;
   }
%}


//states
%state COMMENT

//macros
slovo = [a-zA-Z]
cifra = [0-9]
oc16 = [0-9A-F]


%%
// rules section

\/\/ { yybegin( COMMENT ); }
<COMMENT>~\n { yybegin( YYINITIAL ); }

[\t\n\r ] { ; }
\(      { return new Symbol( sym.LP ); }
\)      { return new Symbol( sym.RP ); }
\{      { return new Symbol( sym.LV ); }
\}      { return new Symbol( sym.RV ); }

//operators
&&      { return new Symbol( sym.AND ); }
\|\|    { return new Symbol( sym.OR ); }
\+      { return new Symbol( sym.PLUS ); }
\*      { return new Symbol( sym.MUL ); }
\-      { return new Symbol( sym.MIN ); }
\/      { return new Symbol( sym.DIV ); }
\<      { return new Symbol( sym.LESS ); }
\<=     { return new Symbol( sym.LESSE ); }
\>      { return new Symbol( sym.GREAT ); }
\>=     { return new Symbol( sym.GREATE ); }
==      { return new Symbol( sym.EQ ); }
\!=     { return new Symbol( sym.NEQ ); }
//separators
;       { return new Symbol( sym.DOTCOMMA ); }
,       { return new Symbol( sym.COMMA ); }
=       { return new Symbol( sym.ASSIGN ); }
:       { return new Symbol( sym.DOUBLEDOT ); }

//key words
"main"      { return new Symbol( sym.MAIN ); }
"int"	    { return new Symbol( sym.INT );	}
"char"		{ return new Symbol( sym.CHAR ); }
"real"      { return new Symbol( sym.REAL ); }
"bool"      { return new Symbol( sym.BOOL); } 
"repeat"    { return new Symbol( sym.REPEAT ); }
"until"     { return new Symbol( sym.UNTIL); }  
"read"		{ return new Symbol( sym.READ ); }
"write"		{ return new Symbol( sym.WRITE ); }
"true"  { return new Symbol( sym.BOOLCONST, yyline, yycolumn, true ); }
"false" { return new Symbol( sym.BOOLCONST, yyline, yycolumn, false ); }	

//id-s
({slovo} | _)({slovo}|{cifra}| _ )*   { return new Symbol( sym.ID, yyline, yycolumn, yytext() ); }
//constants
{cifra}+    { return new Symbol( sym.INTCONST, yyline, yycolumn, new Integer( yytext() ) ); }
\${oc16}+   { return new Symbol( sym.INTCONST, yyline, yycolumn, Integer.parseInt( yytext(), 16 ) ); }
0\.{cifra}+(E[+\-]{cifra}+)? { return new Symbol( sym.REALCONST, yyline, yycolumn, Double.valueOf( yytext() ) ); }
'[^]' { return new Symbol( sym.CHARCONST, yyline,yycolumn, yytext().charAt(0) ); }
//error symbol
. { throw new Error("Illegal character <"+yytext()+">"); }
