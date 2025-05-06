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

//inum      = [1-9][0-9]*      //integer

//sinum     = ("-")?[0-9]+      //singed integer

//fnum      = [0-9]+.[0-9]+     //float

var       = [a-zA-Z_][a-zA-Z0-9_]*     //variable

qstring   = \" ~ \"

//// TOKENS ////
//tokens can be
//  hours HH:MM:SS
//  dates YY/MM/DD
//  binary number
//  hexadecimal number
//

token_1   = "D-"{date}("-"{date})?

date = "0"[4-9]"/July/2022" |
       ([1-2][0-9]|"30"|"31")"/"("July")"/2022" |
       ("0"[1-9]|[1-2][0-9]|"30"|"31")"/"("August"|"October"|"December")"/2022" |
       ("0"[1-9]|[1-2][0-9]|"30")"/"("September"|"November")"/2022" |
       ("0"[1-9]|["1"[0-5]])"/January/2023"

token_2   =  "R-"{words}{4,15}("????"("??")*)?

words = "XX" | "YY" | "ZZ"

token_3  = "N-"{hex}({hexS}{hex}){4}({hexS}{hex}{hexS}{hex})*

hex = "2"[a-fA-F] |
      ([3-9][a-fA-F])([0-9]|[a-fA-F]) |
      ([1-9]|"a"|"A")([0-9]|[a-fA-F])([0-9]|[a-fA-F]) |
      ("b"|"B")([0-9]|[a-bA-B])([0-9]|[a-fA-F]) |
      ("b"|"B")(("c"|"C"))[0-3]

hexS = ("+" | "/" | "*")

%%

// Strings part
// "START"            {return sym(sym.START_WD, new String(yytext()));}
"TRUE"            {return sym(sym.TRUE_WD, new String(yytext()));}
"FALSE"            {return sym(sym.FALSE_WD, new String(yytext()));}
"IF"            {return sym(sym.IF_WD, new String(yytext()));}
"FI"            {return sym(sym.FI_WD, new String(yytext()));}
"AND"            {return sym(sym.AND_WD, new String(yytext()));}
"OR"            {return sym(sym.OR_WD, new String(yytext()));}
"DO"            {return sym(sym.DO_WD, new String(yytext()));}
"PRINT"            {return sym(sym.PRINT_WD, new String(yytext()));}
"DONE"            {return sym(sym.DONE_WD, new String(yytext()));}


// "?"             {return sym(sym.QUM);}           //Question Mark 
"!"             {return sym(sym.EXM);}           //Exclamation Mark 
// "@"             {return sym(sym.ATM);}           //At Symbol 
// "#"             {return sym(sym.HAM);}           //Hash / Pound 
// "$"             {return sym(sym.DOM);}           //Dollar Mark 
// "%"             {return sym(sym.PAM);}           //Percent 
// "^"             {return sym(sym.CIM);}           //Caret (Circumflex) 
"&"             {return sym(sym.AND);}           //Ampersand 
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
// "."             {return sym(sym.DOT);}           //Period / Dot 
// ":"             {return sym(sym.CO);}            //Colon 
// ","             {return sym(sym.CM);}            //Comma 
";"             {return sym(sym.SC);}            //Semicolon 
// \'              {return sym(sym.QU);}            //Single Quote 
// \"              {return sym(sym.DQU);}           //Double Quote 
// \`              {return sym(sym.GRAVE);}         //Grave Accent / Backtick
// "~"             {return sym(sym.TIL);}           //Tilde 
"|"             {return sym(sym.OR);}            //Pipe 
// "_"             {return sym(sym.US);}            //Underscore 



// {inum}             {return sym(sym.INUM, new Integer(yytext()));}
// {sinum}            {return sym(sym.SINUM, new Integer(yytext()));}
// {fnum}             {return sym(sym.FNUM, new Float(yytext()));}
{var}              {return sym(sym.VAR, new String(yytext()));}
{qstring}          {return sym(sym.QSTRING, new String(yytext()));}

{token_1}          {return sym(sym.TOK1);}
{token_2}          {return sym(sym.TOK2);}
{token_3}          {return sym(sym.TOK3);}

//{var}              {return sym(sym.VAR, yytext());}

{sep}            {return sym(sym.SEP);}

{comment}          {;}

\r | \n | \r\n | " " | \t   {;}

.                   {System.out.println("Scanner Error: " + yytext());}