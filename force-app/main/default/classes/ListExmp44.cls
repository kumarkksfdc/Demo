public class ListExmp44 {
    public list<ListExmp4> employee  	{set;get;}
    public ListExmp4 emp				{set;get;}
    public account acc					{set;get;}
    public contact con 					{set;get;}
     
      public ListExmp44(){
        employee=new List<ListExmp4>();
        emp=new ListExmp4();
        emp.acc=new account();
        emp.con=new contact();
        acc=new Account();
        con=new Contact();

    }
    public void add(){
       emp =new ListExmp4();
        emp.acc=acc;
        emp.con=con;
        employee.add(emp);
    }
}