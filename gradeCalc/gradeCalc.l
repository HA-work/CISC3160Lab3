%{
 
#include <stdio.h>
#include "y.tab.h"
int c;
int q;
int l;
int r;
int t;
// maybe change variable names
// maybe make QLR of type components
// as they all kind kind of similiar

// can use C code here so can condense
// and use if statements
extern int yylval;
%}
%%
" "       ;
[Q]     {
            q = yytext[0];
            yylval = q - 'A';
            //printf("Quiz\n");
            return(QUIZ);
          }

[L]     {
            l = yytext[0];
            yylval = l - 'A';
            //printf("Lab\n");
            return(LAB);
          }

[R]     {
            q = yytext[0];
            yylval = q - 'A';
            //printf("Reflection\n");
            return(REFLECTION);
          }

[T]     {
            t = yytext[0];
            yylval = t - 'A';
            //printf("Total\n");
            return(TOTAL);
          }

[0-5]     {
            c = yytext[0];
            yylval = c - '0';
            return(DIGIT);
          }



[^QLRT0-5]   {
                 c = yytext[0];
                 //printf("Unrecognized Input\n");
                 return(c);
               }

