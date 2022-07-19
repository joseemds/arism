module parser

import ast {Op, Add, Sub, Num}

pub fn parse(values []ast.Ast){
	for value in values{
		match value {
			Num { println(value.value) }
			Op { println('op') 
				match value {
					Add { println('add') }
					Sub { println('sub') }
				} 
			
			}
		}
	}
}
