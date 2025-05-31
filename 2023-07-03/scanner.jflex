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

// real_num = (([0-9]+\.[0-9]*)|(\.[0-9]+)) //real_number

qstring   = \" ~ \"

//// TOKENS ////
//tokens can be
//  hours HH:MM:SS
//  dates YY/MM/DD
//  binary number
//  hexadecimal number
//
hour = (                                 //HH:MM:SS” between 07:13:24 and 17:37:43
                                                            //07:37:19 and 22:39:23
    "07:37:" ((19)|[2-5][0-9])      |
    "07:3" [8-9] ":" [0-5][0-9]             |
    "07:" [4-5][0-9] ":" [0-5][0-9]         |
    "0"[8-9] ":" [0-5][0-9] ":" [0-5][0-9]     |
    "1"[0-9] ":" [0-5][0-9]  ":" [0-5][0-9]    |
    "2"[0-1] ":" [0-5][0-9]  ":" [0-5][0-9] |
    "22"     ":"  [0-2][0-9] ":" [0-5][0-9] |
    "22:3"[0-8] ":" [0-5][0-9] |
    "22:39:" [0-1][0-9] |
    "22:39:2" [0-3]

)
hour2 = (                                 //HH:MM” between 07:13:24 and 17:37:43
                                                            //07:37:19 and 22:39:23
    "07:37"      |
    "07:3" [8-9]            |
    "07:" [4-5][0-9]        |
    "0"[8-9] ":" [0-5][0-9]      |
    "1"[0-9] ":" [0-5][0-9]     |
    "2"[0-1] ":" [0-5][0-9]  |
    "22"     ":"  [0-2][0-9]  |
    "22:3"[0-8]|
    "22:39"

)

// bin   = ((101)                  |       //binary number between 101 and 11010
//         (11[0-1])               |
//         (1[0-1] [0-1] [0-1])    |
//         (10[0-1] [0-1] [0-1])   |
//         (1100[0-1])             |
//         (11010)) 

date =  (                                    //a date in the format DD/MM/YYYY 02/07/2023 --06/10/2023
    // July (31 days)
    "2023/07/0"[2-9] | "2023/07/"[1-2][0-9] | "2023/07/30" | "2023/07/31" |
    
    // August (31 days)
    "2023/08/0"[1-9] | "2023/08/"[1-2][0-9] | "2023/08/30" | "2023/08/31" |
    
    // September (30 days)
    "2023/09/0"[1-9] | "2023/09/"[1-2][0-9] | "2023/09/30" |
    
    // October (31 days)
    "2023/10/0"[1-6] 
        )  


 date2 =  (                                    // a date in the format DD/MM/YYYY
          // July (31 days)
    "0"[2-9]"/07/2023" | [1-2][0-9]"/07/2023" | "30/07/2023" | "31/07/2023" |

         // August (31 days)
    "0"[1-9]"/08/2023" | [1-2][0-9]"/08/2023" | "30/08/2023" | "31/08/2023" |

         // September (30 days)
    "0"[1-9]"/09/2023" | [1-2][0-9]"/09/2023" | "30/09/2023" |

          // October (31 days)
    "0"[1-6]"/10/2023" 
 )


// hex =    (                      //hexadecimal number is between 3b and aE3
//     ("3"[b-fB-F])   |
//     ([4-9][0-9a-fA-F]) |
//     ([a-fA-f][0-9a-fA-F]) |
//     (([0-9])[0-9a-fA-F][0-9a-fA-F])   |
//     (("a"|"A")([0-9a-dA-D])[0-9a-fA-F])|
//     (("a"|"A")("e"|"E")[0-3])   
// )  
evennum = (2 | 4 | 6 | 8)
num = (                     //-18 to 286
"-1"({evennum}|0) |
"-"{evennum} |
"0"|
{evennum} |
[1-9]{evennum}|
"1"[0-9]{evennum}|
"2"[0-7]{evennum}|
"28"(2 | 4 | 6)
)

token_1   = ((("!!!!""!!"*){num})|("?????""??"*))[ \t]* ";"

token_2   = ({date} | {date2}) [ \t]* ";"

token_3   = ({hour} | {hour2}) [ \t]* ";"

%%

// Strings part
// "START"            {return sym(sym.START_WD, new String(yytext()));}
"house"            {return sym(sym.HOUSE_WD, new String(yytext()));}
"start"            {return sym(sym.START_WD, new String(yytext()));}
"end"            {return sym(sym.END_WD, new String(yytext()));}
"if"            {return sym(sym.IF_WD, new String(yytext()));}
"then"            {return sym(sym.THEN_WD, new String(yytext()));}
"fi"            {return sym(sym.FI_WD, new String(yytext()));}
"and"            {return sym(sym.AND, new String(yytext()));}
"or"            {return sym(sym.OR, new String(yytext()));}
"not"            {return sym(sym.NOT, new String(yytext()));}
"=="            {return sym(sym.EQQ, new String(yytext()));}
"print"            {return sym(sym.PRINT_WD, new String(yytext()));}


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
// "="             {return sym(sym.EQ);}            //Equal Sign 
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
// {real_num}              {return sym(sym.REAL_NUM, new String(yytext()));}
{qstring}          {return sym(sym.QSTRING, new String(yytext()));}

{token_1}          {return sym(sym.TOK1);}
{token_2}          {return sym(sym.TOK2);}
{token_3}          {return sym(sym.TOK3);}


{sep}            {return sym(sym.SEP);}

{comment}          {;}

\r | \n | \r\n | " " | \t   {;}

.                   {System.out.println("Scanner Error: " + yytext());}