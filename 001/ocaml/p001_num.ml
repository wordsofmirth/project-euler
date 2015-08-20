(*
  compile bytecode with  ocamlc nums.cma q001_num.ml
  compile natively with  ocamlopt nums.cmxa q001_num.ml

  run with ./a.out 1000000000000000000000000000000000000000000000
*)

open Num

let gauss_sum n = (n */ (n +/ (num_of_int 1))) // (num_of_int 2)

let gauss_sum_mod n m = (gauss_sum (quo_num (n -/ (num_of_int 1)) m)) */ m;;

let n = num_of_string Sys.argv.(1) in
let sum3 = gauss_sum_mod n (num_of_int 3) in
let sum5 = gauss_sum_mod n (num_of_int 5) in
let sum15 = gauss_sum_mod n (num_of_int 15) in
let sum = (sum3 +/ sum5) -/ sum15 in
print_string ((string_of_num sum) ^ "\n")
