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

comment     = "[[--" ~ "--]]"

sep         = "===="


var       = [a-zA-Z_][a-zA-Z0-9_]*     //variable


qstring   = \" ~ \"

//// TOKENS ////

 date =  (                                    // a date in the format DD/MM/YYYY 04/July/2022 and 15/January/2023
          // January (31 days)
    "0"[1-9]"/January/2023" | "1"[0-5]"/January/2023" | "30/January/2023" | "31/January/2023" |

          // July (31 days)
    "0"[4-9]"/July/2022" | [1-2][0-9]"/July/2022" | "30/July/2022" | "31/July/2022" |

         // August (31 days)
    "0"[1-9]"/August/2022" | [1-2][0-9]"/August/2022" | "30/August/2022" | "31/August/2022" |

         // September (30 days)
    "0"[1-9]"/September/2022" | [1-2][0-9]"/September/2022" | "30/September/2022" |

          // October (31 days)
    "0"[1-9]"/October/2022" | [1-2][0-9]"/October/2022" | "30/October/2022" | "31/October/2022" |

          // November (30 days)
    "0"[1-9]"/November/2022" | [1-2][0-9]"/November/2022" | "30/November/2022" |

          // December (31 days)
    "0"[1-9]"/December/2022" | [1-2][0-9]"/December/2022" | "30/December/2022" | "31/December/2022"
 )


hex =    (                      //hexadecimal number is between 2A and bC3
    ("2"[a-fA-F])   |
    ([3-9][0-9a-fA-F]) |
    ([a-fA-f][0-9a-fA-F]) |
    (([0-9])[0-9a-fA-F][0-9a-fA-F])   |
    (("a"|"A")([0-9a-fA-F])[0-9a-fA-F])|
    (("b"|"B")([0-9a-bA-B])[0-9a-fA-F])|
    (("b"|"B")("c"|"C")[0-3])
      
)  

word =("XX" | "YY" | "ZZ")
wordrep = {word}{4,15}

hexsep = ("+" | "/" | "*")

token_1   = "D-"{date}("-"{date})? [ \t]* ";"

token_2   = "R-" {wordrep}("????"("??"*))? [ \t]* ";"

token_3   = "N-"({hex}{hexsep}{hex}{hexsep}{hex}{hexsep}{hex}{hexsep}{hex})({hexsep}{hex}{hexsep}{hex})* [ \t]* ";"

%%

// Strings part
"TRUE"            {return sym(sym.TRUE_WD, new String(yytext()));}
"FALSE"            {return sym(sym.FALSE_WD, new String(yytext()));}
"IF"            {return sym(sym.IF_WD, new String(yytext()));}
"FI"            {return sym(sym.FI_WD, new String(yytext()));}
"OR"            {return sym(sym.OR_WD, new String(yytext()));}
"AND"            {return sym(sym.AND_WD, new String(yytext()));}
"DO"            {return sym(sym.DO_WD, new String(yytext()));}
"DONE"            {return sym(sym.DONE_WD, new String(yytext()));}
"PRINT"            {return sym(sym.PRINT_WD, new String(yytext()));}


"!"             {return sym(sym.NOT);}           //Exclamation Mark 
"&"             {return sym(sym.AND);}           //Ampersand 
"="             {return sym(sym.EQ);}            //Equal Sign 
"("             {return sym(sym.OP);}            //Open Parenthesis 
")"             {return sym(sym.CP);}            //Close Parenthesis 
";"             {return sym(sym.SC);}            //Semicolon 
"|"             {return sym(sym.OR);}            //Pipe 



{var}              {return sym(sym.VAR, new String(yytext()));}
{qstring}          {return sym(sym.QSTRING, new String(yytext()));}

{token_1}          {return sym(sym.TOK1);}
{token_2}          {return sym(sym.TOK2);}
{token_3}          {return sym(sym.TOK3);}


{sep}            {return sym(sym.SEP);}

{comment}          {;}

\r | \n | \r\n | " " | \t   {;}

.                   {System.out.println("Scanner Error: " + yytext());}