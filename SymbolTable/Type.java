package SymbolTable;



public class Type extends SymbolNode {
	public static int INT = 0;
	public static int CHAR = 1;
	public static int REAL = 2;
	public static int BOOL = 3;
	public static int UNKNOWN = 4;
	public int tkind;
	
	public Type ( String name, int typeKind, SymbolNode next){
		super( name, SymbolNode.TYPE, null, next );
		this.tkind = typeKind;
		this.type = this;
	}

	
	public boolean equals(Type type){
		return this.tkind != type.tkind;
	}

	public int conversionDif(Type type){

		return this.tkind -type.tkind;
	}
}
