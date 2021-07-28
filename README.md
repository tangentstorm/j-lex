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

See `help_jlex_` for what the token descriptor codes mean.

## Known Limitations

- Does not understand multi-line noun definitions.
