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

comment     = "(+" ~ "+)"

sep         = ("*****")("**")*

inum      = [1-9][0-9]*      //integer

real_num = (([0-9]+\.[0-9]+)|(\.[0-9]+)) //real_number

qstring   = \' ~ \'

//// TOKENS ////
//tokens can be
//  hours HH:MM:SS
//  dates YY/MM/DD
//  binary number
//  hexadecimal number
//
hour = (                                 //HH:MM:SS” between
    "10:3"[2-9]      |
    "10:" [4-5][0-9]         |
    "1"[1-7]":" [0-5][0-9]        |
    "18:" [0-1][0-9]  |
    "18:2"[0-7] 
)

hourformat = (                                 //HH:MM:SS” between 
    "10:3"[2-9]" am"      |
    "10:" [4-5][0-9] " am"          |
    "11:" [0-5][0-9]  " am"       |
    "12:" [0-5][0-9]    " pm"    |
    "0"[1-5]":" [0-5][0-9]" pm"   |
    "06:" [0-1][0-9] " pm"  |
    "06:2"[0-7] " pm" 
)



bin   = ((101)                  |       //binary number 
        (11[0-1])               |									
        (1[0-1] [0-1] [0-1])    |
        (100 [0-1] [0-1])   |
        (1010[0-1])             |
        (10110)) 

w = ("!" | "@" | "#")
tok1word = ({w}{7})({w}{w})*


w2 = ("&&" | "%%" | "$$")
tok2word = ({w2}{3,22})

tok2word2 = ([a-zA-Z]{4}|[a-zA-Z]{6} | [a-zA-Z]{8})

token_1   = "A:"{tok1word}(":"{bin})?

token_2   =  "B:"{tok2word}(({tok2word2}"#"{tok2word2})|{tok2word2}"#"{tok2word2}"#"{tok2word2})

token_3   =  "C:"({hour}|{hourformat})

%%

// Strings part
"euro/day"            {return sym(sym.EURODAY_WD, new String(yytext()));}
"MIN_SUM"            {return sym(sym.MIN_SUM_WD, new String(yytext()));}
"E"            {return sym(sym.ELEC_WD, new String(yytext()));}


"("             {return sym(sym.OP);}            //Open Parenthesis 
")"             {return sym(sym.CP);}            //Close Parenthesis 
"."             {return sym(sym.DOT);}           //Period / Dot 
":"             {return sym(sym.CO);}            //Colon 
","             {return sym(sym.CM);}            //Comma 
";"             {return sym(sym.SC);}            //Semicolon 



{inum}             {return sym(sym.INUM, new Integer(yytext()));}
{real_num}              {return sym(sym.REAL_NUM, new Double(yytext()));}
{qstring}          {return sym(sym.QSTRING, new String(yytext()));}

{token_1}          {return sym(sym.TOK1);}
{token_2}          {return sym(sym.TOK2);}
{token_3}          {return sym(sym.TOK3);}


{sep}            {return sym(sym.SEP);}

{comment}          {;}

\r | \n | \r\n | " " | \t   {;}

.                   {System.out.println("Scanner Error: " + yytext());}