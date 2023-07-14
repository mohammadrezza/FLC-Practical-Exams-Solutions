
//----------------------------------------------------
// The following code was generated by CUP v0.11b beta 20140226
//----------------------------------------------------

/** CUP generated class containing symbol constants. */
public class sym {
  /* terminals */
  public static final int UPDATE_WD = 18;
  public static final int CM = 7;
  public static final int DONE_WD = 19;
  public static final int INUM = 20;
  public static final int GT = 11;
  public static final int CB = 10;
  public static final int OB = 9;
  public static final int SPEED_WD = 14;
  public static final int EOF = 0;
  public static final int HEIGHT_WD = 13;
  public static final int TOK3 = 5;
  public static final int TOK2 = 4;
  public static final int SUM_WD = 15;
  public static final int SEP = 2;
  public static final int TOK1 = 3;
  public static final int COND_WD = 17;
  public static final int error = 1;
  public static final int MUL_WD = 16;
  public static final int EQ = 8;
  public static final int SC = 6;
  public static final int INIT_WD = 12;
  public static final String[] terminalNames = new String[] {
  "EOF",
  "error",
  "SEP",
  "TOK1",
  "TOK2",
  "TOK3",
  "SC",
  "CM",
  "EQ",
  "OB",
  "CB",
  "GT",
  "INIT_WD",
  "HEIGHT_WD",
  "SPEED_WD",
  "SUM_WD",
  "MUL_WD",
  "COND_WD",
  "UPDATE_WD",
  "DONE_WD",
  "INUM"
  };
public String[] TT;
	public sym(){
		TT = new String[100];
		TT[18]=new String("UPDATE_WD");
		TT[7]=new String("CM");
		TT[19]=new String("DONE_WD");
		TT[20]=new String("INUM");
		TT[11]=new String("GT");
		TT[10]=new String("CB");
		TT[9]=new String("OB");
		TT[14]=new String("SPEED_WD");
		TT[0]=new String("EOF");
		TT[13]=new String("HEIGHT_WD");
		TT[5]=new String("TOK3");
		TT[4]=new String("TOK2");
		TT[15]=new String("SUM_WD");
		TT[2]=new String("SEP");
		TT[3]=new String("TOK1");
		TT[17]=new String("COND_WD");
		TT[1]=new String("error");
		TT[16]=new String("MUL_WD");
		TT[8]=new String("EQ");
		TT[6]=new String("SC");
		TT[12]=new String("INIT_WD");
	}
public String getTT(int i){return TT[i];}
}

