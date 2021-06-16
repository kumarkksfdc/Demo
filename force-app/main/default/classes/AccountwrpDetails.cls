public class AccountwrpDetails {
    
    public AccountWrapper wrapper  {set;get;}
    public AccountwrpDetails(){
        wrapper=new AccountWrapper();
        wrapper.acc=new account();
        wrapper.acc.name='kumar';
        wrapper.acc.phone='1234';
        
        Wrapper.con=new contact();
        wrapper.con.lastname='kankari';
        wrapper.con.phone='1236';
    }

}