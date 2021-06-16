public class ListExm2 {
    public List<Account> account     {set;get;}
    public Account acc				 {set;get;}
    	
    public ListExm2(){
        account=new List<Account>();
        acc=new Account();
    }
    Public void add(){
        account.add(acc);
        acc=new Account();/*set acc is equals to Zero */
    }
}