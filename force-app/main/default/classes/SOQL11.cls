public class SOQL11 {
    public list<SOQL1>  ACCOUNT		{set;get;}
    public SOQL11(){
        List<Account> accs =[select Name,Phone,Industry,Rating,Type from Account];
        ACCOUNT=new list<SOQL1>();
        for(account a:accs){
            SOQL1 S=NEW SOQL1();
            S.acc=a;
            S.flag=false;
            ACCOUNT.add(S);
        }
    }

}