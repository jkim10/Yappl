(* IR generation: translate takes a semantically checked AST and
   produces LLVM IR

   LLVM tutorial: Make sure to read the OCaml version of the tutorial

   http://llvm.org/docs/tutorial/index.html

   Detailed documentation on the OCaml LLVM library:

   http://llvm.moe/
   http://llvm.moe/ocaml/

*)

module L = Llvm
module A = Ast
open Sast

module StringMap = Map.Make(String)

(* translate : Sast.program -> Llvm.module *)
let translate (globals, functions) =
  let context    = L.global_context () in

  (* Create the LLVM compilation module into which
     we will generate code *)
  let the_module = L.create_module context "MicroC" in

  (* Get types from the context *)
  let i32_t      = L.i32_type    context
  and f_t        = L.double_type context
  and i8_t       = L.i8_type     context
  and i1_t       = L.i1_type     context
  and ptr  = L.pointer_type (L.i8_type (context))
  in
  let dist_array_t = L.array_type (ptr) 100 in
  let struct_dist_t : L.lltype = 
    L.named_struct_type context "Dist" in
  let struct_event_t : L.lltype = 
  L.named_struct_type context "Event" in
  (* Return the LLVM type for a MicroC type *)
  let ltype_of_typ = function
      A.Int   -> i32_t
    | A.Float -> f_t
    | A.Bool  -> i1_t
    | A.Dist   -> dist_array_t
    | A.String -> ptr
    | A.Event -> struct_event_t
  in
  
  let vptr_t = L.pointer_type (L.i8_type context) in
  let _ = L.struct_set_body struct_event_t [| L.pointer_type (ptr);f_t|] false in
  let _ = L.struct_set_body struct_dist_t [| i32_t;vptr_t;vptr_t |] false in
  (* Create a map of global variables after creating each *)
  let global_vars : L.llvalue StringMap.t =
    let global_var m (t, n) =
      let init = L.const_int (ltype_of_typ t) 0
      in StringMap.add n (L.define_global n init the_module) m in
    List.fold_left global_var StringMap.empty globals in

  let printf_t : L.lltype =
    L.var_arg_function_type i32_t [| L.pointer_type i8_t |] in
  let printf_func : L.llvalue =
    L.declare_function "printf" printf_t the_module in

  let get_ptr n = ptr in

  (* Declare Foo functions *)
  let sample_t : L.lltype =
    L.function_type (ptr)
    (Array.of_list (List.init 100 get_ptr))
  in
  let sample : L.llvalue =
    L.declare_function "sample" sample_t the_module in

  (* Define each function (arguments and return type) so we can
     call it even before we've created its body *)
  let function_decls : (L.llvalue * sfunc_def) StringMap.t =
    let function_decl m fdecl =
      let name = fdecl.sfname
      and formal_types =
        Array.of_list (List.map (fun (t,_) -> ltype_of_typ t) fdecl.sformals)
      in let ftype = L.function_type (ltype_of_typ fdecl.srtyp) formal_types in
      StringMap.add name (L.define_function name ftype the_module, fdecl) m in
    List.fold_left function_decl StringMap.empty functions in
  (* Fill in the body of the given function *)
  let build_function_body fdecl =
    let (the_function, _) = StringMap.find fdecl.sfname function_decls in
    let builder = L.builder_at_end context (L.entry_block the_function) in

    let int_format_str = L.build_global_stringptr "%d\n" "fmt" builder in
    let float_format_str = L.build_global_stringptr "%f\n" "fmt" builder in

    (* Construct the function's "locals": formal arguments and locally
       declared variables.  Allocate each on the stack, initialize their
       value, if appropriate, and remember their values in the "locals" map *)
    let local_vars =
      let add_formal m (t, n) p =
        L.set_value_name n p;
        let local = L.build_alloca (ltype_of_typ t) n builder in
        ignore (L.build_store p local builder);
        StringMap.add n local m

      (* Allocate space for any locally declared variables and add the
       * resulting registers to our map *)
      and add_local m (t, n) =
        let local_var = L.build_alloca (ltype_of_typ t) n builder in
        let local_var2 = (match t with
        | A.Dist -> L.build_array_alloca dist_array_t (L.const_int i32_t 100) "array_init" builder
        | _ -> local_var)
        in StringMap.add n local_var2 m
      in

      let formals = List.fold_left2 add_formal StringMap.empty fdecl.sformals
          (Array.to_list (L.params the_function)) in
      List.fold_left add_local formals fdecl.slocals
    in

    (* Return the value for a variable or formal argument.
       Check local names first, then global names *)
    let lookup n = try StringMap.find n local_vars
      with Not_found -> StringMap.find n global_vars
    in

    (* Construct code for an expression; return its value *)
    (* let get_key_value d = 
      let (_,e) = d in
        match e with
           SEvent(s,p) ->
            let x = ref [] in
            for i = 1 to (int_of_float (Float.mul p 100.0)) do
                let a = (L.build_global_stringptr s "ee" builder) in
                let allocate = L.build_alloca ptr "event_string" builder in
                let store = L.build_store a allocate builder in
                x := !x @ [allocate]
            done;
            !x
          | _ -> raise (Failure "not implemented")
    in *)
    let distributions:(string, L.llvalue) Hashtbl.t = Hashtbl.create 50
    in
    let rec build_expr builder ((styp, e) : sexpr) = match e with
        SLiteral i  -> L.const_int i32_t i
      | SFloLit f -> L.const_float f_t f
      | SBoolLit b  -> L.const_int i1_t (if b then 1 else 0)
      | SId s       ->
        (match styp with
         A.Dist -> Hashtbl.find distributions s
        |_ -> L.build_load (lookup s) s builder)
      | SAssign (s, e) -> 
        let e' = build_expr builder e in
          (match styp with
            A.Dist -> Hashtbl.add distributions s e';ignore(L.build_store e' (lookup s) builder); e'
            | _ -> ignore(L.build_store e' (lookup s) builder); e'
          );
      | SEvent (s, p) -> 
          let key_ = (
                let key_ = L.build_malloc ptr "key" builder in
                ignore (L.build_store (L.build_global_stringptr s "tmp" builder) key_ builder); key_
              ) in
          let value_ = (
                let data = L.build_malloc f_t "value" builder in
                ignore (L.build_store (L.const_float f_t p) data builder); data
              ) in
          let key = L.build_bitcast key_ vptr_t "key" builder in
          let value = L.build_bitcast value_ vptr_t "val" builder in
          let event = L.const_named_struct struct_event_t [|key;value|] in
          event
      | SDist (l) ->
      let get_key_value d = 
          let (_,e) = d in
            match e with
               SEvent(s,p) ->
                let x = ref [] in
                for i = 1 to (int_of_float (Float.mul p 100.0)) do
                    let a = L.build_global_stringptr s "tmp" builder in
                    (* let allocate = L.build_malloc (L.type_of a) "event_string" builder in
                    let store = L.build_store a allocate builder in *)
                    x := !x @ [a]
                done;
                !x
              | _ -> raise (Failure "not implemented")
        in
        let e = List.map get_key_value (l) in
        let e' = List.flatten e in
        let data = L.const_array ptr (Array.of_list e') in
(*         let bitcast = L.build_bitcast data (L.pointer_type dist_array_t) "ARRAY2PTR" builder in
 *)     data
      | SStringLit str -> L.build_global_stringptr str "tmp" builder
      | SBinop (e1, op, e2) ->
        let e1' = build_expr builder e1
        and e2' = build_expr builder e2 in
        let ets = L.string_of_lltype (L.type_of e1') in
        (match op with
           A.Add     -> 
            (match ets with
                    "double" -> L.build_fadd
                    |"i32" -> L.build_add
              | _ -> raise(Failure("Ints and floats can be added")) )
         | A.Sub     ->
            (match ets with
               "double" -> L.build_fsub
                    |"i32" -> L.build_sub
              | _ -> raise(Failure("Ints and floats can be subtracted")) )
         | A.Mod     -> L.build_urem
         | A.And     -> L.build_and
         | A.Or      -> L.build_or
         | A.Equal   -> 
            (match ets with
               "double" -> L.build_fcmp L.Fcmp.Oeq
                    |"i32" -> L.build_icmp L.Icmp.Eq 
              | _ -> raise(Failure("Ints and floats can be compared")))
         | A.Neq     ->
            (match ets with
               "double" -> L.build_fcmp L.Fcmp.One
                    |"i32" -> L.build_icmp L.Icmp.Ne 
              | _ -> raise(Failure("Ints and floats can be compared")))
         | A.Less    ->
            (match ets with
               "double" -> L.build_fcmp L.Fcmp.Ult
                    |"i32" -> L.build_icmp L.Icmp.Slt  
              | _ -> raise(Failure("Ints and floats can be compared")))
         | A.Leq     ->
            (match ets with
               "double" -> L.build_fcmp L.Fcmp.Ule
                    |"i32" -> L.build_icmp L.Icmp.Sle  
              | _ -> raise(Failure("OIts and floats can be compared")))
         | A.Greater ->
            (match ets with
               "double" -> L.build_fcmp L.Fcmp.Ugt
                    |"i32" -> L.build_icmp L.Icmp.Sgt  
              | _ -> raise(Failure("Ints and floats can be compared")))
         | A.Geq     ->
            (match ets with
               "double" -> L.build_fcmp L.Fcmp.Uge
                    |"i32" -> L.build_icmp L.Icmp.Sge  
              | _ -> raise(Failure("Ints and floats can be compared")))
         | A.Sampl -> raise(Failure("Not a BINOP"))
         | A.Mult     ->
            (match ets with
               "double" -> L.build_fmul
                    |"i32" -> L.build_mul   
              | _ -> raise(Failure("Ints and floats can be multiplied")))
         |A.Div     ->
            (match ets with
               "double" -> L.build_fdiv 
                    |"i32" -> L.build_sdiv
              | _ -> raise(Failure("Ints and floats can be divided")))
            ) e1' e2' "tmp" builder
      | SCall ("print_s",[e])->
        L.build_call printf_func [| (build_expr builder e) |] "printf" builder
      | SUnop(op,e) ->
        (match op with
          A.Sampl ->
            let e' = build_expr builder e in
            let get_event n =
                  L.const_extractvalue e' [|n|]
                in
            let event_list = List.init 100 get_event in
            L.build_call sample (Array.of_list event_list) "sample" builder
          |_-> raise (Failure "not implemented")
        )
      | SCall ("sample",[e])->
        let e' = build_expr builder e in
        let get_event n =
              L.const_extractvalue e' [|n|]
            in
        let event_list = List.init 100 get_event in
        L.build_call sample (Array.of_list event_list) "sample" builder
      | SCall ("print", [e]) ->
        L.build_call printf_func [| int_format_str ; (build_expr builder e) |]
          "printf" builder
      | SCall ("print_f", [e]) ->
        L.build_call printf_func [| float_format_str ; (build_expr builder e) |]
          "printf" builder
      | SCall (f, args) ->
        let (fdef, fdecl) = StringMap.find f function_decls in
        let llargs = List.rev (List.map (build_expr builder) (List.rev args)) in
        let result = f ^ "_result" in
        L.build_call fdef (Array.of_list llargs) result builder
    in

    (* LLVM insists each basic block end with exactly one "terminator"
       instruction that transfers control.  This function runs "instr builder"
       if the current block does not already have a terminator.  Used,
       e.g., to handle the "fall off the end of the function" case. *)
    let add_terminal builder instr =
      match L.block_terminator (L.insertion_block builder) with
        Some _ -> ()
      | None -> ignore (instr builder) in

    (* Build the code for the given statement; return the builder for
       the statement's successor (i.e., the next instruction will be built
       after the one generated by this call) *)
    let rec build_stmt builder = function
        SBlock sl -> List.fold_left build_stmt builder sl
      | SExpr e -> ignore(build_expr builder e); builder
      | SReturn e -> ignore(L.build_ret (build_expr builder e) builder); builder
      | SIf (predicate, then_stmt, else_stmt) ->
        let bool_val = build_expr builder predicate in

        let then_bb = L.append_block context "then" the_function in
        ignore (build_stmt (L.builder_at_end context then_bb) then_stmt);
        let else_bb = L.append_block context "else" the_function in
        ignore (build_stmt (L.builder_at_end context else_bb) else_stmt);

        let end_bb = L.append_block context "if_end" the_function in
        let build_br_end = L.build_br end_bb in (* partial function *)
        add_terminal (L.builder_at_end context then_bb) build_br_end;
        add_terminal (L.builder_at_end context else_bb) build_br_end;

        ignore(L.build_cond_br bool_val then_bb else_bb builder);
        L.builder_at_end context end_bb

      | SWhile (predicate, body) ->
        let while_bb = L.append_block context "while" the_function in
        let build_br_while = L.build_br while_bb in (* partial function *)
        ignore (build_br_while builder);
        let while_builder = L.builder_at_end context while_bb in
        let bool_val = build_expr while_builder predicate in

        let body_bb = L.append_block context "while_body" the_function in
        add_terminal (build_stmt (L.builder_at_end context body_bb) body) build_br_while;

        let end_bb = L.append_block context "while_end" the_function in

        ignore(L.build_cond_br bool_val body_bb end_bb while_builder);
        L.builder_at_end context end_bb

    in
    (* Build the code for each statement in the function *)
    let func_builder = build_stmt builder (SBlock fdecl.sbody) in

    (* Add a return if the last block falls off the end *)
    add_terminal func_builder (L.build_ret (L.const_int i32_t 0))

  in

  List.iter build_function_body functions;
  the_module
