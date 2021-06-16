public class ListExmp33 {
    public List<ListExmp3> employee     {set;get;}
    public ListExmp3 emp 			   {set;get;}	
    
    public ListExmp33(){
        employee=new List<ListExmp3>();
        emp=new ListExmp3();
    }
    public void add(){
        employee.add(emp);
        emp=new ListExmp3();
    }
 		public void removeAll()
        {
       		 employee.clear();
    	}
}