public class setpractice2 {
    public list<setpractice1> sp2    {set;get;}
    public set<setpractice1>sp1	     {set;get;}
       public setpractice2(){
        sp2=new list<setpractice1>();
        sp1=new set<setpractice1>();
           setpractice sp=new setpractice();
       	   sp.branch='ECE';
       	   sp.city='HYD';
       		 setpractice1 s=new setpractice1();
           				s.state='TS';
        		account a=new account();
       			 a.name='kumar';
        			a.phone='12345';
       				 s.sp.acc=a;
        			
       
        
        contact b=new contact();
        b.firstname='kumar';
        b.lastname='mohan';
        s.con=b;
        sp1.add(s);
        sp2.addAll(sp1);
        
        
    }
}