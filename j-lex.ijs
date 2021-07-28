NB. j lexer
cocurrent 'jlex'

help =: noun define
`jlex y` tokenizes j source code `y` into a nested structure:

  1 box per line, containing:
    1 box per token, contaning:
      2 boxes:
        a 1-character code describing the token
        the token itself

the token codes are as follows:

  S -> whitespace characters
  P -> parenthesis
  D -> direct definition brace ( {{ or }} )
  C -> comment ( NB. ... )
  A -> copula ( =. or =: )  ('A' for 'Assignment')
  K -> control word  ( if. do. end. etc )
  U -> unknown/invalid

  p -> pronoun/proverb etc ( x y m n u v )
  i -> identifier
  n -> noun
  a -> adverb
  v -> verb
  c -> conjunction

  L -> character literal
  N -> number
)

jcut =: verb define
  NB. tokenize j like ;: but include whitespace
  r =. 0$a:
  for_t. ;: y do.                  NB. for each token
    if. p =. {. (>t) ss y do.      NB. if there is whitespace before first match..
      'w y' =. p ({. ; }.) y       NB. shift prefix into w
      r =. r, <w                   NB. and append to tokens
    end.
    r =. r,t
    y =. (#>t)}.y                  NB. drop token from y
  end.
  if. #y do. r =. r,<y end.        NB. append final whitespace
  r
)

NB. helpers for jtyp
isName =: [: # '^[[:alpha:]]\w+$' & rxmatches
reCtrl =: '^(assert|break|continue|(goto|label|for)(_\w+)|do|end|if|else|elseif|return'
reCtrl =: reCtrl,'|select|f?case|throw|while|whilst)[.]'
isCtrl =: [: #  reCtrl & rxmatches
isCopula =: [: # '=[.:]' & rxmatches
isParen =: (1=#) *. [: +./@, '()' -:"0 {.
isSpace =: [:*./' '=]
isProname =: [: +./ (1=#) *. 'xymnuv'-:"0 _ {.

jtype =: verb define
  NB. classify a j token
  if. 'NB.' -: 3 {. y do. 'C'
  elseif. y e. '{{',:'}}' do. 'D' NB. direct def brace
  elseif. isProname y     do. 'p' NB. proname
  elseif. isSpace y       do. 'S' NB. space
  elseif. isCopula y      do. 'A' NB. assignment
  elseif. isCtrl y        do. 'K' NB. keyword
  elseif. isParen y       do. 'P' NB. paren
  elseif. 1 do.
    if. isName y do. 'i' return. end.
    select. try. t=.> type<'o'[".'o=. ',y catch. 'U' return. end.
    case. 'noun' do.
      if. 2 = 3!:0 o     do. 'L'  NB. string/character
      else.                  'N'  NB. numeric (int,bool,float,rational,complex)
      end. NB. boxes,unicode, sparse,etc do not have literal tokens
    case. 'verb'         do. 'v'
    case. 'conjunction'  do. 'c'
    case. 'adverb'       do. 'a'
    case. 'not defined'  do. 'U'
    case. 'invalid name' do. 'U'  NB. shouldn't happen since we know it's a name
    end.
  end.
)

jlex =: {{
  if. 'literal' -: datatype y do. y =. ,. LF cut y -. CR end.
  (jtype;]) L:0 jcut each y }}

jlex_z_ =: jlex_jlex_
