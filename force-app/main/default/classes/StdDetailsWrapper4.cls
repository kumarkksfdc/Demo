public class StdDetailsWrapper4 {
    public string college 				 {set;get;}
    public StdDetailsWrapper3 stddtl	 {set;get;}
    
    PUBLIC StdDetailsWrapper4(){
        college='ACE ENG CLG';
        stddtl=new StdDetailsWrapper3();
        stddtl.phone='9666222637';
        stddtl.city='hyd';
        stddtl.zipcode='501501';
        
        
        StdDetailsWrapper1 s1=new StdDetailsWrapper1();
        s1.name='kumar';
        s1.branch='ECE';
        stddtl.std=s1;
        
    }

}