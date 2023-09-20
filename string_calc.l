%{
#include "y.tab.h"
%}

%%

[0-9]+  { yylval = atoi(yytext); return NUMBER; }
","    { return COMMA; }
"\n"   { return EOL; }
[ \t]  { /* ignore whitespace */ }
.      { /* ignore all other characters */ }

%%
