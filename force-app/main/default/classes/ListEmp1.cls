public class ListEmp1 {
    public String name    {set;get;}
    Public List<string> branches {set;get;}
    
    Public ListEmp1(){
        branches=new List<string>();
    }
    public void add(){
        branches.add(name);
        name=null;
    }
    
}