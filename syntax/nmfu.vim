if exists("b:current_syntax")
	finish
endif

syn keyword nmfuKeyword case loop optional try catch wait finish break foreach do match expr if elif else yield prio
syn keyword nmfuDefWord out parser macro hook finishcode yieldcode
syn keyword nmfuConstant true false nomatch outofspace end

syn region  nmfuOutDecl start="\v(^\s*out)@<=" end="\v[;=]" contains=nmfuOutType,nmfuOutStrLen,nmfuOutIntAttr
syn region  nmfuOutStrLen start="\v(str)@<=\s*\[" end="]" contains=nmfuNumber contained
syn region  nmfuOutIntAttr start="\v(int)@<=\s*\{" end="}" contains=nmfuNumber,nmfuOutIntAttrName contained

syn keyword nmfuOutType int str raw bool enum contained
syn keyword nmfuOutIntAttrName size unsigned signed contained
syn keyword nmfuOutTypeModifier unterminated contained

hi def link nmfuOutType         Type
hi def link nmfuOutIntAttrName  StorageClass
hi def link nmfuOutTypeModifier StorageClass

hi def link nmfuKeyword  Statement
hi def link nmfuDefWord  Define
hi def link nmfuConstant Special

syn match   nmfuCaseModifier "\vgreedy\s*(case)@="

hi def link nmfuCaseModifier Statement

syn match   nmfuMathOperator "\V*" contained
syn match   nmfuMathOperator "\V+" contained
syn match   nmfuMathOperator "\V-" contained
syn match   nmfuMathOperator "\V/" contained
syn match   nmfuMathOperator "\V%" contained
syn match   nmfuMathOperator "\V*" contained
syn match   nmfuMathOperator "[!=]=" contained
syn match   nmfuMathOperator "[<>]=\?" contained
syn match   nmfuMathOperator "\V&" contained
syn match   nmfuMathOperator "\V|" contained
syn match   nmfuMathOperator "\V^" contained

syn match   nmfuOperator "\V+="
syn match   nmfuOperator "\V="

hi def link nmfuMathOperator Operator
hi def link nmfuOperator Operator

syn match nmfuMacroCall "\v\w+(\s*\()@="
syn match nmfuMacroDef  "\v(macro\s*)@<=\w+(\s*\()@="

hi def link nmfuMacroCall Function
hi def link nmfuMacroDef Function

syn match   nmfuSpecialMath "\v\$\w+" contained
hi def link nmfuSpecialMath Special

syn match   nmfuComment "\v//.*$"

hi def link nmfuComment  Comment

syn match   nmfuNumber  "\v<[0-9]+"
syn match   nmfuNumber  "\v<0x[0-9a-fA-F]+"
syn match   nmfuNumber  "\v<0b[0-1]+"
syn region  nmfuStr	  start=/\v"/ skip=/v\\./ end=/\v"/

syn region  nmfuMathExpr start="\[" end="\]" contains=nmfuNumber,nmfuMathOperator,nmfuSpecialMath
syn region  nmfuCondition start="\v(if|elif)@<=" end="\v\{@=" contains=nmfuNumber,nmfuMathOperator,nmfuSpecialMath

syn match   nmfuRegexEscaped  "\v\\[\[.\](){}\\+?*/ ]" contained contains=nmfuRegexEscaper
syn match   nmfuRegexClass    "\v\\[wWdDsSntr]"  contained contains=nmfuRegexEscaper
syn match   nmfuRegexEscaper  "\v\\" contained
syn match   nmfuRegexByte     "\v[0-9a-fA-F]{2}"  contained
syn match   nmfuRegexAny      "\V." contained
syn match   nmfuRegexEscapedCharClassRange "\v\\\-" contained contains=nmfuRegexEscaper
syn match   nmfuRegexCharClassRange "\V-" contained
syn region  nmfuRegexCharClass matchgroup=nmfuRegexCharClassEnd start="\v\[\^?" end="]" skip="\\." contained contains=nmfuRegexEscaped,nmfuRegexClass,nmfuRegexCharClassRange,nmfuRegexEscapedCharClassRange
syn region  nmfuRegexByteCharClass matchgroup=nmfuRegexCharClassEnd start="\v\[\^?" end="]" skip="\\." contained contains=nmfuRegexCharClassRange,nmfuRegexByte
syn match   nmfuRegexRepeat  "\v\{\d+(,\d*)?\}" contained contains=nmfuNumber
syn match   nmfuRegexGroup    "\V(" contained
syn match   nmfuRegexGroup    "\V)" contained
syn match   nmfuRegexOperator "\V+" contained
syn match   nmfuRegexOperator "\V?" contained
syn match   nmfuRegexOperator "\V*" contained
syn match   nmfuRegexOr       "\V|" contained

syn region  nmfuByteRegex matchgroup=nmfuRegexEnd start="\vb/[^/]@=" end="/" skip="\\." contains=nmfuRegexByte,nmfuRegexGroup,nmfuRegexRepeat,nmfuRegexByteCharClass,nmfuRegexAny,nmfuRegexOr,nmfuRegexOperator
syn region  nmfuRegex     matchgroup=nmfuRegexEnd start="\v/[^/]@=" end="/" skip="\\."  contains=nmfuRegexEscaped,nmfuRegexClass,nmfuRegexAny,nmfuRegexCharClass,nmfuRegexGroup,nmfuRegexOperator,nmfuRegexOr,nmfuRegexRepeat

hi def link nmfuRegexEnd  Identifier

hi def link nmfuRegexClass Type
hi def link nmfuRegexByte  Constant
hi def link nmfuRegexAny   Type
hi def link nmfuRegexCharClassEnd Statement
hi def link nmfuRegexCharClassRange Type
hi def link nmfuRegexGroup Function
hi def link nmfuRegexOperator Special
hi def link nmfuRegxOr Operator
hi def link nmfuRegexEscaper Comment
hi def link nmfuRegexRepeat Type

hi def link nmfuMathExpr  Statement

hi def link nmfuNumber   Constant
hi def link nmfuStr 	 String

let b:current_syntax = "nmfu"
