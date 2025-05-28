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

comment     = "+--" ~ "--+"

sep         = "===="

inum      = [1-9][0-9]*      //integer

qstring   = \" ~ \"

//// TOKENS ////
//tokens can be
//  hours HH:MM:SS
//  dates YY/MM/DD
//  binary number
//  hexadecimal number
//
hour = (                                 //HH:MM:SS” between
                                                            // 08:00 and 17:35
    "0"[8-9] ":" [0-5][0-9]|
    "1"[0-6] ":" [0-5][0-9]   |
    "17:" [0-2][0-9]       |
    "17:3"[0-5]
)

 date =  (                                    // a date in the format DD/MM/YYYY 03/09/2021 and 05/03/2022
          // January (31 days)
    "0"[1-9]"/01/2022" | [1-2][0-9]"/01/2022" | "30/01/2022" | "31/01/2022" |

    // February (28 days)
    "0"[1-9]"/02/2022" | [1-2][0-8]"/02/2022" |

          // March (31 days)
    "0"[1-5]"/03/2022" |
         // September (30 days)
    "0"[3-9]"/09/2021" | [1-2][0-9]"/09/2021" | "30/09/2021" |

          // October (31 days)
    "0"[1-9]"/10/2021" | [1-2][0-9]"/10/2021" | "30/10/2021" | "31/10/2021" |

          // November (30 days)
    "0"[1-9]"/11/2021" | [1-2][0-9]"/11/2021" | "30/11/2021" |

          // December (31 days)
    "0"[1-9]"/12/2021" | [1-2][0-9]"/12/2021" | "30/12/2021" | "31/12/2021"
 )
 

hex =    (                      //hexadecimal number is between 3b and aE3
    ("3"[b-fB-F])   |
    ([4-9][0-9a-fA-F]) |
    ([a-fA-f][0-9a-fA-F]) |
    (([0-9])[0-9a-fA-F][0-9a-fA-F])   |
    (("a"|"A")([0-9a-dA-D])[0-9a-fA-F])|
    (("a"|"A")("e"|"E")[0-3])   
)  
hexsep = "+" | "-" | "*"

hexrep = ({hex}{hexsep}{hex}{hexsep}{hex}{hexsep}{hex}{hexsep}{hex}{hexsep}{hex})

oddw = (
    ([a-z] [a-z] [a-z] [a-z] [a-z]) ([a-z][a-z])*
)

word = ("00"|"01"|"10"|"11")
wordrep = (
{word}{word}{word}{word}*
)?

token_1   = "I_"{date}(":"{hour})? [ \t]* ";"

token_2   = "J_"({hexrep}({hexsep}{hex})*) [ \t]* ";"

token_3   = "K_"{oddw}{wordrep} [ \t]* ";"

%%

// Strings part
// "START"            {return sym(sym.START_WD, new String(yytext()));}
"INIT"            {return sym(sym.INIT_WD, new String(yytext()));}
"HEIGHT"            {return sym(sym.HEIGHT_WD, new String(yytext()));}
"SPEED"            {return sym(sym.SPEED_WD, new String(yytext()));}
"SUM"            {return sym(sym.SUM_WD, new String(yytext()));}
"MUL"            {return sym(sym.MUL_WD, new String(yytext()));}
"COND"            {return sym(sym.COND_WD, new String(yytext()));}
"UPDATE"            {return sym(sym.UPDATE_WD, new String(yytext()));}
"DONE"            {return sym(sym.DONE_WD, new String(yytext()));}



"="             {return sym(sym.EQ);}            //Equal Sign 
"["             {return sym(sym.OB);}            //Open Bracket 
"]"             {return sym(sym.CB);}            //Close Bracket 
">"             {return sym(sym.GT);}            //Greater Than 

","             {return sym(sym.CM);}            //Comma 
";"             {return sym(sym.SC);}            //Semicolon 
    



{inum}             {return sym(sym.INUM, new Integer(yytext()));}

{token_1}          {return sym(sym.TOK1);}
{token_2}          {return sym(sym.TOK2);}
{token_3}          {return sym(sym.TOK3);}


{sep}            {return sym(sym.SEP);}

{comment}          {;}

\r | \n | \r\n | " " | \t   {;}

.                   {System.out.println("Scanner Error: " + yytext());}