  /* File parser.mly */
        %token <int> NUMBER
        %token PLUS MINUS TIMES DIV
        %token LESS LESSEQUAL GREATER GREATEREQUAL EQUAL NEGATION
        %token NEGATION
        %token LPAREN RPAREN
        %token EOF
        %left PLUS MINUS        /* lowest precedence */
        %left TIMES DIV         /* medium precedence */
        %start main             /* the entry point */
        %type <Pi.expression> main
        %%
        main:
            expr EOF                { $1 }
        ;
        expr: 
            NUMBER                   { Pi.Num($1) }
          | LPAREN expr RPAREN      { $2 }
          | expr PLUS expr          { Pi.Sum($1, $3) }
          | expr MINUS expr         { Pi.Sub($1, $3) }
          | expr TIMES expr         { Pi.Mul($1, $3) }
          | expr DIV expr           { Pi.Div($1, $3) }
          | expr LESS EQUAL expr    { Pi.Le($1, $4)  }
          | expr LESS expr          { Pi.Lt($1, $3)  }
          | expr GREATER expr       { Pi.Gt($1, $3)  }
          | expr GREATER EQUAL expr { Pi.Ge($1, $4)  }
        ;