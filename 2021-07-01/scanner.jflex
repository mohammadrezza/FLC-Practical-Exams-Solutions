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

comment     = "(*" ~ "*)"

sep         = "####"

inum      = [1-9][0-9]*      //integer

//sinum     = ("-")?[0-9]+      //singed integer

fnum      = [0-9]+.[0-9]+     //float

//var       = [a-zA-Z_][a-zA-Z0-9_]*     //variable

qstring   = \" ~ \"


//// TOKENS ////
//tokens can be
//  hours HH:MM:SS
//  dates YY/MM/DD
//  binary number
//  hexadecimal number
//
hour = (                                 //HH:MM:SS” between 03:51:47 and 23:45:34
    "03:51:" ((4[7-9])| "5"[0-9])      |
    "03:5" [2-9] ":" [0-5][0-9]             |
    "0"[4-9] ":" [0-5][0-9] ":" [0-5][0-9]     |
    "1"[0-9] ":" [0-5][0-9]  ":" [0-5][0-9]    |
    "2"[0-2] ":" [0-5][0-9]  ":" [0-5][0-9]        |
    "23:"[0-3] ":" [0-5][0-9]             |
    "23:4"[0-5] ":" [0-5][0-9]         |
    "23:45:" [0-2][0-9]                 |
    "23:45:" 3[0-4]
)

tok1Rep=(("aa"|"ab"|"ba"|"bb"){5}("aa"|"ab"|"ba"|"bb"){2}*)?
                                        // 101 and 11010
bin   = "-"(
        (101)                  |       //binary number between 101 to 1010001
        (11[0-1])               |
        (1[0-1] [0-1] [0-1])    |
        (1[0-1][0-1] [0-1] [0-1])   |
        (1[0-1][0-1] [0-1] [0-1] [0-1])   |
        (100[0-1] [0-1] [0-1][0-1])   |
        (101000[0-1])

)
            

token_1   = "X-"{hour}({tok1Rep})

token_2   ="Y"({bin}{4}|{bin}{123}|{bin}{257})

//token_3   =

%%

// Strings part
// "START"            {return sym(sym.START_WD, new String(yytext()));}


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
// "("             {return sym(sym.OP);}            //Open Parenthesis 
// ")"             {return sym(sym.CP);}            //Close Parenthesis 
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
// "|"             {return sym(sym.OR);}            //Pipe 
// "_"             {return sym(sym.US);}            //Underscore 



{inum}             {return sym(sym.INUM, new Integer(yytext()));}
// {sinum}            {return sym(sym.SINUM, new Integer(yytext()));}
{fnum}             {return sym(sym.FNUM, new Float(yytext()));}
// {var}              {return sym(sym.VAR, new String(yytext()));}
{qstring}          {return sym(sym.QSTRING, new String(yytext()));}

{token_1}          {return sym(sym.TOK1);}
{token_2}          {return sym(sym.TOK2);}
// {token_3}          {return sym(sym.TOK3);}

//{var}              {return sym(sym.VAR, yytext());}

{sep}            {return sym(sym.SEP);}

{comment}          {;}
"euro/kg"               {return sym(sym.EURO_KG_WD);}
"kg"               {
    System.out.println( yytext());return sym(sym.KG_WD);}
"euro"              {return sym(sym.EURO_WD);}

\r | \n | \r\n | " " | \t   {;}

.                   {System.out.println("Scanner Error: " + yytext());}