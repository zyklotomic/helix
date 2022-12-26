[
  (list)
  (tuple)
  (dictionary)
  (set)

  (if_statement)
  (for_statement)
  (while_statement)
  (with_statement)
  (try_statement)
  (match_statement)
  (case_clause)
  (import_from_statement)

  (parenthesized_expression)
  (generator_expression)
  (list_comprehension)
  (set_comprehension)
  (dictionary_comprehension)

  (tuple_pattern)
  (list_pattern)
  (argument_list)
  (parameters)
  (binary_operator)

  (function_definition)
  (class_definition)
] @indent

[
  (if_statement)
  (for_statement)
  (while_statement)
  (with_statement)
  (try_statement)
  (match_statement)
  (case_clause)

  (function_definition)
  (class_definition)
] @extend

[
  (return_statement)
  (break_statement)
  (continue_statement)
  (raise_statement)
  (pass_statement)
] @extend.prevent-once

[
  ")"
  "]"
  "}"
] @outdent
(elif_clause
  "elif" @outdent)
(else_clause
  "else" @outdent)

; A hack to indent the `try:` clause of a try statement since
; tree-sitter does not recognize a try statement until one of
; `except.*:` or `finally:` is detected.
; Unfortunately, the following capture does not handle nested `try:`s.
(
  (ERROR) @try_clause
  (#match? @try_clause "try:")
) @indent @extend
