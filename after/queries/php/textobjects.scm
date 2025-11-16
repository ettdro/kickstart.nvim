;; extends

(assignment_expression
  left: (variable_name) @assignment.lhs)

(assignment_expression
  left: (_) @_lhs
  right: (_) @_rhs
  (#make-range! "assignment.rhs" @_rhs @_rhs)
  (#make-range! "assignment.lhs" @_lhs @_lhs)
  (#make-range! "assignment.outer" @_lhs @_rhs))

(class_declaration
  name: (name) @class.name)
