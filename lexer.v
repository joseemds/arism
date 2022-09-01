module lexer

import os
import ast

struct Lexbuf {
 	buf string
	len int
	pos int
	last_char string
	tokens [] ast.Ast 
}

pub fn from_file(f string) Lexbuf{
	content := os.read_file(f) or {
		panic("Error while reading buffer from file")
	}
	return from_string(content)
}

pub fn from_string(s string) Lexbuf{
	return Lexbuf{
		buf: s
		len: s.len
		pos: 0
		last_char: ""
	}
}


pub fn scan_tokens(l Lexbuf) Lexbuf{
	mut tokens := []ast.Ast
	for char_ in l.buf.trim_space().split(" ") {
		tokens << scan_token(char_)
	}
	return Lexbuf{
		buf: l.buf
		len: l.len
		pos: l.pos
		tokens: tokens 
	}
}

fn scan_token(s string) ast.Ast {
	return match s {
	"0", "1", "2","3","4","5","6","7","8","9" { ast.Num{value: s.int() } }
	"+" { ast.Op.add }
	"-" { ast.Op.sub }
	else { panic("Unexpected token") }
	}
}

fn add_token(l Lexbuf) Lexbuf{
	return Lexbuf {
		buf: l.buf
		len: l.len
		pos: l.pos
		tokens: [ast.Op.add]
	}
}
