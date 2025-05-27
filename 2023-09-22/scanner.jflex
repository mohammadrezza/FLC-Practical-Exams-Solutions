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

//sinum     = ("-")?[0-9]+      //singed integer

//fnum      = [0-9]+.[0-9]+     //float

//var       = [a-zA-Z_][a-zA-Z0-9_]*     //variable

//qstring   = \" ~ \"

//// TOKENS ////
// hours HH:MM:SS
// "0"[0-9]":"[0-5][0-9]":"[0-5][0-9]
// "1"[0-9]":"[0-5][0-9]":"[0-5][0-9]
// "2"[0-3]":"[0-5][0-9]":"[0-5][0-9]
// dates YYYY/MM/DD
// {year} "/" ("01") "/" ((0[1-9]) | [1-2][0-9] | 30 | 31)  // January
// {year} "/" ("02") "/" ((0[1-9]) | [1-2][0-9] )           // February
// {year} "/" ("03") "/" ((0[1-9]) | [1-2][0-9] | 30 | 31)  // March
// {year} "/" ("04") "/" ((0[1-9]) | [1-2][0-9] | 30 )      // April
// {year} "/" ("05") "/" ((0[1-9]) | [1-2][0-9] | 30 | 31)  // May
// {year} "/" ("06") "/" ((0[1-9]) | [1-2][0-9] | 30 )      // June
// {year} "/" ("07") "/" ((0[1-9]) | [1-2][0-9] | 30 | 31)  // July
// {year} "/" ("08") "/" ((0[1-9]) | [1-2][0-9] | 30 | 31)  // August
// {year} "/" ("09") "/" ((0[1-9]) | [1-2][0-9] | 30 )      // September
// {year} "/" ("10") "/" ((0[1-9]) | [1-2][0-9] | 30 | 31)  // October
// {year} "/" ("11") "/" ((0[1-9]) | [1-2][0-9] | 30 )      // Novermber
// {year} "/" ("12") "/" ((0[1-9]) | [1-2][0-9] | 30 | 31)  // December
// hexadecimal number
// hex = [0-9a-fA-F]
// ({hex})    //0-F
// ({1-9a-fA-F})({hex})     //10-FF
// ({1-9a-fA-F})({hex})({hex})   //100-FFF
// ip address
// ip_range  = ([0-9] | [1-9][0-9] | 1[0-9][0-9] | 2[0-4][0-9] | 25[0-5])
// ip_address = ({ip_range}\.{ip_range}\.{ip_range}\.{ip_range}) 
// binary number
//  numbers

odd = "-27"[1,3] |
      "-2"[0-6][1,3,5,7,9] |
      "-1"[0-9][1,3,5,7,9] |
      "-"[0-9][1,3,5,7,9]  |
      "-"[1,3,5,7,9] |
      [1,3,5,7,9] |
      [0-9][1,3,5,7,9] |
      [1-3][0-9][1,3,5,7,9] |
      "4"[0-4][1,3,5,7,9] |
      "45"[1,3,5,7]
      

token_1   =  "A_"({odd}"*")({odd}"*")({odd}"*")({odd}) |
             "A_"({odd}"*")({odd}"*")({odd}"*")({odd}"*")({odd}"*")({odd}"*")({odd}) |
             "A_"({odd}"*")({odd}"*")({odd}"*")({odd}"*")({odd}"*")({odd}"*")({odd}"*")({odd}"*")({odd}"*")({odd}"*")({odd}) 

date = "2023/" ("09"|"September") "/" ("2"[2-9] | 30 ) |      // September
       "2023/" ("10"|"October") "/" ((0[1-9]) | [1-2][0-9] | 30 | 31) |  // October
       "2023/" ("11"|"Novermber") "/" ((0[1-9]) | [1-2][0-9] | 30 ) |      // Novermber
       "2023/" ("12"|"December") "/" ((0[1-9]) | [1-2][0-9] | 30 | 31) |  // December
       "2024/" ("01"|"January") "/" ((0[1-9]) | [1-2][0-9] | 30 | 31) |  // January
       "2024/" ("02"|"February") "/" ((0[1-7]) )            // February

token_2   =  "B_"{date}


hex = [1-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F] |
      [1-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]
hsep = ("*"|"$"|"&")

token_3   =  "C_"{hex}{hsep}{hex}{hsep}{hex}{hsep}{hex}({hsep}{hex}{hsep}{hex})*

%%

// Strings part
// "AND"            {return sym(sym.AND_WD, new String(yytext()));}
// "COND"           {return sym(sym.COND_WD, new String(yytext()));}
// "DO"             {return sym(sym.DO, new String(yytext()));}
// "DONE"           {return sym(sym.DONE, new String(yytext()));}
// "FALSE"          {return sym(sym.FALSE_WD, new String(yytext()));}
// "FI"             {return sym(sym.FI_WD, new String(yytext()));}
// "HEIGHT"         {return sym(sym.HEIGHT_WD, new String(yytext()));}
// "IF"             {return sym(sym.IF_WD, new String(yytext()));}
// "INIT"           {return sym(sym.INIT_WD, new String(yytext()));}
// "KG"             {return sym(sym.KG_WD, new String(yytext()));}
// "MAX"            {return sym(sym.MAX_WD, new String(yytext()));}
// "MUL"            {return sym(sym.MUL_WD, new String(yytext()));}
// "OR"             {return sym(sym.OR_WD, new String(yytext()));}
// "PLUS"           {return sym(sym.PLUS_WD, new String(yytext()));}
// "PRINT"          {return sym(sym.PRINT_WD, new String(yytext()));}
// "SPEED"          {return sym(sym.SPEED_WD, new String(yytext()));}
// "STAR"           {return sym(sym.STAR_WD, new String(yytext()));}
// "START"          {return sym(sym.START_WD, new String(yytext()));}
// "SUM"            {return sym(sym.SUM_WD, new String(yytext()));}
// "TRUE"           {return sym(sym.TRUE_WD, new String(yytext()));}
// "UPDATE"         {return sym(sym.UPDATE_WD, new String(yytext()));}

// "and"              {return sym(sym.AND_WD, new String(yytext()));}
// "compare"          {return sym(sym.COMPARE_WD, new String(yytext()));}
// "end"              {return sym(sym.END_WD, new String(yytext()));}
// "euro"             {return sym(sym.EURO_WD, new String(yytext()));}
// "euro/kg"          {return sym(sym.EURO_KG_WD, new String(yytext()));}
// "false"            {return sym(sym.FALSE_WD, new String(yytext()));}
// "fi"               {return sym(sym.FI_WD, new String(yytext()));}
// "house"            {return sym(sym.HOUSE_WD, new String(yytext()));}
// "if"               {return sym(sym.IF_WD, new String(yytext()));}
// "kg"               {return sym(sym.KG_WD, new String(yytext()));}
// "not"              {return sym(sym.NOT_WD, new String(yytext()));}
// "or"               {return sym(sym.OR_WD, new String(yytext()));}
// "print"            {return sym(sym.PRINT_WD, new String(yytext()));}
// "start"            {return sym(sym.START_WD, new String(yytext()));}
// "then"             {return sym(sym.THEN_WD, new String(yytext()));}
// "true"             {return sym(sym.TRUE_WD, new String(yytext()));}
// "with"             {return sym(sym.WITH_WD, new String(yytext()));}

"INS"             {return sym(sym.INS_WD, new String(yytext()));}
"CMP"             {return sym(sym.CMP_WD, new String(yytext()));}
"SUM"             {return sym(sym.SUM_WD, new String(yytext()));}


// "?"             {return sym(sym.QUM);}           //Question Mark 
// "!"             {return sym(sym.EXM);}           //Exclamation Mark 
// "@"             {return sym(sym.ATM);}           //At Symbol 
// "#"             {return sym(sym.HAM);}           //Hash / Pound 
// "$"             {return sym(sym.DOM);}           //Dollar Mark 
// "%"             {return sym(sym.PAM);}           //Percent 
// "^"             {return sym(sym.CIM);}           //Caret (Circumflex) 
// "&"             {return sym(sym.AND);}           //Ampersand 
// "="             {return sym(sym.EQ);}            //Equal Sign 
"("             {return sym(sym.OP);}            //Open Parenthesis 
")"             {return sym(sym.CP);}            //Close Parenthesis 

"*"             {return sym(sym.STAR);}          //Asterisk 
"-"             {return sym(sym.DASH);}          //Hyphen/Dash 
"+"             {return sym(sym.PLUS);}          //Plus 
"["             {return sym(sym.OB);}            //Open Bracket 
"]"             {return sym(sym.CB);}            //Close Bracket 
"/"             {return sym(sym.SL);}            //Slash 

// "{"             {return sym(sym.OC);}            //Open Curly Brace 
// "}"             {return sym(sym.CC);}            //Close Curly Brace 
// ">"             {return sym(sym.GT);}            //Greater Than 
// "<"             {return sym(sym.LT);}            //Less Than 
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


{inum}             {return sym(sym.INUM, new Integer(yytext()));}
// {sinum}            {return sym(sym.SINUM, new Integer(yytext()));}
// {fnum}             {return sym(sym.FNUM, new Float(yytext()));}
// {var}              {return sym(sym.VAR, new String(yytext()));}
// {qstring}          {return sym(sym.QSTRING, new String(yytext()));}


{token_1}          {return sym(sym.TOKEN1);}
{token_2}          {return sym(sym.TOKEN2);}
{token_3}          {return sym(sym.TOKEN3);}


{sep}            {return sym(sym.SEP);}

{comment}          {;}

\r | \n | \r\n | " " | \t   {;}

.                   {System.out.println("Scanner Error: " + yytext());}