public class PickListExample4 {
    public Set<String> cities  		{set;get;}
    public List<SelectOption> options 	{Set;get;}
    public List<string> selected		{set;get;}
    public String result 				{set;get;}
    public PickListExample4(){
        selected=new List<String>();
        cities =new Set<String>{'Hyd','Ban','Che','Pune'};
        options =new List<SelectOption>();
        for(String s :cities ){
            SelectOption op=new SelectOption(s,s);
            options.add(op);
        }   
    }
    public void create(){
        cities.removeAll(selected);
       options.clear();
         for(String s :cities ){
            SelectOption op=new SelectOption(s,s);
            options.add(op);
        }   
    }
    public void getData(){
         result='You have selected :';
        for(String s :selected){
            result=result+' ---'+s;
        }
        create();
    }
}