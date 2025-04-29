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

comment     = "+--" ~ "--+"

sep         = "===="

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

token_1   = "I_"{date}(":"{time})?

// september 09 - 30 days
// october 10 
// novermber 11 - 30 days
// december 12
// jan
// feb - 28 days
// march
// april
// may  --

date = "03/09/2021" |
       "0"[4-9]"/09/2021" |
       [1-2][0-9]"/09/2021" |
       "30/09/2021" |
       
       "0"[1-9]"/11/2021" |
       [1-2][0-9]"/11/2021" |
       "30/11/2021" |

       "0"[1-9]"/"("10"|"12")"/2021" |
       [1-2][0-9]"/"("10"|"12")"/2021" |
       ("30"|"31")"/"("10"|"12")"/2021" |

       "0"[1-9]"/01/2022" |
       [1-2][0-9]"/01/2022" |
       ("30"|"31")"/01/2022" |

       "0"[1-9]"/02/2022" |
       "1"[0-9]"/02/2022" |
       "2"[0-8]"/02/2022" |

       "0"[1-5]"/03/2022"

time = "0"[8-9]":"[0-5][0-9] |
       "1"[0-6]":"[0-5][0-9] |
       "17:"[0-2][0-9] |
       "17:3"[0-5]


token_2   = "J_"({hex}(({hex_sep}{hex})){5}({hex_sep}{hex}{hex_sep}{hex})*)

hex_sep = ("+"|"-"|"*")

hex_c = [a-fA-F]

hex = "3"[b-fB-F] |
      [4-9]([0-9]|{hex_c}) |
      [a-fA-F]([0-9]|{hex_c}) |
      
      [0-9]([0-9]|{hex_c})([0-9]|{hex_c}) |
      ("a"|"A")([0-9]|[a-dA-D])([0-9]|{hex_c}) |
      
      ("a"|"A")("e"|"E")[0-3]

token_3   = "K_"[a-z]{5}([a-z][a-z])*(("00"|"11"|"10"|"01"){3}("00"|"11"|"10"|"01")*)?


%%

// Strings part
// "START"            {return sym(sym.START_WD, new String(yytext()));}
"INIT"          {return sym(sym.INIT_WD, new String(yytext()));}
"HEIGHT"       {return sym(sym.HEIGHT_WD, new String(yytext()));}
"SPEED"       {return sym(sym.SPEED_WD, new String(yytext()));}
"UPDATE"      {return sym(sym.UPDATE_WD, new String(yytext()));}
"DONE"        {return sym(sym.DONE_WD, new String(yytext()));}
"COND"       {return sym(sym.COND_WD, new String(yytext()));}

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
// "("             {return sym(sym.OP);}            //Open Parenthesis 
// ")"             {return sym(sym.CP);}            //Close Parenthesis 
"["             {return sym(sym.OB);}            //Open Bracket 
"]"             {return sym(sym.CB);}            //Close Bracket 
// "{"             {return sym(sym.OC);}            //Open Curly Brace 
// "}"             {return sym(sym.CC);}            //Close Curly Brace 
// ">"             {return sym(sym.GT);}            //Greater Than 
// "<"             {return sym(sym.LT);}            //Less Than 
// "/"             {return sym(sym.SL);}            //Slash 
// \\              {return sym(sym.BSL);}           //Backslash 
// "."             {return sym(sym.DOT);}           //Period / Dot 
// ":"             {return sym(sym.CO);}            //Colon 
","             {return sym(sym.CM);}            //Comma 
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
// {var}              {return sym(sym.VAR, new String(yytext()));}
// {qstring}          {return sym(sym.QSTRING, new String(yytext()));}

{token_1}          {return sym(sym.TOK1);}
{token_2}          {return sym(sym.TOK2);}
{token_3}          {return sym(sym.TOK3);}

//{var}              {return sym(sym.VAR, yytext());}

{sep}            {return sym(sym.SEP);}

{comment}          {;}

\r | \n | \r\n | " " | \t   {;}

.                   {System.out.println("Scanner Error: " + yytext());}