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

comment     = "[++" ~ "++]"

sep         = ("****")("**")*


real_num = (([0-9]+\.[0-9]*)|(\.[0-9]+)) //real_number

qstring   = \" ~ \"

//// TOKENS ////
hour = (
    "07:21:" ((1[3-9])|[2-5][0-9])      |
    "07:2" [2-9] ":" [0-5][0-9]             |
    "07:" [3-5][0-9] ":" [0-5][0-9]         |
    "0"[8-9] ":" [0-5][0-9] ":" [0-5][0-9]     |
    "1"[0-8] ":" [0-5][0-9]  ":" [0-5][0-9]    |
    "19:" [0-3][0-9] ":" [0-5][0-9]         |
    "19:4"[0-5] ":" [0-5][0-9]             |
    "19:46:" [0-4][0-9]                 |
    "19:46:" 5[0-4]
)

real = (                        
"10.5"[3-9] |
"10."[6-9][0-9] |
"1"[1-2]"."[0-9][0-9] |
"13."[0-6][0-9]|
"13.7"[0-4]
)

bin = (
    [0-1]{4} | [0-1]{6} | [0-1]{11}
)
tok2rep = ("@"|"!"){2}|("@"|"!"){10}

oddlow =(
[a-z][a-z]*
)

evencap =(
    [A-Z][A-Z] ([A-Z][A-Z])*
)

token_1   = ("A:" "!" {bin})|("B:" "@"{hour} )

token_2   = "C:"({real}|"value"){tok2rep}({oddlow}| {evencap}) 


%%

// Strings part
"POINTS"            {return sym(sym.POINTS_WD, new String(yytext()));}
"LOW"            {return sym(sym.LOW_WD, new String(yytext()));}
"MEDIUM"            {return sym(sym.MEDIUM_WD, new String(yytext()));}
"HIGH"            {return sym(sym.HIGH_WD, new String(yytext()));}


"*"             {return sym(sym.STAR);}          //Asterisk 
"-"             {return sym(sym.DASH);}          //Hyphen/Dash 
"+"             {return sym(sym.PLUS);}          //Plus 
"("             {return sym(sym.OP);}            //Open Parenthesis 
")"             {return sym(sym.CP);}            //Close Parenthesis 
"/"             {return sym(sym.SL);}            //Slash 
":"             {return sym(sym.CO);}            //Colon 
","             {return sym(sym.CM);}            //Comma 
";"             {return sym(sym.SC);}            //Semicolon 



{real_num}              {return sym(sym.REAL_NUM, new Double(yytext()));}
{qstring}          {return sym(sym.QSTRING, new String(yytext()));}

{token_1}          {return sym(sym.TOK1);}
{token_2}          {return sym(sym.TOK2);}


{sep}            {return sym(sym.SEP);}

{comment}          {;}

\r | \n | \r\n | " " | \t   {;}

.                   {System.out.println("Scanner Error: " + yytext());}