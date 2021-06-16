public class wrapper2 {
    public string branch		{set;get;}
    public wrapper1 wrp1		{set;get;}
    public wrapper4 wrp2		{set;get;}
     
    public wrapper2(){
        branch='ECE';
        wrp1=new wrapper1();
        wrp1.acc=new account();
        wrp1.acc.name='kumar';
        wrp1.college='ace eng';
       	wrp1.state='telangana'; 
        wrp1.acc.phone='966666666'; 
        
         wrp2=new wrapper4();
         wrp2.citycode=501501;
         wrp2.con=new contact();
         wrp2.con.email='kumar@123';
         wrp2.con.fax='hellow world';
    }
    
    
}