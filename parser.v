module parser

import ast {Op, Num}

pub fn parse(values []ast.Ast){
	for value in values{
		match value {
			Num { println(value.value) }
			Op {
				match value {
					.add { println('add') }
					.sub { println('sub') }
				} 
			
			}
		}
	}
}
