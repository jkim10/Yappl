type token =
  | SEMI
  | LPAREN
  | RPAREN
  | LBRACE
  | RBRACE
  | PLUS
  | MINUS
  | ASSIGN
  | EQ
  | NEQ
  | LT
  | AND
  | OR
  | IF
  | ELSE
  | WHILE
  | INT
  | BOOL
  | RETURN
  | COMMA
  | LITERAL of (int)
  | BLIT of (bool)
  | ID of (string)
  | EOF

open Parsing;;
let _ = parse_error;;
# 4 "microcparse.mly"
open Ast
# 32 "microcparse.ml"
let yytransl_const = [|
  257 (* SEMI *);
  258 (* LPAREN *);
  259 (* RPAREN *);
  260 (* LBRACE *);
  261 (* RBRACE *);
  262 (* PLUS *);
  263 (* MINUS *);
  264 (* ASSIGN *);
  265 (* EQ *);
  266 (* NEQ *);
  267 (* LT *);
  268 (* AND *);
  269 (* OR *);
  270 (* IF *);
  271 (* ELSE *);
  272 (* WHILE *);
  273 (* INT *);
  274 (* BOOL *);
  275 (* RETURN *);
  276 (* COMMA *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  277 (* LITERAL *);
  278 (* BLIT *);
  279 (* ID *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\005\000\005\000\003\000\006\000\
\006\000\004\000\007\000\007\000\009\000\009\000\008\000\008\000\
\010\000\010\000\010\000\010\000\010\000\011\000\011\000\011\000\
\011\000\011\000\011\000\011\000\011\000\011\000\011\000\011\000\
\011\000\011\000\011\000\012\000\012\000\013\000\013\000\000\000"

let yylen = "\002\000\
\002\000\000\000\003\000\002\000\000\000\003\000\002\000\001\000\
\001\000\008\000\000\000\001\000\001\000\003\000\000\000\002\000\
\002\000\003\000\007\000\005\000\003\000\001\000\001\000\001\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\004\000\000\000\001\000\001\000\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\008\000\009\000\040\000\000\000\000\000\000\000\
\000\000\001\000\000\000\000\000\004\000\007\000\003\000\000\000\
\000\000\012\000\000\000\000\000\014\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\022\000\023\000\
\000\000\000\000\000\000\000\000\006\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\010\000\016\000\017\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\034\000\
\018\000\000\000\000\000\021\000\000\000\000\000\037\000\000\000\
\025\000\026\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\035\000\000\000\020\000\039\000\000\000\
\019\000"

let yydgoto = "\002\000\
\005\000\006\000\007\000\008\000\024\000\009\000\017\000\034\000\
\018\000\035\000\036\000\062\000\063\000"

let yysindex = "\029\000\
\245\254\000\000\000\000\000\000\000\000\035\000\082\255\245\254\
\023\255\000\000\245\254\245\254\000\000\000\000\000\000\028\255\
\059\255\000\000\245\254\072\255\000\000\245\254\079\255\149\255\
\245\254\043\255\149\255\083\255\092\255\043\255\000\000\000\000\
\106\255\091\255\149\255\046\255\000\000\094\255\104\255\043\255\
\043\255\062\255\043\255\043\255\000\000\000\000\000\000\043\255\
\043\255\043\255\043\255\043\255\043\255\043\255\043\255\000\000\
\000\000\110\255\126\255\000\000\191\255\096\255\000\000\207\255\
\000\000\000\000\071\255\071\255\086\255\199\255\215\255\105\255\
\149\255\149\255\043\255\000\000\100\255\000\000\000\000\149\255\
\000\000"

let yyrindex = "\000\000\
\124\000\000\000\000\000\000\000\000\000\000\000\000\000\124\000\
\000\000\000\000\124\000\122\255\000\000\000\000\000\000\123\255\
\000\000\000\000\000\000\000\000\000\000\138\255\000\000\125\255\
\138\255\000\000\125\255\000\000\000\000\000\000\000\000\000\000\
\030\255\000\000\125\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\124\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\128\255\000\000\000\000\018\255\
\000\000\000\000\166\255\179\255\000\255\161\255\031\255\078\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000"

let yygindex = "\000\000\
\000\000\250\255\165\000\000\000\103\000\000\000\000\000\237\255\
\122\000\243\255\230\255\000\000\069\000"

let yytablesize = 239
let yytable = "\038\000\
\030\000\013\000\030\000\042\000\015\000\003\000\004\000\039\000\
\030\000\030\000\030\000\030\000\030\000\058\000\059\000\046\000\
\061\000\064\000\033\000\030\000\033\000\065\000\066\000\067\000\
\068\000\069\000\070\000\071\000\072\000\001\000\024\000\032\000\
\024\000\032\000\010\000\024\000\024\000\033\000\024\000\024\000\
\024\000\024\000\024\000\032\000\026\000\014\000\047\000\019\000\
\061\000\024\000\032\000\048\000\049\000\024\000\050\000\051\000\
\052\000\053\000\054\000\077\000\078\000\020\000\060\000\031\000\
\032\000\033\000\081\000\048\000\049\000\055\000\050\000\051\000\
\052\000\053\000\054\000\022\000\048\000\049\000\027\000\025\000\
\027\000\052\000\011\000\012\000\040\000\055\000\027\000\027\000\
\027\000\027\000\027\000\048\000\049\000\041\000\055\000\045\000\
\056\000\027\000\076\000\048\000\049\000\027\000\050\000\051\000\
\052\000\053\000\054\000\043\000\057\000\055\000\048\000\049\000\
\073\000\044\000\080\000\048\000\049\000\055\000\050\000\051\000\
\052\000\053\000\054\000\002\000\011\000\013\000\036\000\037\000\
\074\000\015\000\038\000\048\000\049\000\055\000\050\000\051\000\
\052\000\053\000\054\000\005\000\021\000\005\000\005\000\079\000\
\000\000\000\000\000\000\000\000\000\000\055\000\026\000\005\000\
\027\000\005\000\000\000\000\000\005\000\000\000\005\000\005\000\
\005\000\031\000\028\000\031\000\029\000\000\000\028\000\030\000\
\028\000\031\000\032\000\033\000\031\000\031\000\028\000\028\000\
\016\000\028\000\028\000\029\000\031\000\029\000\000\000\016\000\
\000\000\028\000\023\000\029\000\029\000\023\000\029\000\029\000\
\000\000\000\000\000\000\000\000\048\000\049\000\029\000\050\000\
\051\000\052\000\053\000\054\000\048\000\049\000\000\000\050\000\
\051\000\052\000\075\000\000\000\048\000\049\000\055\000\050\000\
\051\000\052\000\053\000\054\000\048\000\049\000\055\000\050\000\
\051\000\052\000\053\000\000\000\000\000\000\000\055\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\055\000"

let yycheck = "\026\000\
\001\001\008\000\003\001\030\000\011\000\017\001\018\001\027\000\
\009\001\010\001\011\001\012\001\013\001\040\000\041\000\035\000\
\043\000\044\000\001\001\020\001\003\001\048\000\049\000\050\000\
\051\000\052\000\053\000\054\000\055\000\001\000\001\001\001\001\
\003\001\003\001\000\000\006\001\007\001\020\001\009\001\010\001\
\011\001\012\001\013\001\013\001\002\001\023\001\001\001\020\001\
\075\000\020\001\020\001\006\001\007\001\024\001\009\001\010\001\
\011\001\012\001\013\001\073\000\074\000\003\001\001\001\021\001\
\022\001\023\001\080\000\006\001\007\001\024\001\009\001\010\001\
\011\001\012\001\013\001\004\001\006\001\007\001\001\001\001\001\
\003\001\011\001\001\001\002\001\002\001\024\001\009\001\010\001\
\011\001\012\001\013\001\006\001\007\001\002\001\024\001\005\001\
\003\001\020\001\003\001\006\001\007\001\024\001\009\001\010\001\
\011\001\012\001\013\001\002\001\005\001\024\001\006\001\007\001\
\003\001\008\001\015\001\006\001\007\001\024\001\009\001\010\001\
\011\001\012\001\013\001\000\000\003\001\003\001\003\001\025\000\
\003\001\005\001\003\001\006\001\007\001\024\001\009\001\010\001\
\011\001\012\001\013\001\002\001\019\000\004\001\005\001\075\000\
\255\255\255\255\255\255\255\255\255\255\024\001\002\001\014\001\
\004\001\016\001\255\255\255\255\019\001\255\255\021\001\022\001\
\023\001\001\001\014\001\003\001\016\001\255\255\001\001\019\001\
\003\001\021\001\022\001\023\001\012\001\013\001\009\001\010\001\
\012\000\012\001\013\001\001\001\020\001\003\001\255\255\019\000\
\255\255\020\001\022\000\009\001\010\001\025\000\012\001\013\001\
\255\255\255\255\255\255\255\255\006\001\007\001\020\001\009\001\
\010\001\011\001\012\001\013\001\006\001\007\001\255\255\009\001\
\010\001\011\001\020\001\255\255\006\001\007\001\024\001\009\001\
\010\001\011\001\012\001\013\001\006\001\007\001\024\001\009\001\
\010\001\011\001\012\001\255\255\255\255\255\255\024\001\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\024\001"

let yynames_const = "\
  SEMI\000\
  LPAREN\000\
  RPAREN\000\
  LBRACE\000\
  RBRACE\000\
  PLUS\000\
  MINUS\000\
  ASSIGN\000\
  EQ\000\
  NEQ\000\
  LT\000\
  AND\000\
  OR\000\
  IF\000\
  ELSE\000\
  WHILE\000\
  INT\000\
  BOOL\000\
  RETURN\000\
  COMMA\000\
  EOF\000\
  "

let yynames_block = "\
  LITERAL\000\
  BLIT\000\
  ID\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    Obj.repr(
# 32 "microcparse.mly"
            ( _1)
# 226 "microcparse.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    Obj.repr(
# 35 "microcparse.mly"
                 ( ([], [])               )
# 232 "microcparse.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'vdecl) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'decls) in
    Obj.repr(
# 36 "microcparse.mly"
                    ( ((_1 :: fst _3), snd _3) )
# 240 "microcparse.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'fdecl) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'decls) in
    Obj.repr(
# 37 "microcparse.mly"
               ( (fst _2, (_1 :: snd _2)) )
# 248 "microcparse.ml"
               : 'decls))
; (fun __caml_parser_env ->
    Obj.repr(
# 40 "microcparse.mly"
              ( [] )
# 254 "microcparse.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'vdecl) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl_list) in
    Obj.repr(
# 41 "microcparse.mly"
                           (  _1 :: _3 )
# 262 "microcparse.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 45 "microcparse.mly"
         ( (_1, _2) )
# 270 "microcparse.ml"
               : 'vdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 48 "microcparse.mly"
          ( Int   )
# 276 "microcparse.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 49 "microcparse.mly"
          ( Bool  )
# 282 "microcparse.ml"
               : 'typ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 7 : 'vdecl) in
    let _3 = (Parsing.peek_val __caml_parser_env 5 : 'formals_opt) in
    let _6 = (Parsing.peek_val __caml_parser_env 2 : 'vdecl_list) in
    let _7 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 54 "microcparse.mly"
  (
    {
      rtyp=fst _1;
      fname=snd _1;
      formals=_3;
      locals=_6;
      body=_7
    }
  )
# 300 "microcparse.ml"
               : 'fdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 66 "microcparse.mly"
              ( [] )
# 306 "microcparse.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formals_list) in
    Obj.repr(
# 67 "microcparse.mly"
                 ( _1 )
# 313 "microcparse.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 70 "microcparse.mly"
        ( [_1] )
# 320 "microcparse.ml"
               : 'formals_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'vdecl) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'formals_list) in
    Obj.repr(
# 71 "microcparse.mly"
                             ( _1::_3 )
# 328 "microcparse.ml"
               : 'formals_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 74 "microcparse.mly"
                ( [] )
# 334 "microcparse.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_list) in
    Obj.repr(
# 75 "microcparse.mly"
                    ( _1::_2 )
# 342 "microcparse.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 78 "microcparse.mly"
                                            ( Expr _1      )
# 349 "microcparse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 79 "microcparse.mly"
                                            ( Block _2 )
# 356 "microcparse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 82 "microcparse.mly"
                                            ( If(_3, _5, _7) )
# 365 "microcparse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 83 "microcparse.mly"
                                            ( While (_3, _5)  )
# 373 "microcparse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 85 "microcparse.mly"
                                            ( Return _2      )
# 380 "microcparse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 88 "microcparse.mly"
                     ( Literal(_1)            )
# 387 "microcparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 89 "microcparse.mly"
                     ( BoolLit(_1)            )
# 394 "microcparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 90 "microcparse.mly"
                     ( Id(_1)                 )
# 401 "microcparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 91 "microcparse.mly"
                     ( Binop(_1, Add,   _3)   )
# 409 "microcparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 92 "microcparse.mly"
                     ( Binop(_1, Sub,   _3)   )
# 417 "microcparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 93 "microcparse.mly"
                     ( Binop(_1, Mod, _3)     )
# 425 "microcparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 94 "microcparse.mly"
                     ( Binop(_1, Equal, _3)   )
# 433 "microcparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 95 "microcparse.mly"
                     ( Binop(_1, Neq, _3)     )
# 441 "microcparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 96 "microcparse.mly"
                     ( Binop(_1, Less,  _3)   )
# 449 "microcparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 97 "microcparse.mly"
                     ( Binop(_1, And,   _3)   )
# 457 "microcparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 98 "microcparse.mly"
                     ( Binop(_1, Or,    _3)   )
# 465 "microcparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 99 "microcparse.mly"
                     ( Assign(_1, _3)         )
# 473 "microcparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 100 "microcparse.mly"
                       ( _2                   )
# 480 "microcparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'args_opt) in
    Obj.repr(
# 102 "microcparse.mly"
                              ( Call (_1, _3)  )
# 488 "microcparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 106 "microcparse.mly"
              ( [] )
# 494 "microcparse.ml"
               : 'args_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'args) in
    Obj.repr(
# 107 "microcparse.mly"
         ( _1 )
# 501 "microcparse.ml"
               : 'args_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 110 "microcparse.mly"
        ( [_1] )
# 508 "microcparse.ml"
               : 'args))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'args) in
    Obj.repr(
# 111 "microcparse.mly"
                    ( _1::_3 )
# 516 "microcparse.ml"
               : 'args))
(* Entry program *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let program (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.program)
