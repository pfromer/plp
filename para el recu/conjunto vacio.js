vacio = 
{
	hayElementos : false,
	sacar : function(x){return vacio},
	pertenece : function(x){return false},
	agregar : function(x){
		var result = Object.create(this);
		result.hayElementos = true;
		result.pertenece = function(y){
			if(x==y){
				return true;				
			}
			else{
				return this.__proto__.pertenece(y);			
			}
		}
		result.sacar = function(z){
			if(x==z){
				return this.__proto__;
			}
			else{
				return this.__proto__.sacar(z).agregar(x);
			}
		}
		return result;
	}
}