public class Apex6 {
    public string accname {set;get;}
    public string Industry {set;get;}
    public void Create(){
        account acc=new account();
        acc.name=accname;
        acc.Industry=industry;
        if(industry=='banking'){
            acc.Ownership='public';
        }else{
            acc.Ownership='private';
        }
        insert acc;
        
    }

}