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

comment     = "(((-" ~ "-)))" | "---".*

sep         = ("%%%%")("%%")*


real_num = (([0-9]+\.[0-9]*)|(\.[0-9]+)) //real_number

qstring   = \" ~ \"

//// TOKENS ////
//tokens can be
//  hours HH:MM:SS
//  dates YY/MM/DD
//  binary number
//  hexadecimal number

bin = ("1"*"0""1"*"0""1"*)|("1"*"0""1"*"0""1"*"0""1"*"0""1"*"0""1"*)
word = (\*|\+)?((\*\+)|(\+\*))* 
even = (0|2|4|6|8)
evennum = (  "-3"[0|2]|                      //-32-1246
            "-"[1-2]{even}  |
            "-"(2|4|6|8)    |
            {even}          |
            [1-9]{even}     |
            [1-9][1-9]{even}    |
            11[1-9]{even}|
            12[1-3]{even}|
            124(0|2|4|6)
            
)
evensep = ("*"|"$"|"+")
token_1   = "A_"({bin}|{word}) [ \t]* ";"

token_2   = "B_"({evennum}{evensep}{evennum}{evensep}{evennum}{evensep}{evennum}({evensep}{evennum}{evensep}{evennum})*) [ \t]* ";"


%%

// Strings part
"START"            {return sym(sym.START_WD, new String(yytext()));}
"BATTERY"            {return sym(sym.BATTERY_WD, new String(yytext()));}
"kWh"            {return sym(sym.KWH_WD, new String(yytext()));}
"FUEL"            {return sym(sym.FUEL_WD, new String(yytext()));}
"liters"            {return sym(sym.LITERS_WD, new String(yytext()));}
"MAX"            {return sym(sym.MAX_WD, new String(yytext()));}
"MOD"            {return sym(sym.MOD_WD, new String(yytext()));}
"USE"            {return sym(sym.USE_WD, new String(yytext()));}
"DO"            {return sym(sym.DO_WD, new String(yytext()));}
"DONE"            {return sym(sym.DONE_WD, new String(yytext()));}
"km"            {return sym(sym.KM_WD, new String(yytext()));}
"units/km"            {return sym(sym.UNITKM_WD, new String(yytext()));}
"PLUS"            {return sym(sym.PLUS, new String(yytext()));}
"STAR"            {return sym(sym.STAR, new String(yytext()));}


"-"             {return sym(sym.DASH);}          //Hyphen/Dash 
"("             {return sym(sym.OP);}            //Open Parenthesis 
")"             {return sym(sym.CP);}            //Close Parenthesis 
","             {return sym(sym.CM);}            //Comma 
";"             {return sym(sym.SC);}            //Semicolon 



{real_num}              {return sym(sym.REAL_NUM, new Double(yytext()));}

{token_1}          {return sym(sym.TOK1);}
{token_2}          {return sym(sym.TOK2);}


{sep}            {return sym(sym.SEP);}

{comment}          {;}

\r | \n | \r\n | " " | \t   {;}

.                   {System.out.println("Scanner Error: " + yytext());}