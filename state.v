module state

import datatypes.fsm
import ast
import assembly

struct Receiver {
	mut:
		inputs [] ast.Ast
		output [] assembly.Instruction
		current_state [] ast.Ast
		input_needed bool
}

fn setup() {
	mut receiver := Receiver{}
	mut machine := fsm.new()

	machine.add_state('InputNeeded', on_state_entry, input_needed_run, input_needed_exit)
	machine.add_state('Shifting', on_state_entry, on_state_run, on_state_exit)
	machine.add_transition('InputNeeded', 'Shifting', fn (_ voidptr, _ string , _ string) bool { return true })
	// machine.add_transition('Shifting', 'InputNeeded', fn (mut receiver, _, _) {receiver.input_needed})
}

fn on_state_entry(mut receiver Receiver, from string, to string) {}
fn input_needed_run(mut receiver Receiver, from string, to string){

	receiver.current_state << receiver.inputs[0]
	receiver.inputs.drop(1)
	
}
fn input_needed_exit(mut receiver Receiver, from string, to string){
	receiver.input_needed = false
}

fn shifting_run(mut receiver Receiver, from string, to string){

	if receiver.inputs.len < 3 {
		value := receiver.inputs[0]
		match value {
			ast.Op {
				match value {
					ast.Add {}
					ast.Sub {}
				}
			}
		else {
			panic("expected first value to be Bin op")
		}
		}
		
	}
}

fn on_state_run(mut receiver Receiver, from string, to string) {}

fn on_state_exit(mut receiver Receiver, from string, to string) {}
