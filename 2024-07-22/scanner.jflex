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

comment     = "<<<" ~ ">>>" | "//".*

sep         = "####"

inum      = [1-9][0-9]*      //integer


var       = [a-zA-Z_][a-zA-Z0-9_]*     //variable


qstring   = \' ~ \'

//// TOKENS ////
//tokens can be
//  hours HH:MM:SS
//  dates YY/MM/DD
//  binary number
//  hexadecimal number
//
hour = (                                 //HH:MM:SS” between 07:13:24 and 17:37:43
                                                          //10:07 and 18:23
    "10:0" [7-9]     |
    "10:" [1-5][0-9]      |
    "1"[1-7]":" [0-5][0-9]         |
    "18:" [0-1][0-9] |
    "18:2"[0-3]    
    
)


 date =  (                                    // a date in the format DD/MM/YYYY
                                                    //13-April-2024 to 19-September-2024
          // April (30 days)
    "1"[3-9]"-April-2024" | "2"[0-9]"-April-2024" | "30-April-2024" |

          // May (31 days)
    "0"[1-9]"-May-2024" | [1-2][0-9]"-May-2024" | "30-May-2024" | "31-May-2024" |

         // June (30 days)
    "0"[1-9]"-June-2024" | [1-2][0-9]"-June-2024" | "30-June-2024" |

          // July (31 days)
    "0"[1-9]"-July-2024" | [1-2][0-9]"-July-2024" | "30-July-2024" | "31-July-2024" |

         // August (31 days)
    "0"[1-9]"-August-2024" | [1-2][0-9]"-August-2024" | "30-August-2024" | "31-August-2024" |

         // September (30 days)
    "0"[1-9]"-September-2024" | [1][0-9]"-September-2024" 
 )


hex =    (                      //hexadecimal number is 
      "0f"|"0F"       |                                           //0f and 1AB
    ([1-9a-fA-F][0-9a-fA-F])   |
    "1"[0-9][0-9a-fA-F] |
    ("1a"|"1A")[0-9a-bA-B]
)  


tok1rep = ("++" | "--"){3,5}

upper = [A-Z]([A-Z][A-Z])*

tok2word = ("cd" | "ef" | "gh" | "ij"){3} | ("cd" | "ef" | "gh" | "ij"){6}

tok2sep = "&" | "?" | "!"
tok2rep = {tok2word} {tok2sep}{tok2word} {tok2sep}{tok2word} ({tok2sep}{tok2word} {tok2sep}{tok2word})*

token_1   = "A:"({hex}|"abc")({tok1rep}){upper}

token_2   = "B:"{tok2rep}

token_3   = "C:"{date} (":"{hour})?

%%

// Strings part
 "->"            {return sym(sym.EQC, new String(yytext()));}
 "MAX"            {return sym(sym.MAX_WD, new String(yytext()));}
 "IF"            {return sym(sym.IF_WD, new String(yytext()));}
 "TRUE_STATEMENT"            {return sym(sym.TRUE_WD, new String(yytext()));}
 "FALSE_STATEMENT"            {return sym(sym.FALSE_WD, new String(yytext()));}
 "AND"            {return sym(sym.AND_WD, new String(yytext()));}
 "OR"            {return sym(sym.OR_WD, new String(yytext()));}
 "NOT"            {return sym(sym.NOT_WD, new String(yytext()));}
 "T"            {return sym(sym.T_WD, new String(yytext()));}
 "F"            {return sym(sym.F_WD, new String(yytext()));}
 "=="            {return sym(sym.EQQ_WD, new String(yytext()));}


"("             {return sym(sym.OP);}            //Open Parenthesis 
")"             {return sym(sym.CP);}            //Close Parenthesis 
"["             {return sym(sym.OB);}            //Open Bracket 
"]"             {return sym(sym.CB);}            //Close Bracket 
","             {return sym(sym.CM);}            //Comma 
";"             {return sym(sym.SC);}            //Semicolon 

{var}              {return sym(sym.VAR, new String(yytext()));}
{qstring}          {return sym(sym.QSTRING, new String(yytext()));}

{token_1}          {return sym(sym.TOK1);}
{token_2}          {return sym(sym.TOK2);}
{token_3}          {return sym(sym.TOK3);}


{sep}            {return sym(sym.SEP);}

{comment}          {;}

\r | \n | \r\n | " " | \t   {;}

.                   {System.out.println("Scanner Error: " + yytext());}