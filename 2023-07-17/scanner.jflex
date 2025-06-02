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

comment     = "{{" ~ "}}" | "//".*

sep         = "***"

inum      = [1-9][0-9]*      //integer


real_num = (([0-9]+\.[0-9]*)|(\.[0-9]+)) //real_number

qstring   = \" ~ \"

//// TOKENS ////
                                                    //05/10/2023 to 03/03/2024
 date =  (                                    // a date in the format DD/MM/YYYY
          // January (31 days)
    "0"[1-9]"/01/2024" | [1-2][0-9]"/01/2024" | "30/01/2024" | "31/01/2024" |

    // February (29 days)
    "0"[1-9]"/02/2024" | [1-2][0-9]"/02/2024" |

          // March (31 days)
    "0"[1-3]"/03/2024" |

          // October (31 days)
    "0"[5-9]"/10/2023" | [1-2][0-9]"/10/2023" | "30/10/2023" | "31/10/2023" |

          // November (30 days)
    "0"[1-9]"/11/2023" | [1-2][0-9]"/11/2023" | "30/11/2023" |

          // December (31 days)
    "0"[1-9]"/12/2023" | [1-2][0-9]"/12/2023" | "30/12/2023" | "31/12/2023"
 )

                                    //27A and 12b3
hex =    (                      //hexadecimal number is between 3b and aE3
    ("27"[a-fA-F])   |
    ("2"[8-9a-fA-F][0-9a-fA-F]) |
    ([3-9a-fA-F][0-9a-fA-F][0-9a-fA-F]) |
    ("11"[0-9a-fA-F][0-9a-fA-F]) |
    ("12"[0-9a-aA-a][0-9a-fA-F]) |
    ("12b"[0-3])  
)  
alpha = ([a-zA-Z]{5}([a-zA-Z][a-zA-Z])*)

octet       = (
                [0-9]       | //0-9
                [1-9][0-9]  |  //10-99
                "1"[0-9][0-9]  |  //100-199
                "2"[0-4][0-9]  |  //200-249
                "25"[0-5]    //250-255
            )
digi = [0-9][0-9][0-9][0-9] ([0-9][0-9])?
digisep = "-" | "+"


ip_address  = {octet}"."{octet}"."{octet}"."{octet}

token_1   = {hex}"*"{alpha}"-"(("****""**"*)|"y""*""**"*"y")? [ \t]* ";"

token_2   = {ip_address}"-"{date} [ \t]* ";"

token_3   = {digi}{digisep}{digi}{digisep}{digi} ({digisep}{digi}{digisep}{digi})? [ \t]* ";"

%%

// Strings part
"euro"            {return sym(sym.EURO_WD, new String(yytext()));}


"%"             {return sym(sym.PAM);}           //Percent 
"-"             {return sym(sym.DASH);}          //Hyphen/Dash 
","             {return sym(sym.CM);}            //Comma 
";"             {return sym(sym.SC);}            //Semicolon 



{inum}             {return sym(sym.INUM, new Integer(yytext()));}
{real_num}              {return sym(sym.REAL_NUM, new Double(yytext()));}
{qstring}          {return sym(sym.QSTRING, new String(yytext()));}

{token_1}          {return sym(sym.TOK1);}
{token_2}          {return sym(sym.TOK2);}
{token_3}          {return sym(sym.TOK3);}


{sep}            {return sym(sym.SEP);}

{comment}          {;}

\r | \n | \r\n | " " | \t   {;}

.                   {System.out.println("Scanner Error: " + yytext());}