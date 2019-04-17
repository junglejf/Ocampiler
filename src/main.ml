(* open Pi;;

let z = new num 5.0 in
  print_float z#getValue;; *)

open Util;;
open Printf;;

let willReadFile = ref false;;
let fileContents = ref "valor antigo";;
  
    
let () =
  for i = 1 to Array.length Sys.argv - 1 do 
    let arg = Sys.argv.(i) in 
      (* printf "[%i] %s\n" i arg; *)

      if arg = "-f" then begin
        willReadFile := true;
      end else begin
        if !willReadFile then begin 
          fileContents := readInputFile arg;
          willReadFile := false;
        end else begin
          printf "%s is not a valid argument\n" arg;
        end
      end
     
      
    
  done;
  print_endline !fileContents;
  let result = Parser.main Lexer.token (Lexing.from_string !fileContents) in 
    print_endline result;