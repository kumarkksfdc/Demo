public class setexmp1 {
    public list<setexmp> s2		    {set;get;}
    public set<setexmp> s1			{set;get;}
    public setexmp1(){
        s2=new list<setexmp>();
        s1=new set<setexmp>();
        setexmp s=new setexmp();
        account a=new account();
        a.Name='kumar';
        a.phone='3332';
        s.acc=a;
        contact b=new contact();
        b.firstname='reddy';
        b.lastname='mohan';
        s.con=b;
        s1.add(s);
        s2.addAll(s1);
        
        
    }
}