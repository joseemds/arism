module ast


pub struct Num {pub: value int}

pub enum Op { add  sub }

pub type Ast = Op | Num
