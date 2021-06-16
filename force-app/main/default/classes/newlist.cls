public class newlist {
    public string name	{set;get;}
    public list<string> cityname	{set;get;}
    public newlist(){
        cityname=new list<string>();
    }
    public void add(){
        cityname.add(name);
        name=null;
    }

}