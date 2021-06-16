public class picklist1 {
    public list<selectOption> option	{set;get;}
    public string selected 				{set;get;}
    public string result				{set;get;}
    public picklist1(){
        option=new list<selectOption>();
        selectOption p=new selectOption('none','none');
        selectOption p1=new selectOption('hyd','TS');
        selectOption p2=new selectOption('bal','KA');
        
        option.add(p);
        option.add(p1);
        option.add(p2);
    }
    public void create(){
        result='You have selected :'+selected;
    }

}