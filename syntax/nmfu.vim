if exists("b:current_syntax")
	finish
endif

syn keyword nmfuKeyword case loop optional try catch wait finish break
syn keyword nmfuDefWord out parser macro
syn keyword nmfuOutType str int enum bool
syn keyword nmfuConstant true false nomatch outofspace else

hi def link nmfuKeyword  Statement
hi def link nmfuDefWord  Define
hi def link nmfuOutType  Type
hi def link nmfuConstant Special

syn match   nmfuMathOperator "\V*" contained
syn match   nmfuMathOperator "\V+" contained
syn match   nmfuMathOperator "\V-" contained
syn match   nmfuMathOperator "\V/" contained
syn match   nmfuMathOperator "\V%" contained

syn match   nmfuOperator "\V+="
syn match   nmfuOperator "\V="

hi def link nmfuMathOperator Operator
hi def link nmfuOperator Operator

syn match nmfuMacroCall "\v\w+(\(\))@="
syn match nmfuMacroDef  "\v(macro\s*)@<=\w+"

hi def link nmfuMacroCall Function
hi def link nmfuMacroDef Function

syn match   nmfuSpecialMath "\v\$\w+" contained
hi def link nmfuSpecialMath Special

syn match   nmfuComment "\v//.*$"

hi def link nmfuComment  Comment

syn match   nmfuNumber  "\v\s[0-9]+"
syn region  nmfuStr	  start=/\v"/ skip=/v\\./ end=/\v"/

syn region  nmfuMathExpr start="\[" end="\]" contains=nmfuNumber,nmfuMathOperator,nmfuSpecialMath
syn region  nmfuRegex start="\v/[^/]@=" end="/" skip="\\."

hi def link nmfuRegex    Identifier
hi def link nmfuMathExpr Statement

hi def link nmfuNumber   Constant
hi def link nmfuStr 	 String

let b:current_syntax = "nmfu"
