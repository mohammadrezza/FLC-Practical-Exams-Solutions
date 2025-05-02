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

//fnum      = [0-9]+.[0-9]+     //float

//var       = [a-zA-Z_][a-zA-Z0-9_]*     //variable

//qstring   = \" ~ \"

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

// bin   = ((101)                  |       //binary number between 101 and 11010
//         (11[0-1])               |
//         (1[0-1] [0-1] [0-1])    |
//         (10[0-1] [0-1] [0-1])   |
//         (1100[0-1])             |
//         (11010)) 

// date =  (                                    //a date in the format DD/MM/YYYY between 03/09/2021 and 05/03/2022
//         ("0"[3-9])"/09/2021"            |
//         ([1-2][0-9])"/09/2021"          |
//         "30/09/2021"                    |   //september
//         ("0"[1-9])"/"(10|12)"/2021"     |
//         ([1-2][0-9])"/"(10|12)"/2021"   |
//         (30|31)"/"(10|12)"/2021"        |   //oct and dec 31 days
//         ("0"[1-9])"/11/2021"            |
//         ([1-2][0-9])"/11/2021"          |
//         "30/11/2021"                    |   //november 30 days
//         ("0"[1-9])"/01/2022"            |
//         ([1-2][0-9])"/01/2022"          |
//         (30|31)"/01/2022"               |   //jan
//         ("0"[1-9])"/02/2022"            |
//         ("1"[0-9])"/02/2022"            |
//         ("2"[0-8])"/02/2022"            |   //Feb 28 days
//         ("0"[1-5])"/03/2022" )               //March
        //28 days Feb
        //30 days Apr, Jun, Sep, Nov
        //31 days Jan, Mar, May, Jul, Aug, Oct, Dec 

hex =    (                      //hexadecimal number is between 3b and aE3
    ("3"[b-fB-F])   |
    ([4-9][0-9a-fA-F]) |
    ([a-fA-f][0-9a-fA-F]) |
    (([0-9])[0-9a-fA-F][0-9a-fA-F])   |
    (("a"|"A")([0-9a-dA-D])[0-9a-fA-F])|
    (("a"|"A")("e"|"E")[0-3])   
)  

//token_1   = 

//token_2   =

//token_3   =

%%

// Strings part
// "START"            {return sym(sym.START_WD, new String(yytext()));}


"?"             {return sym(sym.QUM);}           //Question Mark 
"!"             {return sym(sym.EXM);}           //Exclamation Mark 
"@"             {return sym(sym.ATM);}           //At Symbol 
"#"             {return sym(sym.HAM);}           //Hash / Pound 
"$"             {return sym(sym.DOM);}           //Dollar Mark 
"%"             {return sym(sym.PAM);}           //Percent 
"^"             {return sym(sym.CIM);}           //Caret (Circumflex) 
"&"             {return sym(sym.AND);}           //Ampersand 
"*"             {return sym(sym.STAR);}          //Asterisk 
"-"             {return sym(sym.DASH);}          //Hyphen/Dash 
"="             {return sym(sym.EQ);}            //Equal Sign 
"+"             {return sym(sym.PLUS);}          //Plus 
"("             {return sym(sym.OP);}            //Open Parenthesis 
")"             {return sym(sym.CP);}            //Close Parenthesis 
"["             {return sym(sym.OB);}            //Open Bracket 
"]"             {return sym(sym.CB);}            //Close Bracket 
"{"             {return sym(sym.OC);}            //Open Curly Brace 
"}"             {return sym(sym.CC);}            //Close Curly Brace 
">"             {return sym(sym.GT);}            //Greater Than 
"<"             {return sym(sym.LT);}            //Less Than 
"/"             {return sym(sym.SL);}            //Slash 
\\              {return sym(sym.BSL);}           //Backslash 
"."             {return sym(sym.DOT);}           //Period / Dot 
":"             {return sym(sym.CO);}            //Colon 
","             {return sym(sym.CM);}            //Comma 
";"             {return sym(sym.SC);}            //Semicolon 
\'              {return sym(sym.QU);}            //Single Quote 
\"              {return sym(sym.DQU);}           //Double Quote 
\`              {return sym(sym.GRAVE);}         //Grave Accent / Backtick
"~"             {return sym(sym.TIL);}           //Tilde 
"|"             {return sym(sym.OR);}            //Pipe 
"_"             {return sym(sym.US);}            //Underscore 



// {inum}             {return sym(sym.INUM, new Integer(yytext()));}
// {sinum}            {return sym(sym.SINUM, new Integer(yytext()));}
// {fnum}             {return sym(sym.FNUM, new Float(yytext()));}
// {var}              {return sym(sym.VAR, new String(yytext()));}
// {qstring}          {return sym(sym.QSTRING, new String(yytext()));}

// {token_1}          {return sym(sym.TOK1);}
// {token_2}          {return sym(sym.TOK2);}
// {token_3}          {return sym(sym.TOK3);}

//{var}              {return sym(sym.VAR, yytext());}

{sep}            {return sym(sym.SEP);}

{comment}          {;}

\r | \n | \r\n | " " | \t   {;}

.                   {System.out.println("Scanner Error: " + yytext());}