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
\011\000\011\000\012\000\012\000\013\000\013\000\000\000"

let yylen = "\002\000\
\002\000\000\000\003\000\002\000\000\000\003\000\002\000\001\000\
\001\000\008\000\000\000\001\000\001\000\003\000\000\000\002\000\
\002\000\003\000\007\000\005\000\003\000\001\000\001\000\001\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\004\000\000\000\001\000\001\000\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\008\000\009\000\039\000\000\000\000\000\000\000\
\000\000\001\000\000\000\000\000\004\000\007\000\003\000\000\000\
\000\000\012\000\000\000\000\000\014\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\022\000\023\000\
\000\000\000\000\000\000\000\000\006\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\010\000\016\000\017\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\033\000\018\000\
\000\000\000\000\021\000\000\000\000\000\036\000\000\000\025\000\
\026\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\034\000\000\000\020\000\038\000\000\000\019\000"

let yydgoto = "\002\000\
\005\000\006\000\007\000\008\000\024\000\009\000\017\000\034\000\
\018\000\035\000\036\000\061\000\062\000"

let yysindex = "\007\000\
\084\255\000\000\000\000\000\000\000\000\030\000\043\255\084\255\
\011\255\000\000\084\255\084\255\000\000\000\000\000\000\035\255\
\081\255\000\000\084\255\100\255\000\000\084\255\089\255\038\255\
\084\255\014\255\038\255\106\255\110\255\014\255\000\000\000\000\
\031\255\111\255\038\255\108\255\000\000\132\255\135\255\014\255\
\014\255\121\255\014\255\014\255\000\000\000\000\000\000\014\255\
\014\255\014\255\014\255\014\255\014\255\014\255\000\000\000\000\
\143\255\154\255\000\000\085\255\120\255\000\000\162\255\000\000\
\000\000\118\255\118\255\130\255\177\255\170\255\038\255\038\255\
\014\255\000\000\133\255\000\000\000\000\038\255\000\000"

let yyrindex = "\000\000\
\126\000\000\000\000\000\000\000\000\000\000\000\000\000\126\000\
\000\000\000\000\126\000\144\255\000\000\000\000\000\000\148\255\
\000\000\000\000\000\000\000\000\000\000\027\255\000\000\153\255\
\027\255\000\000\153\255\000\000\000\000\000\000\000\000\000\000\
\000\255\000\000\153\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\156\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\159\255\000\000\000\000\018\255\000\000\
\000\000\068\255\073\255\055\255\050\255\086\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\250\255\088\000\000\000\145\000\000\000\000\000\076\000\
\159\000\001\000\230\255\000\000\112\000"

let yytablesize = 188
let yytable = "\038\000\
\024\000\013\000\024\000\042\000\015\000\024\000\024\000\001\000\
\024\000\024\000\024\000\024\000\024\000\057\000\058\000\026\000\
\060\000\063\000\032\000\024\000\032\000\064\000\065\000\066\000\
\067\000\068\000\069\000\070\000\005\000\010\000\005\000\005\000\
\043\000\014\000\031\000\032\000\033\000\032\000\044\000\026\000\
\005\000\027\000\005\000\011\000\012\000\005\000\060\000\005\000\
\005\000\005\000\030\000\028\000\030\000\029\000\019\000\029\000\
\030\000\029\000\031\000\032\000\033\000\030\000\030\000\029\000\
\029\000\029\000\029\000\029\000\027\000\030\000\027\000\075\000\
\076\000\028\000\029\000\028\000\027\000\027\000\079\000\027\000\
\027\000\028\000\028\000\020\000\028\000\028\000\031\000\027\000\
\031\000\025\000\048\000\049\000\028\000\050\000\051\000\052\000\
\053\000\054\000\031\000\016\000\003\000\004\000\039\000\022\000\
\073\000\031\000\016\000\040\000\047\000\023\000\046\000\041\000\
\023\000\048\000\049\000\045\000\050\000\051\000\052\000\053\000\
\054\000\059\000\074\000\048\000\049\000\002\000\048\000\049\000\
\052\000\050\000\051\000\052\000\053\000\054\000\055\000\048\000\
\049\000\048\000\049\000\056\000\050\000\051\000\052\000\053\000\
\054\000\071\000\011\000\078\000\048\000\049\000\013\000\050\000\
\051\000\052\000\053\000\054\000\072\000\015\000\035\000\048\000\
\049\000\037\000\050\000\051\000\052\000\053\000\054\000\048\000\
\049\000\037\000\050\000\051\000\052\000\053\000\054\000\048\000\
\049\000\021\000\050\000\051\000\052\000\053\000\048\000\049\000\
\077\000\050\000\051\000\052\000"

let yycheck = "\026\000\
\001\001\008\000\003\001\030\000\011\000\006\001\007\001\001\000\
\009\001\010\001\011\001\012\001\013\001\040\000\041\000\002\001\
\043\000\044\000\001\001\020\001\003\001\048\000\049\000\050\000\
\051\000\052\000\053\000\054\000\002\001\000\000\004\001\005\001\
\002\001\023\001\021\001\022\001\023\001\020\001\008\001\002\001\
\014\001\004\001\016\001\001\001\002\001\019\001\073\000\021\001\
\022\001\023\001\001\001\014\001\003\001\016\001\020\001\001\001\
\019\001\003\001\021\001\022\001\023\001\012\001\013\001\009\001\
\010\001\011\001\012\001\013\001\001\001\020\001\003\001\071\000\
\072\000\001\001\020\001\003\001\009\001\010\001\078\000\012\001\
\013\001\009\001\010\001\003\001\012\001\013\001\001\001\020\001\
\003\001\001\001\006\001\007\001\020\001\009\001\010\001\011\001\
\012\001\013\001\013\001\012\000\017\001\018\001\027\000\004\001\
\020\001\020\001\019\000\002\001\001\001\022\000\035\000\002\001\
\025\000\006\001\007\001\005\001\009\001\010\001\011\001\012\001\
\013\001\001\001\003\001\006\001\007\001\000\000\006\001\007\001\
\011\001\009\001\010\001\011\001\012\001\013\001\003\001\006\001\
\007\001\006\001\007\001\005\001\009\001\010\001\011\001\012\001\
\013\001\003\001\003\001\015\001\006\001\007\001\003\001\009\001\
\010\001\011\001\012\001\013\001\003\001\005\001\003\001\006\001\
\007\001\003\001\009\001\010\001\011\001\012\001\013\001\006\001\
\007\001\025\000\009\001\010\001\011\001\012\001\013\001\006\001\
\007\001\019\000\009\001\010\001\011\001\012\001\006\001\007\001\
\073\000\009\001\010\001\011\001"

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
# 31 "microcparse.mly"
            ( _1)
# 211 "microcparse.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    Obj.repr(
# 34 "microcparse.mly"
                 ( ([], [])               )
# 217 "microcparse.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'vdecl) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'decls) in
    Obj.repr(
# 35 "microcparse.mly"
                    ( ((_1 :: fst _3), snd _3) )
# 225 "microcparse.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'fdecl) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'decls) in
    Obj.repr(
# 36 "microcparse.mly"
               ( (fst _2, (_1 :: snd _2)) )
# 233 "microcparse.ml"
               : 'decls))
; (fun __caml_parser_env ->
    Obj.repr(
# 39 "microcparse.mly"
              ( [] )
# 239 "microcparse.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'vdecl) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl_list) in
    Obj.repr(
# 40 "microcparse.mly"
                           (  _1 :: _3 )
# 247 "microcparse.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 44 "microcparse.mly"
         ( (_1, _2) )
# 255 "microcparse.ml"
               : 'vdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 47 "microcparse.mly"
          ( Int   )
# 261 "microcparse.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 48 "microcparse.mly"
          ( Bool  )
# 267 "microcparse.ml"
               : 'typ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 7 : 'vdecl) in
    let _3 = (Parsing.peek_val __caml_parser_env 5 : 'formals_opt) in
    let _6 = (Parsing.peek_val __caml_parser_env 2 : 'vdecl_list) in
    let _7 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 53 "microcparse.mly"
  (
    {
      rtyp=fst _1;
      fname=snd _1;
      formals=_3;
      locals=_6;
      body=_7
    }
  )
# 285 "microcparse.ml"
               : 'fdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 65 "microcparse.mly"
              ( [] )
# 291 "microcparse.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formals_list) in
    Obj.repr(
# 66 "microcparse.mly"
                 ( _1 )
# 298 "microcparse.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 69 "microcparse.mly"
        ( [_1] )
# 305 "microcparse.ml"
               : 'formals_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'vdecl) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'formals_list) in
    Obj.repr(
# 70 "microcparse.mly"
                             ( _1::_3 )
# 313 "microcparse.ml"
               : 'formals_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 73 "microcparse.mly"
                ( [] )
# 319 "microcparse.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_list) in
    Obj.repr(
# 74 "microcparse.mly"
                    ( _1::_2 )
# 327 "microcparse.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 77 "microcparse.mly"
                                            ( Expr _1      )
# 334 "microcparse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 78 "microcparse.mly"
                                            ( Block _2 )
# 341 "microcparse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 81 "microcparse.mly"
                                            ( If(_3, _5, _7) )
# 350 "microcparse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 82 "microcparse.mly"
                                            ( While (_3, _5)  )
# 358 "microcparse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 84 "microcparse.mly"
                                            ( Return _2      )
# 365 "microcparse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 87 "microcparse.mly"
                     ( Literal(_1)            )
# 372 "microcparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 88 "microcparse.mly"
                     ( BoolLit(_1)            )
# 379 "microcparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 89 "microcparse.mly"
                     ( Id(_1)                 )
# 386 "microcparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 90 "microcparse.mly"
                     ( Binop(_1, Add,   _3)   )
# 394 "microcparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 91 "microcparse.mly"
                     ( Binop(_1, Sub,   _3)   )
# 402 "microcparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 92 "microcparse.mly"
                     ( Binop(_1, Equal, _3)   )
# 410 "microcparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 93 "microcparse.mly"
                     ( Binop(_1, Neq, _3)     )
# 418 "microcparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 94 "microcparse.mly"
                     ( Binop(_1, Less,  _3)   )
# 426 "microcparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 95 "microcparse.mly"
                     ( Binop(_1, And,   _3)   )
# 434 "microcparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 96 "microcparse.mly"
                     ( Binop(_1, Or,    _3)   )
# 442 "microcparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 97 "microcparse.mly"
                     ( Assign(_1, _3)         )
# 450 "microcparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 98 "microcparse.mly"
                       ( _2                   )
# 457 "microcparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'args_opt) in
    Obj.repr(
# 100 "microcparse.mly"
                              ( Call (_1, _3)  )
# 465 "microcparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 104 "microcparse.mly"
              ( [] )
# 471 "microcparse.ml"
               : 'args_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'args) in
    Obj.repr(
# 105 "microcparse.mly"
         ( _1 )
# 478 "microcparse.ml"
               : 'args_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 108 "microcparse.mly"
        ( [_1] )
# 485 "microcparse.ml"
               : 'args))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'args) in
    Obj.repr(
# 109 "microcparse.mly"
                    ( _1::_3 )
# 493 "microcparse.ml"
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
