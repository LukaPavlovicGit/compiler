package SymbolTable;

public class Variable extends SymbolNode {
	
	public int last_def;
	public int last_use;
	public int nestLevel;
	
	public Variable(String name, Type type, SymbolNode next, int nestLevel){
		super( name, SymbolNode.VARIABLE, type, next );
		last_def = -1;
		last_def = -1;
		this.nestLevel=nestLevel;
	}
	
}
