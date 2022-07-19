module ast


pub struct Add {}
pub struct Sub {}

pub struct Num {pub: value int}

pub type Op = Add | Sub

pub type Ast = Op | Num