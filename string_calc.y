%{
#include <stdio.h>
int yylex(void);
int yyerror(const char *s);
%}

%token NUMBER COMMA EOL

%{

int sum = 0;

%}

%%

input:
      /* empty */
    | input line
    ;

line:
      EOL
    | expr EOL  { printf("Sum: %d\n", sum); sum = 0; }
    ;

expr:
      NUMBER         { sum += $1; }
    | expr COMMA NUMBER { sum += $3; }
    ;

%%

int main() {
    yyparse();
    return 0;
}

int yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}

int yywrap() {
    return 1;
}
