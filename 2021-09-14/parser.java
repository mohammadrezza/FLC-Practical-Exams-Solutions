
//----------------------------------------------------
// The following code was generated by CUP v0.11b beta 20140226
//----------------------------------------------------

import java_cup.runtime.*;
import java.util.*;
import java.io.*;
import java_cup.runtime.XMLElement;

/** CUP v0.11b beta 20140226 generated parser.
  */
@SuppressWarnings({"rawtypes"})
public class parser extends java_cup.runtime.lr_parser {

 public final Class getSymbolContainer() {
    return sym.class;
}

  /** Default constructor. */
  @Deprecated
  public parser() {super();}

  /** Constructor which sets the default scanner. */
  @Deprecated
  public parser(java_cup.runtime.Scanner s) {super(s);}

  /** Constructor which sets the default scanner. */
  public parser(java_cup.runtime.Scanner s, java_cup.runtime.SymbolFactory sf) {super(s,sf);}

  /** Production table. */
  protected static final short _production_table[][] = 
    unpackFromStrings(new String[] {
    "\000\041\000\002\002\004\000\002\002\005\000\002\003" +
    "\003\000\002\003\006\000\002\003\011\000\002\004\005" +
    "\000\002\004\005\000\002\004\002\000\002\005\005\000" +
    "\002\014\012\000\002\014\007\000\002\014\007\000\002" +
    "\014\012\000\002\014\004\000\002\015\003\000\002\015" +
    "\003\000\002\015\003\000\002\015\005\000\002\015\005" +
    "\000\002\006\005\000\002\006\004\000\002\011\006\000" +
    "\002\011\006\000\002\011\004\000\002\012\011\000\002" +
    "\012\011\000\002\017\002\000\002\013\006\000\002\013" +
    "\006\000\002\013\007\000\002\013\007\000\002\016\005" +
    "\000\002\016\005" });

  /** Access to production table. */
  public short[][] production_table() {return _production_table;}

  /** Parse-action table. */
  protected static final short[][] _action_table = 
    unpackFromStrings(new String[] {
    "\000\132\000\012\004\ufffa\005\ufffa\006\ufffa\007\ufffa\001" +
    "\002\000\004\002\134\001\002\000\012\004\uffff\005\124" +
    "\006\123\007\122\001\002\000\004\004\007\001\002\000" +
    "\004\016\012\001\002\000\004\002\000\001\002\000\004" +
    "\010\041\001\002\000\010\011\013\017\015\020\014\001" +
    "\002\000\004\010\ufff4\001\002\000\004\012\033\001\002" +
    "\000\004\012\016\001\002\000\010\017\022\020\020\026" +
    "\017\001\002\000\020\010\ufff3\011\ufff3\012\ufff3\014\ufff3" +
    "\015\ufff3\021\ufff3\022\ufff3\001\002\000\020\010\ufff1\011" +
    "\ufff1\012\ufff1\014\ufff1\015\ufff1\021\ufff1\022\ufff1\001\002" +
    "\000\010\011\024\021\023\022\025\001\002\000\020\010" +
    "\ufff2\011\ufff2\012\ufff2\014\ufff2\015\ufff2\021\ufff2\022\ufff2" +
    "\001\002\000\010\017\022\020\020\026\017\001\002\000" +
    "\006\010\ufff7\020\027\001\002\000\010\017\022\020\020" +
    "\026\017\001\002\000\020\010\ufff0\011\ufff0\012\ufff0\014" +
    "\ufff0\015\ufff0\021\ufff0\022\ufff0\001\002\000\004\012\030" +
    "\001\002\000\010\017\022\020\020\026\017\001\002\000" +
    "\010\010\ufff8\021\023\022\025\001\002\000\020\010\uffef" +
    "\011\uffef\012\uffef\014\uffef\015\uffef\021\uffef\022\025\001" +
    "\002\000\010\017\022\020\020\026\017\001\002\000\010" +
    "\011\035\021\023\022\025\001\002\000\006\010\ufff6\017" +
    "\036\001\002\000\004\012\037\001\002\000\010\017\022" +
    "\020\020\026\017\001\002\000\010\010\ufff5\021\023\022" +
    "\025\001\002\000\010\017\047\020\045\023\043\001\002" +
    "\000\012\002\ufff9\017\047\020\045\023\043\001\002\000" +
    "\004\013\061\001\002\000\004\010\060\001\002\000\004" +
    "\012\055\001\002\000\010\017\047\020\045\023\043\001" +
    "\002\000\004\012\050\001\002\000\010\017\022\020\020" +
    "\026\017\001\002\000\010\010\052\021\023\022\025\001" +
    "\002\000\012\002\uffec\017\uffec\020\uffec\023\uffec\001\002" +
    "\000\010\017\047\020\045\023\043\001\002\000\012\002" +
    "\uffee\017\uffee\020\uffee\023\uffee\001\002\000\010\017\022" +
    "\020\020\026\017\001\002\000\010\010\057\021\023\022" +
    "\025\001\002\000\012\002\uffeb\017\uffeb\020\uffeb\023\uffeb" +
    "\001\002\000\012\002\uffea\017\uffea\020\uffea\023\uffea\001" +
    "\002\000\012\014\uffe7\017\022\020\020\026\017\001\002" +
    "\000\004\014\115\001\002\000\004\014\071\001\002\000" +
    "\012\012\065\015\066\021\023\022\025\001\002\000\010" +
    "\017\022\020\020\026\017\001\002\000\010\017\022\020" +
    "\020\026\017\001\002\000\010\014\uffe2\021\023\022\025" +
    "\001\002\000\010\014\uffe1\021\023\022\025\001\002\000" +
    "\004\024\072\001\002\000\006\017\075\020\074\001\002" +
    "\000\010\017\106\020\105\025\104\001\002\000\004\012" +
    "\101\001\002\000\004\012\076\001\002\000\010\017\022" +
    "\020\020\026\017\001\002\000\010\010\100\021\023\022" +
    "\025\001\002\000\010\017\uffe6\020\uffe6\025\uffe6\001\002" +
    "\000\010\017\022\020\020\026\017\001\002\000\010\010" +
    "\103\021\023\022\025\001\002\000\010\017\uffe5\020\uffe5" +
    "\025\uffe5\001\002\000\004\010\uffe8\001\002\000\004\012" +
    "\112\001\002\000\004\012\107\001\002\000\010\017\022" +
    "\020\020\026\017\001\002\000\010\010\111\021\023\022" +
    "\025\001\002\000\010\017\uffe4\020\uffe4\025\uffe4\001\002" +
    "\000\010\017\022\020\020\026\017\001\002\000\010\010" +
    "\114\021\023\022\025\001\002\000\010\017\uffe3\020\uffe3" +
    "\025\uffe3\001\002\000\004\024\116\001\002\000\006\017" +
    "\075\020\074\001\002\000\010\017\106\020\105\025\120" +
    "\001\002\000\004\010\uffe9\001\002\000\012\002\uffed\017" +
    "\uffed\020\uffed\023\uffed\001\002\000\004\010\127\001\002" +
    "\000\004\010\126\001\002\000\004\010\125\001\002\000" +
    "\012\004\ufffc\005\ufffc\006\ufffc\007\ufffc\001\002\000\012" +
    "\004\ufffb\005\ufffb\006\ufffb\007\ufffb\001\002\000\012\004" +
    "\ufffa\005\ufffa\006\ufffa\007\ufffa\001\002\000\012\004\ufffe" +
    "\005\124\006\123\007\131\001\002\000\004\010\132\001" +
    "\002\000\010\004\ufffa\005\ufffa\006\ufffa\001\002\000\010" +
    "\004\ufffd\005\124\006\123\001\002\000\004\002\001\001" +
    "\002" });

  /** Access to parse-action table. */
  public short[][] action_table() {return _action_table;}

  /** <code>reduce_goto</code> table. */
  protected static final short[][] _reduce_table = 
    unpackFromStrings(new String[] {
    "\000\132\000\010\002\003\003\005\004\004\001\001\000" +
    "\002\001\001\000\002\001\001\000\002\001\001\000\006" +
    "\005\007\014\010\001\001\000\002\001\001\000\002\001" +
    "\001\000\002\001\001\000\002\001\001\000\002\001\001" +
    "\000\002\001\001\000\004\015\020\001\001\000\002\001" +
    "\001\000\002\001\001\000\002\001\001\000\002\001\001" +
    "\000\004\015\031\001\001\000\002\001\001\000\004\015" +
    "\025\001\001\000\002\001\001\000\002\001\001\000\004" +
    "\015\030\001\001\000\002\001\001\000\002\001\001\000" +
    "\004\015\033\001\001\000\002\001\001\000\002\001\001" +
    "\000\002\001\001\000\004\015\037\001\001\000\002\001" +
    "\001\000\010\006\041\011\045\012\043\001\001\000\006" +
    "\011\120\012\043\001\001\000\002\001\001\000\002\001" +
    "\001\000\002\001\001\000\006\011\052\012\043\001\001" +
    "\000\002\001\001\000\004\015\050\001\001\000\002\001" +
    "\001\000\002\001\001\000\006\011\053\012\043\001\001" +
    "\000\002\001\001\000\004\015\055\001\001\000\002\001" +
    "\001\000\002\001\001\000\002\001\001\000\010\015\063" +
    "\016\061\017\062\001\001\000\002\001\001\000\002\001" +
    "\001\000\002\001\001\000\004\015\067\001\001\000\004" +
    "\015\066\001\001\000\002\001\001\000\002\001\001\000" +
    "\002\001\001\000\004\013\072\001\001\000\002\001\001" +
    "\000\002\001\001\000\002\001\001\000\004\015\076\001" +
    "\001\000\002\001\001\000\002\001\001\000\004\015\101" +
    "\001\001\000\002\001\001\000\002\001\001\000\002\001" +
    "\001\000\002\001\001\000\002\001\001\000\004\015\107" +
    "\001\001\000\002\001\001\000\002\001\001\000\004\015" +
    "\112\001\001\000\002\001\001\000\002\001\001\000\002" +
    "\001\001\000\004\013\116\001\001\000\002\001\001\000" +
    "\002\001\001\000\002\001\001\000\002\001\001\000\002" +
    "\001\001\000\002\001\001\000\002\001\001\000\002\001" +
    "\001\000\004\004\127\001\001\000\002\001\001\000\002" +
    "\001\001\000\004\004\132\001\001\000\002\001\001\000" +
    "\002\001\001" });

  /** Access to <code>reduce_goto</code> table. */
  public short[][] reduce_table() {return _reduce_table;}

  /** Instance of action encapsulation class. */
  protected CUP$parser$actions action_obj;

  /** Action encapsulation object initializer. */
  protected void init_actions()
    {
      action_obj = new CUP$parser$actions(this);
    }

  /** Invoke a user supplied parse action. */
  public java_cup.runtime.Symbol do_action(
    int                        act_num,
    java_cup.runtime.lr_parser parser,
    java.util.Stack            stack,
    int                        top)
    throws java.lang.Exception
  {
    /* call code in generated class */
    return action_obj.CUP$parser$do_action(act_num, parser, stack, top);
  }

  /** Indicates start state. */
  public int start_state() {return 0;}
  /** Indicates start production. */
  public int start_production() {return 0;}

  /** <code>EOF</code> Symbol index. */
  public int EOF_sym() {return 0;}

  /** <code>error</code> Symbol index. */
  public int error_sym() {return 1;}


  /** User initialization code. */
  public void user_init() throws java.lang.Exception
    {

    table = new HashMap <String, Integer>();

 Tree = new DisegnaAlbero();   }public static DisegnaAlbero Tree;

  /** Scan to get the next Symbol. */
  public java_cup.runtime.Symbol scan()
    throws java.lang.Exception
    {
 Symbol s=_scanner.next_token(); Tree.push(s.toString(), 0); return s;   }


    public HashMap <String, Integer> table;

    public Object stack(int position){
        return (((Symbol)stack.elementAt(tos + position)).value);
    }


/** Cup generated class to encapsulate user supplied action code.*/
@SuppressWarnings({"rawtypes", "unchecked", "unused"})
class CUP$parser$actions {
  private final parser parser;

  /** Constructor */
  CUP$parser$actions(parser parser) {
    this.parser = parser;
  }

  /** Method 0 with the actual generated action code for actions 0 to 300. */
  public final java_cup.runtime.Symbol CUP$parser$do_action_part00000000(
    int                        CUP$parser$act_num,
    java_cup.runtime.lr_parser CUP$parser$parser,
    java.util.Stack            CUP$parser$stack,
    int                        CUP$parser$top)
    throws java.lang.Exception
    {
      /* Symbol object for return from actions */
      java_cup.runtime.Symbol CUP$parser$result;

      /* select the action based on the action number */
      switch (CUP$parser$act_num)
        {
          /*. . . . . . . . . . . . . . . . . . . .*/
          case 0: // $START ::= prog EOF 
            { 
              Object RESULT =null;
		int start_valleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left;
		int start_valright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).right;
		Object start_val = (Object)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-1)).value;
		RESULT = start_val;
              CUP$parser$result = parser.getSymbolFactory().newSymbol("$START",0, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          /* ACCEPT */
          CUP$parser$parser.done_parsing();
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 1: // prog ::= header SEP simulation_section 
            { parser.Tree.reduce(3,"prog",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("prog",0, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 2: // header ::= header1 
            { parser.Tree.reduce(1,"header",1);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("header",1, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 3: // header ::= header1 TOK3 SC header1 
            { parser.Tree.reduce(4,"header",1);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("header",1, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-3)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 4: // header ::= header1 TOK3 SC header1 TOK3 SC header1 
            { parser.Tree.reduce(7,"header",1);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("header",1, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-6)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 5: // header1 ::= header1 TOK1 SC 
            { parser.Tree.reduce(3,"header1",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("header1",2, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 6: // header1 ::= header1 TOK2 SC 
            { parser.Tree.reduce(3,"header1",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("header1",2, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 7: // header1 ::= 
            { parser.Tree.reduce(0,"header1",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("header1",2, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 8: // simulation_section ::= initt SC commands 
            { parser.Tree.reduce(3,"simulation_section",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("simulation_section",3, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 9: // initt ::= INIT_WD HEIGHT_WD EQ exp CM SPEED_WD EQ exp 
            { parser.Tree.reduce(8,"initt",0);
              HashMap RESULT =null;
		int heightleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-6)).left;
		int heightright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-6)).right;
		String height = (String)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-6)).value;
		int exphleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-4)).left;
		int exphright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-4)).right;
		Integer exph = (Integer)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-4)).value;
		int speedleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).left;
		int speedright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).right;
		String speed = (String)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-2)).value;
		int expsleft = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).left;
		int expsright = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).right;
		Integer exps = (Integer)((java_cup.runtime.Symbol) CUP$parser$stack.peek()).value;
		 parser.table.put(height, exph); parser.table.put(speed, exps); 
System.out.println("HEIGHT " + parser.table.get("HEIGHT"));
System.out.println("SPEED " + parser.table.get("SPEED"));
              CUP$parser$result = parser.getSymbolFactory().newSymbol("initt",10, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-7)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 10: // initt ::= INIT_WD HEIGHT_WD EQ exp CM 
            { parser.Tree.reduce(5,"initt",0);
              HashMap RESULT =null;
		int heightleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-3)).left;
		int heightright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-3)).right;
		String height = (String)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-3)).value;
		int exphleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left;
		int exphright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).right;
		Integer exph = (Integer)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-1)).value;
		 parser.table.put(height, exph); parser.table.put("SPEED", 0); 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("initt",10, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-4)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 11: // initt ::= INIT_WD SPEED_WD EQ exp CM 
            { parser.Tree.reduce(5,"initt",0);
              HashMap RESULT =null;
		int speedleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-3)).left;
		int speedright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-3)).right;
		String speed = (String)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-3)).value;
		int expsleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left;
		int expsright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).right;
		Integer exps = (Integer)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-1)).value;
		 parser.table.put(speed, exps); parser.table.put("HEIGHT", 0); 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("initt",10, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-4)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 12: // initt ::= INIT_WD SPEED_WD EQ exp CM HEIGHT_WD EQ exp 
            { parser.Tree.reduce(8,"initt",0);
              HashMap RESULT =null;
		int speedleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-6)).left;
		int speedright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-6)).right;
		String speed = (String)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-6)).value;
		int expsleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-4)).left;
		int expsright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-4)).right;
		Integer exps = (Integer)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-4)).value;
		int heightleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).left;
		int heightright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).right;
		String height = (String)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-2)).value;
		int exphleft = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).left;
		int exphright = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).right;
		Integer exph = (Integer)((java_cup.runtime.Symbol) CUP$parser$stack.peek()).value;
		 parser.table.put(height, exph); parser.table.put(speed, exps); 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("initt",10, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-7)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 13: // initt ::= INIT_WD CM 
            { parser.Tree.reduce(2,"initt",0);
              HashMap RESULT =null;
		 parser.table.put("HEIGHT", 0); parser.table.put("SPEED", 0); 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("initt",10, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 14: // exp ::= INUM 
            { parser.Tree.reduce(1,"exp",0);
              Integer RESULT =null;
		int inumleft = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).left;
		int inumright = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).right;
		Integer inum = (Integer)((java_cup.runtime.Symbol) CUP$parser$stack.peek()).value;
		 RESULT = (Integer)inum; 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("exp",11, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 15: // exp ::= HEIGHT_WD 
            { parser.Tree.reduce(1,"exp",0);
              Integer RESULT =null;
		 RESULT = (Integer)parser.table.get("HEIGHT"); 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("exp",11, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 16: // exp ::= SPEED_WD 
            { parser.Tree.reduce(1,"exp",0);
              Integer RESULT =null;
		 RESULT = (Integer)parser.table.get("SPEED"); 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("exp",11, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 17: // exp ::= exp MUL_WD exp 
            { parser.Tree.reduce(3,"exp",0);
              Integer RESULT =null;
		int ex1left = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).left;
		int ex1right = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).right;
		Integer ex1 = (Integer)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-2)).value;
		int ex2left = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).left;
		int ex2right = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).right;
		Integer ex2 = (Integer)((java_cup.runtime.Symbol) CUP$parser$stack.peek()).value;
		 RESULT = (Integer)ex1 * (Integer)ex2; 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("exp",11, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 18: // exp ::= exp SUM_WD exp 
            { parser.Tree.reduce(3,"exp",0);
              Integer RESULT =null;
		int ex1left = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).left;
		int ex1right = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).right;
		Integer ex1 = (Integer)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-2)).value;
		int ex2left = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).left;
		int ex2right = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).right;
		Integer ex2 = (Integer)((java_cup.runtime.Symbol) CUP$parser$stack.peek()).value;
		 RESULT = (Integer)ex1 + (Integer)ex2; 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("exp",11, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 19: // commands ::= command command command 
            { parser.Tree.reduce(3,"commands",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("commands",4, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 20: // commands ::= commands command 
            { parser.Tree.reduce(2,"commands",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("commands",4, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 21: // command ::= HEIGHT_WD EQ exp SC 
            { parser.Tree.reduce(4,"command",0);
              Object RESULT =null;
		int exleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left;
		int exright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).right;
		Integer ex = (Integer)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-1)).value;
		 parser.table.put("HEIGHT", ex);
System.out.println("HEIGHT " + parser.table.get("HEIGHT"));

              CUP$parser$result = parser.getSymbolFactory().newSymbol("command",7, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-3)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 22: // command ::= SPEED_WD EQ exp SC 
            { parser.Tree.reduce(4,"command",0);
              Object RESULT =null;
		int exleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left;
		int exright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).right;
		Integer ex = (Integer)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-1)).value;
		 parser.table.put("SPEED", ex);
System.out.println("SPEED " + parser.table.get("SPEED"));

              CUP$parser$result = parser.getSymbolFactory().newSymbol("command",7, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-3)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 23: // command ::= cond SC 
            { parser.Tree.reduce(2,"command",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("command",7, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 24: // cond ::= COND_WD OB comparison CB UPDATE_WD list_ass DONE_WD 
            { parser.Tree.reduce(7,"cond",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("cond",8, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-6)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 25: // cond ::= COND_WD OB nt0 CB UPDATE_WD list_ass DONE_WD 
            { parser.Tree.reduce(7,"cond",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("cond",8, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-6)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 26: // nt0 ::= 
            { parser.Tree.reduce(0,"nt0",0);
              Boolean RESULT =null;
		 RESULT = true; 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("nt0",13, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 27: // list_ass ::= HEIGHT_WD EQ exp SC 
            { parser.Tree.reduce(4,"list_ass",0);
              Object RESULT =null;
		int exleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left;
		int exright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).right;
		Integer ex = (Integer)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-1)).value;
		 Boolean com = (Boolean)parser.stack(-6);
if(com){
    parser.table.put("HEIGHT", ex);
    System.out.println("HEIGHT " + parser.table.get("HEIGHT"));
}

              CUP$parser$result = parser.getSymbolFactory().newSymbol("list_ass",9, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-3)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 28: // list_ass ::= SPEED_WD EQ exp SC 
            { parser.Tree.reduce(4,"list_ass",0);
              Object RESULT =null;
		int exleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left;
		int exright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).right;
		Integer ex = (Integer)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-1)).value;
		 Boolean com = (Boolean)parser.stack(-6);
if(com){
    parser.table.put("SPEED", ex);
    System.out.println("SPEED " + parser.table.get("SPEED"));
}

              CUP$parser$result = parser.getSymbolFactory().newSymbol("list_ass",9, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-3)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 29: // list_ass ::= list_ass HEIGHT_WD EQ exp SC 
            { parser.Tree.reduce(5,"list_ass",0);
              Object RESULT =null;
		int exleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left;
		int exright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).right;
		Integer ex = (Integer)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-1)).value;
		 Boolean com = (Boolean)parser.stack(-7);
if(com){
    parser.table.put("HEIGHT", ex);
    System.out.println("HEIGHT " + parser.table.get("HEIGHT"));
}

              CUP$parser$result = parser.getSymbolFactory().newSymbol("list_ass",9, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-4)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 30: // list_ass ::= list_ass SPEED_WD EQ exp SC 
            { parser.Tree.reduce(5,"list_ass",0);
              Object RESULT =null;
		int exleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left;
		int exright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).right;
		Integer ex = (Integer)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-1)).value;
		 Boolean com = (Boolean)parser.stack(-7);
if(com){
    parser.table.put("SPEED", ex);
    System.out.println("SPEED " + parser.table.get("SPEED"));
}

              CUP$parser$result = parser.getSymbolFactory().newSymbol("list_ass",9, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-4)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 31: // comparison ::= exp GT exp 
            { parser.Tree.reduce(3,"comparison",0);
              Boolean RESULT =null;
		int ex1left = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).left;
		int ex1right = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).right;
		Integer ex1 = (Integer)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-2)).value;
		int ex2left = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).left;
		int ex2right = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).right;
		Integer ex2 = (Integer)((java_cup.runtime.Symbol) CUP$parser$stack.peek()).value;
		 RESULT = ex1 > ex2; 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("comparison",12, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 32: // comparison ::= exp EQ exp 
            { parser.Tree.reduce(3,"comparison",0);
              Boolean RESULT =null;
		int ex1left = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).left;
		int ex1right = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).right;
		Integer ex1 = (Integer)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-2)).value;
		int ex2left = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).left;
		int ex2right = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).right;
		Integer ex2 = (Integer)((java_cup.runtime.Symbol) CUP$parser$stack.peek()).value;
		 RESULT = ex1 == ex2; 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("comparison",12, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /* . . . . . .*/
          default:
            throw new Exception(
               "Invalid action number "+CUP$parser$act_num+"found in internal parse table");

        }
    } /* end of method */

  /** Method splitting the generated action code into several parts. */
  public final java_cup.runtime.Symbol CUP$parser$do_action(
    int                        CUP$parser$act_num,
    java_cup.runtime.lr_parser CUP$parser$parser,
    java.util.Stack            CUP$parser$stack,
    int                        CUP$parser$top)
    throws java.lang.Exception
    {
              return CUP$parser$do_action_part00000000(
                               CUP$parser$act_num,
                               CUP$parser$parser,
                               CUP$parser$stack,
                               CUP$parser$top);
    }
}

}
