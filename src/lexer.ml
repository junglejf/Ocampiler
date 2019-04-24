# 2 "lexer.mll"
         
        open Parser        (* The type token is defined in parser.mli *)
        exception Eof
        
# 7 "lexer.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base =
   "\000\000\239\255\000\000\000\000\000\000\245\255\002\000\003\000\
    \248\255\249\255\250\255\251\255\252\255\253\255\017\000\255\255\
    \243\255\244\255\000\000\000\000\242\255\000\000\000\000\002\000\
    \241\255\002\000\240\255";
  Lexing.lex_backtrk =
   "\255\255\255\255\255\255\255\255\255\255\255\255\009\000\008\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\001\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255";
  Lexing.lex_default =
   "\255\255\000\000\255\255\255\255\255\255\000\000\255\255\255\255\
    \000\000\000\000\000\000\000\000\000\000\000\000\255\255\000\000\
    \000\000\000\000\255\255\255\255\000\000\255\255\255\255\255\255\
    \000\000\255\255\000\000";
  Lexing.lex_trans =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\015\000\015\000\000\000\000\000\015\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \015\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \009\000\008\000\011\000\013\000\000\000\012\000\000\000\010\000\
    \014\000\014\000\014\000\014\000\014\000\014\000\014\000\014\000\
    \014\000\014\000\000\000\000\000\007\000\005\000\006\000\017\000\
    \016\000\014\000\014\000\014\000\014\000\014\000\014\000\014\000\
    \014\000\014\000\014\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\021\000\000\000\000\000\000\000\020\000\003\000\024\000\
    \000\000\000\000\000\000\000\000\022\000\000\000\002\000\025\000\
    \000\000\000\000\018\000\023\000\004\000\019\000\026\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000";
  Lexing.lex_check =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\255\255\255\255\000\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\000\000\000\000\000\000\255\255\000\000\255\255\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\255\255\255\255\000\000\000\000\000\000\006\000\
    \007\000\014\000\014\000\014\000\014\000\014\000\014\000\014\000\
    \014\000\014\000\014\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\003\000\255\255\255\255\255\255\019\000\000\000\023\000\
    \255\255\255\255\255\255\255\255\021\000\255\255\000\000\002\000\
    \255\255\255\255\004\000\022\000\000\000\018\000\025\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255";
  Lexing.lex_base_code =
   "";
  Lexing.lex_backtrk_code =
   "";
  Lexing.lex_default_code =
   "";
  Lexing.lex_trans_code =
   "";
  Lexing.lex_check_code =
   "";
  Lexing.lex_code =
   "";
}

let rec token lexbuf =
   __ocaml_lex_token_rec lexbuf 0
and __ocaml_lex_token_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 7 "lexer.mll"
                                      ( token lexbuf )
# 117 "lexer.ml"

  | 1 ->
let
# 8 "lexer.mll"
                           lxm
# 123 "lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 8 "lexer.mll"
                               ( VALUE( int_of_string lxm) )
# 127 "lexer.ml"

  | 2 ->
# 9 "lexer.mll"
                           ( PLUS )
# 132 "lexer.ml"

  | 3 ->
# 10 "lexer.mll"
                           ( MINUS )
# 137 "lexer.ml"

  | 4 ->
# 11 "lexer.mll"
                           ( TIMES )
# 142 "lexer.ml"

  | 5 ->
# 12 "lexer.mll"
                           ( DIV )
# 147 "lexer.ml"

  | 6 ->
# 13 "lexer.mll"
                           ( LPAREN )
# 152 "lexer.ml"

  | 7 ->
# 14 "lexer.mll"
                           ( RPAREN )
# 157 "lexer.ml"

  | 8 ->
# 15 "lexer.mll"
                           ( LESS )
# 162 "lexer.ml"

  | 9 ->
# 16 "lexer.mll"
                           ( GREATER )
# 167 "lexer.ml"

  | 10 ->
# 17 "lexer.mll"
                           ( EQUAL )
# 172 "lexer.ml"

  | 11 ->
# 18 "lexer.mll"
                           ( GREATEREQUAL )
# 177 "lexer.ml"

  | 12 ->
# 19 "lexer.mll"
                           ( LESSEQUAL )
# 182 "lexer.ml"

  | 13 ->
# 20 "lexer.mll"
                           ( TRUE )
# 187 "lexer.ml"

  | 14 ->
# 21 "lexer.mll"
                           ( FALSE )
# 192 "lexer.ml"

  | 15 ->
# 22 "lexer.mll"
                           ( NEGATION )
# 197 "lexer.ml"

  | 16 ->
# 23 "lexer.mll"
                           ( EOF )
# 202 "lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_token_rec lexbuf __ocaml_lex_state

;;

