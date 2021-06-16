public class wrapperpractice2 {
    public string state             {set;get;}
    public wrapperpractice1 wrp2    {set;get;}
    public wrapperpractice3 wrp3    {set;get;}
    
     public wrapperpractice2(){
        wrp2=new wrapperpractice1();
        wrp2.country='INDIA';
        /*wrapperpractice w=new wrapperpractice();
        wrp2.wrp1=w;
        w.company='TCS';
        w.city='hyd';
        w.zipcode='501501';*/
           
            wrapperpractice a=new wrapperpractice();
            a.company='TCS';
            a.city='hyd';
            a.zipcode='501501';
            wrp2.wrp1=a;
        
        contact con=new contact();
        wrp2.con=con;
        con.email='kankarikumar927@gmail.com';
        con.firstname='kankari';
        
        account acc=new account();
        wrp2.wrp1.acc=acc;
        wrp2.wrp1.acc.name='kumar';
        wrp2.wrp1.acc.phone='9666222637';
        
        wrp3=new wrapperpractice3();
        wrp3.amount=10000;
        wrp3.intrest=3;
        wrp3.intrest();     
    }
}