" syntax highlighting for expresso
"
" Language:     Expresso
" Maintainer:   Sergey Ivanov
" URL:          https://github.com/ivanovs-4/expresso-vim

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'expresso'
endif

syn spell notoplevel

syn match expressoIdentifier "[_a-z][a-zA-z0-9_']*" contained
syn match expressoType "\<[A-Z][a-zA-Z0-9_']*\>"
syn match expressoOperators "[-!#$%&\*\+/<=>\?@\\^|~:.]\+\|\<_\>"
syn match expressoSeparator  "[,;]"

syn region expressoBlock matchgroup=expressoDelimiter start="{" end="}" contains=TOP,@Spell
syn region expressoParens matchgroup=expressoDelimiter start="(" end=")" contains=TOP,expressoTypeSig,@Spell
syn region expressoBrackets matchgroup=expressoDelimiter start="\[" end="]" contains=TOP,expressoTypeSig,@Spell

syn match expressoRecordField contained containedin=expressoBlock
  \ "[_a-z][a-zA-Z0-9_']*\(,\s*[_a-z][a-zA-Z0-9_']*\)*\_s\+::\_s"
  \ contains=
  \ expressoIdentifier,
  \ expressoOperators,
  \ expressoSeparator,
  \ expressoParens
syn match expressoTypeSig
  \ "^\s*\(let\s\+\|in\s\+\|fix\s\+\)\?[_a-z][a-zA-Z0-9_']*#\?\(,\s*[_a-z][a-zA-Z0-9_']*#\?\)*\_s\+::\_s"
  \ contains=
  \ expressoIn,
  \ expressoLet,
  \ expressoFix,
  \ expressoIdentifier,
  \ expressoOperators,
  \ expressoSeparator,
  \ expressoParens
syn keyword expressoLet let
syn keyword expressoIn in
syn keyword expressoFix fix
syn keyword expressoKeyword case of

syn keyword expressoBool True False
syn match expressoChar "\<'[^'\\]'\|'\\.'\|'\\u[0-9a-fA-F]\{4}'\>"
syn region expressoString start=+"+ skip=+\\\\\|\\"+ end=+"+
  \ contains=@Spell
syn match expressoNumber "\<[0-9]\+\>\|\<0[xX][0-9a-fA-F]\+\>\|\<0[oO][0-7]\+\>\|\<0[bB][10]\+\>"
syn match expressoFloat "\<[0-9]\+\.[0-9]\+\([eE][-+]\=[0-9]\+\)\=\>"


highlight def link expressoIdentifier Identifier
highlight def link expressoType Type
highlight def link expressoOperators Operator
highlight def link expressoSeparator Delimiter

highlight def link expressoDelimiter Delimiter

highlight def link expressoLet Keyword
highlight def link expressoIn Keyword
highlight def link expressoFix Keyword
highlight def link expressoKeyword Keyword

highlight def link expressoBool Boolean
highlight def link expressoChar String
highlight def link expressoString String
highlight def link expressoNumber Number
highlight def link expressoFloat Float

let b:current_syntax = "expresso"
