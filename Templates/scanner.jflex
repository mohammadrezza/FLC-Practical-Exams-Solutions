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
//                  "//".*

sep         = (\$\$\$)(\$\$)*

//inum      = [1-9][0-9]*      //integer

//sinum     = ("-")?[0-9]+      //singed integer

//fnum      = [0-9]+.[0-9]+     //float

//var       = [a-zA-Z_][a-zA-Z0-9_]*     //variable

// real_num = (([0-9]+\.[0-9]*)|(\.[0-9]+)) //real_number

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

// bin   = ((101)                  |       //binary number between 101 and 11010
//         (11[0-1])               |
//         (1[0-1] [0-1] [0-1])    |
//         (10[0-1] [0-1] [0-1])   |
//         (1100[0-1])             |
//         (11010)) 
// octet       = (
//                 [0-9]       | //0-9
//                 [1-9][0-9]  |  //10-99
//                 "1"[0-9][0-9]  |  //100-199
//                 "2"[0-4][0-9]  |  //200-249
//                 "25"[0-5]    //200-249
//             )

// ip_address  = {octet}"."{octet}"."{octet}"."{octet}

// date =  (                                    //a date in the format DD/MM/YYYY
//          // January (31 days)
//     "2025/01/0"[1-9] | "2025/01/"[1-2][0-9] | "2025/01/30" | "2025/01/31" |
    
//     // February (28 days, no leap year (366 days in a year) handling)
//     "2025/02/0"[1-9] | "2025/02/"[1-2][0-8] |
    
//     // March (31 days)
//     "2025/03/0"[1-9] | "2025/03/"[1-2][0-9] | "2025/03/30" | "2025/03/31" |
    
//     // April (30 days)
//     "2025/04/0"[1-9] | "2025/04/"[1-2][0-9] | "2025/04/30" |
    
//     // May (31 days)
//     "2025/05/0"[1-9] | "2025/05/"[1-2][0-9] | "2025/05/30" | "2025/05/31" |
    
//     // June (30 days)
//     "2025/06/0"[1-9] | "2025/06/"[1-2][0-9] | "2025/06/30" |
    
//     // July (31 days)
//     "2025/07/0"[1-9] | "2025/07/"[1-2][0-9] | "2025/07/30" | "2025/07/31" |
    
//     // August (31 days)
//     "2025/08/0"[1-9] | "2025/08/"[1-2][0-9] | "2025/08/30" | "2025/08/31" |
    
//     // September (30 days)
//     "2025/09/0"[1-9] | "2025/09/"[1-2][0-9] | "2025/09/30" |
    
//     // October (31 days)
//     "2025/10/0"[1-9] | "2025/10/"[1-2][0-9] | "2025/10/30" | "2025/10/31" |
    
//     // November (30 days)
//     "2025/11/0"[1-9] | "2025/11/"[1-2][0-9] | "2025/11/30" |
    
//     // December (31 days)
//     "2025/12/0"[1-9] | "2025/12/"[1-2][0-9] | "2025/12/30" | "2025/12/31"
//         )  


//  date =  (                                    // a date in the format DD/MM/YYYY
//           // January (31 days)
//     "0"[1-9]"/01/2025" | [1-2][0-9]"/01/2025" | "30/01/2025" | "31/01/2025" |

//     // February (28 days)
//     "0"[1-9]"/02/2025" | [1-2][0-8]"/02/2025" |

//           // March (31 days)
//     "0"[1-9]"/03/2025" | [1-2][0-9]"/03/2025" | "30/03/2025" | "31/03/2025" |

//           // April (30 days)
//     "0"[1-9]"/04/2025" | [1-2][0-9]"/04/2025" | "30/04/2025" |

//           // May (31 days)
//     "0"[1-9]"/05/2025" | [1-2][0-9]"/05/2025" | "30/05/2025" | "31/05/2025" |

//          // June (30 days)
//     "0"[1-9]"/06/2025" | [1-2][0-9]"/06/2025" | "30/06/2025" |

//           // July (31 days)
//     "0"[1-9]"/07/2025" | [1-2][0-9]"/07/2025" | "30/07/2025" | "31/07/2025" |

//          // August (31 days)
//     "0"[1-9]"/08/2025" | [1-2][0-9]"/08/2025" | "30/08/2025" | "31/08/2025" |

//          // September (30 days)
//     "0"[1-9]"/09/2025" | [1-2][0-9]"/09/2025" | "30/09/2025" |

//           // October (31 days)
//     "0"[1-9]"/10/2025" | [1-2][0-9]"/10/2025" | "30/10/2025" | "31/10/2025" |

//           // November (30 days)
//     "0"[1-9]"/11/2025" | [1-2][0-9]"/11/2025" | "30/11/2025" |

//           // December (31 days)
//     "0"[1-9]"/12/2025" | [1-2][0-9]"/12/2025" | "30/12/2025" | "31/12/2025"
//  )


// hex =    (                      //hexadecimal number is between 3b and aE3
//     ("3"[b-fB-F])   |
//     ([4-9][0-9a-fA-F]) |
//     ([a-fA-f][0-9a-fA-F]) |
//     (([0-9])[0-9a-fA-F][0-9a-fA-F])   |
//     (("a"|"A")([0-9a-dA-D])[0-9a-fA-F])|
//     (("a"|"A")("e"|"E")[0-3])   
// )  

//token_1   = 

//token_2   =  

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
// "{"             {return sym(sym.OC);}            //Open Curly Brace 
// "}"             {return sym(sym.CC);}            //Close Curly Brace 
// ">"             {return sym(sym.GT);}            //Greater Than 
// "<"             {return sym(sym.LT);}            //Less Than 
// "/"             {return sym(sym.SL);}            //Slash 
// \\              {return sym(sym.BSL);}           //Backslash 
// "."             {return sym(sym.DOT);}           //Period / Dot 
// ":"             {return sym(sym.CO);}            //Colon 
// ","             {return sym(sym.CM);}            //Comma 
// ";"             {return sym(sym.SC);}            //Semicolon 
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
// {real_num}              {return sym(sym.REAL_NUM, new Double(yytext()));}
// {qstring}          {return sym(sym.QSTRING, new String(yytext()));}

// {token_1}          {return sym(sym.TOK1);}
// {token_2}          {return sym(sym.TOK2);}
// {token_3}          {return sym(sym.TOK3);}


{sep}            {return sym(sym.SEP);}

{comment}          {;}

\r | \n | \r\n | " " | \t   {;}

.                   {System.out.println("Scanner Error: " + yytext());}