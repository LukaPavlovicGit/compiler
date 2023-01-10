# jflex-fcup-compiler
Projekat iz programskih prevodioca

## Grammer:

Program -> main{ Block }
Block -> { VarList StatementList }

VarList ->  VarList VarDecl | VarDecl
VarDecl -> NameList:Type;
NameList -> NameList , id | id
Type -> int | char | real | bool

StatementList -> StatementList Statement | Statement
Statement -> repeat StatementList until Expression;
           | id = Expression;
           | read(NameList);
           | Block


Expression -> Expression or AndExpression | AndExpression
AndExpression -> AndExpression and RelExpression | RelExpression
RelExpression -> ArExpression RelOp ArExpression
RelOp -> < | <= | == | != | > | >=

ArExpression -> ArExpression + Term | ArExpression - Term | Term
Term -> Term * Factor | Term / Factor | Factor
Factor -> id | Const | (Expression)
Const -> INTCONST | CHARCONST | BOOLCONST | REALCONST


## Commands for command line:

1. java -cp java_cup.jar java_cup.Main -parser MPParser MPParser.cup

2. javac MPParser.java

---------------------------------------------------------------------------------------------------------

3.1. java MPParser primeri/0_nema_Main-a

3.2. java MPParser primeri/1_nest_level,read,repeat

3.3. java MPParser primeri/2_isti_naziv_promenljiva_razliciti_nivoi-semanticka_greska

3.4. java MPParser primeri/3_nedozvoljena_dodela-semanticka_greska

3.5. java MPParser primeri/4_repeat_until_semanticka_greska

3.6. java MPParser primeri/5_promentljiva_nije_deklarisana-semanticka_greska

3.7. java MPParser primeri/6_ugnjezdena_petlja

3.8. java MPParser primeri/7_petlja_bez_stetment-a

3.9. java MPParser primeri/8_blok_greska

3.10. java MPParser primeri/9_ponovno_deklarisanje-semanticka_greska

3.11. java MPParser primeri/10_aritm_oper_nad_bool-semanticka_greska

3.12. java MPParser primeri/11_relac_oper_bool_res_1-semanticka_greska

3.13. java MPParser primeri/12_relac_oper_bool_res_2

3.14. java MPParser primeri/13_logic_oper


