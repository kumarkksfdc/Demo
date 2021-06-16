public class SOQL {
    public list<account> accs {set;get;}
    public SOQL(){
       accs=[select name,phone,type from account]; 
    }

}