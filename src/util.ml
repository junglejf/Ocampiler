open Pi;;

(* Files *)
let readInputFile file_name =
  let ch = open_in file_name in
    let s = really_input_string ch (in_channel_length ch) in
    close_in ch;
    s;;

(* Pi Denotations *)
let rec string_of_arithmetic_expression arithmetic_expression = 
  match arithmetic_expression with 
  | Sum (x, y) -> "SUM (" ^ (string_of_expression x) ^ ", " ^ (string_of_expression y) ^ ")"
  | Num (x) -> "NUM (" ^ (string_of_int x) ^ ")"
  | Sub (x, y) -> "SUB (" ^ (string_of_expression x) ^ ", " ^ (string_of_expression y) ^ ")"
  | Div (x, y) -> "DIV (" ^ (string_of_expression x) ^ ", " ^ (string_of_expression y) ^ ")"
  | Mul (x, y) -> "MUL (" ^ (string_of_expression x) ^ ", " ^ (string_of_expression y) ^ ")"
  
and string_of_boolean_expression boolean_expression =
  match boolean_expression with 
  | Boo(x) -> "BOO (" ^ (string_of_bool x) ^ ")"
  | Eq (x, y) ->  "EQ (" ^ (string_of_expression x) ^ ", " ^ (string_of_expression y) ^ ")"
  | Lt (x, y) ->  "LT (" ^ (string_of_expression x) ^ ", " ^ (string_of_expression y) ^ ")"
  | Le (x, y) ->  "LE (" ^ (string_of_expression x) ^ ", " ^ (string_of_expression y) ^ ")"
  | Gt (x, y) ->  "GT (" ^ (string_of_expression x) ^ ", " ^ (string_of_expression y) ^ ")"
  | Ge (x, y) ->  "GE (" ^ (string_of_expression x) ^ ", " ^ (string_of_expression y) ^ ")"
  | And (x, y) ->  "AND (" ^ (string_of_expression x) ^ ", " ^ (string_of_expression y) ^ ")"
  | Or (x, y) ->  "OR (" ^ (string_of_expression x) ^ ", " ^ (string_of_expression y) ^ ")"
  | Not (x) ->  "NOT (" ^ (string_of_expression x) ^ ")"


and string_of_expression expression =
  match expression with
  | AExp(x) -> string_of_arithmetic_expression x
  | BExp(x) -> string_of_boolean_expression x
  | Id(x) -> "ID (" ^ x ^ ")"

and string_of_command command = 
  match command with
  | Loop(x, y) -> "LOOP (" ^ (string_of_boolean_expression x) ^ ", " ^ (string_of_command y) ^ ")"
  | CSeq(x, y) -> "CSEQ (" ^ (string_of_command x) ^ ", " ^ (string_of_command y) ^ ")"
  | Nop -> "NOP"
  | Assign(x, y) -> "ASSIGN (" ^ (string_of_expression x) ^ ", " ^ (string_of_expression y) ^ ")"
  | Cond(x, y, z) -> "COND (" ^ (string_of_boolean_expression x) ^ ", " ^ (string_of_command y) ^ ", " ^ (string_of_command z) ^ ")"


and string_of_statement statement =
  match statement with
  | Exp (x) -> string_of_expression x
  | Cmd (x) -> string_of_command x
  
and string_of_exp_opcode expOc =
  match expOc with
  | OPSUM -> "#SUM"
  | OPMUL -> "#MUL"
  | OPSUB  -> "#SUB"
  | OPDIV  -> "#DIV"
  | OPEQ  -> "#EQ"
  | OPLT  -> "#LT"
  | OPLE  -> "#LE"
  | OPGT  -> "#GT"
  | OPGE  -> "#GE"
  | OPAND  -> "#AND"
  | OPOR  -> "#OR"
  | OPNOT -> "#NOT"

  and string_of_cmd_opcode cmdOc =
  match cmdOc with
  | OPASSIGN  -> "#ASSIGN"
  | OPLOOP  -> "#LOOP"
  | OPCOND -> "#COND"



and string_of_ctn ctn =
  match ctn with 
  | Statement(x) -> string_of_statement x
  | ExpOc(x) -> string_of_exp_opcode x
  | CmdOc(x) -> string_of_cmd_opcode x 
  
(* Stacks *)
and string_of_stack stack func = 
"[ " ^ (String.concat ", " (List.map func (List.of_seq (Stack.to_seq stack))) ) ^ " ]"
;;

(* Dictionaries *)
module Environment = Map.Make(String);;
module Memory = Map.Make(struct type t = int let compare = compare end);;

let string_of_dictionary func =
  func;;
  


