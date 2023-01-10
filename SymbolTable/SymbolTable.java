package SymbolTable;

public class SymbolTable {
	
	/*tabela simbola za "language scope"
	u ovom slucaju tu pripadaju samo tipovi*/
	private SymbolNode types;
	
	/* tabela simbola za oblast vazenja programa */
	private SymbolNode variables;
	
	public SymbolTable( )
	{
		types = new Type( "unknown", Type.UNKNOWN, null);
		types = new Type( "char", Type.CHAR, types );
		types = new Type( "int", Type.INT, types );
		types = new Type( "real", Type.REAL, types);
		types= new Type( "bool", Type.BOOL, types);
		variables = null;
	}
	
	public boolean addVar( String name, Type type,int nestLevel )
	{
		Variable existing = this.getVar( name, nestLevel, true);
		if ( existing != null )
			return false;
		variables = new Variable( name, type, variables, nestLevel);
		return true;
	}

	/**
	 * Pronalazi trazenu promenjivu pod imenom name
	 * Ukoliko pri prolazenju naidjemo na neku koja je manja
	 * od tren nivoa od kog se nalazimo i ima isto ime
	 *
	 * Bool nam sluzi da nam nagovesti dal je pronadjena promenjiva
	 * u istom bloku kao trenutna ugnjezdenost koja je pozvala ovu func
	 *
	 * @param  name trazeno ime promenjive
	 * @param nestLevel trenutna ugnjezdenost koda
	 * @param deklaracija true ako se pravi nova promenjiva
	 */

	public Variable getVar(String name, int nestLevel, boolean deklaracija){

		SymbolNode current = variables;
		int currentNestLevel=nestLevel;


		while ( current != null ){
			if(((Variable)current).nestLevel <= currentNestLevel && current.name.compareTo( name ) == 0 ) {
				if(deklaracija) {
					if (((Variable)current).nestLevel == nestLevel) {
						return (Variable) current;
					}
				}else{
					return (Variable) current;
				}
			}

			currentNestLevel=((Variable)current).nestLevel < currentNestLevel ? ((Variable)current).nestLevel : currentNestLevel;
			current = current.next;

		}
		return null;
	}
	
	public Type getType(String typeName)
	{
		SymbolNode current = types;
		while ( current != null && 
				current.name.compareTo( typeName ) != 0 )
			current = current.next;
		return ( Type ) current;
	}
	
	public SymbolNode getVariables()
	{
		return variables;
	}

}
