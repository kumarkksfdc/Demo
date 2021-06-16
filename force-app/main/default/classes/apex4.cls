public class apex4 {
    public Account acc {set;get;}
    public void Create(){
        acc=new Account();
        acc.Name='dam';
        acc.Phone='123';
        insert acc;
    }
    
    public void show(){
        Contact con=new Contact();
        con.lastname='kankari';
        con.FirstName='damodhar';
        con.AccountId=acc.Id;
        insert con;
    }

}