import java_cup.runtime.*;

%%

%unicode
%cup
%line
%column

%{
    private Symbol sym(int type){
        return new Symbol(type, yyline, yycolumn);
    }

    private Symbol sym(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
%}

nl          = \r | \n | \r\n

comment     = "(++" ~ "++)"

sep         = (\$\$)

inum      = [1-9][0-9]*      //integer

var       = [a-zA-Z_][a-zA-Z0-9_]*     //variable


qstring   = \" ~ \"

//// TOKENS ////
hour = (                                 //HH:MM:SS” between 07:13:24 and 17:37:43
    "07:13:" ((2[4-9])|[3-5][0-9])      |
    "07:1" [4-9] ":" [0-5][0-9]             |
    "07:" [2-5][0-9] ":" [0-5][0-9]         |
    "0"[8-9] ":" [0-5][0-9] ":" [0-5][0-9]     |
    "1"[0-6] ":" [0-5][0-9]  ":" [0-5][0-9]    |
    "17:" [0-2][0-9] ":" [0-5][0-9]         |
    "17:3"[0-6] ":" [0-5][0-9]             |
    "17:37:" [0-3][0-9]                 |
    "17:37:" 4[0-3]
)

bin   = ((101)                  |       //binary number between 101 and 11010
        (11[0-1])               |
        (1[0-1] [0-1] [0-1])    |
        (10[0-1] [0-1] [0-1])   |
        (1100[0-1])             |
        (11010)) 

hexev =("0"|"2"|"4"|"6"|"8"|"a"|"A"|"c"|"C"|"e"|"E")
hex =    (                      //hexadecimal number is between −5C and aB6
    ("-5"{hexev})|
    ("-"[1-4]{hexev})   |
    ("-"("2"|"4"|"6"|"8"|"a"|"A"|"c"|"C"|"e"|"E")) |
    ({hexev})              |                                                     
    ([1-9a-fA-F]{hexev}) |
    ([0-9][0-9a-fA-F]{hexev}) |
    ("a"([0-9]|"a"|"A"){hexev}) |
    ((("aE")|("ae")|("AE")|("Ae"))[0|2])
)  

tok1w = ("a" | "b" | "c")
word = {tok1w}{7}({tok1w}{tok1w})*

token_1   = {word}"#"{hex}?[ \t]* ";"

token_2   ={hour}":"{bin}[ \t]* ";"


%%

// Strings part
"compare"            {return sym(sym.COMPARE_WD, new String(yytext()));}
"with"            {return sym(sym.WITH_WD, new String(yytext()));}
"end"            {return sym(sym.END_WD, new String(yytext()));}
"print"            {return sym(sym.PRINT_WD, new String(yytext()));}

"*"             {return sym(sym.STAR);}          //Asterisk 
"-"             {return sym(sym.DASH);}          //Hyphen/Dash 
"="             {return sym(sym.EQ);}            //Equal Sign 
"+"             {return sym(sym.PLUS);}          //Plus 
"("             {return sym(sym.OP);}            //Open Parenthesis 
")"             {return sym(sym.CP);}            //Close Parenthesis  
"{"             {return sym(sym.OC);}            //Open Curly Brace 
"}"             {return sym(sym.CC);}            //Close Curly Brace 
"/"             {return sym(sym.SL);}            //Slash 
";"             {return sym(sym.SC);}            //Semicolon 



{inum}             {return sym(sym.INUM, new Integer(yytext()));}

{token_1}          {return sym(sym.TOK1);}
{token_2}          {return sym(sym.TOK2);}

{var}              {return sym(sym.VAR, yytext());}

{sep}            {return sym(sym.SEP);}

{comment}          {;}

\r | \n | \r\n | " " | \t   {;}

.                   {System.out.println("Scanner Error: " + yytext());}