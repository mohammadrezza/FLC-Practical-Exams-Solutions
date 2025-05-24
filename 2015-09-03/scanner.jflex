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

comment     = "//".*

sep         = ("####")("##")*

inum      = [1-9][0-9]*      //integer

//sinum     = ("-")?[0-9]+      //singed integer

//fnum      = [0-9]+.[0-9]+     //float

//var       = [a-zA-Z_][a-zA-Z0-9_]*     //variable

// real_num = [+-]?(([0-9]+\.[0-9]*)|(\.[0-9]+)) //real_number

qstring   = \" ~ \"

//// TOKENS ////
//tokens can be
//  hours HH:MM:SS
//  dates YY/MM/DD
//  binary number
//  hexadecimal number
//
// hour = (                                 //HH:MM:SS” between 07:13:24 and 17:37:43
//     "07:13:" ((2[4-9])|[3-5][0-9])      |
//     "07:1" [4-9] ":" [0-5][0-9]             |
//     "07:" [2-5][0-9] ":" [0-5][0-9]         |
//     "0"[8-9] ":" [0-5][0-9] ":" [0-5][0-9]     |
//     "1"[0-6] ":" [0-5][0-9]  ":" [0-5][0-9]    |
//     "17:" [0-2][0-9] ":" [0-5][0-9]         |
//     "17:3"[0-6] ":" [0-5][0-9]             |
//     "17:37:" [0-3][0-9]                 |
//     "17:37:" 4[0-3]
// )

bin   = ((101)                  |       //binary number between 101 and 101000
        (11[0-1])               |
        (1[0-1] [0-1] [0-1])    |
        (1[0-1][0-1] [0-1] [0-1])   |
        (100[0-1] [0-1] [0-1]) |
        (101000)
)

date =  (                                    //a date in the format DD/MM/YYYY 2015/12/12 and 2016/03/13,
         // January (31 days) 
    "2015/12/1"[2-9] | "2015/12/2"[0-9] | "2015/12/30" | "2015/12/31" |
    "2016/01/0"[1-4] |"2016/01/0"[6-9] | "2016/01/"[1-2][0-9] | "2016/01/30" | "2016/01/31" |
    
    // February (28 days, no leap year (366 days in a year) handling)
    "2016/02/0"[1-9] | "2016/02/"[1-2][0-9] |
    
    // March (31 days)
    "2025/03/0"[1-9] | "2025/03/1"[0-3] 
        )    

// hex =    (                      //hexadecimal number is between 3b and aE3
//     ("3"[b-fB-F])   |
//     ([4-9][0-9a-fA-F]) |
//     ([a-fA-f][0-9a-fA-F]) |
//     (([0-9])[0-9a-fA-F][0-9a-fA-F])   |
//     (("a"|"A")([0-9a-dA-D])[0-9a-fA-F])|
//     (("a"|"A")("e"|"E")[0-3])   
// )  

wordrep = (
    {word}{word} | {word}{word}{word}
)

word = ("**"|"???")

oddnum = (
    "-3"[0-5] |
    "-"[1-2][0-9] |
    "-"[1-9] |
    "0" |
    [1-9] |
    [1-9][0-9]|
    [1-2][0-9][0-9]|
    "3"[0-2][0-9] |
    "33"[0-3]
)

datesep = "-" | "+"

token_1   = (("%%%%%"("%%")*) | {wordrep}) {oddnum}?

token_2   = {date}{datesep}{date}

token_3   ="$"{bin}

%%

// Strings part
// "START"            {return sym(sym.START_WD, new String(yytext()));}
"PART"            {return sym(sym.PART_WD, new String(yytext()));}
"m/s"            {return sym(sym.MS_WD, new String(yytext()));}
"PRINT_MIN_MAX"            {return sym(sym.PRINT_MIN_MAX_WD, new String(yytext()));}
"m"            {return sym(sym.M_WD, new String(yytext()));}


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
"{"             {return sym(sym.OC);}            //Open Curly Brace 
"}"             {return sym(sym.CC);}            //Close Curly Brace 
// ">"             {return sym(sym.GT);}            //Greater Than 
// "<"             {return sym(sym.LT);}            //Less Than 
// "/"             {return sym(sym.SL);}            //Slash 
// \\              {return sym(sym.BSL);}           //Backslash 
// "."             {return sym(sym.DOT);}           //Period / Dot 
":"             {return sym(sym.CO);}            //Colon 
","             {return sym(sym.CM);}            //Comma 
";"             {return sym(sym.SC);}            //Semicolon 
// \'              {return sym(sym.QU);}            //Single Quote 
// \"              {return sym(sym.DQU);}           //Double Quote 
// \`              {return sym(sym.GRAVE);}         //Grave Accent / Backtick
// "~"             {return sym(sym.TIL);}           //Tilde 
"|"             {return sym(sym.OR);}            //Pipe 
// "_"             {return sym(sym.US);}            //Underscore 
"->"             {return sym(sym.NEXT);}             



{inum}             {return sym(sym.INUM, new Integer(yytext()));}
// {sinum}            {return sym(sym.SINUM, new Integer(yytext()));}
// {fnum}             {return sym(sym.FNUM, new Float(yytext()));}
// {var}              {return sym(sym.VAR, new String(yytext()));}
// {real_num}              {return sym(sym.REAL_NUM, new String(yytext()));}
{qstring}          {return sym(sym.QSTRING, new String(yytext()));}

{token_1}          {return sym(sym.TOK1);}
{token_2}          {return sym(sym.TOK2);}
{token_3}          {return sym(sym.TOK3);}

//{var}              {return sym(sym.VAR, yytext());}

{sep}            {return sym(sym.SEP);}

{comment}          {;}

\r | \n | \r\n | " " | \t   {;}

.                   {System.out.println("Scanner Error: " + yytext());}