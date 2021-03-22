%{
#include <stdio.h>
int quiz = 0;
int lab = 0;
int reflection = 0;
int total = 0;
int base; // not sure if I need this
%}
%start request
%token DIGIT QUIZ LAB REFLECTION TOTAL

// do I need to initilize the registers?

// got a reduce/reduce error
// this means 2 or more rules can apply to the same input
// will try to fix this
// not sure where this is happening though

// maybe can use regex to simplify

// also says I have a syntax error

// earlier version was working

// problem with 6 numbers

// when you do Q 1 1 1 1 1 1
// it interprets it as Q 1 1 1 1 11
// and gives 15
// it should preferably not do this

// also Q 11111
// is interpreted as Q 1 1 1 1 1
// this should preferably not happen 
// can stop this by removing number so we only use single digits
// and limiting enterable grades to 5

// attempting this change

// the code will only accept Q or R or L followed by 5 single digit numbers from 0 to 5
// any other numbers will cause nothing to happen
// T can be followed by a number



%%                   /* beginning of rules section */
request:  
         
         |
         request out '\n'
         |
		 request in '\n'
         |	
         
         request error '\n'
         {
           yyerrok;
         }
         ;


out:   
         TOTAL
         {
           $$ = $1;
		   // total?
		   total = quiz + reflection + lab;
		   // maybe should use Q R or L instead or T
		   
		   
		   printf("Total grade is %d\n", total);
		   // maybe should be register
         }
		 
		  
         ;
		 
in:   
         
		 QUIZ number number number number number
		 {
           $$ = $2 + $3 + $4 + $5 + $6;
		   quiz = $2 + $3 + $4 + $5 + $6;
		   printf("Quiz total %d\n",quiz);
		   // maybe should print the register
		   // maybe could use QUIZ instead of $1
		   // could probably condense this code better
		   // should I update total for safety?
		   total = quiz + reflection + lab;
		   printf("Total grade after current entry is %d\n", total);
         }
		  |
		  LAB number number number number number
		 {
           $$ = $2 + $3 + $4 + $5 + $6;
		   lab = $2 + $3 + $4 + $5 + $6;
		   printf("Lab total %d\n",lab);
		   // should print
		   total = quiz + reflection + lab;
		   printf("Total grade after current entry is %d\n", total);
         }
		  |
		 REFLECTION number number number number number
		 {
           $$ = $2 + $3 + $4 + $5 + $6;
		   reflection = $2 + $3 + $4 + $5 + $6;
		   printf("Reflection total %d\n",reflection);
		   total = quiz + reflection + lab;
		   printf("Total grade after current entry is %d\n", total);
         }
		  
         ;
number:  DIGIT
         {
           $$ = $1;
           base = ($1==0) ? 8 : 10;
         }    
		 
		 /*
		 |
         number DIGIT
         {
           $$ = base * $1 + $2;
         }
		 */
         ;
%%
main()
{
 return(yyparse());
}
yyerror(s)
char *s;
{
  //fprintf(stderr, "%s\n",s);
}
yywrap()
{
  return(1);
}
