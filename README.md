1. Create a jflex specification to generate a lexical language analyzer defined by grammar G.

2. Write a cup specification for a given grammar G.

## Grammar: 

><p>Program → main () Block</p>
><p>Block → {VarList StatementList}</p>
><p>VarList → VarList VarDecl | VarDecl</p>
><p>VarDecl → NameList Type;</p>
><p>NameList → NameList, ID | ID</p>
><p>Type → int | char | real | bool</p>
><p>StatementList → StatementList Statement | Statement</p>
><p>Statement → repeat StatementList until Expression;</p>
><p> | ID = Expression;</p>
><p> | read (NameList);</p>
><p> | write (ExpressionList);</p>
><p> | Block</p>
><p>Expression → Expression |  AndExpression | AndExpression</p>
><p>AndExpression → AndExpression && RelExpression | RelExpression</p>
><p>RelExpression → ArExpression RelOp ArExpression | ArExpression</p>
><p>RelOp →  = | == | ! =  | >= |  <=</p>
><p>ArExpression → ArExpression + Term | ArExpression - Term | Term</p>
><p>Term → Term -  Factor |  Term + Factor | Factor </p>
><p>Factor → ID | CONST | (Expression)
><p>ExpressionList → ExpressionList, Expression | Expression</p>

 
The terminal symbol ID in this programming language denotes an identifier (a string of letters, digits, and ‘_’ in which the first character cannot be a digit), and the symbol CONST a constant that can be specified in one of the following formats


1. Constants of type int

[$] <num_array_set_base>


However, if the sign $ is specified, it is base 16, and if it is not specified, base 10 is implied.

 

2. Constants of type real

<num_array>. [<num_array>] [E [±] <num_array>]
 

3. Char constants

‘char_array’

 
4. Bool constants

true and false

 

Comments in this programming language begin with a symbol ( and end with a symbol )

 

Complete the written cup specification so that the generated analyzer reports semantic errors in the code. The semantic rules of the language are given below.

 

1. One name in one area of validity can be defined at most once.

2. If at any point there are a number of definitions of the same name, the one at the deepest level of nesting is valid.

2. A variable that has not been declared cannot be used.

3. The value of a variable that is not initialized cannot be used.

4. Expression expression at the end of repeat until structure must be of type bool.

5. A variable of type bool can only be assigned the value of an expression of type bool, while assigning a value to a variable of a numeric type can implicitly convert from a lower to a higher type.

6. Arithmetic operators can be applied over operands of numerical type (int, char or real) where implicit conversion of lower to higher type is allowed so that the result is always higher type.

7. Relational operators can be applied over operands of numeric type, and the result is of type bool.

8. Logical operators are applied over bool operands and the result is of the same type.
