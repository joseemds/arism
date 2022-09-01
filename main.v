import os

import lexer

fn main(){
	input_file := os.args[1]
	// output_file := os.args[2]

	lexbuf := lexer.from_file(input_file)
	println(lexer.scan_tokens(lexbuf))
}
