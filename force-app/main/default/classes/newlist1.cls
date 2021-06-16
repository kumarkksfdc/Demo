public class newlist1 {
    public list<account> accounts {set;get;}
    public account acc			   {set;get;}
    public newlist1(){
        accounts=new List<account>();
        acc=new account();
    }
    public void add(){
        accounts.add(acc);
    }

}