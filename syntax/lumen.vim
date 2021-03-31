" Vim syntax file
" Language:    Lumen <https://github.com/sctb/lumen>
" Maintainer:  ajv
" Last Change: August 6, 2009
" URL:         
"
" Options:
"   g:lumen_always_atstrings - if nonzero, highlight sexps after
"                            @-symbols in strings
"   g:lumen_rainbow          - if nonzero, use rainbow colors to
"                            highlight nested parentheses
"                            differently from each other (up to
"                            10 levels deep)

"-------------------------------------------------------------------------------
" Setup:

" For vim-version 5.x: Clear all syntax items
" For vim-version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

setlocal iskeyword=35,36,37,42,43,45,47,48,49,50,51,52,53,54,55,56,57,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,92,94,95,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122

syn case ignore

syn cluster lumenListCluster contains=TOP,lumenParenError,lumenParen0,lumenParen1,lumenParen2,lumenParen3,lumenParen4,lumenParen5,lumenParen6,lumenParen7,lumenParen8,lumenParen9

"-------------------------------------------------------------------------------
" Identifiers:

syn match lumenIdent display /[^\()[\]'`,"; \t|]\+/ contains=lumenSsyntax,lumenFn,lumenVar,lumenGlobal,lumenNonfloat 
syn match lumenIdent display "|..\{-}|" contains=lumenSsyntax,lumenFn,lumenVar,lumenGlobal,lumenNonfloat 

syn match lumenSsyntax display "[:~&.!]" 
syn match lumenSsyntax display /[.!][^\()[\]'`,"; \t|:~&.!]\+/ 
syn match lumenSsyntax display "[.!]|..\{-}|" 
syn match lumenSsyntax display /[\()[\]'`,"; \t|:~&.!]\zs:[^\()[\]'`,"; \t|:~&.!]\+/
syn match lumenSsyntax display /[^\()[\]'`,"; \t|:~&.!]\+:\ze\($\|[\()[\]'`,"; \t|:~&.!]\)/

"-------------------------------------------------------------------------------
" Lists:

syn match lumenQQ display "`" 

syn match lumenUnquote display ",@\=" 

syn match lumenDotted display "\s\.\s" 

syn match lumenParenError display ")" 

if exists("g:lumen_rainbow") && g:lumen_rainbow != 0
  syn region lumenParen0 matchgroup=hlLevel0 start="`\=(" skip="|..\{-}|" matchgroup=hlLevel0 end=")" contains=@lumenListCluster,lumenParen1 
  syn region lumenParen1 matchgroup=hlLevel1 start="`\=(" skip="|..\{-}|" matchgroup=hlLevel1 end=")" contains=@lumenListCluster,lumenParen2 contained 
  syn region lumenParen2 matchgroup=hlLevel2 start="`\=(" skip="|..\{-}|" matchgroup=hlLevel2 end=")" contains=@lumenListCluster,lumenParen3 contained 
  syn region lumenParen3 matchgroup=hlLevel3 start="`\=(" skip="|..\{-}|" matchgroup=hlLevel3 end=")" contains=@lumenListCluster,lumenParen4 contained 
  syn region lumenParen4 matchgroup=hlLevel4 start="`\=(" skip="|..\{-}|" matchgroup=hlLevel4 end=")" contains=@lumenListCluster,lumenParen5 contained 
  syn region lumenParen5 matchgroup=hlLevel5 start="`\=(" skip="|..\{-}|" matchgroup=hlLevel5 end=")" contains=@lumenListCluster,lumenParen6 contained 
  syn region lumenParen6 matchgroup=hlLevel6 start="`\=(" skip="|..\{-}|" matchgroup=hlLevel6 end=")" contains=@lumenListCluster,lumenParen7 contained 
  syn region lumenParen7 matchgroup=hlLevel7 start="`\=(" skip="|..\{-}|" matchgroup=hlLevel7 end=")" contains=@lumenListCluster,lumenParen8 contained 
  syn region lumenParen8 matchgroup=hlLevel8 start="`\=(" skip="|..\{-}|" matchgroup=hlLevel8 end=")" contains=@lumenListCluster,lumenParen9 contained 
  syn region lumenParen9 matchgroup=hlLevel9 start="`\=(" skip="|..\{-}|" matchgroup=hlLevel9 end=")" contains=@lumenListCluster,lumenParen0 contained 
else
  syn region lumenList matchgroup=Delimiter start="(" skip="|..\{-}|" matchgroup=Delimiter end=")" contains=@lumenListCluster 
  syn region lumenQQList matchgroup=PreProc start="`(" skip="|..\{-}|" matchgroup=PreProc end=")" contains=@lumenListCluster 
endif

"-------------------------------------------------------------------------------
" Bracket Functions:

syn region lumenBracketFn matchgroup=SpecialChar start="\[" skip="|..\{-}|" matchgroup=SpecialChar end="]" contains=TOP 

syn match lumenBracketError display "]" 

"-------------------------------------------------------------------------------
" Symbols:

syn match lumenQuote display "'" 

syn match lumenSym display /'[^\()[\]'`,"; \t|]\+/ contains=lumenQuote 
syn match lumenSym display "'|..\{-}|" contains=lumenQuote 

syn region lumenSym start=/'"/ skip=/\\"/ end=/"/ 

syn region lumenSymList matchgroup=Type start="'(" skip="|..\{-}|" matchgroup=Type end=")" contains=TOP 

"-------------------------------------------------------------------------------
" Standard Functions And Macros:

"
" (define ...)
"
syn keyword lumenFn bias
syn keyword lumenFn can-return?
syn keyword lumenFn can-unquote?
syn keyword lumenFn compile-args
syn keyword lumenFn compile-atom
syn keyword lumenFn compile-call
syn keyword lumenFn compile-file
syn keyword lumenFn compile-infix
syn keyword lumenFn compile-special
syn keyword lumenFn compiler
syn keyword lumenFn compiler
syn keyword lumenFn delimiters
syn keyword lumenFn eof
syn keyword lumenFn equal?
syn keyword lumenFn escape-newlines
syn keyword lumenFn eval-print
syn keyword lumenFn expand
syn keyword lumenFn expand-definition
syn keyword lumenFn expand-function
syn keyword lumenFn expand-local
syn keyword lumenFn expand-macro
syn keyword lumenFn expected
syn keyword lumenFn failed
syn keyword lumenFn flag?
syn keyword lumenFn getenv
syn keyword lumenFn getop
syn keyword lumenFn id
syn keyword lumenFn index
syn keyword lumenFn infix
syn keyword lumenFn infix?
syn keyword lumenFn key?
syn keyword lumenFn literal
syn keyword lumenFn literal?
syn keyword lumenFn lower-body
syn keyword lumenFn lower-call
syn keyword lumenFn lower-definition
syn keyword lumenFn lower-do
syn keyword lumenFn lower-for
syn keyword lumenFn lower-function
syn keyword lumenFn lower-if
syn keyword lumenFn lower-infix
syn keyword lumenFn lower-infix?
syn keyword lumenFn lower-set
syn keyword lumenFn lower-short
syn keyword lumenFn lower-special
syn keyword lumenFn lower-statement
syn keyword lumenFn lower-try
syn keyword lumenFn lower-while
syn keyword lumenFn macro-function
syn keyword lumenFn macro?
syn keyword lumenFn main
syn keyword lumenFn math
syn keyword lumenFn op-delims
syn keyword lumenFn parenthesize-call?
syn keyword lumenFn passed
syn keyword lumenFn peek-char
syn keyword lumenFn precedence
syn keyword lumenFn quasiquote-list
syn keyword lumenFn quasiquoting?
syn keyword lumenFn quasisplice?
syn keyword lumenFn quoting?
syn keyword lumenFn read
syn keyword lumenFn read-all
syn keyword lumenFn read-char
syn keyword lumenFn read-string
syn keyword lumenFn read-table
syn keyword lumenFn reader
syn keyword lumenFn reader
syn keyword lumenFn reader
syn keyword lumenFn rep
syn keyword lumenFn repl
syn keyword lumenFn reserved
syn keyword lumenFn run-file
syn keyword lumenFn skip-non-code
syn keyword lumenFn special-form?
syn keyword lumenFn special?
syn keyword lumenFn standalone?
syn keyword lumenFn stash*
syn keyword lumenFn statement?
syn keyword lumenFn stream
syn keyword lumenFn symbol-expansion
syn keyword lumenFn symbol?
syn keyword lumenFn terminator
syn keyword lumenFn tests
syn keyword lumenFn unary?
syn keyword lumenFn usage
syn keyword lumenFn valid-code?
syn keyword lumenFn variable?
syn keyword lumenFn whitespace
syn keyword lumenFn wrap
syn keyword lumenFn zzap
syn keyword lumenFn zzop

"
" (define-global ...)
"
syn keyword lumenFn #
syn keyword lumenFn %
syn keyword lumenFn %message-handler
syn keyword lumenFn %result
syn keyword lumenFn *
syn keyword lumenFn +
syn keyword lumenFn -
syn keyword lumenFn -inf
syn keyword lumenFn /
syn keyword lumenFn <
syn keyword lumenFn <=
syn keyword lumenFn =
syn keyword lumenFn >
syn keyword lumenFn >=
syn keyword lumenFn abs
syn keyword lumenFn acos
syn keyword lumenFn add
syn keyword lumenFn almost
syn keyword lumenFn apply
syn keyword lumenFn argv
syn keyword lumenFn asin
syn keyword lumenFn atan
syn keyword lumenFn atan2
syn keyword lumenFn atom?
syn keyword lumenFn bind
syn keyword lumenFn bind*
syn keyword lumenFn boolean?
syn keyword lumenFn bound?
syn keyword lumenFn call
syn keyword lumenFn cat
syn keyword lumenFn ceil
syn keyword lumenFn char
syn keyword lumenFn clip
syn keyword lumenFn code
syn keyword lumenFn compile
syn keyword lumenFn compile-function
syn keyword lumenFn cos
syn keyword lumenFn cut
syn keyword lumenFn drop
syn keyword lumenFn edge
syn keyword lumenFn empty?
syn keyword lumenFn environment
syn keyword lumenFn escape
syn keyword lumenFn eval
syn keyword lumenFn exit
syn keyword lumenFn expand-if
syn keyword lumenFn find
syn keyword lumenFn first
syn keyword lumenFn floor
syn keyword lumenFn function?
syn keyword lumenFn hd
syn keyword lumenFn id-literal?
syn keyword lumenFn in?
syn keyword lumenFn indent-level
syn keyword lumenFn indentation
syn keyword lumenFn inf
syn keyword lumenFn inf?
syn keyword lumenFn inner
syn keyword lumenFn is?
syn keyword lumenFn join
syn keyword lumenFn keep
syn keyword lumenFn key
syn keyword lumenFn keys
syn keyword lumenFn keys?
syn keyword lumenFn last
syn keyword lumenFn load
syn keyword lumenFn log
syn keyword lumenFn log10
syn keyword lumenFn lower
syn keyword lumenFn macroexpand
syn keyword lumenFn map
syn keyword lumenFn mapo
syn keyword lumenFn max
syn keyword lumenFn min
syn keyword lumenFn nan
syn keyword lumenFn nan?
syn keyword lumenFn nil?
syn keyword lumenFn none?
syn keyword lumenFn number
syn keyword lumenFn number-code?
syn keyword lumenFn number?
syn keyword lumenFn numeric?
syn keyword lumenFn one?
syn keyword lumenFn pair
syn keyword lumenFn pow
syn keyword lumenFn print
syn keyword lumenFn quasiexpand
syn keyword lumenFn quoted
syn keyword lumenFn random
syn keyword lumenFn read-file
syn keyword lumenFn reduce
syn keyword lumenFn reserved?
syn keyword lumenFn reverse
syn keyword lumenFn run
syn keyword lumenFn search
syn keyword lumenFn setenv
syn keyword lumenFn sin
syn keyword lumenFn sinh
syn keyword lumenFn some?
syn keyword lumenFn sort
syn keyword lumenFn split
syn keyword lumenFn sqrt
syn keyword lumenFn stash
syn keyword lumenFn string
syn keyword lumenFn string-literal?
syn keyword lumenFn string?
syn keyword lumenFn tan
syn keyword lumenFn tanh
syn keyword lumenFn target
syn keyword lumenFn tl
syn keyword lumenFn toplevel?
syn keyword lumenFn two?
syn keyword lumenFn unstash
syn keyword lumenFn valid-id?
syn keyword lumenFn write
syn keyword lumenFn write-file

"
" (define-macro ...)
"
syn keyword lumenFn %define
syn keyword lumenFn %function
syn keyword lumenFn %local-function
syn keyword lumenFn %global-function
syn keyword lumenFn arguments%
syn keyword lumenFn at
syn keyword lumenFn case
syn keyword lumenFn case-let
syn keyword lumenFn cat!
syn keyword lumenFn class
syn keyword lumenFn dec
syn keyword lumenFn define
syn keyword lumenFn define*
syn keyword lumenFn var
syn keyword lumenFn define-global
syn keyword lumenFn define-global*
syn keyword lumenFn define-macro
syn keyword lumenFn define-reader
syn keyword lumenFn define-special
syn keyword lumenFn define-symbol
syn keyword lumenFn define-test
syn keyword lumenFn define-variable
syn keyword lumenFn define-constant
syn keyword lumenFn define-transformer
syn keyword lumenFn define-setter
syn keyword lumenFn during-compilation
syn keyword lumenFn each
syn keyword lumenFn on
syn keyword lumenFn export
syn keyword lumenFn fn
syn keyword lumenFn fn*
syn keyword lumenFn for
syn keyword lumenFn guard
syn keyword lumenFn if
syn keyword lumenFn inc
syn keyword lumenFn join!
syn keyword lumenFn language
syn keyword lumenFn let
syn keyword lumenFn let-macro
syn keyword lumenFn let-symbol
syn keyword lumenFn let-unique
syn keyword lumenFn let-when
syn keyword lumenFn list
syn keyword lumenFn obj
syn keyword lumenFn on
syn keyword lumenFn quasiquote
syn keyword lumenFn quote
syn keyword lumenFn set-of
syn keyword lumenFn step
syn keyword lumenFn target
syn keyword lumenFn test
syn keyword lumenFn test=
syn keyword lumenFn unless
syn keyword lumenFn when
syn keyword lumenFn when-compiling
syn keyword lumenFn wipe
syn keyword lumenFn with
syn keyword lumenFn with-bindings
syn keyword lumenFn with-frame
syn keyword lumenFn with-indent

"
" shorthands
"
syn keyword lumenFn defalias
syn keyword lumenFn defun
syn keyword lumenFn defmacro
syn keyword lumenFn defsym
syn keyword lumenFn mac
syn keyword lumenFn def
syn keyword lumenFn defvar
syn keyword lumenFn defconst
syn keyword lumenFn defset
syn keyword lumenFn let*
syn keyword lumenFn try
syn keyword lumenFn new
syn keyword lumenFn iflet
syn keyword lumenFn whenlet

"
" specials
"
syn keyword lumenFn get
syn keyword lumenFn set
syn keyword lumenFn at
syn keyword lumenFn not
syn keyword lumenFn or
syn keyword lumenFn and
syn keyword lumenFn do
syn keyword lumenFn require
syn keyword lumenFn while
syn keyword lumenFn break
syn keyword lumenFn error
syn keyword lumenFn return

syn keyword lumenFn then
syn keyword lumenFn elif
syn keyword lumenFn else
syn keyword lumenFn done
syn keyword lumenFn end
syn keyword lumenFn import


"-------------------------------------------------------------------------------
" Variables:

syn match lumenGlobal display /[^\()[\]'`,"; \t|:~&.!]\+\*/ 

syn keyword lumenVar nil
syn keyword lumenVar null
syn keyword lumenVar true
syn keyword lumenVar false
syn keyword lumenVar t
syn keyword lumenVar #t
syn keyword lumenVar #f

"-------------------------------------------------------------------------------
" Optional Parameters:

syn region lumenOpt matchgroup=Identifier start="(o\>" skip="|..\{-}|" matchgroup=Identifier end=")" contains=TOP 

"-------------------------------------------------------------------------------
" Strings:

syn match lumenStringEscError contained display "\\." 

syn match lumenStringEsc contained display /\\[\abtnvfre'"]/ 
" syn match lumenStringEsc contained display "\\\o\{1,3}" 
" syn match lumenStringEsc contained display "\\\Cx\x\{1,2}" 
" syn match lumenStringEsc contained display "\\\Cu\x\{1,4}" 
" syn match lumenStringEsc contained display "\\\CU\x\{1,8}" 

" syn match lumenAtStringAt contained "@[^\()[\]\{\}\\'`,"@]\+"
syn match lumenAtStringAt contained display "@"

syn match lumenAtStringExpr contained skipwhite skipempty "@@\@!" nextgroup=@lumenAtStringAt,lumenListCluster,lumenParen.* 

if exists("g:lumen_always_atstrings") && g:lumen_always_atstrings != 0
  syn region lumenString start=/"/ skip=/\%(\\\\\|\\"\)/ end=/"/ contains=@Spell,lumenStringEsc,lumenStringEscError,lumenAtStringAt,lumenAtStringExpr 
else
  syn region lumenString start=/"/ skip=/\%(\\\\\|\\"\)/ end=/"/ contains=@Spell,lumenStringEsc,lumenStringEscError 
endif

"-------------------------------------------------------------------------------
" Numbers:

syn match lumenNonfloat contained display ?\%(^\|[\()[\]'`,"; \t|:~&.!]\)\@<=\%(#b\%(#[ie]\)\=\|\%(#[ie]\)\=#b\)\%([+-]\=\%([01]\+#*/[01]\+#*\%([esfdl][+-]\=[01]\+\)\=\|[01]\+#*\%([esfdl][+-]\=[01]\+\)\=\)\|[+-]\=\%([01]\+#*/[01]\+#*\%([esfdl][+-]\=[01]\+\)\=\|[01]\+#*\%([esfdl][+-]\=[01]\+\)\=\)@[+-]\=\%([01]\+#*/[01]\+#*\%([esfdl][+-]\=[01]\+\)\=\|[01]\+#*\%([esfdl][+-]\=[01]\+\)\=\)\|[+-]\=\%([01]\+#*/[01]\+#*\%([esfdl][+-]\=[01]\+\)\=\|[01]\+#*\%([esfdl][+-]\=[01]\+\)\=\)\=[+-]\%(\%([01]\+#*/[01]\+#*\%([esfdl][+-]\=[01]\+\)\=\|[01]\+#*\%([esfdl][+-]\=[01]\+\)\=\)\)\=i\)\ze\%($\|[\()[\]'`,"; \t|:~&.!]\)? 
syn match lumenNonfloat contained display ?\%(^\|[\()[\]'`,"; \t|:~&.!]\)\@<=\%(#o\%(#[ie]\)\=\|\%(#[ie]\)\=#o\)\%([+-]\=\%(\o\+#*/\o\+#*\%([esfdl][+-]\=\o\+\)\=\|\o\+#*\%([esfdl][+-]\=\o\+\)\=\)\|[+-]\=\%(\o\+#*/\o\+#*\%([esfdl][+-]\=\o\+\)\=\|\o\+#*\%([esfdl][+-]\=\o\+\)\=\)@[+-]\=\%(\o\+#*/\o\+#*\%([esfdl][+-]\=\o\+\)\=\|\o\+#*\%([esfdl][+-]\=\o\+\)\=\)\|[+-]\=\%(\o\+#*/\o\+#*\%([esfdl][+-]\=\o\+\)\=\|\o\+#*\%([esfdl][+-]\=\o\+\)\=\)\=[+-]\%(\%(\o\+#*/\o\+#*\%([esfdl][+-]\=\o\+\)\=\|\o\+#*\%([esfdl][+-]\=\o\+\)\=\)\)\=i\)\ze\%($\|[\()[\]'`,"; \t|:~&.!]\)? 
syn match lumenNonfloat contained display ?\%(^\|[\()[\]'`,"; \t|:~&.!]\)\@<=\%(\%(#d\)\=\%(#[ie]\)\=\|\%(#[ie]\)\=\%(#d\)\=\)\%([+-]\=\%(\d\+#*/\d\+#*\%([esfdl][+-]\=\d\+\)\=\|\d\+#*\%([esfdl][+-]\=\d\+\)\=\)\|[+-]\=\%(\d\+#*/\d\+#*\%([esfdl][+-]\=\d\+\)\=\|\d\+#*\%([esfdl][+-]\=\d\+\)\=\)@[+-]\=\%(\d\+#*/\d\+#*\%([esfdl][+-]\=\d\+\)\=\|\d\+#*\%([esfdl][+-]\=\d\+\)\=\)\|[+-]\=\%(\d\+#*/\d\+#*\%([esfdl][+-]\=\d\+\)\=\|\d\+#*\%([esfdl][+-]\=\d\+\)\=\)\=[+-]\%(\%(\d\+#*/\d\+#*\%([esfdl][+-]\=\d\+\)\=\|\d\+#*\%([esfdl][+-]\=\d\+\)\=\)\)\=i\)\ze\%($\|[\()[\]'`,"; \t|:~&.!]\)? 
syn match lumenNonfloat contained display ?\%(^\|[\()[\]'`,"; \t|:~&.!]\)\@<=\%(#x\%(#[ie]\)\=\|\%(#[ie]\)\=#x\)\%([+-]\=\%(\x\+#*/\x\+#*\%([sl][+-]\=\x\+\)\=\|\x\+#*\%([sl][+-]\=\x\+\)\=\)\|[+-]\=\%(\x\+#*/\x\+#*\%([sl][+-]\=\x\+\)\=\|\x\+#*\%([sl][+-]\=\x\+\)\=\)@[+-]\=\%(\x\+#*/\x\+#*\%([sl][+-]\=\x\+\)\=\|\x\+#*\%([sl][+-]\=\x\+\)\=\)\|[+-]\=\%(\x\+#*/\x\+#*\%([sl][+-]\=\x\+\)\=\|\x\+#*\%([sl][+-]\=\x\+\)\=\)\=[+-]\%(\%(\x\+#*/\x\+#*\%([sl][+-]\=\x\+\)\=\|\x\+#*\%([sl][+-]\=\x\+\)\=\)\)\=i\)\ze\%($\|[\()[\]'`,"; \t|:~&.!]\)? 

syn match lumenNumber display !\%(^\|[\()[\]'`,"; \t|]\)\@<=\%(#b\%(#[ie]\)\=\|\%(#[ie]\)\=#b\)\%(\%([+-]\=\%([01]\+#*/[01]\+#*\%([esfdl][+-]\=[01]\+\)\=\|\%([01]\+#*\|\.[01]\+#*\|[01]\+\.[01]*#*\|[01]\+#\+\.#*\)\%([esfdl][+-]\=[01]\+\)\=\)\|[+-]\%(inf\.0\|nan\.0\)\)\|\%([+-]\=\%([01]\+#*/[01]\+#*\%([esfdl][+-]\=[01]\+\)\=\|\%([01]\+#*\|\.[01]\+#*\|[01]\+\.[01]*#*\|[01]\+#\+\.#*\)\%([esfdl][+-]\=[01]\+\)\=\)\|[+-]\%(inf\.0\|nan\.0\)\)@\%([+-]\=\%([01]\+#*/[01]\+#*\%([esfdl][+-]\=[01]\+\)\=\|\%([01]\+#*\|\.[01]\+#*\|[01]\+\.[01]*#*\|[01]\+#\+\.#*\)\%([esfdl][+-]\=[01]\+\)\=\)\|[+-]\%(inf\.0\|nan\.0\)\)\|\%([+-]\=\%([01]\+#*/[01]\+#*\%([esfdl][+-]\=[01]\+\)\=\|\%([01]\+#*\|\.[01]\+#*\|[01]\+\.[01]*#*\|[01]\+#\+\.#*\)\%([esfdl][+-]\=[01]\+\)\=\)\|[+-]\%(inf\.0\|nan\.0\)\)\=[+-]\%(\%([01]\+#*/[01]\+#*\%([esfdl][+-]\=[01]\+\)\=\|\%([01]\+#*\|\.[01]\+#*\|[01]\+\.[01]*#*\|[01]\+#\+\.#*\)\%([esfdl][+-]\=[01]\+\)\=\)\|inf\.0\|nan\.0\)\=i\)\ze\%($\|[\()[\]'`,"; \t|]\)! 
syn match lumenNumber display !\%(^\|[\()[\]'`,"; \t|]\)\@<=\%(#o\%(#[ie]\)\=\|\%(#[ie]\)\=#o\)\%(\%([+-]\=\%(\o\+#*/\o\+#*\%([esfdl][+-]\=\o\+\)\=\|\%(\o\+#*\|\.\o\+#*\|\o\+\.\o*#*\|\o\+#\+\.#*\)\%([esfdl][+-]\=\o\+\)\=\)\|[+-]\%(inf\.0\|nan\.0\)\)\|\%([+-]\=\%(\o\+#*/\o\+#*\%([esfdl][+-]\=\o\+\)\=\|\%(\o\+#*\|\.\o\+#*\|\o\+\.\o*#*\|\o\+#\+\.#*\)\%([esfdl][+-]\=\o\+\)\=\)\|[+-]\%(inf\.0\|nan\.0\)\)@\%([+-]\=\%(\o\+#*/\o\+#*\%([esfdl][+-]\=\o\+\)\=\|\%(\o\+#*\|\.\o\+#*\|\o\+\.\o*#*\|\o\+#\+\.#*\)\%([esfdl][+-]\=\o\+\)\=\)\|[+-]\%(inf\.0\|nan\.0\)\)\|\%([+-]\=\%(\o\+#*/\o\+#*\%([esfdl][+-]\=\o\+\)\=\|\%(\o\+#*\|\.\o\+#*\|\o\+\.\o*#*\|\o\+#\+\.#*\)\%([esfdl][+-]\=\o\+\)\=\)\|[+-]\%(inf\.0\|nan\.0\)\)\=[+-]\%(\%(\o\+#*/\o\+#*\%([esfdl][+-]\=\o\+\)\=\|\%(\o\+#*\|\.\o\+#*\|\o\+\.\o*#*\|\o\+#\+\.#*\)\%([esfdl][+-]\=\o\+\)\=\)\|inf\.0\|nan\.0\)\=i\)\ze\%($\|[\()[\]'`,"; \t|]\)! 
syn match lumenNumber display !\%(^\|[\()[\]'`,"; \t|]\)\@<=\%(\%(#d\)\=\%(#[ie]\)\=\|\%(#[ie]\)\=\%(#d\)\=\)\%(\%([+-]\=\%(\d\+#*/\d\+#*\%([esfdl][+-]\=\d\+\)\=\|\%(\d\+#*\|\.\d\+#*\|\d\+\.\d*#*\|\d\+#\+\.#*\)\%([esfdl][+-]\=\d\+\)\=\)\|[+-]\%(inf\.0\|nan\.0\)\)\|\%([+-]\=\%(\d\+#*/\d\+#*\%([esfdl][+-]\=\d\+\)\=\|\%(\d\+#*\|\.\d\+#*\|\d\+\.\d*#*\|\d\+#\+\.#*\)\%([esfdl][+-]\=\d\+\)\=\)\|[+-]\%(inf\.0\|nan\.0\)\)@\%([+-]\=\%(\d\+#*/\d\+#*\%([esfdl][+-]\=\d\+\)\=\|\%(\d\+#*\|\.\d\+#*\|\d\+\.\d*#*\|\d\+#\+\.#*\)\%([esfdl][+-]\=\d\+\)\=\)\|[+-]\%(inf\.0\|nan\.0\)\)\|\%([+-]\=\%(\d\+#*/\d\+#*\%([esfdl][+-]\=\d\+\)\=\|\%(\d\+#*\|\.\d\+#*\|\d\+\.\d*#*\|\d\+#\+\.#*\)\%([esfdl][+-]\=\d\+\)\=\)\|[+-]\%(inf\.0\|nan\.0\)\)\=[+-]\%(\%(\d\+#*/\d\+#*\%([esfdl][+-]\=\d\+\)\=\|\%(\d\+#*\|\.\d\+#*\|\d\+\.\d*#*\|\d\+#\+\.#*\)\%([esfdl][+-]\=\d\+\)\=\)\|inf\.0\|nan\.0\)\=i\)\ze\%($\|[\()[\]'`,"; \t|]\)! 
syn match lumenNumber display !\%(^\|[\()[\]'`,"; \t|]\)\@<=\%(#x\%(#[ie]\)\=\|\%(#[ie]\)\=#x\)\%(\%([+-]\=\%(\x\+#*/\x\+#*\%([sl][+-]\=\x\+\)\=\|\%(\x\+#*\|\.\x\+#*\|\x\+\.\x*#*\|\x\+#\+\.#*\)\%([sl][+-]\=\x\+\)\=\)\|[+-]\%(inf\.0\|nan\.0\)\)\|\%([+-]\=\%(\x\+#*/\x\+#*\%([sl][+-]\=\x\+\)\=\|\%(\x\+#*\|\.\x\+#*\|\x\+\.\x*#*\|\x\+#\+\.#*\)\%([sl][+-]\=\x\+\)\=\)\|[+-]\%(inf\.0\|nan\.0\)\)@\%([+-]\=\%(\x\+#*/\x\+#*\%([sl][+-]\=\x\+\)\=\|\%(\x\+#*\|\.\x\+#*\|\x\+\.\x*#*\|\x\+#\+\.#*\)\%([sl][+-]\=\x\+\)\=\)\|[+-]\%(inf\.0\|nan\.0\)\)\|\%([+-]\=\%(\x\+#*/\x\+#*\%([sl][+-]\=\x\+\)\=\|\%(\x\+#*\|\.\x\+#*\|\x\+\.\x*#*\|\x\+#\+\.#*\)\%([sl][+-]\=\x\+\)\=\)\|[+-]\%(inf\.0\|nan\.0\)\)\=[+-]\%(\%(\x\+#*/\x\+#*\%([sl][+-]\=\x\+\)\=\|\%(\x\+#*\|\.\x\+#*\|\x\+\.\x*#*\|\x\+#\+\.#*\)\%([sl][+-]\=\x\+\)\=\)\|inf\.0\|nan\.0\)\=i\)\ze\%($\|[\()[\]'`,"; \t|]\)! 

"-------------------------------------------------------------------------------
" Character Literals:

syn match lumenChar "#\\[ -~]" 
syn match lumenChar "#\\\%(null\|nul\|backspace\|tab\|newline\|linefeed\|vtab\|page\|return\|space\|rubout\)" 
syn match lumenChar "#\\[0-3][0-7][0-7]" 
syn match lumenChar "#\\\Cu\x\{1,4}" 
syn match lumenChar "#\\\CU\x\{1,6}" 

"-------------------------------------------------------------------------------
" Comments:

" lumenCommentGroup allows adding matches for special things in comments

syn cluster lumenCommentGroup contains=lumenTodo,@Spell

syn match lumenComment ";.*$" contains=@lumenCommentGroup 

syn match lumenTodo contained "\%(todo\|xxx\|fixme\):\=" 

syn region lumenCommentRegion start="#|" end="|#" contains=lumenCommentRegion,@lumenCommentGroup 

"-------------------------------------------------------------------------------
" Define Highlighting:

hi def link lumenAtStringAt SpecialChar
hi def link lumenAtStringExpr SpecialChar
hi def link lumenBracketError Error
hi def link lumenChar Type
hi def link lumenComment Comment
hi def link lumenCommentRegion Comment
hi def link lumenDotted Statement
hi def link lumenFn Statement
hi def link lumenGlobal Identifier
hi def link lumenNonfloat Number
hi def link lumenNumber Number
hi def link lumenOpt Type
hi def link lumenParenError Error
hi def link lumenQQ PreProc
hi def link lumenQuote Type
hi def link lumenSsyntax Type
hi def link lumenString String
hi def link lumenStringEsc SpecialChar
hi def link lumenStringEscError Error
hi def link lumenSym Type
hi def link lumenTodo Todo
hi def link lumenUnquote PreProc
hi def link lumenVar Statement

if exists("g:lumen_rainbow") && g:lumen_rainbow != 0
  if &bg == "dark"
    " hi def hlLevel0 ctermfg=red guifg=red1
    " hi def hlLevel1 ctermfg=yellow guifg=orange1
    " hi def hlLevel2 ctermfg=green guifg=yellow1
    " hi def hlLevel3 ctermfg=cyan guifg=greenyellow
    " hi def hlLevel4 ctermfg=magenta guifg=green1
    " hi def hlLevel5 ctermfg=red guifg=springgreen1
    " hi def hlLevel6 ctermfg=yellow guifg=cyan1
    " hi def hlLevel7 ctermfg=green guifg=slateblue1
    " hi def hlLevel8 ctermfg=cyan guifg=magenta1
    " hi def hlLevel9 ctermfg=magenta guifg=purple1

    " Has potential...
    " hi def hlLevel0 ctermfg=red guifg=red1
    " hi def hlLevel1 ctermfg=yellow guifg=orangered3
    " hi def hlLevel2 ctermfg=green guifg=orange2
    " hi def hlLevel3 ctermfg=cyan guifg=yellow3
    " hi def hlLevel4 ctermfg=magenta guifg=green3
    " hi def hlLevel5 ctermfg=red guifg=deepskyblue2
    " hi def hlLevel6 ctermfg=yellow guifg=cyan1
    " hi def hlLevel7 ctermfg=green guifg=slateblue1
    " hi def hlLevel8 ctermfg=cyan guifg=magenta1
    " hi def hlLevel9 ctermfg=magenta guifg=purple1

    hi def hlLevel0 ctermfg=red guifg=red1
    hi def hlLevel1 ctermfg=yellow guifg=orange1
    hi def hlLevel2 ctermfg=green guifg=yellow3
    hi def hlLevel3 ctermfg=cyan guifg=green3
    hi def hlLevel4 ctermfg=magenta guifg=cyan3
    hi def hlLevel5 ctermfg=red guifg=skyblue2
    hi def hlLevel6 ctermfg=yellow guifg=slateblue1
    hi def hlLevel7 ctermfg=green guifg=magenta1
    hi def hlLevel8 ctermfg=cyan guifg=purple1
    hi def hlLevel9 ctermfg=magenta guifg=cyan4
  else
    hi def hlLevel0 ctermfg=red guifg=red3
    hi def hlLevel1 ctermfg=darkyellow guifg=orangered3
    hi def hlLevel2 ctermfg=darkgreen guifg=orange2
    hi def hlLevel3 ctermfg=blue guifg=yellow3
    hi def hlLevel4 ctermfg=darkmagenta guifg=olivedrab4
    hi def hlLevel5 ctermfg=red guifg=green4
    hi def hlLevel6 ctermfg=darkyellow guifg=paleturquoise3
    hi def hlLevel7 ctermfg=darkgreen guifg=deepskyblue4
    hi def hlLevel8 ctermfg=blue guifg=darkslateblue
    hi def hlLevel9 ctermfg=darkmagenta guifg=darkviolet
  endif
endif

syn sync lines=100

let b:commentary_format="; %s"
let b:current_syntax="lumen"
