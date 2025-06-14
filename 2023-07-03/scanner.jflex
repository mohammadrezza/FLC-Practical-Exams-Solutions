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

comment     = "<*" ~ "*>"

sep         = (\$\$\$)(\$\$)*

inum      = [1-9][0-9]*      //integer

//sinum     = ("-")?[0-9]+      //singed integer

//fnum      = [0-9]+.[0-9]+     //float

//var       = [a-zA-Z_][a-zA-Z0-9_]*     //variable

qstring   = \" ~ \"

//// TOKENS ////
//  tokens can be
//  hours HH:MM:SS
//  dates YYYY/MM/DD
//  January, February, March, April, May, June, July, August, September, October, November, December
//  binary number
//  hexadecimal number
//  [0-9]|[a-fA-F]

even = "-1"[0-8] |
       "-"?[0-9] |
       [1-9][0-9] |
       "1"[0-9][0-9] |
       "2"[0-7][0-9] |
       "28"[0-6]


token_1   = ("!!!!")({even}|("?????")("??")*)

year = "2023"
// 02/07/2023
// 06/10/2023

token_2   = "0"[2-9]"/07/"{year} | 
            ("0"[0-9] | [1-2][0-9] | "30" | "31")"/07/"{year} |
            ("0"[0-9] | [1-2][0-9] | "30" | "31")"/08/"{year} |
            ("0"[0-9] | [1-2][0-9] | "30")"/09/"{year} |
            "0"[0-6]"/10/"{year} |

            {year}"/07/0"[2-9] | 
            {year}"/07/"("0"[0-9] | [1-2][0-9] | "30" | "31") |
            {year}"/08/"("0"[0-9] | [1-2][0-9] | "30" | "31") |
            {year}"/09/"("0"[0-9] | [1-2][0-9] | "30") |
            {year}"/10/0"[0-6] 
            
// 07:37:19
// 22:39:23

token_3   = "07:37"(":19")? |
            "07:37"(":"[2-5][0-9])? |
            "07:3"[8-9](":"[0-5][0-9])? |
            "07:"[4-5][0-9](":"[0-5][0-9])? |
            "0"[8-9]":"[0-5][0-9](":"[0-5][0-9])? |
            "1"[0-9]":"[0-5][0-9](":"[0-5][0-9])? |
            "2"[0-1]":"[0-5][0-9](":"[0-5][0-9])? |
            "22:"[0-2][0-9](":"[0-5][0-9])? |
            "22:3"[0-8](":"[0-5][0-9])? |
            "22:39"(":"[0-1][0-9])? |
            "22:39"(":2"[0-3])?            

%%

// Strings part
// "START"            {return sym(sym.START_WD, new String(yytext()));}
"house"            {return sym(sym.HOUSE_WD, new String(yytext()));}
"start"            {return sym(sym.START_WD, new String(yytext()));}
"end"               {return sym(sym.END_WD, new String(yytext()));}
"print"              {return sym(sym.PRINT_WD, new String(yytext()));}
"if"               {return sym(sym.IF_WD, new String(yytext()));}
"fi"               {return sym(sym.FI_WD, new String(yytext()));}
"and"               {return sym(sym.AND_WD, new String(yytext()));}
"or"                {return sym(sym.OR_WD, new String(yytext()));}
"not"               {return sym(sym.NOT_WD, new String(yytext()));}
"then"               {return sym(sym.THEN_WD, new String(yytext()));}


// "?"             {return sym(sym.QUM);}           //Question Mark 
// "!"             {return sym(sym.EXM);}           //Exclamation Mark 
// "@"             {return sym(sym.ATM);}           //At Symbol 
// "#"             {return sym(sym.HAM);}           //Hash / Pound 
// "$"             {return sym(sym.DOM);}           //Dollar Mark 
// "%"             {return sym(sym.PAM);}           //Percent 
// "^"             {return sym(sym.CIM);}           //Caret (Circumflex) 
// "&"             {return sym(sym.AND);}           //Ampersand 
// "*"             {return sym(sym.STAR);}          //Asterisk 
// "-"             {return sym(sym.DASH);}          //Hyphen/Dash 
"="             {return sym(sym.EQ);}            //Equal Sign 
// "+"             {return sym(sym.PLUS);}          //Plus 
"("             {return sym(sym.OP);}            //Open Parenthesis 
")"             {return sym(sym.CP);}            //Close Parenthesis 
// "["             {return sym(sym.OB);}            //Open Bracket 
// "]"             {return sym(sym.CB);}            //Close Bracket 
// "{"             {return sym(sym.OC);}            //Open Curly Brace 
// "}"             {return sym(sym.CC);}            //Close Curly Brace 
// ">"             {return sym(sym.GT);}            //Greater Than 
// "<"             {return sym(sym.LT);}            //Less Than 
// "/"             {return sym(sym.SL);}            //Slash 
// \\              {return sym(sym.BSL);}           //Backslash 
"."             {return sym(sym.DOT);}           //Period / Dot 
// ":"             {return sym(sym.CO);}            //Colon 
","             {return sym(sym.CM);}            //Comma 
";"             {return sym(sym.SC);}            //Semicolon 
// \'              {return sym(sym.QU);}            //Single Quote 
// \"              {return sym(sym.DQU);}           //Double Quote 
// \`              {return sym(sym.GRAVE);}         //Grave Accent / Backtick
// "~"             {return sym(sym.TIL);}           //Tilde 
// "|"             {return sym(sym.OR);}            //Pipe 
// "_"             {return sym(sym.US);}            //Underscore 


{inum}             {return sym(sym.INUM, new Integer(yytext()));}
// {sinum}            {return sym(sym.SINUM, new Integer(yytext()));}
// {fnum}             {return sym(sym.FNUM, new Float(yytext()));}
// {var}              {return sym(sym.VAR, new String(yytext()));}
{qstring}          {return sym(sym.QSTRING, new String(yytext()));}


{token_1}          {return sym(sym.TOKEN1);}
{token_2}          {return sym(sym.TOKEN2);}
{token_3}          {return sym(sym.TOKEN3);}


{sep}            {return sym(sym.SEP);}

{comment}          {;}

\r | \n | \r\n | " " | \t   {;}

.                   {System.out.println("Scanner Error: " + yytext());}