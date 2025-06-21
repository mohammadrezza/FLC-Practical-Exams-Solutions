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

//inum      = [1-9][0-9]*      //integer

//sinum     = ("-")?[0-9]+      //singed integer

// fnum      = [0-9]+\.[0-9]+     //float

// rnum      = (([0-9]+\.[0-9]*)|(\.[0-9]+))     // real number

//var       = [a-zA-Z_][a-zA-Z0-9_]*     //variable

//qstring   = \" ~ \"

//// TOKENS ////
// hours HH:MM:SS
// "0"[0-9]":"[0-5][0-9]":"[0-5][0-9]
// "1"[0-9]":"[0-5][0-9]":"[0-5][0-9]
// "2"[0-3]":"[0-5][0-9]":"[0-5][0-9]
// dates YYYY/MM/DD
// {year} "/" ("01"|"January") "/" ((0[1-9]) | [1-2][0-9] | 30 | 31)     |     ((0[1-9]) | [1-2][0-9] | 30 | 31) "/" ("01"|"January") "/" {year}
// {year} "/" ("02"|"February") "/" ((0[1-9]) | [1-2][0-9] )             |     ((0[1-9]) | [1-2][0-9] )  "/"  ("02"|"February")  "/" {year}
// {year} "/" ("03"|"March") "/" ((0[1-9]) | [1-2][0-9] | 30 | 31)       |     ((0[1-9]) | [1-2][0-9] | 30 | 31) "/"  ("03"|"March")  "/" {year}
// {year} "/" ("04"|"April") "/" ((0[1-9]) | [1-2][0-9] | 30 )           |     ((0[1-9]) | [1-2][0-9] | 30 ) "/" ("04"|"April") "/" {year}
// {year} "/" ("05"|"May") "/" ((0[1-9]) | [1-2][0-9] | 30 | 31)         |     ((0[1-9]) | [1-2][0-9] | 30 | 31) "/"  ("05"|"May")  "/" {year}
// {year} "/" ("06"|"June") "/" ((0[1-9]) | [1-2][0-9] | 30 )            |     ((0[1-9]) | [1-2][0-9] | 30 ) "/" ("06"|"June") "/" {year}
// {year} "/" ("07"|"July") "/" ((0[1-9]) | [1-2][0-9] | 30 | 31)        |     ((0[1-9]) | [1-2][0-9] | 30 | 31)  "/"  ("07"|"July")  "/"  {year}
// {year} "/" ("08"|"August") "/" ((0[1-9]) | [1-2][0-9] | 30 | 31)      |     ((0[1-9]) | [1-2][0-9] | 30 | 31)  "/"  ("08"|"August") "/" {year}
// {year} "/" ("09"|"September") "/" ((0[1-9]) | [1-2][0-9] | 30 )       |     ((0[1-9]) | [1-2][0-9] | 30 ) "/"  ("09"|"September")  "/"  {year}
// {year} "/" ("10"|"October") "/" ((0[1-9]) | [1-2][0-9] | 30 | 31)     |     ((0[1-9]) | [1-2][0-9] | 30 | 31)  ("10"|"October")  "/" {year}
// {year} "/" ("11"|"Novermber") "/" ((0[1-9]) | [1-2][0-9] | 30 )       |     ((0[1-9]) | [1-2][0-9] | 30 ) "/"  ("11"|"Novermber")  "/"  {year}
// {year} "/" ("12"|"December") "/" ((0[1-9]) | [1-2][0-9] | 30 | 31)    |     ((0[1-9]) | [1-2][0-9] | 30 | 31)  "/" ("12"|"December") "/"  {year}
// hexadecimal number
// hex = [0-9a-fA-F]
// ({hex})    //0-F
// ({1-9a-fA-F})({hex})     //10-FF
// ({1-9a-fA-F})({hex})({hex})   //100-FFF
// ip address
// ip_range  = ([0-9] | [1-9][0-9] | 1[0-9][0-9] | 2[0-4][0-9] | 25[0-5])
// ip_address = ({ip_range}\.{ip_range}\.{ip_range}\.{ip_range}) 
// binary number
// bin = [0-1] | 1[0-1] | 1[0-1][0-1] | 1[0-1][0-1][0-1]
//  numbers

token_1   = 

token_2   =

//token_3   =

%%

// Strings part
// "PRINT"            {return sym(sym.PRINT_WD, new String(yytext()));}


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
// "|"             {return sym(sym.OR);}            //Pipe 
// "_"             {return sym(sym.US);}            //Underscore 


// {inum}             {return sym(sym.INUM, new Integer(yytext()));}
// {sinum}            {return sym(sym.SINUM, new Integer(yytext()));}
// {fnum}             {return sym(sym.FNUM, new Float(yytext()));}
// {rnum}             {return sym(sym.RNUM, new Double(yytext()));}
// {var}              {return sym(sym.VAR, new String(yytext()));}
// {qstring}          {return sym(sym.QSTRING, new String(yytext()));}


{token_1}          {return sym(sym.TOKEN1);}
{token_2}          {return sym(sym.TOKEN2);}
// {token_3}          {return sym(sym.TOKEN3);}


{sep}            {return sym(sym.SEP);}

{comment}          {;}

\r | \n | \r\n | " " | \t   {;}

.                   {System.out.println("Scanner Error: " + yytext());}