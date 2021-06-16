public class StudentScore {
    public String Name {set;get;}
    public Integer tel {set;get;}
    public Integer hin {set;get;}
    public Integer eng {set;get;}
    public Integer mat {set;get;}
    public Integer scn {set;get;}
    public Integer soc {set;get;}
    public Integer totalmarks{set;get;}
    Public decimal percentage{set;get;}
    
    
    Public void total(){
        totalmarks=(tel+hin+eng+mat+scn+soc);
    }
    public void percentage(){
        percentage=((totalmarks*100)/6)/100;
    }
    public void reset(){
        tel=null;
        hin=null;
        eng=null;
        mat=null;
        scn=null;
        soc=null;
        totalmarks=null;
        percentage=null;
        
    }
    public pagereference createlink(){
        pagereference p=new pagereference('/apex/test11');
        return p;
    }
}