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

comment     = "[[+" ~ "+]]"

sep         = "##"

inum      = [1-9][0-9]*      //integer

qstring   = \" ~ \"

//// TOKENS ////
//tokens can be

date =  (                                    //a date in the format DD/MM/YYYY
                            //“2023/09/22” (or “2023/September/22”) and “2024/02/07” (or “2024/February/07”)
         // January (31 days)
    "2024/01/0"[1-9] | "2024/01/"[1-2][0-9] | "2024/01/30" | "2024/01/31" |
    
    // February (28 days, no leap year (366 days in a year) handling)
    "2024/02/0"[1-7] |
    
    // September (30 days)
    "2023/09/2"[2-9] | "2023/09/30" |
    
    // October (31 days)
    "2023/10/0"[1-9] | "2023/10/"[1-2][0-9] | "2023/10/30" | "2023/10/31" |
    
    // November (30 days)
    "2023/11/0"[1-9] | "2023/11/"[1-2][0-9] | "2023/11/30" |
    
    // December (31 days)
    "2023/12/0"[1-9] | "2023/12/"[1-2][0-9] | "2023/12/30" | "2023/12/31"
        )  

tdate =  (                                    //a date in the format DD/MM/YYYY
                            //“2023/09/22” (or “2023/September/22”) and “2024/02/07” (or “2024/February/07”)
         // January (31 days)
    "2024/January/0"[1-9] | "2024/January/"[1-2][0-9] | "2024/January/30" | "2024/January/31" |
    
    // February (28 days, no leap year (366 days in a year) handling)
    "2024/February/0"[1-7] |
    
    // September (30 days)
    "2023/September/2"[2-9] | "2023/September/30" |
    
    // October (31 days)
    "2023/October/0"[1-9] | "2023/October/"[1-2][0-9] | "2023/October/30" | "2023/October/31" |
    
    // November (30 days)
    "2023/November/0"[1-9] | "2023/November/"[1-2][0-9] | "2023/November/30" |
    
    // December (31 days)
    "2023/December/0"[1-9] | "2023/December/"[1-2][0-9] | "2023/December/30" | "2023/December/31"
        )          

 
odd = (1 | 3 | 5 | 7 | 9)
oddnum = (
    "-273" | "-271"|
    "-2"[0-7]{odd} |
    "-1"[0-9]{odd}  |
    "-"{odd}| 
    {odd}|
    [1-9]{odd}|
    [1-3][0-9]{odd}|
    "4"[0-4]{odd}|
    "45"(1|3|5|7)
)
tok1odd = (({oddnum}"*"){3}{oddnum} | ({oddnum}"*"){6}{oddnum} | ({oddnum}"*"){10}{oddnum})

hex = [1-9a-fA-f][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F] |  [1-9a-fA-f][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F] 
hexsep = ("*" | "$" | "&")
hexrep = ({hex}{hexsep}){3}{hex}({hexsep}{hex}{hexsep}{hex})*

token_1   = "A_"{tok1odd} [ \t]* ";"

token_2   = "B_"({date}|{tdate}) [ \t]* ";"

token_3   = "C_"{hexrep} [ \t]* ";"

%%

// Strings part
"INS"            {return sym(sym.INS_WD, new String(yytext()));}
"CMP"            {return sym(sym.CMP_WD, new String(yytext()));}
"SUM"            {return sym(sym.SUM_WD, new String(yytext()));}



"*"             {return sym(sym.STAR);}          //Asterisk 
"-"             {return sym(sym.DASH);}          //Hyphen/Dash 
"+"             {return sym(sym.PLUS);}          //Plus 
"("             {return sym(sym.OP);}            //Open Parenthesis 
")"             {return sym(sym.CP);}            //Close Parenthesis 
"["             {return sym(sym.OB);}            //Open Bracket 
"]"             {return sym(sym.CB);}            //Close Bracket 
"/"             {return sym(sym.SL);}            //Slash 
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