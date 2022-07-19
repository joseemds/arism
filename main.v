import os

import ast

import parser

import assembly

fn main(){
	file := os.args[1]
	println(file)
	
	parser.parse([ast.Ast(ast.Op(ast.Add{})), ast.Ast(ast.Num{value: 2}), ast.Ast(ast.Num{value: 2})])
	instrs := ([ast.Ast(ast.Op(ast.Add{})), ast.Ast(ast.Num{value: 2}), ast.Ast(ast.Num{value: 2})])
	assembly.write_instrs(file, instrs)
}