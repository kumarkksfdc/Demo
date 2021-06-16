public class SOQL5 {
     public list<account> accs		{set;get;}
    public SOQL5(){
        accs=[select name,phone,industry from account];
    }
	 public void get(){
        accs=[select name,phone,industry from account where industry IN ('educational','energy')];
    }
     public void getdata(){
         list<string> mylist=new list<string>{'educational','energy'};
        accs=[select name,phone,industry from account where industry IN:mylist];
    }
}