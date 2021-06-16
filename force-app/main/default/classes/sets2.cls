public class sets2 {
    public List<sets1> customer {set;get;}
    public set<sets1> s {set;get;}
    public sets2(){
        customer =new List<sets1>();
        s=new set<sets1>();
        sets1 s1=new sets1();
     account acc=new account();
     acc.name='kumar';
     acc.phone='123456';
        s1.acc=acc;
        Contact c=new Contact();
        c.LastName='Myla';
        c.firstName='Satish';
        s1.con=c;
       s.add(s1); 
        customer.addAll(s);
        
        
    }

}