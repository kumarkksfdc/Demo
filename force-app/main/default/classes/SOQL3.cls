public class SOQL3 {
    PUBLIC list<account> acc		{set;get;}
    public string searchtext		{set;get;}
    public void get(){
        acc=[select name ,phone,industry from account where name=:searchtext or industry=:searchtext];
   acc.sort();
    }
		/*public void searchAgain(){
        String query='select name,phone,industry,type from Account';
        if(searchText!=null && searchText!=''){
            query=query+' where name=\''+searchText+'\'';
        }
         acc=Database.query(query);   
    }*/
}