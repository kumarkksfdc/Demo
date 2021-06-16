public class soqlpractice3 {
    public list<Account> accs		{set;get;}
    public string pick			    {set;get;}
    public void search(){
        accs=[select name,phone,type from account where name=:pick or type=:pick];
 		accs.sort();
    }
     public void searchAgain(){
        String query='select name,phone,type from Account';
        if(pick!=null && pick!=''){
            query=query+' where type=\''+pick+'\'';
        }
         accs=Database.query(query);   
    }

 
}