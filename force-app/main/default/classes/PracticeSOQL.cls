public class PracticeSOQL {
    public list<accwrapForSOQL> accounts  {set;get;}
    public PracticeSOQL(){
        list<account> accs=[select name,phone,type,industry from account];
        accounts=new list<accwrapForSOQL>();
        for(account a:accs){
            accwrapForSOQL aw=new accwrapForSOQL();
            aw.acc=a;
            aw.flag=false;
            accounts.add(aw);
            
        }
        
        
    }

}