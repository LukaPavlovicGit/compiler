Program -> { Block }
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