/* Ocamlyacc parser for MicroC */

%{
open Ast
%}

%token SEMI LPAREN RPAREN LBRACE RBRACE PLUS MINUS ASSIGN MOD COLON MULT DIV SAMPL
%token EQ NEQ LT AND OR GEQ LEQ GT

%token IF ELSE WHILE INT BOOL FLOAT DIST STR

/* return, COMMA token */
%token <string> STRING
%token RETURN COMMA
%token <int> LITERAL
%token <bool> BLIT
%token <float> FLIT
%token <string> ID

%token EOF

%start program
%type <Ast.program> program

%right ASSIGN
%left OR
%left AND
%left EQ NEQ
%left LT GT LEQ GEQ
%left MOD
%left PLUS MINUS

%%

/* add function declarations*/
program:
  decls EOF { ([],{
                        rtyp=Int;
                        fname="main";
                        formals=[];
                        locals=fst (snd $1);
                        body=fst $1
                      }:: snd (snd $1))}

decls:
   /* nothing */ { ([],([], []))             }
 | vdecl SEMI decls { (fst $3,(($1 :: fst (snd $3)), snd (snd $3))) }
 | fdecl decls { (fst $2, (fst (snd $2), ($1 :: snd (snd $2)))) }
 | stmt_list decls { ($1@fst $2,snd $2)}

vdecl_list:
  /*nothing*/ { [] }
  | vdecl SEMI vdecl_list  {  $1 :: $3 }

/* int x */
vdecl:
  typ ID { ($1, $2) }

typ:
    INT   { Int   }
  | FLOAT { Float }
  | BOOL  { Bool  }
  | DIST   { Dist   }
  | STR { String }

/* fdecl */
fdecl:
  vdecl LPAREN formals_opt RPAREN LBRACE vdecl_list stmt_list RBRACE
  {
    {
      rtyp=fst $1;
      fname=snd $1;
      formals=$3;
      locals=$6;
      body=$7
    }
  }

/* formals_opt */
formals_opt:
  /*nothing*/ { [] }
  | formals_list { $1 }

formals_list:
  vdecl { [$1] }
  | vdecl COMMA formals_list { $1::$3 }

stmt_list:
  /* nothing */ { [] }
  | stmt stmt_list  { $1::$2 }

stmt:
    expr SEMI                               { Expr $1      }
  | LBRACE stmt_list RBRACE                 { Block $2 }
  /* if (condition) { block1} else {block2} */
  /* if (condition) stmt else stmt */
  | IF LPAREN expr RPAREN stmt ELSE stmt    { If($3, $5, $7) }
  | WHILE LPAREN expr RPAREN stmt           { While ($3, $5)  }
  /* return */
  | RETURN expr SEMI                        { Return $2      }

expr:
    LITERAL          { Literal($1)            }
  | FLIT             { FloLit ($1)            }
  | BLIT             { BoolLit($1)            }
  | ID               { Id($1)                 }
  | STRING COLON FLIT { Event($1,$3)           }
  | LBRACE event_list RBRACE { Dist($2)}
  | expr PLUS   expr { Binop($1, Add,   $3)   }
  | expr MINUS  expr { Binop($1, Sub,   $3)   }
  | expr MOD    expr { Binop($1, Mod, $3)     }
  | expr EQ     expr { Binop($1, Equal, $3)   }
  | expr NEQ    expr { Binop($1, Neq, $3)     }
  | expr LT     expr { Binop($1, Less,  $3)   }
  | expr AND    expr { Binop($1, And,   $3)   }
  | expr OR     expr { Binop($1, Or,    $3)   }
  | expr MULT   expr { Binop($1, Mult, $3)    }
  | expr DIV    expr { Binop($1, Div, $3 )}
  | expr GEQ    expr { Binop($1, Geq, $3 )}
  | expr LEQ    expr { Binop($1, Leq, $3 )}
  | expr GT     expr { Binop($1, Greater, $3 )}
  | SAMPL expr {Unop(Sampl,$2)}
  | STRING       { StringLit($1) } 
  | ID ASSIGN expr   { Assign($1, $3)         }
  | LPAREN expr RPAREN { $2                   }
  /* call */
  | ID LPAREN args_opt RPAREN { Call ($1, $3)  }

event_list:
  {[]}
  | STRING COLON FLIT {[Event($1,$3)]}
  | expr COMMA event_list {$1 :: $3}     


/* args_opt*/
args_opt:
  /*nothing*/ { [] }
  | args { $1 }

args:
  expr  { [$1] }
  | expr COMMA args { $1::$3 }
