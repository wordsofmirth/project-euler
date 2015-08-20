(*
  compile bytecode with  ocamlc nums.cma q001_bigint.ml
  compile natively with  ocamlopt nums.cmxa q001_bigint.ml

  run with ./a.out 100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
*)

open Big_int

let gauss_sum n =
  div_big_int
    (mult_big_int n (add_int_big_int 1 n))
    (big_int_of_int 2)

let gauss_sum_mod n m =
  mult_big_int
    m
    (gauss_sum
       (div_big_int (sub_big_int n unit_big_int) m));;

let n = big_int_of_string Sys.argv.(1) in
let sum3 = gauss_sum_mod n (big_int_of_int 3) in
let sum5 = gauss_sum_mod n (big_int_of_int 5) in
let sum15 = gauss_sum_mod n (big_int_of_int 15) in
let sum = sub_big_int (add_big_int sum3 sum5) sum15 in
print_string ((string_of_big_int sum) ^ "\n")
