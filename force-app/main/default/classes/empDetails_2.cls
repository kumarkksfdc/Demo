public class empDetails_2 {
    public String Location {set;get;}
    public empDetails2 emp {set;get;}
    public empDetails_2(){
        Location='HYDERABAD';
        emp=new empDetails2();
        emp.name='KUMAR';
        emp.company='TCS';
        emp.branch='MADHAPUR';
        emp.sal=200000;
        emp.salary();
        
    }
    

}