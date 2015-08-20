(*
  compile bytecode with  ocamlc q001.ml
  compile natively with  ocamlopt q001.ml

  run with ./a.out 1000
*)

let gauss_sum n = n*(n+1)/2

let gauss_sum_mod n m = (gauss_sum ((n - 1) / m)) * m;;

let n = int_of_string Sys.argv.(1) in
let sum3 = gauss_sum_mod n 3 in
let sum5 = gauss_sum_mod n 5 in
let sum15 = gauss_sum_mod n 15 in
let sum = (sum3 + sum5) - sum15 in
print_string ((string_of_int sum) ^ "\n")
