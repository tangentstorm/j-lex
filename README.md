# j-lex

`j-lex` is a J source code lexer written in J ( http://jsoftware.com )

## Installation

    install'github:tangentstorm/j-lex@main'

## Usage

       load 'tangentstorm/j-lex'
       jlex '{{ i. 10,y }}'
    ┌───────────────────────────────────────────────────────────┐
    │┌──────┬─────┬──────┬─────┬──────┬─────┬─────┬─────┬──────┐│
    ││┌─┬──┐│┌─┬─┐│┌─┬──┐│┌─┬─┐│┌─┬──┐│┌─┬─┐│┌─┬─┐│┌─┬─┐│┌─┬──┐││
    │││D│{{│││S│ │││v│i.│││S│ │││N│10│││v│,│││p│y│││S│ │││D│}}│││
    ││└─┴──┘│└─┴─┘│└─┴──┘│└─┴─┘│└─┴──┘│└─┴─┘│└─┴─┘│└─┴─┘│└─┴──┘││
    │└──────┴─────┴──────┴─────┴──────┴─────┴─────┴─────┴──────┘│
    └───────────────────────────────────────────────────────────┘

       jcut_jlex_ '{{ i. 10,y }}'  NB. like ;: but preserve spaces
    ┌──┬─┬──┬─┬──┬─┬─┬─┬──┐
    │{{│ │i.│ │10│,│y│ │}}│
    └──┴─┴──┴─┴──┴─┴─┴─┴──┘

       jtype_jlex_ '{{'  NB. return the type code for a single token
    D

See `help_jlex_` for what the token descriptor codes mean.

## Known Limitations

- Does not understand multi-line noun definitions.
