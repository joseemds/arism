module assembly
import os
import ast

enum Register {
	rcx
	rax
	rdx
	rbx
	rsp
	rbp
	rsi
	rdi
	eax
	edi
	edx
	r8
	r9
	r10
	r11
}

type Value = Register | int

struct Mov {
	src Value
	dest Value
}

struct Add {
	src Value
	dest Value	
}


// enum Instruction {
// 	mov
// 	lea
// 	call
// 	add
// 	sub
// 	imul
// 	ret
// 	push
// 	pop
// 	pseudo
// 	label
// }

type Instruction = 
	Mov
	| Add

pub fn write_instr(filename string) {
	file := filename.all_before(".") + ".out"
	mut f := os.open_file(file, "w", 0o600) or { panic ("could not open file") }
	defer {
		println("closing file")
		f.close()
	}
	f.write_string(Register.rax.str() + " ") or  { println("deu bode") }
}

pub fn write_instrs(filename string, instrs []ast.Ast) {
	file := filename.all_before(".") + ".out"
	mut f := os.open_file(file, "w", 0o600) or { panic ("could not open file") }
	defer {
		println("closing file")
		f.close()
	}
	for instr in instrs{
		match instr {
			ast.Num {
				f.write_string("mov " + instr.value.str() + " " + Register.rax.str()) or {panic("bleh")}
			}
			ast.Op {
				match instr {
					ast.Add { println('add') }
					ast.Sub { println('sub') }
				} 
			
			}
		}
	}
}

